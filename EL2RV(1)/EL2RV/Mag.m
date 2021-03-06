function m = Mag( u )
%#eml
%-------------------------------------------------------------------------------
%   Given a 3-by-n matrix where each column represents a vector, return a
%   row vector of the magnitudes of each column.
%-------------------------------------------------------------------------------
%   Form:
%   m = Mag( u )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   u            (:,:)  Vectors
%
%   -------
%   Outputs
%   -------
%   m            (:)   Corresponding magnitudes
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	 Copyright 1995 Princeton Satellite Systems, Inc. All rights reserved.
%-------------------------------------------------------------------------------

m = sqrt(sum(u.^2));

% PSS internal file version information
%--------------------------------------
% $Date: 2002-11-14 11:47:22 -0500 (Thu, 14 Nov 2002) $
% $Revision: 3407 $
