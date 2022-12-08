#include "mex.h"

void Add_SubB_To_SubA(double* A, size_t Am, size_t An, size_t Aim, size_t Ain,
        size_t sm, size_t sn, double alphaA, double alphaB,
        double* B, size_t Bm, size_t Bn, size_t Bim, size_t Bin);
void Add_ElementsB_To_ElementsA(double* A, size_t Am, size_t An, size_t Aim, size_t Ain, size_t Asm, size_t Asn,
        double alphaA, double alphaB,
        double* B, size_t Bm, size_t Bn, size_t Bim, size_t Bin, size_t Bsm, size_t Bsn);

// void ReplaceSubMatrix(double* M, mwSize mM, mwSize mN, mwSize iM, mwSize iN, double *S, mwSize sM, mwSize sN);
// void AddSubMatrix(double* M, mwSize mM, mwSize mN, mwSize iM, mwSize iN, double *S, mwSize sM, mwSize sN);
// void ExtractSubMatrix(double* M, mwSize mM, mwSize mN, mwSize iM, mwSize iN, double *S, mwSize sM, mwSize sN);