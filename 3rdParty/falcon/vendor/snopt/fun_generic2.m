%****************************************************************************************************************
%*   Name:                                       fun_generic                                                    *
%*   Project:                                                                                                   *
%*   (c) 2008 by Institute of Flight System Dynamics of Technische Universitaet Muenchen, All Rights Reserved   *
%****************************************************************************************************************
%* Circulation :    <FSD_Secret(Project)>                                                                       *
%* Purpose     :    provides generic user function which can be called by snopt                                 *
%* Description:     the generic user function calls the the original user function via its function handle      *
%*                  which is defined as global!                                                                 *
%* References  :                                                                                                *
%****************************************************************************************************************
%* Syntax   :   [cost,y] = oe_cost(y,p,z,rr,p0,M0, varargin)                                                    *
%*                                                                                                              *
%*  I N P U T S :       Description                                             Type        Dim     Unit        *
%*   x                  -  user function parameter vector                       double      [nx,1]  [mxd]       *
%*                                                                                                              *
%*  O U T P U T S :                                                                                             *
%*   f                  -  cost function values                                 double      [nf,1]    [-]       *
%*   varargout{1} =g    -  cost function jacobi matrix                          double      [nf,np]   [-]       *
%*                                                                                                              *
%*  C A L L S:                                                                                                  *
%*                                                                                                              *
%****************************************************************************************************************
%*  Author                  *     Date    *     Description                                                     *
%****************************************************************************************************************
%*  Weingartner, Michael    * 2010-11-18 *     initial function design                                          *
%****************************************************************************************************************
function [f,g] = fun_generic2(x)

%************************************************************************************************************
%%  %* Call original user function via its function handle                                                      *
%************************************************************************************************************
%*  <Weingartner, Michael>           <2010-11-18>                                                           *
%************************************************************************************************************
%*                                                                      %                                   *
%define global user function handle
global userfun_hdl

%call user function by using its function handle
[f,g]=feval(userfun_hdl,x);
%*                                                                      %                                   *
%************************************************************************************************************


end

