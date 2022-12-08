/* Match two grids */
/* The function is called as */
/* [Obj.StateGridIndices, MinValues] = MatchGrids( StateGrid.getNormalizedTime(), Obj.InternalNormalizedTime); */
#include "mex.h"
#include "string.h"
#include "math.h"

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void mexFunction(int nlhs, mxArray *plhs[],
        int nrhs, const mxArray *prhs[])
{
    const mxArray *stateptr, *timeptr;
    double *timegrid, *stategrid, *Index, *MinDist;
    double mindist;
    mwSize m,n, Ntimegrid, Nstategrid;
    mwIndex timeindex, stateindex;
    
    if(nrhs != 2) {
        mexErrMsgIdAndTxt("falcon:InvalidInput", "MatchGrids needs two input arguments.");
    }
    if(nlhs > 2) {
        mexErrMsgIdAndTxt("falcon:InvalidInput", "Too many output arguments.");
    }
    if(!(mxIsDouble(prhs[0]))) {
        mexErrMsgIdAndTxt("falcon:InvalidInput", "Input argument 1 must be of type double.");
    }
    if(!(mxIsDouble(prhs[1]))) {
        mexErrMsgIdAndTxt("falcon:InvalidInput", "Input argument 2 must be of type double.");
    }
    /* Get the inputs */
    stateptr = prhs[0];
    timeptr  = prhs[1];
    /* First input:  stategrid is the base grid */
    /* Second input: timegrid is the grid to be matched */
    
    /* Determine the sizes */
    m = mxGetM(stateptr);
    n = mxGetN(stateptr);
    Nstategrid = MAX(m, n);
    if(m != 1 && n != 1){
        mexErrMsgIdAndTxt("falcon:InvalidInput", "Input 2 must be a vector.");
    }
    
    m = mxGetM(timeptr);
    n = mxGetN(timeptr);
    Ntimegrid = MAX(m, n);
    if(m != 1 && n != 1){
        mexErrMsgIdAndTxt("falcon:InvalidInput", "Input 1 must be a vector.");
    }
    
    /* Get the values */
    stategrid= mxGetPr(stateptr);
    timegrid = mxGetPr(timeptr);
    
    /* Check that both inputs are in ascending order */
    /*for(timeindex = 1; timeindex < Nstategrid; timeindex++){
     * if(stategrid[timeindex-1] >= stategrid[timeindex]){
     * mexErrMsgTxt("Input 1 must be strictly ascending.");
     * }
     * }
     * for(timeindex = 1; timeindex < Ntimegrid; timeindex++){
     * if(timegrid[timeindex-1] >= timegrid[timeindex]){
     * mexErrMsgTxt("Input 2 must be strictly ascending.");
     * }
     * }*/
    
    /* Create the output arrays and link them */
    plhs[0] = mxCreateDoubleMatrix(m, n, mxREAL);
    Index = mxGetPr(plhs[0]);
    plhs[1] = mxCreateDoubleMatrix(m, n, mxREAL);
    MinDist = mxGetPr(plhs[1]);
    
    stateindex = 0;
    /* Iterate over all points in the timegrid */
    for(timeindex = 0; timeindex < Ntimegrid; timeindex++){
        /* Init the distance between the stategrid and the current time point */
        mindist = fabs(timegrid[timeindex] - stategrid[stateindex]);
        /* Go through the stategrid until the distance starts to grow again */
        while(stateindex < Nstategrid-1){
            if(mindist > fabs(timegrid[timeindex] - stategrid[stateindex+1])){
                mindist = fabs(timegrid[timeindex] - stategrid[stateindex+1]);
                stateindex++;
            }else{
                break; /* reached the end, break the while loop */
            }
        }
        
        /* Write the outputs */
        Index[timeindex] = (double)(stateindex+1);
        MinDist[timeindex] = mindist;
    }
}
