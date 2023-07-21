function [XF,nnn] = Left_boundary(S,M,N,dx,dz)
    num=0;
for j = 2: N
    xpos = 0.;
    zpos = (j-1)*dz; 
    num = num +1;
    XF(num,1) = xpos;
    XF(num,2) = zpos; 
end 
nnn=num;