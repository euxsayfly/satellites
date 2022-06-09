function meanAnom = E2M( ecc, eccAnom )
%#eml
%-------------------------------------------------------------------------------
%   Converts eccentric anomaly to mean anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   meanAnom = E2M( ecc, eccAnom )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   ecc       (1,:) Eccentricity
%   eccAnom   (1,:) Eccentric anomaly
%
%   -------
%   Outputs
%   -------
%   meanAnom  (1,:) Mean anomaly
%
%-------------------------------------------------------------------------------
%   References:	Bate, R. R. Fundamentals of Astrodynamics. pp. 185-187.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   Copyright (c) 1993-1998 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

meanAnomX = zeros(size(eccAnom));

if( ecc == 1 )
  error('Eccentric anomaly is not defined for parabolas')
end

if( ecc < 1 )
  meanAnomX = eccAnom - ecc*sin( eccAnom );
end

if( ecc > 1 )
  meanAnomX = ecc*sinh( eccAnom ) - eccAnom;
end

meanAnom = meanAnomX;


% PSS internal file version information
%--------------------------------------
% $Date: 2007-03-27 16:07:24 -0400 (Tue, 27 Mar 2007) $
% $Revision: 9006 $


