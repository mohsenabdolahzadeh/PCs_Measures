function [mesh_ratio,ave_mesh_ratio,local_mesh_ratio,covering_radious] = MeshRatio1(X,nb,Min_dis,CVT_Vertices)

 

%Calculating covering radious
[np, ~] = size(X);
% Compute Voronoi diagram
[V, C] = voronoin(X);

% Get vertices of each Voronoi region
numPoints = size(X, 1);
voronoiVertices = cell(numPoints, 1);
for i = 1:numPoints
    CVT_Vertices{i} = V(C{i}, :);
end

for i = nb+1:np
    delta_x = [];
    delta_z = [];
    j = i-nb;
    delta_x = X(i,1) - CVT_Vertices{1,i}(:,1);
    delta_z = X(i,2) - CVT_Vertices{1,i}(:,2);
    covering_radious(j,1) = max(sqrt(delta_x.^2 + delta_z.^2));
end


% the maximum distance to the nearest neighbor
 max_min_dis = max(Min_dis(nb+1:end,1));

 local_mesh_ratio = covering_radious(:,1)./Min_dis(nb+1:end,1);
mesh_ratio = covering_radious/max_min_dis;
ave_mesh_ratio = mean(mesh_ratio);
