function [states_dot, output] = source_model(states, controls)
% model interface created by falcon.m

p = 0.14;

% Extract states
y1      = states(1);
y2      = states(2);
L       = states(3);

% Extract controls
u   = controls(1);

% ------------------------ %
% implement the model here %
% ------------------------ %

% implement state derivatives here
% x_dot   = x_dot;
% y_dot   = y_dot;
y1_dot   = y2;
y2_dot   = -y1 + y2*(1.4-p*y2^2) + 4*u;
L_dot    = (u^2 + y1^2);

states_dot = [y1_dot; y2_dot; L_dot];
output = u + y1 / 6;
end
