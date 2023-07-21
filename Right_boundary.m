function [XF,nnn] = Right_boundary(S,M,N,dx,dz,nn)
    num = 0;
for j = 2: N
    xpos = (M)*dx;
    zpos = (j-1)*dz; 
    num = num +1;
    XF(num,1) = xpos;
    XF(num,2) = zpos; 
end 
    nnn = num;