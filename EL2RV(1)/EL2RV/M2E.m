function eccAnom  = M2E( e, meanAnom, tol, nMax )
%#eml

%-------------------------------------------------------------------------------
%   Generate the eccentric anomaly from the mean anomaly and the eccentricity.
%-------------------------------------------------------------------------------
%   Form:
%   eccAnom  = M2E( e, meanAnom, tol, nMax )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e            (: or 1) Eccentricity
%   meanAnom     (:)      Mean anomaly
%   tol          (1,1)    Tolerance
%   nMax         (1,1)    Maximum number of iterations
%
%   -------
%   Outputs
%   -------
%   eccAnom     (:)       Eccentric anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1993-1998 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

% Ellipse
%--------
eccAnom = 0;

if( e < 1 )
    eccAnomX = M2EEl(e,meanAnom,tol,nMax);
    eccAnom = eccAnomX;
end

% Hyperbola
%----------
if( e > 1 )
    eccAnomX = M2EHy(e,meanAnom,tol,nMax);
    eccAnom = eccAnomX;
end

if( e == 1 )
  error('The eccentricity must be > 0, and not == 1');
end




% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
