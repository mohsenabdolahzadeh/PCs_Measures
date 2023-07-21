function [w, grf2, condn] = L2HessianStencil(z, X, porder, mu)
% Function L2HessianStencil: weights of least squares numerical differentiation formula for Hessian
%
% Compute the weights of least squares numerical differentiation formula for Hessian at a point z in R^d
% given function values at X\subset R^d, which is exact for polynomials up to order q=order.
%
% INPUT
%
% z -- a row d-vector representing a point in R^d where the Hessian is estimated
% X -- an (np x d)-matrix of np points in R^d where function values are known
% porder -- polynomial order (degree+1) (integer >= 1)
% mu -- power of the least square weights (real number >= 0)
%
% OUTPUT
%
% w -- an (np x no)-matrix whose columns are the stencil weights for
%      the corresponding second order partial derivatives evaluated at z (no= d*(d+1)/2 is the number of partial derivatives)
%      according to the  ordering of corresponding second degree monomials in monomials.m
% grf2 -- (1 x no)-vector of  ||.||_{2,mu} growth functions for all partial derivatives 
%          with order q=order and power mu 
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
% Copyright (C) 2017-2020 Oleg Davydov <oleg.davydov@math.uni-giessen.de>
%
% This file is part of mFDlab released under GNU General Public License v2.0.
% See the file README for further details.


if porder < 3
    error('polynomial order must be at least 3 for Hessian')
end

%number of variables
d = size(z,2);

%dimension of polynomials of given order in d variables
polydim = nchoosek(porder+d-1,d);
 
% the matrix cz is the rhs for the Hessian (second partial derivatives of monomials at the origin in columns, 
% the ordering of derivatives correspond to the ordering of second degree monomials in monomials.m)
no = d*(d+1)/2; %number of second order derivatives in d variables
fcoefs = ones(no,1); %init factorial coefficients as 1 for every second order derivative
fcoefs(((d+1)*(d+2) - (1:d).*(2:d+1))/2 - d) = 2; %replace by 2 for all pure derivatives
cz = zeros(polydim,no);
cz(d+2:d+1+no,:) = diag(fcoefs); %assign factorial coefficients for each derivative of corresponding monomial, keeping zeros otherwise


%orders of second partial partial derivatives as differential operators
dorder = 2*ones(1,no);

%run L2Stencil.m
[w, grf2, condn] = L2Stencil(z, X, porder, mu, cz, dorder);
 
 
 
