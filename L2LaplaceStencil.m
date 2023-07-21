function [w, grf2, condn] = L2LaplaceStencil(z, X, porder, mu)
% Function L2LaplaceStencil: weights of a least squares numerical differentiation formula for Laplacian
%
% Compute the weights of least squares numerical differentiation formula for the Laplacian at a point z in R^d, 
% given function values at X\subset R^d, which is exact for polynomials up to order q=order.
%
% INPUT
%
% z -- a row d-vector representing a point in R^d where the Laplacian is estimated
% X -- an (np x d)-matrix of np points in R^d where function values are known
% porder -- polynomial order (degree+1) (integer >= 1)
% mu -- power of the least square weights (real number >= 0)  
%
% OUTPUT
%
% w -- an (np x 1)-vector of stencil weights for the Laplacian
% grf2 -- the  ||.||_{2,mu} growth functions for the Laplacian  with order q=order and power mu 
% condn -- condition number of the weighted Vandermonde matrix used in the computation
%
% WARNING: If mu>0 and z belongs to X, then we ASSUME that z=x_1 and all other points are different from z.
%
%
% INFO
%
% See L2Stencil.m for further details
%
% COPYRIGHT & LICENSE
%
% Copyright (C) 2012-2020 Oleg Davydov <oleg.davydov@math.uni-giessen.de>
%
% This file is part of mFDlab released under GNU General Public License v2.0.
% See the file README for further details.


if porder < 3
    error('polynomial order must be at least 3 for Laplacian')
end

%number of variables
d = size(z,2);

%dimension of polynomials of given order in d variables
polydim = nchoosek(porder+d-1,d);
 
% the vector cz is the rhs for the Laplacian
cz = zeros(polydim,1);
ind = ((d+1)*(d+2) - (1:d).*(2:d+1))/2 + 1;
cz(ind,:) = 2;

%order of the derivative 
dorder = 2;

%run L2Stencil.m
[w, grf2, condn] = L2Stencil(z, X, porder, mu, cz, dorder);
 
 
 
