function [AnalyticalFunction, dx_AnalyticalFunction, dz_AnalyticalFunction, ...
    d2dx2_AnalyticalFunction, d2dz2_AnalyticalFunction, ...
     Laplase_Analytical_Function] = SineFunction(MN,X,h,w)

%Shifting function 
shift_constant = 1;




%AnalyticalFunction = zeros(MN);
%AnalyticalFunction = X(:,1).^2 + X(:,2).^2; 
%dx_AnalyticalFunction = 2*X(:,1);
%dz_AnalyticalFunction = 2*X(:,2);
%d2dx2_AnalyticalFunction = 2;
%d2dz2_AnalyticalFunction = 2;
%Laplase_Analytical_Function(1:MN,1) = 4;

%AnalyticalFunction = sin(X(:,1)) + cos(X(:,2)); 
%dx_AnalyticalFunction = cos(X(:,1));
%dz_AnalyticalFunction = -sin(X(:,2));
%d2dx2_AnalyticalFunction = -sin(X(:,1));
%d2dz2_AnalyticalFunction = -cos(X(:,2));
%Laplase_Analytical_Function(1:MN,1) = d2dx2_AnalyticalFunction + d2dz2_AnalyticalFunction;

% An analytical solution for laplace equation 
%{
 AnalyticalFunction = 100*(sinh((pi*X(:,2))/w).*sin((pi*X(:,1))/w))./sinh((pi*h)/w); 
dx_AnalyticalFunction = cos(X(:,1));
dz_AnalyticalFunction = -sin(X(:,2));
d2dx2_AnalyticalFunction = -sin(X(:,1));
d2dz2_AnalyticalFunction = -cos(X(:,2));
Laplase_Analytical_Function(1:MN,1) = d2dx2_AnalyticalFunction + d2dz2_AnalyticalFunction;
%}

% An analytical solution for poisson equation
AnalyticalFunction = 100*(sinh((pi*X(:,2))/w).*sin((pi*X(:,1))/w))./sinh((pi*h)/w);  %X(:,2).*(1-X(:,2)).*X(:,1).^3;
AnalyticalFunction = AnalyticalFunction + shift_constant;
dx_AnalyticalFunction = cos(X(:,1));
dz_AnalyticalFunction = -sin(X(:,2));
d2dx2_AnalyticalFunction = -sin(X(:,1)); 
d2dz2_AnalyticalFunction = -cos(X(:,2));
Laplase_Analytical_Function(1:MN,1) = d2dx2_AnalyticalFunction + d2dz2_AnalyticalFunction;
%AnalyticalFunction = sin(X(:,1)+ pi) + sin(X(:,2)+ pi); 
%dx_AnalyticalFunction = cos(X(:,1)+ pi);
%dz_AnalyticalFunction = cos(X(:,2)+ pi);
%d2dx2_AnalyticalFunction = -sin(X(:,1)+ pi);
%d2dz2_AnalyticalFunction = -sin(X(:,2)+ pi);
%Laplase_Analytical_Function(1:MN,1) = d2dx2_AnalyticalFunction + d2dz2_AnalyticalFunction;


end