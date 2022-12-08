function [x,F,inform,xmul,Fmul] = snopt_hdl(x,xlow,xupp,Flow,Fupp,userfun,grad_opt,varargin)
%        [x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun,varargin);
%
% This function is intended to solve the following NLP:
% minimize:
%            F(ObjRow) + ObjAdd
% subject to:
%            xlow <= x <= xupp
%            Flow <= F <= Fupp
% where F is a vector of functions containing the objective and constraint
% functions.
%
% Calling sequence 1:
%  [x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun)
%
% Calling sequence 2:
%  [x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun,
%                                 ObjAdd, ObjRow)
% Calling sequence 3:
%  [x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun,
%                                 A, iAfun, jAvar, iGfun, jGvar)
% Calling sequence 4:
%  [x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun,
%                                 ObjAdd, ObjRow,
%                                 A, iAfun, jAvar, iGfun, jGvar)
% Calling sequence 5:
%  [x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun,
%                                 ObjAdd, ObjRow,
%                                 A, iAfun, jAvar, iGfun, jGvar,
%                                 xmul, Fmul)

% Description of the arguments:
%  x          -- initial guess for x.
%  xlow, xupp -- upper and lower bounds on x.
%  Flow, Fupp -- upper and lower bounds on F.
%  userfun    -- a string denoting name of a user-defined function
%                that computes the objective and constraint functions
%                and their corresponding derivatives.
%                WARNING: If arguments iAfun, jAvar, and A, are provided,
%                then it is crucial that the associated linear terms
%                are not included in the calculation of F in userfun.
%                **Example:
%                      >> [f,G] = feval(userfun,x);
%                      >> F  = sparse(iAfun,jAvar,A)*x + f
%                      >> DF = sparse(iAfun,jAvar,A) + sparse(iGfun,jGvar,G)
%                (where DF denotes F').
%                G must be either a dense matrix, or a vector of derivatives
%                in the same order as the indices iGfun and jGvar, i.e.,
%                if G is a vector, the Jacobian of f is given
%                by sparse(iGfun,jGvar,G).
%
%                **More details on G:
%                The user maybe define, all, some, or none of the
%                entries of G.  If the user does NOT intend to
%                supply ALL nonzero entries of G, it is imperative
%                that the proper derivative level is set prior to
%                a call to snopt():
%                     >> snseti("Derivative option",k);
%                where k = 0 or 1.  Meaning:
%                    1 -- Default.  All derivatives are provided.
%                    0 -- Some derivatives are not provided.
%                For the case k = 0 (ONLY), G may be returned as
%                an empty array [].
%                For the case k = 0, the user must denote
%                unknown NONZERO elements of G by NaN.
%                **Example: (vector case)
%                   >> G = [1, NaN, 3, NaN, -5]';
%                  or (full matrix case)
%                   >> G = [1, 0, NaN; 0 NaN 2; 0 0 3];
% ObjAdd       -- Default 0.  Constant added to F(ObjRow).
% ObjRow       -- Default 1.  Denotes row of objective function in F.
% A            -- Constant elements in the Jacobian of F.
% iAfun, jAvar -- Indices of A, corresponding to A.
% iGfun, jGvar -- Indices of nonlinear elements in the Jacobian of F.
%
% More IMPORTANT details:
%   1) The indices (iAfun,jAvar) must be DISJOINT from (iGfun,jGvar).
%      A nonzero element in F' must be either an element of G or an
%      element of A, but not the sum of the two.
%
%   2) If the user does not wish to provide iAfun, jAvar, iGfun,
%      jGvar, then snopt() will determine them by calling snJac().
%
%      WARNING: In this case, the derivative level will be set to zero
%      if constant elements exist.  This is because the linear
%      elements have not yet been deleted from the definition of
%      userfun.  Furthermore, if G is given in vector form, the
%      ordering of G may not necessarily correspond to (iGfun,jGvar)
%      computed by snJac().


%************************************************************************************************************
%%  %* SNOPT for user functions defined as function handles                                                     *
%************************************************************************************************************
%*  <Weingartner, Michael>           <2010-11-18>                                                           *
%************************************************************************************************************
%*                                                                        %                                   *
global xfinal Ffinal

np = length(x);
if isempty(xlow)
    xlow=-inf*ones(np,1);
end
if isempty(xupp)
    xupp=inf*ones(np,1);
end
if isempty(Flow)
    Flow=-inf;
end
if isempty(Fupp)
    Fupp=inf;
end

global userfun_hdl
userfun_hdl = userfun;

%generic user function, calls the global function handle userfun_hdl
if grad_opt==1
    userfun_name = 'fun_generic2';
else
    userfun_name = 'fun_generic';
end

%SNOPT optimization
[x,F,inform,xmul,Fmul] = snopt(x,xlow,xupp,Flow,Fupp,userfun_name,varargin{:});
%[x,F,inform,xmul,Fmul] = snsolve(x,xlow,xupp,Flow,Fupp,userfun_name,varargin{:});
xfinal = x;
Ffinal = F;
%*                                                                      %                                   *
%************************************************************************************************************


end




