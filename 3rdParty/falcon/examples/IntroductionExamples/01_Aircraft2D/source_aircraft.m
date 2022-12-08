function [states_dot] = source_aircraft(states, controls)
% model interface created by falcon.m

% Extract states
x     = states(1);
z     = states(2);
V     = states(3);
gamma = states(4);

% Extract controls
C_T   = controls(1);
C_L   = controls(2);

% Constants
g = 9.81; % m/s^2
m = 55e3; % kg
rho = 1.225; % kg/m^3
S = 123; % m^2
T_max = 2e5;  % N

% Calculate thrust
T = T_max * C_T;

% Calculate drag
C_D = 0.03 + 0.04 * C_L^2;
D = rho/2 * V^2 * S * C_D;

% implement state derivatives here
x_dot     =  V * cos(gamma);
z_dot     = -V * sin(gamma);
V_dot     = 1/m * (T-D) - g*sin(gamma);
gamma_dot = 1/m * rho/2 * V * S * C_L - g/V*cos(gamma);

states_dot = [x_dot; z_dot; V_dot; gamma_dot];

end
