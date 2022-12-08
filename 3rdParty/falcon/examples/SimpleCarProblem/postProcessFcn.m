function [y_dot,V_square] = postProcessFcn(chi,V)
% ------------------------ %
% implement the post-processing step here %
% ------------------------ %

% implement post-processing value
y_dot    = V.*sin(chi);
V_square = V.^2;

% EoF
end
