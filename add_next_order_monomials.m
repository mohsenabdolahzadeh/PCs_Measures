function [polvalues, positions] = add_next_order_monomials (X,dim,polvalues,positions)
% Function add_next_order_monomials: extend monomial evaluations by one order
%
% See monomials.m for further info.
%
% INPUT
%
% X -- an (N x dim)-matrix of N points in R^d
% dim -- number of variables
% polvalues -- (N x polynomial dimension) matrix: current order
% positions -- positions of pure monomials x_i^{n-1} of the highest current order n within polvalues
%
% OUTPUT
%
% polvalues -- (N x polynomial dimension) matrix: next order
% positions -- positions of pure monomials x_i^{n} of the highest next order n+1 within polvalues
%
% WARNING: will only work correctly if "polvalues" and "positions" are correct values and positions for the previous order.
%
%
% COPYRIGHT & LICENSE
%
% Copyright (C) 2012-2020 Oleg Davydov <oleg.davydov@math.uni-giessen.de>
%
% This file is part of mFDlab released under GNU General Public License v2.0.
% See the file README for further details.


%initialise the array of values of exact order and the new position of the pure monomial (at the end of the current array)
polvalues_exact_order = [];
position1 = size(polvalues,2) + 1; %position of x_1^n in polvalues
position = position1;

for i=1:dim
    %multiply all monomials of previous exact order starting from the i-th pure monomial by x_i
    polvalues_exact_order = [polvalues_exact_order,...
        polvalues(:,positions(i):end).*repmat(X(:,i),1,position1-positions(i))];
    
    %update the position (needed for the next n)
    positions(i) = position;
    position = size(polvalues,2) + size(polvalues_exact_order,2) + 1; %needed for the next i
end

polvalues = [polvalues polvalues_exact_order];
