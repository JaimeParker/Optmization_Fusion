#include "mex.h"
#include "blas.h"

#if !defined(_WIN32)
    #if !defined(daxpy)
        #define daxpy daxpy_
    #endif
    #if !defined(dger)
        #define dger  dger_
    #endif
    #if !defined(dgemm)
        #define dgemm dgemm_
    #endif
    #if !defined(dsymm)
        #define dsymm dsymm_
    #endif
#endif

// TODO: Tune this!
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
    ptrdiff_t p = num_cols(J_array);
    ptrdiff_t q = num_pages(H_array);

    if(num_rows(H_array) != m * n || num_rows(J_array) != n) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Dimensions mismatch");
    }

    if(num_pages(J_array) != q) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Page count mismatch");
    }

    double const *H = mxGetPr(H_array);
    double const *J = mxGetPr(J_array);

    mwSize out_size[] = { m * p, p, q };
    mxArray *out_array =
        mxCreateNumericArray(3, out_size, mxDOUBLE_CLASS, mxREAL);
    if(!out_array) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Failed to allocate array");
    }
    double *out = mxGetPr(out_array);

    // BLAS pass-by-reference arguments
    ptrdiff_t const n_rows_H = m * n;
    ptrdiff_t const n_rows_out = m * p;
    char const char_L = 'L';
    char const char_N = 'N';
    char const char_T = 'T';
    ptrdiff_t const i_one = 1;
    double const one = 1;
    double const zero = 0;

    if(n == 1 && p == 1) {

        #pragma omp parallel for \
            schedule(static) \
            shared(J, H, out) \
            if (q > PAGE_PARALLELIZATION_THRESHOLD)
        for(ptrdiff_t page = 0; page < q; ++page) {
            double const *H_page = &H[page * m];
            double const J_page = J[page];
            double *out_page = &out[page * m];
            double v = J_page * J_page;
            daxpy(&m, &v, H_page, &i_one, out_page, &i_one);
        }

    }
    else if(n == 1) {

        #pragma omp parallel for \
            schedule(static) \
            shared(J, H, out) \
            if (q > PAGE_PARALLELIZATION_THRESHOLD)
        for(ptrdiff_t page = 0; page < q; ++page) {
            double const *H_page = &H[page * m];
            double const *J_page = &J[page * p];
            double *out_page = &out[page * (m * p * p)];
            for(ptrdiff_t k = 0; k < m; ++k) {
                double const *H_block = &H_page[k];
                double *out_block = &out_page[k * p];
                dger(
                    &p, &p,
                    H_block,
                    J_page, &i_one,
                    J_page, &i_one,
                    out_block, &n_rows_out);
            }
        }

    }
    else {

        #pragma omp parallel \
            shared(J, H, out) \
            if (q > PAGE_PARALLELIZATION_THRESHOLD)
        {
            double tmp[n * p];

            //double *tmp = malloc(sizeof(double) * n * p);
            //if(!tmp) {
            //    mexErrMsgIdAndTxt("falcon:InternalError", "Failed to allocate matrix");
            //}

            #pragma omp for schedule(static)
            for(ptrdiff_t page = 0; page < q; ++page) {
                double const *H_page = &H[page * (m * n * n)];
                double const *J_page = &J[page * (n * p)];
                double *out_page = &out[page * (m * p * p)];
                for(size_t k = 0; k < m; ++k) {
                    double const *H_block = &H_page[k * n];
                    double *out_block = &out_page[k * p];
                    dsymm(
                        &char_L, &char_L,
                        &n, &p,
                        &one, H_block, &n_rows_H,
                        J_page, &n,
                        &zero, tmp, &n);
                    dgemm(
                        &char_T, &char_N,
                        &p, &p,
                        &n,
                        &one,
                        J_page, &n,
                        tmp, &n,
                        &zero, out_block, &n_rows_out);
                }
            }

            //free(tmp);
        }

    }

    plhs[0] = out_array;

}
