function [w, grf2, condn] = L2GradientStencil(z, X, porder, mu)
% Function L2GradientStencil: weights of a least squares formula for the gradient
%
% Compute the weights of least squares numerical differentiation formula for the gradient at a point z in R^d,
% given function values at X\subset R^d, which is exact for polynomials up to order q=order.
%
% INPUT
%
% z -- a row d-vector representing a point in R^d where gradient is evaluated
% X -- an (np x d)-matrix of np points in R^d where function values are known
% porder -- polynomial order (degree+1) (integer >= 1)
% mu -- power of the least square weights (real number >= 0)
%
% OUTPUT
%
% w -- an (np x d)-matrix whose columns are the stencil weights for
%      the corresponding partial derivatives evaluated at z in Z, 
%      [partial_1 f(z) ... partial_d f(z)]
% grf2 -- (nz x d)-vector of  ||.||_{2,mu} growth functions for all points in z and all partial derivatives 
%          with order q=order and power mu for each point in z
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


if porder < 2
    error('polynomial order must be at least 2 for gradient')
end

%number of variables
d = size(z,2);

%dimension of polynomials of given order in d variables
polydim = nchoosek(porder+d-1,d);
 
% the matrix cz is the rhs for the gradient (gradients of monomials at the origin, colums correspond to partial derivatives)
cz = zeros(polydim,d);
cz(2:d+1,:) = eye(d);

%orders of partial derivatives as differential operators
dorder = ones(1,d);

%run L2Stencil.m
[w, grf2, condn] = L2Stencil(z, X, porder, mu, cz, dorder);
 
 
 
