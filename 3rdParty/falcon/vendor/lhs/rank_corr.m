function rc=rank_corr(corr,nsample)
% rc=rank_corr(corr,nsample)
% induce rank correlation
% method of Iman & Conover
% Iman, R. L., and W. J. Conover. 1982. A Distribution-free Approach to
% Inducing Rank Correlation Among Input Variables.
% Communications in Statistics B 11:311-334.
% Input:
%   corr    : correlation matrix of the variables (nvar,nvar)
%   nsample : no. of samples
% Output:
%   rc       : rank (nsample,nvar)
%   Budiman (2004)

nvar=length(corr);

% induce data with correlation
xm=zeros(1,nvar);
xs=ones(1,nvar);
R=latin_hs(xm,xs,nsample,nvar);
T = corrcoef(R);
P = chol(corr)';
Q = chol(T)';

S = P / Q;
RB= R*S';

for cnt_var=1:nvar
    % rank RB
    [r,~]=ranking(RB(:,cnt_var));
    rc(:,cnt_var) = r;
end
end