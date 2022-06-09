function x1 = Hills2ECI( x0, xH )
%#eml
%-------------------------------------------------------------------------------
%   Given the reference state in ECI, converts a Hills frame state to ECI.
%-------------------------------------------------------------------------------
%   Form:
%   x1 = Hills2ECI( x0, xH )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   x0              (6,1) [r;v] ECI frame
%   xH              (6,n) [r;v] Hills frame
%
%   -------
%   Outputs
%   -------
%   x1              (6,n) [r; v] ECI frame
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 2001 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

% Cylindrical system
%-------------------
A = GetHillsMats( x0(1:3,1), x0(4:6,1) );
x1 = zeros(6,1);
x1(1:3,1) = x0(1:3,1) + A' * xH(1:3,1);
%    el= RV2El(x0);
%    a  = el(1);
%    e  = el(2);
%    M = el(6);
%    nu=M2f(M,e);
%    mu = 3.9860044e14;
% %    n  = sqrt(mu*a^-3);   
% %    thetaDot = n*power(1+e*cos(nu),2)*power(1-e*e,-3/2);    %this equation
% %    will cause problems when e>1, modified by Dang Zhaohui in 2016-12-23
% %    in Ma Lan, Xin Jiang
%    p = a*(1-e^2);
%    thetaDot = (1+e*cos(nu))^2*sqrt(mu/p^3);
%    w = [0; 0; thetaDot];
%    
%  x1(4:6,1)  = x0(4:6,1) +  A'*(xH(4:6,1) + cross( w, xH(1:3,1)));

w_eci = cross(x0(1:3,1),x0(4:6,1))/norm(x0(1:3,1))^2;
wmat = [0,-w_eci(3),w_eci(2);
    w_eci(3),0,-w_eci(1);
    -w_eci(2),w_eci(1),0];
x1(4:6,1)  = x0(4:6,1) +  A'*xH(4:6,1) + wmat*A'*xH(1:3,1);

%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2007-06-27 15:15:18 -0400 (Wed, 27 Jun 2007) $
% $Revision: 10087 $
