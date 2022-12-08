#include "mex.h"

/* Add this declaration because it does not exist in the "mex.h" header */
extern int mxUnshareArray(mxArray *array_ptr, int level);

// INTERFACE (G, indG, J, indJ)
void mexFunction( int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[] ) {
    
    // NOTES:
    // - mxGetM and mxGetN always return size of matrix regardless of datatype
    
    // Declaration
    double      *G;
    double      *J;
    double      *w;
    double      *h;
    uint32_T *indJ;
    uint32_T *indG;
    uint32_T *indh;
    uint32_T  numG;
    uint32_T  numJ;
    uint32_T  numh;
    size_t      nG;
    size_t      nJ;
    size_t      nw;
    size_t      nh;
    size_t       i;
    
    // Check Input Arguments
    if(nrhs != 7){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Function was called with incorrect number of arguments.");
    }
    
    // Extract Data
    // ... sparse G
    nG      = mxGetM(prhs[1])*mxGetN(prhs[1]);
    
    // ... Jacobian
    nJ      = mxGetM(prhs[3])*mxGetN(prhs[3]);
    nw      = mxGetM(prhs[4])*mxGetN(prhs[4]);
    
    // ... sparse h
    nh      = mxGetM(prhs[6])*mxGetN(prhs[6]);
    
    // Input Consistency Check
    if(nG != nJ){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Left and Right Side assigment must be the same number of elements.");
    }
    
    if(nG != nw){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Left and Right Side assigment must be the same number of elements.");
    }
    
    if(nG != nh){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Left and Right Side assigment must be the same number of elements.");
    }
    
    // Unshare the array before changing it
    mxUnshareArray(prhs[0], true);
    
    // Extract Data
    // ... sparse G
    G       = mxGetPr(prhs[0]);
    numG    = mxGetM(prhs[0]) * mxGetN(prhs[0]);
    indG    = (uint32_T*)mxGetData(prhs[1]);
    nG      = mxGetM(prhs[1])*mxGetN(prhs[1]);
    
    // ... Jacobian
    J       = mxGetPr(prhs[2]);
    numJ    = mxGetM(prhs[2]) * mxGetN(prhs[2]);
    indJ    = (uint32_T*)mxGetData(prhs[3]);
    nJ      = mxGetM(prhs[3])*mxGetN(prhs[3]);
    w       = mxGetPr(prhs[4]);
    nw      = mxGetM(prhs[4])*mxGetN(prhs[4]);
    
    // ... sparse h
    h       = mxGetPr(prhs[5]);
    numh    = mxGetM(prhs[5]) * mxGetN(prhs[5]);
    indh    = (uint32_T*)mxGetData(prhs[6]);
    nh      = mxGetM(prhs[6])*mxGetN(prhs[6]);
    
    // Write Values
    for (i = 0; i < nG; i++)
    {
        if (indG[i] >= 1 && indG[i] <= numG && indJ[i] >= 1 && indJ[i] <= numJ && indh[i] >= 1 && indh[i] <= numh )
            G[indG[i]-1] = G[indG[i]-1] - J[indJ[i]-1] * h[indh[i]-1] * w[i];
        else
            mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                    "Internal Error. Assignment is out of bounds.");
    }
    
    // Write Outputs
    plhs[0] = mxCreateSharedDataCopy(prhs[0]);
}