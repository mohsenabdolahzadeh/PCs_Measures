
%for numx = 0:5:50

% Generate example data

%xi = (X(:,1)) ; yi = (X(:,2));

x1= [];
x2=[];
measure1=[];
measure2=[];
j=0;
for k = 0:5:50
for numx = 1:50
     j=j+1;
     X = [];
    [X, nn, nb, nn_Top_St,nn_Top_End,nn_Right_St] = Load_geometry(numx,k);
    AB = load(strcat('/u/a/abdolahzadeh/Desktop/mohsen_bitbucket-gfdm_meshless_v0-55281cefa779/Measure_sin_Laplas_eq/Riesz_S_energy/PointWise/PCs',num2str(k),'/RieszSEnergy_PWE',num2str(numx),'.txt')); 
    a1 = X(:, 1); % Independent variable 1 (x)
    a2 = X(:, 2); % Independent variable 2 (y) 
    x1 = [x1;a1];
    x2 = [x2;a2];
    a3 = AB(:, 1);
    a4 = AB(:, 2);
    measure1 = [measure1;a3]; % Measure 1
    measure2 = [measure2;a4]; % Measure 2
end

end


% Read independent variables from one text file
%independentData = importdata('independent_data.txt');
%x1 = X(nb+1:end, 1); % Independent variable 1 (x)

%x2 = X(nb+1:end, 2); % Independent variable 2 (y) 

% Read measures from another text file
%measuresData = importdata('measures.txt');
%measure1 = AB(nb+1:end, 1); % Measure 1
%measure2 = AB(nb+1:end, 2); % Measure 2

% Plot the data using scatter3
figure;
scatter3(x1, x2, measure2, 3, measure1, 'filled');

% Customize the plot
xlabel('x');
ylabel('y');
zlabel('Error');
%title('3D Plot of Two Measures');
colorbar;

% Adjust the colormap if desired
colormap('jet'); % Use 'jet' colormap
caxis([min(measure1), max(measure1)]); % Set the color axis limits based on measure1

% Adjust the viewing angle if desired
view(45, 30); % Set the viewing angle






%{
AB1 = reshape(AB(:, 1), size(G));
AB2 = reshape(AB(:, 2), size(G));


figure;
scatter3(G, Y, AB1, AB2, 'FaceColor', 'interp', 'EdgeColor', 'none');
title('3D Surface with Pointwise Measures');
xlabel('X');
ylabel('Y');
zlabel('Measure 1');

% Adjust the figure layout
colormap jet;
colorbar;
%}
%{
%x = linspace(-1, 1, 50);
%y = linspace(-1, 1, 50);
%[X, Y] = meshgrid(x, y);

% Calculate pointwise error
error = AB(:,2);

% Calculate another measure (e.g., pointwise difference)
diff_measure = AB(:,1);

x = linspace(min(xi),max(xi),sqrt(numel(error)));
y = linspace(-min(yi),max(yi), sqrt(numel(error)));
[G, Y] = meshgrid(x, y);

error = reshape(error, size(G));
diff_measure = reshape(diff_measure, size(G));

% Plotting the results
figure;
scatter3(G, Y, error, diff_measure, 'FaceColor', 'interp', 'EdgeColor', 'none');
colormap jet;
colorbar;

title('Pointwise Error with Another Measure');
xlabel('X');
ylabel('Y');
zlabel('Error');
%}



%{
% Create some data
x = linspace(0, 2*pi, 100);
y = sin(x);

% Create a figure with 50 subplots
figure;

% Set the number of rows and columns
numRows = 5;
numCols = 5;

for i = 1:25
    AB = load(strcat('/u/a/abdolahzadeh/Desktop/mohsen_bitbucket-gfdm_meshless_v0-55281cefa779/Measure_sin_Laplas_eq/ConVol/PointWise/PCs5/ConditionVal_PWE',num2str(i),'.txt')); 
    % Create each subplot
    subplot(numRows, numCols, i);
    loglog(AB(:,1), AB(:,2),'o');
    title(['Plot ', num2str(i)]);
end

% Adjust the layout
sgtitle('50 Subplots Example');

%}

