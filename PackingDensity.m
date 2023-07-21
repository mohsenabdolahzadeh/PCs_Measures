function [packing_density,area_of_percircles] = PackingDensity(Min_dis,nb,X)
%the packing density can be calculated by considering circles around each node,
% summing the area of the circles within the domain and dividing by the area of 
% the domain. The circles should be half the radius of the exclusion
% radius(minimum distance)

area_of_circles = 0;
[np ~] = size(X);
for i=nb+1:np
    j = i-nb;
    radious = Min_dis(i)/2.;
    area_of_circles = area_of_circles + pi*radious^2;
end

%The optimal packing density in a plane accure for circles soraunded by hexagonal which has packing valueof 0.9069 
packing_density = abs(area_of_circles - 0.9069)/(abs(0.9069));
 
for i =1:np
    area_of_percircles(i,1) = pi*((Min_dis(i,1)/2)^2);
end