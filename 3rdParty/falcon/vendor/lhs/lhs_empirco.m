function s=lhs_empirco(data,nsample)
% s=lhs_empirco(data,nsample)
% perform lhs on multivariate empirical distribution
% with correlation
% Input:
%   data    : data matrix (ndata,nvar)
%   nsample : no. of samples
% Output:
%   s       : random sample (nsample,nvar)
%   Budiman (2003)

[~,nvar]=size(data);
corr=corrcoef(data);
rc=rank_corr(corr,nsample); % induce correlation

for cnt_j=1:nvar
    r=rc(:,cnt_j);
    % draw random no.
    u=rand(nsample,1);
    % calculate percentile
    p=((r-u)./nsample).*100;
    % inverse from empirical distribution
    s(:,cnt_j) = prctile(data(:,cnt_j),p);
end
end