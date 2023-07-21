function [w, grf2, condn] = L2FunStencil(z, X, porder, mu)
% Function L2FunStencil: weights for function estimation by least squares
%
% Compute the least squares weight vector w for a numerical approximation of the 
% function value at a point z in R^d, given function values at X\subset R^d, which is exact for 
% polynomials up to order q=order. 
%
% INPUT
%
% z -- a row d-vector representing a point in R^d where the function is estimated
% X -- an (np x d)-matrix of np points in R^d where function values are known
% porder -- polynomial order (degree+1) (integer >= 1)
% mu -- power of the least square weights (real number >= 0)
%
% OUTPUT
%
% w -- an (np x 1)-vector of stencil weights for the directional derivative
% grf2 -- the  ||.||_{2,mu} growth functions for the directional derivative 
%          with order q=order and power mu 
% condn -- condition number of the least squares problem
%
% WARNING: This routine should not be used if X contains z. 
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


%number of variables
d = size(z,2);

%dimension of polynomials of given order in d variables
polydim = nchoosek(porder+d-1,d);
 
% the vector cz is the rhs for the directional derivative
cz = zeros(polydim,1);
cz(1) = 1;

%order of the derivative 
dorder = 0;

%run L2Stencil.m
%(note that some parts of L2Stencil code are only needed for derivatives and can be 
% removed when dorder=0)
[w, grf2, condn] = L2Stencil(z, X, porder, mu, cz, dorder);
 
 
 
