function [riesz_s_energy,mean_riesz_s_energy] = Compute_Riesz_S_energy(X,h)

Index = rangesearch(X,X,h);
[num_p dim] = size(X);
for i = 1:num_p
    dxx = []; dzz = []; euclidian_distance = [];

    dxx = (X(i,1)-X(Index{i,1}(1,2:end),1));
    dxx = dxx.^2;
    dzz = (X(i,2)-X(Index{i,1}(1,2:end),2));
    dzz = dzz.^2;
    euclidian_distance = sqrt(dxx + dzz);
    riesz_s_energy(i,1) = sum(1/euclidian_distance(:,1));
end
mean_riesz_s_energy = mean(riesz_s_energy);