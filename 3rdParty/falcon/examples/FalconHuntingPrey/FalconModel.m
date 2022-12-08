function [states_dot] = FalconModel(states, controls)
% model interface created by falcon.m

% Extract states
V     = states(1);
gamma = states(2);
% h     = states(3);
% s     = states(4);

% Extract controls
P     = controls(1);
C_L   = controls(2);

% Constants
g            = 9.81;
m            = 0.014;
rho          = 1.2922;
C_D0_flap    = 0.03;
S            = 100e-4;
k_flap       = 0.0833;

% Aerodynamics
C_D          = C_D0_flap + k_flap .* C_L.^2;
D = C_D.*rho/2.*V.^2.*S;
L = C_L.*rho/2.*V.^2.*S;

T = P./V;

% implement state derivatives here
V_dot     = (T-D)./m-g.*sin(gamma);
gamma_dot = L./(m.*V)-g./V.*cos(gamma);
h_dot     = V.*sin(gamma);
s_dot     = V.*cos(gamma);

states_dot = [V_dot; gamma_dot; h_dot; s_dot];

end
