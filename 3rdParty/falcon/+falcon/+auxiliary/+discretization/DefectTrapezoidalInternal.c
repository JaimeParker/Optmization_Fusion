#include "mex.h"
#include "omp.h"

// INTERFACE (G, indG, J, indJ)
void mexFunction( int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[] ) {
    
    // NOTES:
    // - mxGetM and mxGetN always return size of matrix regardless of datatype
    
    // Declaration
    double        *x;
    double     *xdot;
    double        *h;
    double      *def;
    double  *sumxdot;
    size_t        nx;
    size_t     nxdot;
    size_t     nts_x;
    size_t  nts_xdot;
    size_t     nts_h;
    
    // Check Input Arguments
    if(nrhs != 3){
        mexErrMsgIdAndTxt( "falcon:SparsitySorting",
                "Internal Error. Function was called with incorrect number of arguments.");
    }
    
    // Extract Data
    // ... states x
    x       = mxGetPr(prhs[0]);
    nx      = mxGetM(prhs[0]);
    nts_x   = mxGetN(prhs[0]);
    
    // ... states dot xdot
    xdot       = mxGetPr(prhs[1]);
    nxdot      = mxGetM(prhs[1]);
    nts_xdot   = mxGetN(prhs[1]);
    
    // ... step size h
    h       = mxGetPr(prhs[2]);
    nts_h   = mxGetM(prhs[2])*mxGetN(prhs[2]);
    
    // Input Consistency Check
    if(nx != nxdot){
        mexErrMsgIdAndTxt( "falcon:Discretization",
                "Internal Error. number of states and number of states dot does not match.");
    }
    
    if(nts_x != nts_xdot){
        mexErrMsgIdAndTxt( "falcon:Discretization",
                "Internal Error. Number of time steps of states and states dot does not match.");
    }
    
    if(nts_x != nts_h+1){
        mexErrMsgIdAndTxt( "falcon:Discretization",
                "Internal Error. Number of time steps of states and number of step sizes does not match.");
    }
    
    // Create Outputs
    plhs[0] = mxCreateDoubleMatrix(nx, nts_x-1, mxREAL);
    plhs[1] = mxCreateDoubleMatrix(nx, nts_x-1, mxREAL);
    
    def     = mxGetPr(plhs[0]);
    sumxdot = mxGetPr(plhs[1]);
    
    // Write Values
#pragma omp parallel for
    for (size_t its = 0; its < nts_x-1; its++)
    {
        for (size_t ix = 0; ix < nx; ix++)
        {
            size_t ind      = nx*its+ix;
//             mexPrintf("%i, %i, %i\n",ind, ind+nx, nts_x);
            sumxdot[ind]    = xdot[ind+nx] + xdot[ind];
            def[ind]        = x[ind+nx] - x[ind] - h[its] * sumxdot[ind];
        }
    }
}