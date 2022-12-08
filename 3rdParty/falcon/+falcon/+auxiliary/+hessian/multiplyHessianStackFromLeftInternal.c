#include "mex.h"
#include "blas.h"

#if !defined(_WIN32)
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
    mxArray const *J_T_array = prhs[1];

    if(!(mxIsDouble(H_array) && mxIsDouble(J_T_array))) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Wrong argument type");
    }
    if(mxIsComplex(H_array) || mxIsComplex(J_T_array)) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Wrong argument complexity");
    }

    ptrdiff_t n = num_cols(H_array);
    ptrdiff_t m = num_rows(H_array) / n;
    ptrdiff_t p = num_rows(J_T_array);
    ptrdiff_t q = num_pages(H_array);

    if(num_rows(H_array) != m * n || num_cols(J_T_array) != n) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Dimensions mismatch");
    }

    if(num_pages(J_T_array) != q) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Page count mismatch");
    }

    double const *H = mxGetPr(H_array);
    double const *J_T = mxGetPr(J_T_array);

    mwSize out_size[] = { m * p, n, q };
    mxArray *out_array =
        mxCreateNumericArray(3, out_size, mxDOUBLE_CLASS, mxREAL);
    if(!out_array) {
        mexErrMsgIdAndTxt("falcon:InternalError", "Failed to allocate array");
    }
    double *out = mxGetPr(out_array);

    ptrdiff_t n_rows_H = m * n;
    ptrdiff_t n_rows_out = m * p;
    char side_R = 'R';
    char uplo_L = 'L';
    double one = 1;
    double zero = 0;

    #pragma omp parallel for \
        schedule(static) \
        shared(J_T, H, out) \
        if (q > PAGE_PARALLELIZATION_THRESHOLD)
    for(ptrdiff_t page = 0; page < q; ++page) {
        double const *H_page = &H[page * (m * n * n)];
        double const *J_T_page = &J_T[page * (p * n)];
        double *out_page = &out[page * (m * p * n)];
        for(ptrdiff_t k = 0; k < m; ++k) {
            double const *H_block = &H_page[k * n];  // left upper corner
            double *out_block = &out_page[k * p];
            dsymm(
                &side_R, &uplo_L,
                &p, &n,
                &one, H_block, &n_rows_H,
                J_T_page, &p,
                &zero, out_block, &n_rows_out);
        }
    }

    plhs[0] = out_array;

}
