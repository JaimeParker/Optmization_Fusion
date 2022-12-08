function [r,sort_idx]=ranking(x)
% [r,i]=ranking(x)
% Ranking of a vector
% input:
%   x   : vector (nrow,1)
% output:
% r : rank of the vector  (nrow,1)
% i : index vector from the sort routine  (nrow,1)
%
n=length(x);
[~,sort_idx]=sort(x);
r(sort_idx,1)=(1:n).';
end