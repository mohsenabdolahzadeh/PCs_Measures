function [X, nn, nb, nn_Top_St,nn_Top_End,nn_Right_St] = Load_geometry(run_n,numx)

X = readmatrix(strcat('/u/a/abdolahzadeh/Desktop/mohsen_bitbucket-gfdm_meshless_v0-55281cefa779/X_sets_Perturbed_PC/X_set_',num2str(numx),'_perturbation/X_set_',num2str(numx),'_pertuebation_',num2str(run_n),'.txt'));
Indat = readmatrix('/u/a/abdolahzadeh/Desktop/mohsen_bitbucket-gfdm_meshless_v0-55281cefa779/X_sets_Perturbed_PC/X_set_0_perturbation/INDAT.txt');
nn = Indat(1,1);
nb = Indat(2,1);
nn_Top_St = Indat(3,1);
nn_Top_End = Indat(4,1);
nn_Right_St = Indat(5,1);
end
