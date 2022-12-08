function [states_dot, y] = source_car(states, controls)
% model interface created by falcon.m

% Extract states
x      = states(1);
y      = states(2);
V      = states(3);
chi    = states(4);

% Extract controls
Vdot   = controls(1);
chidot = controls(2);

% ------------------------ %
% implement the model here %
% ------------------------ %

% implement state derivatives here
x_dot   = V*cos(chi);
y_dot   = V*sin(chi);
V_dot   = Vdot;
chi_dot = chidot;
states_dot = [x_dot; y_dot; V_dot; chi_dot];

y =  [V*sin(chi); V+1];

end
