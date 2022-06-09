function eccAnom = M2EEl( ecc, meanAnom, tol, nMax )
%#eml

%-------------------------------------------------------------------------------
%   Eccentric anomaly for an ellipse.
%   Computed from the mean anomaly and the eccentricity. The user can optionally 
%   specify a tolerance and maximum number of iterations.
%-------------------------------------------------------------------------------
%   Form:
%   eccAnom = M2EEl( ecc, meanAnom, tol, nMax )   or
%   eccAnom = M2EEl( ecc, meanAnom, tol )         or
%   eccAnom = M2EEl( ecc, meanAnom)
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   ecc            (1,:) Eccentricity
%   meanAnom       (1,:) Mean anomaly
%   tol            (1,1) Tolerance(optional, default is 1e-8)
%   nMax           (1,1) Maximum number of iterations
%                        (optional, default is no maximum. Can
%                        only be input if tol is also specified.)
%   -------
%   Outputs
%   -------
%   eccAnom        (1,:) Eccentric anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1994 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

% First guess
eccAnomX  = M2EApp(ecc,meanAnom);
	
% Iterate
delta = tol + 1; 
n     = 0;
tau   = tol;

while ( max(abs(delta)) > tau )
  dE    	  = (meanAnom - eccAnomX + ecc*sin(eccAnomX))/ ...
                   (1 - ecc*cos(eccAnomX));
  eccAnomX    = eccAnomX + dE;
  n           = n + 1;
  delta       = norm(abs(dE),'inf');
  tau         = tol*max(norm(eccAnomX,'inf'),1.0);
  if ( nargin == 4 ),
    if ( n == nMax),
      break
    end
  end
end

eccAnom = eccAnomX;

% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
