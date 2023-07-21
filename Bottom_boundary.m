function [XF,nnn] = Bottom_boundary(S,M,N,dx,dz)
 num = 0;
 for i = 1: M+1
     num = num+1;
     xpos = (i-1)*dx;
     zpos = 0.;
     XF(num,1) = xpos;
     XF(num,2) = zpos;
 end
 nnn = num;