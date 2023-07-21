function [F_in_par1] = Inter_particle_forces(i,dx,dxx,dzz,dx_ij,dz_ij,cc)

int = cc-1;         %due to neglecting the target particle 
%distance between point 
r_ij = [];
F_in_par1(1,1) = 0; F_in_par1(1,2)=0;
%Constaants defines in "https://doi.org/10.1016/j.cpc.2021.108008"
delta_s = 1.2*dx;  % diesi
alpha = 0.95;       % alpha*dlta_s
p_b = 1.;
c1 = 2.*alpha*delta_s/3.;
c2 = 0.005;         % a constant ranged from 0.004 to 0.006
k_r = c2*delta_s*p_b;

r_ij= sqrt(dxx+dzz);
for j = 1:int
    if(r_ij(j)<=delta_s/2.)
        F_in_par1(1,1) = F_in_par1(1,1) + 192.*(dx_ij(j)/r_ij(j))*k_r* ...
            ((3*c1^2/delta_s^4) - (c1/delta_s^3));
        F_in_par1(1,2) = F_in_par1(1,2) + 192.*(dz_ij(j)/r_ij(j))*k_r* ...
            ((3*c1^2/delta_s^4) - (c1/delta_s^3));
    elseif(r_ij(j)>delta_s/2 && r_ij(j)<alpha*delta_s)
        F_in_par1(1,1) = F_in_par1(1,1) + 12.*(dx_ij(j)/r_ij(j))*k_r* ...
            ((3*c1^2/r_ij(j)^4) - (3*c1/r_ij(j)^3));
        F_in_par1(1,2) = F_in_par1(1,2) + 12.*(dz_ij(j)/r_ij(j))*k_r* ...
            ((3*c1^2/r_ij(j)^4) - (3*c1/r_ij(j)^3));
    else
        F_in_par1(1,1) = F_in_par1(1,1);
        F_in_par1(1,2) = F_in_par1(1,2);
    end
end