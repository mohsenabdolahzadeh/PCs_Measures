function [wieghts,Index,Min_dis1,Min_dis2,Min_dis, Center,turqu_vec,delta_x,delta_z,deltam,AveR,F_in_par,MeshRatio,nc,groth,von_con,Energy_function,avedelta,Mean_Cross_RF] = LHSmatrix(X,h,MN,dx,dz,nb)
% This function calculate the Matrix M_i, W_1, ans b_i. The three
% calculated matrix for eachn point cloud insert into a matrix called LHS
    
    %Looking for neighbourhoods particles
    Index = rangesearch(X,X,h);
    % Calculating sugested measure for PC quality
    [Min_dis1,Min_dis2,Min_dis, Center,turqu_vec,delta_x,delta_z,deltam,AveR,F_in_par,MeshRatio,nc,Energy_function,avedelta,Mean_Cross_RF] = Measures_PC_quality(MN,X,Index,dx,dz,nb,h);
    
    

    % Computing weight 
    for i = 1:MN
        X_set =[];
        z = [];
        X_set(:,1) = X(Index{i,1}(1,:),1);
        X_set(:,2) = X(Index{i,1}(1,:),2);
        z = [X(i,1),X(i,2)];
        wieghts{i,2}(1,:) = Index{i,1}(1,:);
        [w, grf2, condn] = L2LaplaceStencil(z, X_set, 3,3);
        wieghts{i,1} = w';
        groth(i,1) = grf2;
        von_con(i,1) = condn;
    end
    
    %{

for i=1:MN
    num=0; % A parametre which counts neighborhood particles
    z = [];
    X_set = [];
    z = [X(i,1),X(i,2)];
    for j = 1:MN
       if (j~=i)  

            dxx = X(j,1)-X(i,1);
            dzz = X(j,2)-X(i,2);
            disij = sqrt(dxx.^2+dzz.^2); % euclidean norm |:|
            if (disij <= h)
                num= num + 1;
                X_set(num,1) = X(j,1); X_set(num,2) = X(j,2);
                wieghts{i,2}(1,num)=j;

            end
       end

    end
    [w, grf2, condn] = L2LaplaceStencil(z, X_set, 3,3);

    wieghts{i,1} = w';

end
    %}

 