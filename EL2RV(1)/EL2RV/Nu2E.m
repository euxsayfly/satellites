function E = Nu2E( e, nu )
%#eml
%-------------------------------------------------------------------------------
%   Converts true anomaly to eccentric or hyperbolic anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   E = Nu2E( e, nu )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e              (1,:)  or (1,1) Eccentricity
%   nu             (1,:)  True anomaly
%
%   -------
%   Outputs
%   -------
%   E              (1,:)  Eccentric or hyperbolic anomaly
%
%-------------------------------------------------------------------------------
%   References: Wiesel, W. E., Spaceflight Dynamics, McGraw-Hill, 1988, pp. 57,60.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1993-1998 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

if( e == 1 )
  error('Eccentric anomaly is not defined for parabolas')
end

E = zeros(size(e));
	
if( e < 1 )
  E = 2*atan( sqrt( (1-e)/(1+e) )*tan(0.5*nu));
end

if( e > 1 )
  E = 2*atanh( sqrt( (e-1)/(1+e) )*tan(0.5*nu)); 
end


% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
