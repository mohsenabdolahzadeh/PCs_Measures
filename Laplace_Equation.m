function [U,A]=Laplace_Equation(nn,nb,wieghts,nn_Top_St,nn_Top_End,w,X)
%Defining matrixes 
A= zeros(nn,nn);
U=zeros(nn,1);
b=zeros(nn,1);
for i=1:nn
    if(i<= nb) %Applying boundary condition  
        A(i,i)=1.;
        [BC_Value] = Derishle_BC(i,nn_Top_St,nn_Top_End,w,X); 
       b(i,1) = BC_Value;
    else
        A(i,wieghts{i,2}(1,:)) = wieghts{i,1}(1,:);
    end
end
 U = A\b;
