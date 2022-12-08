function [constraints] = source_path(outputs, states, controls)
% constraint interface created by falcon.m

% Extract outputs
control_constr = outputs(1);

% Extract states
y1             = states(1);
y2             = states(2);
L              = states(3);

% Extract controls
u              = controls(1);

% ----------------------------- %
% implement the constraint here %
% ----------------------------- %

% implement constraint values here
constraints = [control_constr];

end
