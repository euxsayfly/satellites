function A = GetHillsMats( ro, vo )
%#eml
%-------------------------------------------------------------------------------
%   This function takes the position and velocity of a satellite in the ECI 
%   frame, and returns the A and Adot matrices used for transformation to 
%   the Hills frame. They are used in the following equations:
%
%   rH = A*(r1-r0);
%   vH = A*(v1-v0) + Adot*(r1-r0);
%
%-------------------------------------------------------------------------------
%   Form:
%   [A, Adot] = GetHillsMats( ro, vo )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   ro              (3,1) r, ECI frame
%   vo              (3,1) v, ECI frame
%
%   -------
%   Outputs
%   -------
%   A               (3,3) Rotation matrix (position)
%   Adot            (3,3) Rotation matrix (velocity)
%                           Equal to -Cross( OrbRate(Mag(ro), A )
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	  Copyright 2001 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

x = Unit( ro ); % x is radial
z = Unit( cross( ro, vo) ); % z is + orbit normal
y = Unit( cross( z, x ) ); % y completes RHS

A = [x'; y'; z'];

%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2007-06-27 15:15:18 -0400 (Wed, 27 Jun 2007) $
% $Revision: 10087 $
