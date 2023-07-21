function[Min_dis1,Min_dis2,Min_dis, Center,turqu_vec,delta_x,delta_z,deltam,AveR,F_in_par,MeshRatio,nc,Energy_function,avedelta,Mean_Cross_RF] = Measures_PC_quality(MN,X,Index,dx,dz,nb,h)
% In this function some measure such as minimum distance of subset or
% centre of subset calculate.


% finding neighbor points of each point for wendland function 
h2 = h/2.;
Index_2 = rangesearch(X,X,h2);
%--------------------------------------------------------------
ncx = round(1.5/dx) + 1; ncz = round(1.5/dz) + 1;
nct = ncx*ncz;
nc = cell(nct,1);
nc(:,1) = {0};
%--------------------------------------------------------------

for i = 1:MN
  %if (i>nb)
        %X_new is subset which is shifted on origin 
        X_new = [];
        %Vector space for cross product 
        R = [];
        % A unit force to calculate turqe
        F = [];
        % Distance between point i and j in each subset
        dxx = []; dzz = []; 
        dx_ij = []; dz_ij = [];
        % Distance between point i and j in each subset for Wendland finction
        drx = []; drz = [];
        
        
        % Calculating the distance between point 'i' and 'j' for each
        % subset
        dxx = (X(i,1)-X(Index{i,1}(1,2:end),1));
        dx_ij = dxx;
        dxx = dxx.^2;
        dzz = (X(i,2)-X(Index{i,1}(1,2:end),2));
        dz_ij = dzz;
        dzz = dzz.^2;

        euclidean_dis  = sqrt(dxx + dzz);
        Energy_function(i,1) = sum(euclidean_dis(:,1).*(log(euclidean_dis(:,1)./2)-1)+2);
        % Calculating distance between point 'i' and  point 'j' for each
        % subset especilized for Wendlannd function
        drx = (X(i,1)-X(Index_2{i,1}(1,2:end),1));
        drz = (X(i,2)-X(Index_2{i,1}(1,2:end),2));         
        
        %Euclidean distance( A parameter for Wendland function)
        rad = sqrt(drx.^2+drz.^2);

        % Minimum distance Measure: calculating minimum distance of all subsets
        j=i-nb;
        Min_dis(i,1) = min(sqrt(dxx+dzz));

        % Shifting subsets to orgin to make a convenient procedure of
        % calculation 
        [rr, cc] = size(Index{i,1});
        X_new(:,1) = X(Index{i,1}(1,:),1)-X(i,1);
        X_new(:,2) = X(Index{i,1}(1,:),2)-X(i,2);
        
        % Calculatig center of mass position for each subset, M_x and M_z.

        M_cente(i,1) = (dx*dz*(sum(X_new(:,1))))/(2*pi*h^2);
        M_cente(i,2) = dx*dz*(sum(X_new(:,2)))/(2*pi*h^2);

        % Turqe
        R(:,1) = X_new(2:end,1);
        R(:,2) = X_new(2:end,2);
        R(:,3) = 0;
        F(1:cc-1,1) = 0; 
        F(1:cc-1,2) = 0; 
        F(1:cc-1,3) = 1; 
        Cross_RF = cross(R,F);
        Turqe(i,1) = sum(Cross_RF(:,1)); Turqe(i,2) = sum(Cross_RF(:,2));
        %------------------------------------ 
        [frx, frz]=Wandland_kernel(drx,drz,rad,h2);
        delta_x(i,1) = sum(frx)*dx*dz;
        delta_z(i,1) = sum(frz)*dx*dz;
        %------------------------------------
        ave_rij = sum(rad)./cc;
        ave_rij = ave_rij.^2;
        Rx(i)= ave_rij*(sum(drz(:,1)./(drz(:,1).^2+drx(:,1).^2).^1.5));
        Rz(i)= ave_rij*(sum(drx(:,1)./(drz(:,1).^2+drx(:,1).^2).^1.5));
        %------------------------------------
        [F_in_par1] = Inter_particle_forces(i,dx,dxx,dzz,dx_ij,dz_ij,cc);
        F_in_par(i,1) = sqrt(F_in_par1(1,1)^2+F_in_par1(1,2)^2);
   %end
   
   icell = round(X(i,1)/(1.5*dx)) + 1; kcell = round(X(i,2)/(1.5*dz)) + 1;
   ii = ncx*(kcell -1) + icell;
   nc{ii,1}(1,1) = nc{ii,1}(1,1) + 1;

end
%-----------------------------------------------
    deltam(:,1) = sqrt(delta_x(:,1).^2 + delta_z(:,1).^2);
    avedelta = mean(deltam);
    % Loking for maximum deviation of cenert of subsets 
    MM = sqrt(M_cente(:,1).^2 + M_cente(:,2).^2);
    Center = mean(MM);
    %calculating the minimum distance of the subsets
    Min_dis1 = min(Min_dis);
    Min_dis2 = mean(Min_dis);
    MeshRatio = Min_dis2/(0.5*Min_dis1); % Messh ratio defined in doi.org/10.1007/s10444-019-09726-5 (eq. 49)
    
    turqu_vec(:,1) = sqrt(Turqe(:,1).^2 + Turqe(:,2).^2);
    Mean_Cross_RF = mean(sqrt(Turqe(:,1).^2 + Turqe(:,2).^2));
    %----------------------------------------------
    % Shifting algoritm preposed by doi:10.1016/j.jcp.2009.05.032 (Rui Xu
    % and et all)
    AveR = mean(sqrt(Rx(:,1).^2 + Rz(:,2).^2));