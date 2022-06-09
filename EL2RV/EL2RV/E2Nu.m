function nu = E2Nu( e, E )
%#eml

%-------------------------------------------------------------------------------
%   Computes the true anomaly from the eccentric or hyperbolic anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   nu = E2Nu( e, E )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e             (1,:)   Eccentricity
%   E             (1,:)   Eccentric or Hyperbolic anomaly
%
%   -------
%   Outputs
%   -------
%   nu            (1,:)   True anomaly
%
%-------------------------------------------------------------------------------
%   References:   Bate, R. R., Fundamentals of Astrodynamics. pp. 20-40.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1993,1996,1998 Princeton Satellite Systems, Inc. 
%   All rights reserved.
%-------------------------------------------------------------------------------

if( e == 1 )
  error('Eccentric anomaly is not defined for parabolas')
end

nuX = zeros(size(E));

if( e < 1 )
  nuX = 2*atan(sqrt((1+e)/(1-e))*tan(0.5*E));
end

if( e > 1 )
  nuX = 2*atan(sqrt((1+e)/(e-1))*tanh(0.5*E));
end

nu = nuX;


% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $
