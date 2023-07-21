function [frx, frz]=Wandland_kernel(drx,drz,rad,h2)
qq = [];
wqq = [];
wqq1 = [];
wqq2 = [];
wqq3 = [];
wqq4 = [];
wab = [];
fac = [];
frx = [];
frz = [];
Awen = 0.557/(h2^2);
Bwen=-2.7852/(h2^3);
qq = rad./h2;
wqq=2.*qq+1.0;
wqq1=1-0.5.*qq;
wqq2= wqq1.*wqq1;
wqq3=wqq2.*wqq1;
wqq4=wqq3.*wqq1;
Wab= Awen.*(wqq.*wqq4);
[n1 n2] = size(qq);
for i = 1:n1
    if(qq(i,1)<= 2.)
fac(i,1) =(Bwen.*qq(i,1).*wqq3(i,1)) ./rad(i,1);
frx(i,1) = fac(i,1) .* drx(i,1);
frz(i,1) = fac(i,1) .* drz(i,1);
    else
        fac(i,1) = 0;
        frx(i,1) = 0;
        frz(i,1) = 0;
    end
end
