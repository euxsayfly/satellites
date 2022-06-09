function c = CP2I( i, L, w )
%#eml

%-------------------------------------------------------------------------------
%   Transformation matrix from the perifocal frame to the inertial frame.
%-------------------------------------------------------------------------------
%   Form:
%   c = CP2I( i, L, w )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   i               (3,1) Inclination
%   L               (3,1) Longitude of the ascending node
%   w               (3,1) Argument of perigee
%
%   -------
%   Outputs
%   -------
%   c               (3,3) Transformation matrix
%
%-------------------------------------------------------------------------------
%   References: Bate, Roger R., Fundamentals of Astrodynamics, Dover 
%                Publications, Inc., New York, 1971, pp. 82-83.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%    Copyright 1993-1998 Princeton Satellite Systems, Inc. All rights reserved.
%-------------------------------------------------------------------------------

ci = cos(i);
si = sin(i);

cw = cos(w);
sw = sin(w);

cL = cos(L);
sL = sin(L);

c = [ cL*cw-sL*sw*ci,-cL*sw-sL*cw*ci, sL*si;...
      sL*cw+cL*sw*ci,-sL*sw+cL*cw*ci,-cL*si;...
               sw*si,          cw*si,    ci];


% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $



