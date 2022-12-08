#include "MatrixFuncs.h"
#include "math.h"

void Add_SubB_To_SubA(double* A, size_t Am, size_t An, size_t Aim, size_t Ain,
        size_t sm, size_t sn, double alphaA, double alphaB,
        double* B, size_t Bm, size_t Bn, size_t Bim, size_t Bin)
{
    // Input Explanation
    // A    ... Matrix A to be altered
    // Am   ... Number of rows in A
    // An   ... Number of columns in A
    // Aim  ... Startrow of alteration in A
    // Ain  ... Starcolumn of alteration in A
    // sm   ... Number of rows in submatrix
    // sn   ... Number of columns in submatrix
    // alphaA.. Multiplier for changed A elements
    // alphaB.. Multiplier for changed B elements
    // B    ... Matrix B to be extracted from
    // Bm   ... Number of rows in B
    // Bn   ... Number of columns in B
    // Bim  ... Startrow of extraction in B
    // Bin  ... Starcolumn of extraction in B
    
    // Check Dimensions for feasibility
    if (Aim+sm > Am || Ain+sn > An)
    {
        mexErrMsgIdAndTxt("CLibraries:Matrix:Error","SubMatrix does not fit in A");
    }
    if (Bim+sm > Bm || Bin+sn > Bn)
    {
        mexErrMsgIdAndTxt("CLibraries:Matrix:Error","SubMatrix does not fit in B");
    }
    
    // Fill Matrix
    for (int is_col = 0; is_col < sn; is_col++) // run through all columns of the submatrix
    {
        int A_startindex = Aim + is_col * Am + Ain * Am;
        int B_startindex = Bim + is_col * Bm + Bin * Bm;
        for (int is_row = 0; is_row < sm; is_row++) // run through all columns of the submatrix
        {
            A[A_startindex + is_row] = alphaB * B[B_startindex + is_row] + alphaA * A[A_startindex + is_row];
        }
    }
}

void Add_ElementsB_To_ElementsA(double* A, size_t Am, size_t An, size_t Aim, size_t Ain, size_t Asm, size_t Asn,
        double alphaA, double alphaB,
        double* B, size_t Bm, size_t Bn, size_t Bim, size_t Bin, size_t Bsm, size_t Bsn)
{
    // Input Explanation
    // A    ... Matrix A to be altered
    // Am   ... Number of rows in A
    // An   ... Number of columns in A
    // Aim  ... Startrow of alteration in A
    // Ain  ... Starcolumn of alteration in A
    // Asm  ... Number of rows in submatrix A
    // Asn  ... Number of columns in submatrix A
    // alphaA.. Multiplier for changed A elements
    // alphaB.. Multiplier for changed B elements
    // B    ... Matrix B to be extracted from
    // Bm   ... Number of rows in B
    // Bn   ... Number of columns in B
    // Bim  ... Startrow of extraction in B
    // Bin  ... Starcolumn of extraction in B
    // Bsm  ... Number of rows in submatrix B
    // Bsn  ... Number of columns in submatrix B
    
    // Check Dimensions for feasibility
    if (Aim+Asm > Am || Ain+Asn > An)
    {
        mexErrMsgIdAndTxt("CLibraries:Matrix:Error","SubMatrix does not fit in A");
    }
    if (Bim+Bsm > Bm || Bin+Bsn > Bn)
    {
        mexErrMsgIdAndTxt("CLibraries:Matrix:Error","SubMatrix does not fit in B");
    }
    if (Asm*Asn != Bsm*Bsn)
    {
        mexErrMsgIdAndTxt("CLibraries:Matrix:Error","Number of Elements must be the same");
    }
    
    int A_startindex = Aim + Ain * Am;
    int B_startindex = Bim + Bin * Bm;
    
    // Fill Matrix
    for (int i = 0; i < Asm*Asn; i++) // run through all columns of the submatrix
    {
        // Get A subindex
        int A_sub_col = i/Asm;
        int A_sub_row = i % Asm;
        
        // Get A subindex
        int B_sub_col = i/Bsm;
        int B_sub_row = i % Bsm;
        
        A[A_startindex + A_sub_col * Am + A_sub_row] = alphaB * B[B_startindex + B_sub_col * Bm + B_sub_row] + alphaA * A[A_startindex + A_sub_col * Am + A_sub_row];
    }
}

// // // // // // void ReplaceSubMatrix(double* M, mwSize mM, mwSize mN, mwSize iM, mwSize iN, double *S, mwSize sM, mwSize sN)
// // // // // // {
// // // // // //     // Input Explanation
// // // // // //     // M    Matrix to be altered
// // // // // //     // mM   Number of Rows of M Matrix
// // // // // //     // mN   Number of Columns of M Matrix
// // // // // //     // iM   Startrow of alteration in M Matrix (zero indexed)
// // // // // //     // iN   Startcol of alteration in M Matrix (zero indexed)
// // // // // //     // S    Replace matrix for submatrix in M
// // // // // //     // sM   Number of Rows of S Matrix
// // // // // //     // sN   Number of columns of S Matrix
// // // // // //
// // // // // //     // Check Dimensions for feasability
// // // // // //     if (iM+sM > mM || iN+sN > mN)
// // // // // //     {
// // // // // //         mexErrMsgIdAndTxt("MATLAB:Matrix:Error","SubMatrix does not fit");
// // // // // //     }
// // // // // //
// // // // // //     // Fill Matrix
// // // // // //     for (int iS_col = 0; iS_col < sN; iS_col++) // Go through all columns of the matrix S
// // // // // //     {
// // // // // //         int s_startindex = iS_col * sM;
// // // // // //         int m_startindex = mM * (iN + iS_col) + iM;
// // // // // //
// // // // // //         for (int iS_row = 0; iS_row < sM; iS_row++)
// // // // // //         {
// // // // // //             M[m_startindex + iS_row] = S[s_startindex + iS_row];
// // // // // //         }
// // // // // //     }
// // // // // // }
// // // // // //
// // // // // // void AddSubMatrix(double* M, mwSize mM, mwSize mN, mwSize iM, mwSize iN, double *S, mwSize sM, mwSize sN)
// // // // // // {
// // // // // //     // Input Explanation
// // // // // //     // M    Matrix to be altered
// // // // // //     // mM   Number of Rows of M Matrix
// // // // // //     // mN   Number of Columns of M Matrix
// // // // // //     // iM   Startrow of alteration in M Matrix (zero indexed)
// // // // // //     // iN   Startcol of alteration in M Matrix (zero indexed)
// // // // // //     // S    Replace matrix for submatrix in M
// // // // // //     // sM   Number of Rows of S Matrix
// // // // // //     // sN   Number of columns of S Matrix
// // // // // //
// // // // // //     // Check Dimensions for feasability
// // // // // //     if (iM+sM > mM || iN+sN > mN)
// // // // // //     {
// // // // // //         mexErrMsgIdAndTxt("MATLAB:Matrix:Error","SubMatrix does not fit");
// // // // // //     }
// // // // // //
// // // // // //     // Fill Matrix
// // // // // //     for (int iS_col = 0; iS_col < sN; iS_col++) // Go through all columns of the matrix S
// // // // // //     {
// // // // // //         int s_startindex = iS_col * sM;
// // // // // //         int m_startindex = mM * (iN + iS_col) + iM;
// // // // // //
// // // // // //         for (int iS_row = 0; iS_row < sM; iS_row++)
// // // // // //         {
// // // // // //             M[m_startindex + iS_row] += S[s_startindex + iS_row];
// // // // // //         }
// // // // // //     }
// // // // // // }
// // // // // //
// // // // // // void ExtractSubMatrix(double* M, mwSize mM, mwSize mN, mwSize iM, mwSize iN, double *S, mwSize sM, mwSize sN)
// // // // // // {
// // // // // //     // Input Explanation
// // // // // //     // M    Matrix to be extracted from
// // // // // //     // mM   Number of Rows of M Matrix
// // // // // //     // mN   Number of Columns of M Matrix
// // // // // //     // iM   Startrow of alteration in M Matrix (zero indexed)
// // // // // //     // iN   Startcol of alteration in M Matrix (zero indexed)
// // // // // //     // S    Submatrix to be extracted from M
// // // // // //     // sM   Number of Rows of S Matrix
// // // // // //     // sN   Number of columns of S Matrix
// // // // // //
// // // // // //     // Check Dimensions for feasability
// // // // // //     if (iM+sM > mM || iN+sN > mN)
// // // // // //     {
// // // // // //         mexErrMsgIdAndTxt("MATLAB:Matrix:Error","SubMatrix does not fit");
// // // // // //     }
// // // // // //
// // // // // //     // Fill Matrix
// // // // // //     for (int iS_col = 0; iS_col < sN; iS_col++) // Go through all columns of the matrix S
// // // // // //     {
// // // // // //         int s_startindex = iS_col * sM;
// // // // // //         int m_startindex = mM * (iN + iS_col) + iM;
// // // // // //
// // // // // //         for (int iS_row = 0; iS_row < sM; iS_row++)
// // // // // //         {
// // // // // //             S[s_startindex + iS_row] = M[m_startindex + iS_row];
// // // // // //         }
// // // // // //     }
// // // // // // }