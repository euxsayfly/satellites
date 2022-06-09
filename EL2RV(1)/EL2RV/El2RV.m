function RV = El2RV(elem)
%#eml


%elem=[a;e;i;W;w;M];
%el=[a;i;W;w;e;M];
el=[elem(1);elem(3);elem(4);elem(5);elem(2);elem(6)];

%-------------------------------------------------------------------------------
%   Converts orbital elements to r and v for an elliptic orbit.
%-------------------------------------------------------------------------------
%   Form:
%   [r, v] = El2RV( el, tol, mu )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   el              (6,:) Elements vector [a;i;W;w;e;M] (Angles in radians)
%   tol             (1,1) Tolerance for Kepler's equation solver
%   mu              (1,1) Gravitational constant
%
%   -------
%   Outputs
%   -------
%   r               (3,:) position vector
%   v               (3,:) velocity vector
%
%-------------------------------------------------------------------------------
%   References:   Battin, R.H., An Introduction to the Mathematics and Methods
%                 of Astrodynamics, p 128.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1993 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

mu = 3.9860044e14;
tol = 1.e-14;

%  Elements vector [a;i;W;w;e;M]
%-------------------------------
  e      = el(5);
  M      = el(6);
  a      = el(1);
  f      = M2Nu( e, M, tol, 200 );

  if( e ~= 1 )
    p    = a*(1-e)*(1+e);
  else
    p    = a*(1+e);
  end
  
  cf     = cos(f);
  sf     = sin(f);
   
  rp     = p/(1 + e*cf)*[ cf; sf; 0 ];
  vp     = sqrt(mu/p)*[-sf; e+cf; 0];
 
  c      = CP2I( el(2), el(3), el(4) );


  r = c*rp;
  v = c*vp;

RV=[r;v];

% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
