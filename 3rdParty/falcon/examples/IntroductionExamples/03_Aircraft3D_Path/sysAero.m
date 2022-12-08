function [ L, D ] = sysAero( Coeffs, V, S, rho )
%SYSAERO Summary of this function goes here
%   Detailed explanation goes here

C_L = Coeffs(1);
C_D = Coeffs(2);

qs = rho * S * V^2 / 2;

L = qs * C_L;
D = qs * C_D;

end

