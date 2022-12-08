#include "mex.h"

// INTERFACE (G, indG, J, indJ)
void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] ) {
    
    // NOTES:
    // - mxGetM and mxGetN always return size of matrix regardless of datatype
    
    // Declaration
    double      *G;
    double      *J;
    double      *w;
    uint32_T *indJ;
    uint32_T *indG;
    uint32_T  numG;
    uint32_T  numJ;
    size_t      nG;
    size_t      nJ;
    size_t      nw;
    size_t       i;
    
    // Check Input Arguments
    if(nrhs != 5){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Function was called with incorrect number of arguments.");
    }
    
    // Extract data for checking
    // ... sparse G
    nG      = mxGetM(prhs[1])*mxGetN(prhs[1]);
    
    // ... Jacobian
    nJ      = mxGetM(prhs[3])*mxGetN(prhs[3]);
    nw      = mxGetM(prhs[4])*mxGetN(prhs[4]);
    
    // Input Consistency Check
    if(nG != nJ){
        mexErrMsgIdAndTxt("falcon:SparsitySorting",
                "Internal Error. Left and Right Side assigment must be the same number of elements.");
    }
    
    if(nG != nw){
        mexErrMsgIdAndTxt("falcon:SparsitySorting",
                "Internal Error. Left and Right Side assigment must be the same number of elements.");
    }
    
    // Copy the output array in order to not mess with Matlabs memory
    plhs[0] = mxDuplicateArray(prhs[0]);
    
    // Extract Data
    // ... sparse G
    G       = mxGetPr(plhs[0]);
    numG    = mxGetM(plhs[0]) * mxGetN(plhs[0]);
    indG    = (uint32_T*)mxGetData(prhs[1]);
    nG      = mxGetM(prhs[1])*mxGetN(prhs[1]);
    
    // ... Jacobian
    J       = mxGetPr(prhs[2]);
    numJ    = mxGetM(prhs[2]) * mxGetN(prhs[2]);
    indJ    = (uint32_T*)mxGetData(prhs[3]);
    nJ      = mxGetM(prhs[3])*mxGetN(prhs[3]);
    w       = mxGetPr(prhs[4]);
    nw      = mxGetM(prhs[4])*mxGetN(prhs[4]);
    
    // Write Values
    for (i = 0; i < nG; i++)
    {
        if (indG[i] >= 1 && indG[i] <= numG && indJ[i] >= 1 && indJ[i] <= numJ )
            G[indG[i]-1] = G[indG[i]-1] + J[indJ[i]-1] * w[i];
        else
            mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                    "Internal Error. Assignment is out of bounds.");
    }
}