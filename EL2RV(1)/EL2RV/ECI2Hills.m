function xH = ECI2Hills( x0, x1 )
%#eml
%-------------------------------------------------------------------------------
%   Compute the relative state in Hills frame given two ECI state vectors.
%   The first input is treated as the reference state.
%-------------------------------------------------------------------------------
%   Form:
%   xH = ECI2Hills( x0, x1 )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   x0              (6,1) [r;v] ECI frame (reference)
%   x1              (6,n) [r;v] ECI frame
%
%   -------
%   Outputs
%   -------
%   xH              (6,n) [r; v] Hills frame
%                         [dR; r1*dTheta; dZ; dRDot; r1*dThetaDot; dZDot]
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	  Copyright 2001 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

% Cylindrical system
%-------------------
A         = GetHillsMats( x0(1:3,1), x0(4:6,1) );
xH = zeros(6,1);
xH(1:3,1) = A * (x1(1:3,1)-x0(1:3,1));

%    el = RV2El(x0);
%    a  = el(1);
%    e  = el(2);
%    M = el(6);
%    nu = M2f(M,e);
%    mu = 3.9860044e14;
% %    n  = sqrt(mu*a^-3);
% %    thetaDot = n*power(1+e*cos(nu),2)*power(1-e*e,-3/2);    %this equation
% %    will cause problems when e>1, modified by Dang Zhaohui in 2016-12-23
% %    in Ma Lan, Xin Jiang
%    p = a*(1-e^2);
%    thetaDot = (1+e*cos(nu))^2*sqrt(mu/p^3);
%    w = [0; 0; thetaDot];
% 
% xH(4:6,1) = A * (x1(4:6,1)-x0(4:6,1)) - cross( w, xH(1:3,1))


w_eci = cross(x0(1:3,1),x0(4:6,1))/norm(x0(1:3,1))^2;
wmat = [0,-w_eci(3),w_eci(2);
    w_eci(3),0,-w_eci(1);
    -w_eci(2),w_eci(1),0];
xH(4:6,1) = A * (x1(4:6,1)-x0(4:6,1)) - A*wmat*(x1(1:3,1)-x0(1:3,1));



%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2007-06-27 15:15:18 -0400 (Wed, 27 Jun 2007) $
% $Revision: 10087 $
