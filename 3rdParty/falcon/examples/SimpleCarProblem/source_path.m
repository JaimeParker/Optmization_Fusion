function [constraints] = source_path(outputs, states, controls)
% constraint interface created by falcon.m

% Extract states
x      = states(1);
y      = states(2);
V      = states(3);
chi    = states(4);

% Extract controls
Vdot   = controls(1);
chidot = controls(2);

% ----------------------------- %
% implement the constraint here %
% ----------------------------- %

% implement constraint values here
turnlb = -0.5/V - chidot;
turnub = chidot - 0.5/V;
constraints = [turnlb; turnub];

end
