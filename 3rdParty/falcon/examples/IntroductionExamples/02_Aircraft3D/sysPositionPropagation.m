function [ xdot, ydot, zdot ] = sysPositionPropagation( V, chi, gamma )
%SYSKINEMATICS Summary of this function goes here
%   Detailed explanation goes here

xdot =  V * cos(chi) * cos(gamma);
ydot =  V * sin(chi) * cos(gamma);
zdot = -V            * sin(gamma);

pos_dot = [xdot; ydot; zdot];

end

