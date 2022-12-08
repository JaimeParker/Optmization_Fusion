#include "mex.h"
#include "blas.h"
#include <omp.h>

#if !defined(_WIN32)
    #if !defined(daxpy)
        #define daxpy daxpy_
    #endif
    #if !defined(dgemv)
        #define dgemv dgemv_
    #endif
    #if !defined(dgemm)
        #define dgemm dgemm_
    #endif
#endif

// Parameter for switching between a dgemm()-based Kronecker product
// implementation and the daxpy()-based specialized code.
// TODO: Tune this!
#define BUFFER_SIZE 4096

// TODO: Tune this!
#define PARALLELIZATION_THRESHOLD 64
#define PAGE_PARALLELIZATION_THRESHOLD 4

mwSize num_rows(mxArray const *array) {
    return mxGetM(array);
}

mwSize num_cols(mxArray const *array) {
    return mxGetDimensions(array)[1];  // NOT mxGetN(array)!
}

mwSize num_pages(mxArray const *array) {
    mwSize page_size = num_rows(array) * num_cols(array);
    return mxGetNumberOfElements(array) / (page_size > 0 ? page_size : 1);
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {

    if(nlhs != 1 || nrhs != 2) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Invalid number of arguments");
    }

    mxArray const *H_array = prhs[0];
    mxArray const *J_array = prhs[1];

    if(!(mxIsDouble(H_array) && mxIsDouble(J_array))) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Wrong argument type");
    }
    if(mxIsComplex(H_array) || mxIsComplex(J_array)) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Wrong argument complexity");
    }

    ptrdiff_t n = num_cols(H_array);
    ptrdiff_t m = num_rows(H_array) / n;
    ptrdiff_t p = num_rows(J_array);
    ptrdiff_t q = num_pages(H_array);

    if(num_rows(H_array) != m * n || num_cols(J_array) != m) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Dimensions mismatch");
    }

    if(num_pages(J_array) != q) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Page count mismatch");
    }

    double const *H = mxGetPr(H_array);
    double const *J = mxGetPr(J_array);

    mwSize out_size[] = { p * n, n, q };
    mxArray *out_array =
        mxCreateNumericArray(3, out_size, mxDOUBLE_CLASS, mxREAL);
    if(!out_array) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Failed to allocate array");
    }
    double *out = mxGetPr(out_array);

    // BLAS pass-by-reference arguments
    ptrdiff_t const i_one = 1;
    double const one = 1;
    double const zero = 0;
    char const char_N = 'N';
    ptrdiff_t const m_times_n = m * n;
    ptrdiff_t const p_times_n = p * n;

    if(n == 1) {
        // For n == 1, we only need to evaluate a simple matrix vector product
        //#pragma omp parallel for \
        //    schedule(static) \
        //    shared(J, H, out) \
        //    if (q > PAGE_PARALLELIZATION_THRESHOLD)
        for(ptrdiff_t page = 0; page < q; ++page) {
            double const *H_page = &H[page * m];
            double const *J_page = &J[page * (p * m)];
            double *out_page = &out[page * p];
            dgemv(&char_N, &p, &m, &one,
                J_page, &p, H_page, &i_one, &zero, out_page, &i_one);
        }
    }
    else if(m == 1) {

        #pragma omp parallel for \
            collapse(3) \
            schedule(static) \
            shared(J, H, out) \
            if (p_times_n > PARALLELIZATION_THRESHOLD)
        for(ptrdiff_t page = 0; page < q; ++page) {
            for(ptrdiff_t r_J = 0; r_J < p; ++r_J) {
                for(ptrdiff_t c_H = 0; c_H < n; ++c_H) {
                    double const *H_page = &H[page * (n * n)];
                    double const *J_page = &J[page * p];
                    double *out_page = &out[page * (p * n * n)];
                    daxpy(
                        &n,
                        &J_page[r_J],
                        &H_page[c_H * n], &i_one,
                        &out_page[c_H * p * n + r_J * n], &i_one);
                }
            }
        }

    }
    else if(q * (p * n) * (m * n) <= BUFFER_SIZE) {
        // For small matrices, use the pre-allocated buffer, fill the left
        // matrix and multiply using dgemm().

        #pragma omp parallel for \
            schedule(static) \
            shared(J, H, out) \
            if (q > PAGE_PARALLELIZATION_THRESHOLD)
        for(ptrdiff_t page = 0; page < q; ++page) {
            double const *H_page = &H[page * (m * n * n)];
            double const *J_page = &J[page * (p * m)];
            double *out_page = &out[page * (p * n * n)];

            double buffer[BUFFER_SIZE] = { 0 };
            // Run this sequentially, since the threading overhead is too high.
            //#pragma omp parallel \
            //            for collapse(3) shared(buffer, J) schedule(static) \
            //            if (m * n * p > PARALLELIZATION_THRESHOLD)
            for(ptrdiff_t c_J = 0; c_J < m; ++c_J) {
                for(ptrdiff_t r_J = 0; r_J < p; ++r_J) {
                    for(ptrdiff_t k = 0; k < n; ++k) {
                        buffer[(c_J * n + k) * p * n + r_J * n + k] =
                            J_page[c_J * p + r_J];
                    }
                }
            }

            dgemm(
                &char_N, &char_N,
                &p_times_n, &n,
                &m_times_n,
                &one,
                buffer, &p_times_n,
                H_page, &m_times_n,
                &zero, out_page, &p_times_n);
        }

    }
    else {
        // For large matrices, avoid the Kronecker product and calculate the
        // result directly.

        #pragma omp parallel for \
            collapse(3) \
            schedule(static) \
            shared(H, J, out) \
            if (q * p_times_n > PARALLELIZATION_THRESHOLD)
        for(ptrdiff_t page = 0; page < q; ++page) {
            for(ptrdiff_t c_H = 0; c_H < n; ++c_H) {
                for(ptrdiff_t r_J = 0; r_J < p; ++r_J) {
                    double const *H_page = &H[page * (m * n * n)];
                    double const *J_page = &J[page * (p * m)];
                    double *out_page = &out[page * (p * n * n)];
                    // serial loop -> avoid race conditions
                    for(ptrdiff_t c_J = 0; c_J < m; ++c_J) {
                        daxpy(
                            &n,
                            &J_page[c_J * p + r_J],
                            &H_page[c_H * m * n + c_J * n], &i_one,
                            &out_page[c_H * p * n + r_J * n], &i_one);
                    }
                }
            }
        }

    }

    plhs[0] = out_array;

}
