function [BC_Value]= Derishle_BC(i,nn_Top_St, nn_Top_End,nn_Right_St,nb,w,X)

%Top boundary

if (i >= nn_Top_St && i <= nn_Top_End) 
    BC_Value =100*sin((pi* X(i,1))/w);

%Right  boundary
%{
if (i>= nn_Right_St && i<=nb )
    BC_Value = X(i,2)*(1-X(i,2));
%}
else
    BC_Value = 0.;
end
