
clear all
clc
% This is a main script which executes the functions calculate the wieght.
% S: Dimension of the space 
% dim: A parameter for saving dimension 
% xDim: Length of in x direction
% zDim: lenghth in z direction 
% MN: Number of Point cloud 1
% X: A M*S matriix which includes a Set of point cloud
% dx and dy are  s
%**********************************************************
 
% Dimension of the space 
S = 2; 
%Lengths of the rectangular
xDim = 1.;  zDim = 1.; 
dx = 0.0255; dz = 0.0255;  
dim.xDim = xDim; dim.zDim = zDim;
dim.dx = dx; dim.dz = dz;
M = round(dim.xDim./dim.dx) ;
N=  round(dim.zDim./dim.dz) ; 
MN = M*N;

% Correction of dim.dx
dim.dx = dim.xDim/M; 

% Correction of dim.dz
dim.dz = dim.zDim/N; 

% Calculating the smoothing length 
h = 2.1*sqrt(dim.dx.^2 + dim.dz.^2); 

%Smoothing length 
dim.h = h; 
 

for numx = 0:5:50

 for run_n = 1:50

%Call GenerateSqurePointCloud function to generate regular point clouds
%[X, nn,nb,nn_Top_St,nn_Top_End,nn_Right_St] = SqurePointCloudGeneration(S,M,N,MN,...
 %   dim.dx,dim.dz,dim.xDim,dim.zDim,run_n); 
 [X, nn, nb, nn_Top_St,nn_Top_End,nn_Right_St] = Load_geometry(run_n,numx);
 
 %DT = delaunayTriangulation(X);
 %IC = incenter(DT);
 
% Total number of point clouds
 MN = nn; 
[MN AA]=size(X);
[nn AA]=size(X);

%Obtaining wieghts
[wieghts,Index, Min_dis1,Min_dis2,Min_dis, Center,turqu_vec,delta_x,delta_z,deltam,AveR,F_in_par,MeshRatio,nc,groth,von_con,Energy_function,avedelta,Mean_Cross_RF] = LHSmatrix(X,h,MN,dx,dz,nb);
%[AllCirArea,DevHexCir] = mesh_ratio(Min_dis,nb,MN);
mean_groth = mean(groth);
mean_von_con = mean(von_con);
Mean_F_in_par = mean(F_in_par);
%---------------------------------
 [CVT_Vertices,variation_XVi]= CVT(X,nb);
 XVi_mean = mean(variation_XVi);
 [fill_distance,DT,cir_center] = fill_dis(X,nb);
 [packing_density,area_of_percircles] = PackingDensity(Min_dis,nb,X);
 [mesh_ratio,ave_mesh_ratio,local_mesh_ratio,covering_radious] = MeshRatio1(X,nb,Min_dis,CVT_Vertices);
 [riesz_s_energy,mean_riesz_s_energy] = Compute_Riesz_S_energy(X,h);
 %------------------------------------

%total_energy_function = sum(Energy_function);
%Solving a Laplace equation 
%[U,A]=Laplace_Equation(nn,nb,wieghts,nn_Top_St,nn_Top_End,dim.xDim,X);
[U,A]=Poisson_Equation(nn,nb,wieghts,nn_Top_St,nn_Top_End,...
    nn_Right_St,dim.xDim,X);

% Call the Analytical function 
[AnalyticalFunction, dx_AnalyticalFunction, dz_AnalyticalFunction, ...
  d2dx2_AnalyticalFunction, d2dz2_AnalyticalFunction, ...
    Laplase_Analytical_Function] = SineFunction(MN,X,dim.zDim,dim.xDim); 

%Calculating errors
[MRS_error, L_inf,point_wise_error] = Error_Cal(AnalyticalFunction, U,nn);

 

%*****************************************************
%PLOTING
local_ratio_filldis_mindis = cir_center(:,1)./Min_dis(nb+1:end,1);
Mean_ratio_filldis_mindis = mean(local_ratio_filldis_mindis);
dd = Min_dis1;
rho = fill_distance/Min_dis1;
MeanEnergy_function = mean(Energy_function);
Mean_covering_radius = mean(covering_radious);

 end
 disp(numx);  % Display a string
end

 