function [x_dot, y] = model_pt2(x, u, p)
% Extract States
x1      = x(1);
x2      = x(2);

% Extract Controls
D       = p(1);
omega_0 = p(2);
k_s     = p(3);

% implementation of PT2 dynamics
x1_dot = x2;
x2_dot = k_s * omega_0^2 * u - 2 * D * omega_0 * x2 - omega_0^2 * x1;

% implementation of output equation
y1 = x1;
y2 = x2;

% collect outputs
x_dot   = [x1_dot;  x2_dot];
y       = [y1;      y2];
end

