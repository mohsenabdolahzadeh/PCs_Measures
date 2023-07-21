function [U,A]=Poisson_Equation(nn,nb,wieghts,nn_Top_St,nn_Top_End,...
    nn_Right_St,w,X)

%Defining matrixes 
%Wieght matrix
A= zeros(nn,nn);

%variable Matrix
U=zeros(nn,1);

% Source term matrix
b=zeros(nn,1);


for i=1:nn
    if(i<= nb) %Applying boundary condition  
        A(i,i)=1.;
        [BC_Value] = Derishle_BC(i,nn_Top_St,nn_Top_End,nn_Right_St,nb,w,X); 
       b(i,1) = BC_Value;
    else
        A(i,wieghts{i,2}(1,:)) = wieghts{i,1}(1,:);
        b(i,1) = 0.;%6*X(i,1)*X(i,2)*(1.-X(i,2))-(2.*X(i,1).^3);
    end
end
 U = A\b;
 U = U + 1.;