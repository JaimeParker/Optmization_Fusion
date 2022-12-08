function [constraints] = HeightConstraint(states, controls)
% constraint interface created by falcon.m

% Extract states
% V     = states(1);
% gamma = states(2);
h     = states(3);
s     = states(4);

% Extract controls
% P     = controls(1);
% C_L   = controls(2);

% ----------------------------- %
% implement the constraint here %
% ----------------------------- %

% implement constraint values here
PCon_h_s = (0.0.*s + 40) .* (0.5.*tanh(0.1.*(s-55))+0.5) .* (0.5.*tanh(-(0.7.*s-70))+0.5) - 0.3 - h;
constraints = PCon_h_s;

end
