function [MRS_error, L_inf,point_wise_error] =Error_Cal(Analytical_val, Numerical_val,nn)

%Calculating MRS error
MRS_error = norm(Numerical_val - Analytical_val);
MRS_error = MRS_error/(norm(Analytical_val));


%Calculating L_inf error
ABS_Error = abs(Numerical_val - Analytical_val);
L_inf = max(ABS_Error)/max(abs(Analytical_val));
%Calculating absulure error
for i = 1:nn
point_wise_error(i,1) = abs(Numerical_val(i,1) - Analytical_val(i,1))/(abs(Analytical_val(i,1)));%./abs(Analytical_val(i,1));
end

