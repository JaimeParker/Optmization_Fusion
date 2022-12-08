function [constraints] = source_path_reduced(V, chidot)

% ----------------------------- %
% implement the constraint here %
% ----------------------------- %

% implement constraint values here
turnlb = -0.5/V - chidot;
turnub = chidot - 0.5/V;
constraints = [turnlb; turnub];

end
