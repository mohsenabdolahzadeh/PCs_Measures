function [CVT_Vertices,variation_XVi]= CVT(X,nb)

% Compute Voronoi diagram
[V, C] = voronoin(X);

% Get vertices of each Voronoi region
numPoints = size(X, 1);
voronoiVertices = cell(numPoints, 1);
for i = 1:numPoints
    CVT_Vertices{i} = V(C{i}, :);
end

for i = nb+1:numPoints
    j = i-nb;
    cx_voronoi = mean(CVT_Vertices{1,i}(:,1));
    cz_voronoi = mean(CVT_Vertices{1,i}(:,2));
    delta_x = X(i,1) - cx_voronoi;
    delta_z = X(i,2) - cz_voronoi;
    variation_XVi(j,1) = sqrt(delta_x^2 + delta_z^2);
end

%{
% Plot Voronoi diagram
figure;
hold on;
for i = 1:size(X, 1)
    regionVertices = V(C{i}, :);
    plot(regionVertices(:, 1), regionVertices(:, 2), 'b');
end
plot(X(:, 1), X(:, 2), '.');
axis equal;

%}