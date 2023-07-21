function polvalues = monomials(X,order)
% Function monomials: evalute monomials up to given order on points in X
%
% Generate the values of all monomials up to 'order' on X in R^d.
% 
% INPUT
%
% X -- an (N x d)-matrix of N points in R^d
% order -- total order of d-variate monomials (order is degree+1)
%
% OUTPUT
%
% polvalues -- (N x polynomial dimension) matrix
%
% WARNING: needs scaling and shifting for better numerical conditioning if applied to points not "filling" the unit disk.
%
%
% INFO
%
% Syntax coincides with Robert Schaback's routine monomials in [1] R. Schaback, MATLAB Programming for Kernel-Based Methods, 
% technical report, 2011, available from http://num.math.uni-goettingen.de/schaback/research/group.html 
% However, the implementation is different with no recursion over the number of variables. 
%
% The ordering of monomials: 
% 1 [x_1 ... x_d] [x_1^2 x_1x_2 ... x_1x_d | x_2^2 x_2x_3 ... x_2x_d | ... | x_{d-1}^2 x_{d-1}x_d | x_d^2] ...
% "positions" below are positions of the highest degree "pure" monomials x_1^m ... x_d^m in the array "polvalues".
% WARNING: The ordering is different from Robert Schaback's routine polynomials in [1]
%
% Idea of the implementation: x_1^2 x_1x_2 ... x_1x_d is obtained from x_1 ... x_d via multiplication by x_1
%                             x_2^2 x_2x_3 ... x_2x_d is obtained from x_2 ... x_d via multiplication by x_2
%                                                         and so on
%
% NOTE: The routine "add_next_order_monomials" may be useful separately in order to add higher order monomials 
% in an adaptive way.  
%
% COPYRIGHT & LICENSE
%
% Copyright (C) 2011 Robert Schaback
% Copyright (C) 2012-2020 Oleg Davydov <oleg.davydov@math.uni-giessen.de>
%
% This file is part of mFDlab released under GNU General Public License v2.0.
% See the file README for further details.

[numpoints,dim]=size(X); 

% handle trivial cases first
if order==0
    polvalues=[];
    return
end
if order==1
    polvalues=ones(numpoints,1);
    return
end

%compute polvalues of order 2  
polvalues = [ones(numpoints,1) X];

%initialize positions of pure monomials x_i^{n-1} of the highest order n within polvalues
positions = 2:dim+1; %n=2

for n = 3:order

 [polvalues, positions] = add_next_order_monomials (X,dim,polvalues,positions);
 
end


