function nu = M2NuPb( meanAnom )
%#eml

%-------------------------------------------------------------------------------
%   Generate the true anomaly from the mean anomaly for a parabola.
%-------------------------------------------------------------------------------
%   Form:
%   nu = M2NuPb( meanAnom )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   meanAnom       (1,:) Mean anomaly
%
%   -------
%   Outputs
%   -------
%   nu             (1,:) True anomaly for a parabola
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	   Copyright 1993-1994 Princeton Satellite Systems, Inc.
%     All rights reserved.
%-------------------------------------------------------------------------------

bo2       = 1.5*meanAnom;
oneThird  = 1/3;
d         = sqrt(1+bo2^2);
x         = (bo2+d)^oneThird - (abs(bo2-d))^oneThird;
nu        = 2*atan(x);

% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
