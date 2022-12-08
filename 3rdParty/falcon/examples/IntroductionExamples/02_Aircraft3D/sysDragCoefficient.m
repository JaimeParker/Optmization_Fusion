function [ CD, jCD ] = sysDragCoefficient( CL )
%SYSDRAGCOEFFICIENT Summary of this function goes here
%   Detailed explanation goes here

CL_break = [-1 -0.6, -0.2, 0.2, 0.6, 1, 1.4, 1.8, 2.2, 2.6, 3];
CD_break = [0.07, 0.0444, 0.0316, 0.0316, 0.0444, 0.07, 0.1084, 0.1596, 0.2236, 0.3004, 0.39];

delta = 1e-6;

CD = interp1(CL_break, CD_break, CL);
jCD = (interp1(CL_break, CD_break, CL+delta) - CD) / delta;


end

