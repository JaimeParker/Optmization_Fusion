#include "mex.h"

/* Add this declaration because it does not exist in the "mex.h" header */
extern int mxUnshareArray(mxArray *array_ptr, int level);

// INTERFACE (G, indG, J, indJ)
void mexFunction( int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[] ) {
    
    // NOTES:
    // - mxGetM and mxGetN always return size of matrix regardless of datatype
    
    // Declaration
    double      *G;
    uint32_T *indG;
    uint32_T  numG;
    size_t      nG;
    size_t       i;
    
    // Check Input Arguments
    if(nrhs != 2){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Function was called with incorrect number of arguments.");
    }
    
    // Unshare the array before changing it
    mxUnshareArray(prhs[0], true);
    
    // Extract Data
    // ... sparse G
    G       = mxGetPr(prhs[0]);
    numG    = mxGetM(prhs[0]) * mxGetN(prhs[0]);
    indG    = (uint32_T*)mxGetData(prhs[1]);
    nG      = mxGetM(prhs[1])*mxGetN(prhs[1]);
    
    // Write Values
    for (i = 0; i < nG; i++)
    {
        //mexPrintf("%i, %i, %i, %i\n", indG[i], numG, indJ[i], numJ);
        if (indG[i] >= 1 && indG[i] <= numG)
        {
            G[indG[i]-1] = G[indG[i]-1] + 1;
        }
        else
            mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                    "Internal Error. Assignment is out of bounds.");
    }
    
    // Write Outputs
    plhs[0] = mxCreateSharedDataCopy(prhs[0]);
}