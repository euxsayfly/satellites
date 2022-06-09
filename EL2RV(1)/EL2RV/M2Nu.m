function nu = M2Nu( e, M, tol, nMax )
%#eml

%-------------------------------------------------------------------------------
%   Computes the true anomaly from the mean anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   nu  = M2Nu( e, M, tol, nMax )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e               (1,1)  Eccentricity
%   M               (1,:)  Mean anomaly (rad)
%   tol             (1,1)  Tolerance
%   nMax            (1,1)  Maximum number of iterations
%
%   -------
%   Outputs
%   -------
%   nu              (1,:)  True anomaly (rad)
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	 Copyright (c) 1996-1998 Princeton Satellite Systems, Inc.
%    All rights reserved.
%-------------------------------------------------------------------------------

if( e ~= 1 )
    E = M2E( e, M, tol, nMax );
    nu = E2Nu( e, E );
else
  nu = M2NuPb( M );
end

% PSS internal file version information
%--------------------------------------
% $Date: 2004-10-29 14:49:33 -0400 (Fri, 29 Oct 2004) $
% $Revision: 3125 $
