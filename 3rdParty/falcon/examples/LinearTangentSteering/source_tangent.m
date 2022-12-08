function [states_dot] = source_tangent(states, controls)
% model interface created by falcon.m

a = 100;

% Extract states
x      = states(1);
y      = states(2);
x_dot  = states(3);
y_dot  = states(4);

% Extract controls
u   = controls(1);

% ------------------------ %
% implement the model here %
% ------------------------ %

% implement state derivatives here
% x_dot   = x_dot;
% y_dot   = y_dot;
x_ddot   = a*cos(u);
y_ddot   = a*sin(u);
states_dot = [x_dot; y_dot; x_ddot; y_ddot];

end
