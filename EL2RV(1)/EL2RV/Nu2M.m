function [meanAnom,eccAnom] = Nu2M( e, nu )
%#eml
%-------------------------------------------------------------------------------
%   Converts true anomaly to mean anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   [meanAnom,eccAnom] = Nu2M( e, nu )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e             (1,1)  Eccentricity
%   nu            (1,:)  True anomaly
%
%   -------
%   Outputs
%   -------
%   meanAnom       (1,:)  Mean anomaly
%   eccAnom        (1,:)  Eccentric anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	 Copyright (c) 1993-1998 Princeton Satellite Systems, Inc.
%    All rights reserved.
%-------------------------------------------------------------------------------

if( e ~= 1 )
  eccAnom  = Nu2E( e, nu );
  meanAnom = E2M( e, eccAnom );
else
  eccAnom = 0;
  meanAnom = tan(0.5*nu) + tan(0.5*nu).^3/3;
end



%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2007-07-26 09:08:53 -0400 (Thu, 26 Jul 2007) $
% $Revision: 10678 $
