function [X,nnn] = Top_boundary(S,M,N,dx,dz)
%nn_T_s = nn +1;
num = 0;
for i = 1: M+1
     num = num+1; 
     xpos = (i-1)*dx;
     zpos = N*dz;
     X(num,1) = xpos;
     X(num,2) = zpos;
 end
 %nn_T_e = nn;
 nnn = num;
   