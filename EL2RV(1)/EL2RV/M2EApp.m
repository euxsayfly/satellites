function eccAnom = M2EApp( e, meanAnom )
%#eml

%-------------------------------------------------------------------------------
%   Approximate root to Kepler's Equation for elliptical and hyperbolic orbits.
%-------------------------------------------------------------------------------
%   Form:
%   eccAnom = M2EApp( e, meanAnom )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e             (: or 1)  Eccentricity
%   meanAnom      (:)       Mean anomaly
%
%   -------
%   Outputs
%   -------
%   eccAnom       (:)       Eccentric anomaly
%
%-------------------------------------------------------------------------------
%   References: Battin, R.H. (1987). An Introduction to the
%               Mathematics and Methods of Astrodynamics, AIAA Press, p. 194.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1994-1998 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

if any( e < 0 | e == 1 )
  error('The eccentricity must be > 0, and not == 1');
end

  eccAnomX = 0;
 
  if(meanAnom ~= 0)
   m    = meanAnom;
   if(m > pi)
       m = -m;           
   end
 
  if( e < 1 )     % elliptical case.
    sM      = sin(m); 
    eA = m + e*sM/(1 - sin(m+e) + sM);
  else  
    sM     = sinh(m/(e-1));
    eA = m^2/ (e*(e-1)*sM - m);
  end
  
  if( m > pi )
    eA = -eA;
  end
  
  eccAnomX = eA;
  
  end
  
  eccAnom = eccAnomX;



% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
