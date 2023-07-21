
% Oleg's code. 
%-------------

% Regulaur point clouds
%{
dt=[100, 400, 1600, 6400];
MinDis=[0.11, 0.054,0.0255,0.0126];
%L2=[28.40.0145884179, 13.11487569, 1.79623591, 1.98277195];
L_inf=[0.00618267
0.00161470
3.76934680e-04
9.03395669e-05];
RMS=[0.00899554
0.00271294
6.76183545e-04
1.68534604e-04
];

%}

% Distmesh point clouds
%{
dt=[100, 400, 1600, 6400];
MinDis=[0.089763111907811,0.043407660078625,0.021193667357130,0.010785764083098]; 
%L2=[21.45291746, 6.052000936002297, 1.79623591, 0.76607330];
L_inf=[0.006460774057583
0.001758155407225
4.333933742277551e-04
2.45357474e-04];
RMS=[0.009829768699373
0.002875445675774
7.849989551339427e-04
1.99041159e-04
];
%}

% perturbation of cartesian of point clouds (15%)
%{

dt=[100, 400, 1600, 6400];
MinDis=[0.048977298892544,0.020044201172217,0.007993133936477,0.003343587507534]; 
%L2=[21.45291746, 6.052000936002297, 1.79623591, 0.76607330];
L_inf=[0.00699351
0.00172947
4.05335862e-04
1.04973668e-04];
RMS=[0.01057713
0.0029932
7.2635474e-04
1.9479195e-04
];
%}

% perturbation of cartesian of point clouds (30%)

%{
dt=[100, 400, 1600, 6400];
MinDis=[0.014959264954531,0.005700927355784,0.001292434364932,2.889622653974526e-04]; 
%L2=[21.45291746, 6.052000936002297, 1.79623591, 0.76607330];
L_inf=[0.00813633
0.00193438
4.97731584e-04
1.22579040e-04];
RMS=[0.01220727
0.0033262
8.59722387e-04
2.22237490e-04
];

%}

% point clouds generation using halton sequence

%
%dt=[100, 400, 1600, 6400];
dt=[0.019913724294463, 0.009956862147231, 0.00333350021981611947693, 4.892845959512060e-04];
%L2=[21.45291746, 6.052000936002297, 1.79623591, 0.76607330];
L_inf=[0.00882832
0.
5.77273359e-04
1.35565625e-04];
RMS=[0.01212775
0.0035114
0.0010238
2.4856895e-04
];
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task 2: Minimum distance effects on point clouds quality

%{

%Acc = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/LocalStdDev_RMS.txt')
j=0;
AB = []
for numx = 0:5:50 
    j=j+1;
    AB{j} = load(strcat('/u/a/abdolahzadeh/Desktop/mohsen_bitbucket-gfdm_meshless_v0-55281cefa779/Measure_sin_Laplas_eq/Torque/LocalStdDev_RMS',num2str(numx),'.txt')); 
end
%{
AB = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS0.txt'); 
A = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS5.txt');
B = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS10.txt');
C = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS15.txt');
D = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS20.txt');
E = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS25.txt');
F = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS30.txt');
G = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS35.txt');
H = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS40.txt');
I = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS45.txt');
J = load('/Users/mohsen/Documents/Repos_Meshless/GFDM_V0/gfdm_meshless_v0/Measure_sin_Laplas_eq/StdDev/StdDev_RMS50.txt');
%}
%{
A = mean(A)
B = mean(B)
C = mean(C)
D = mean(D)
E = mean(E)
F = mean(F)
G = mean(G)
H = mean(H)
I = mean(I)
J = mean(J)
%}





%loglog(AB(:,1),AB(:,2),'o',A(:,1),A(:,2),'o',B(:,1),B(:,2),'*',C(:,1),C(:,2),'+',D(:,1),D(:,2),'_',E(:,1),E(:,2),'square',F(:,1),F(:,2),'diamond'...
%  ,G(:,1),G(:,2),'^',H(:,1),H(:,2),'v',I(:,1),I(:,2),'>',J(:,1),J(:,2),'<')

loglog(AB{1}(:,1),AB{1}(:,2),'o',AB{2}(:,1),AB{2}(:,2),'o',AB{3}(:,1),AB{3}(:,2),'*',AB{4}(:,1),AB{4}(:,2),'+',AB{5}(:,1),AB{5}(:,2),'_',AB{6}(:,1),AB{6}(:,2),'square',AB{7}(:,1),AB{7}(:,2),'diamond'...
,AB{8}(:,1),AB{8}(:,2),'^',AB{9}(:,1),AB{9}(:,2),'v',AB{10}(:,1),AB{10}(:,2),'>',AB{11}(:,1),AB{11}(:,2),'<')
 %loglog(AB{1}(:,1),AB{1}(:,2),'o')

legend('0%','5%','10%','15%','20%','25%','30%','35%','40%','45%','50%','Fontsize',12,'Interpreter','latex');
xlabel('$$rho$$','Fontsize',12,'Interpreter','latex');
ylabel('Error','Fontsize',12,'Interpreter','latex'); 
   %loglog(Acc(:,1),Acc(:,2),'o')

%GG = load('/u/a/abdolahzadeh/Desktop/Oleg/Max_Turqe_RMS/MaxTurqe_RMS_5p.txt');
%loglog(GG(:,1),GG(:,3),'o');
%plot(x,y,'b o',x,z,'g o',x,m,'r o')
%loglog(dt,L2,'-b o',dt,L_inf,'-.r s',dt,RMS,'--g ^');
%loglog(dt,L_inf,'-b o',dt,RMS,'-.r s');
%legend('L_2','L_\infty','RMS','Fontsize',12);
%legend('5%','10%','15%','20%','25%','30%','35%','40%','45%','50%','Fontsize',12);
%legend('$$L_\infty$$','RMS','Fontsize',12,'Interpreter','latex');
%xlabel('Center of mass','Fontsize',12);
%ylabel('Error','Fontsize',12);
 %ylim([1e-05 1e-01])
% semi iregulaur point clouds
% 


%}



% Create a figure to hold the plot





% Initialize variables to accumulate data
allX = [];
allY = [];
for j = 30:5:50
% Loop over the 50 text files

    for i = 1:50
    % Read data from the current file
    data = importdata(['/u/a/abdolahzadeh/Desktop/mohsen_bitbucket-gfdm_meshless_v0-55281cefa779/Measure_sin_Laplas_eq/Riesz_S_energy/PointWise/PCs',num2str(j),'/RieszSEnergy_PWE',num2str(i),'.txt']); % Assumes file names are in the format 'data1.txt', 'data2.txt', etc.
    x = data(:, 1); % X-values
    y = data(:, 2); % Y-values
    
    % Accumulate data
    allX = [allX; x];
    allY = [allY; y];
    end
end 
figure;
% Plot all data together
loglog(allX, allY,'.');

% Customize the plot as needed (e.g., labels, titles, legends)
xlabel(['$\delta d$'], 'Interpreter', 'latex');
ylabel('Error', 'Interpreter', 'latex');
%title('Plot of All Data');




