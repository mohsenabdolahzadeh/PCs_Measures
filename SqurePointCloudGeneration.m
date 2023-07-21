function [X, nn, nb, nn_Top_St,nn_Top_End,nn_Right_St] = SqurePointCloudGeneration(S...
    ,M,N,MN,dx,dz,L_x,L_z,run_n)
%{
this function creats regulare nodes in a squre area
Inputs:
 S: Dimension of the space
 M: Numner of point cluds in x-direction 
 N: Number of point cluds in z-direction 
%}
nn = 0;
nb= 0;

%Point cloud generation using perturbation of cartesian 

% Generating bottomn boundary
[XF,nnn] = Bottom_boundary(S,M,N,dx,dz);
X(1:nnn,1)=XF(1:nnn,1); %+ (-1).^randi(2)*randn(1,1)*dx*.2;
X(1:nnn,2)=XF(1:nnn,2);
nn = nn+nnn; 
% Generating top boundary
nn_Top_St = nn + 1; % Firest point number at top boundary 
[XF,nnn] = Top_boundary(S,M,N,dx,dz);
X(nn+1:nn+nnn,1)=XF(1:nnn,1); %+ (-1).^randi(2)*randn(1,1)*dx*.2;
X(nn+1:nn+nnn,2)=XF(1:nnn,2);
nn = nn + nnn;
nn_Top_End = nn; % End point number at top boundary 
% Generating left boundary
[XF,nnn] = Left_boundary(S,M,N,dx,dz);
X(nn+1:nn+nnn,1)=XF(1:nnn,1);
X(nn+1:nn+nnn,2)=XF(1:nnn,2); %+ (-1).^randi(2)*randn(1,1)*dz*.2;
nn = nn + nnn;
% Generating right boundary
nn_Right_St = nn+1
[XF,nnn] = Right_boundary(S,M,N,dx,dz);
X(nn+1:nn+nnn,1)=XF(1:nnn,1);
X(nn+1:nn+nnn,2)=XF(1:nnn,2); %+ (-1).^randi(2)*randn(1,1)*dz*.3;
nn = nn + nnn;
nb = nb + nn; 

%rng(1);
 for j=2:N
     for i=2:M
         xpos = (i-1)*dx + (-1).^randi(2)*rand*dx*1.0;
         zpos = (j-1)*dz + (-1).^randi(2)*rand*dz*1.0;
         nn = nn +1;
         X(nn,1) = xpos;
         X(nn,2) = zpos;
     end
 end

 %filnem= ['mmdta' num2str(run_n)];
% csvwrite('/u/a/abdolahzadeh/Desktop/Oleg/Errors/myfile.txt',X)


%writematrix(X,strcat('/u/a/abdolahzadeh/Desktop/Oleg/X_set_5_perturbation/X_set_5_pertuebation_',num2str(run_n),'.txt'),'Delimiter','tab');


%{
% Generating bottomn boundary

[XF,nnn] = Bottom_boundary(S,M,N,dx,dz);
X(1:nnn,1)=XF(1:nnn,1);
X(1:nnn,2)=XF(1:nnn,2);
nn = nn+nnn; 

% Generating top boundary
nn_Top_St = nn + 1; % Firest point number at top boundary 
[XF,nnn] = Top_boundary(S,M,N,dx,dz);
X(nn+1:nn+nnn,1)=XF(1:nnn,1);
X(nn+1:nn+nnn,2)=XF(1:nnn,2);
nn = nn + nnn;
nn_Top_End = nn; % End point number at top boundary 

% Generating left boundary
[XF,nnn] = Left_boundary(S,M,N,dx,dz);
X(nn+1:nn+nnn,1)=XF(1:nnn,1);
X(nn+1:nn+nnn,2)=XF(1:nnn,2);
nn = nn + nnn;

% Generating right boundary
nn_Right_St = nn+1
[XF,nnn] = Right_boundary(S,M,N,dx,dz);
X(nn+1:nn+nnn,1)=XF(1:nnn,1);
X(nn+1:nn+nnn,2)=XF(1:nnn,2);
nn = nn + nnn;
nb = nb + nn;
%}

% Generating interior point clouds

% Generating interrior point clouds using Distmesh algorithm
%{
dx=dx/1;
dz=dz/1;
fd = @(p) -min(min(min(-dz+p(:,2),(L_z-dz)-p(:,2)),-dx+p(:,1)),(L_x-dx)-p(:,1));
  fh = @(p) ones(size(p,1),1);
  [p,t] = distmesh( fd, fh, dx, [dx,dz;L_x-dx,L_z-dz],[dx,dz;dx,...
      L_z-dz;L_x-dx,dz;L_x-dx,L_z-dz] );
  patch( 'vertices', p, 'faces', t, 'facecolor', [.9, .9, .9] );
sizep = size(p);

for i = 1:sizep(1)
    X(nb+i,1) = p(i,1);
    X(nb+i,2) = p(i,2);
end
%}


 %Generating regular interior point clouds 
%{
 for j=2:N
     for i=2:M
         xpos = (i-1)*dx;
         zpos = (j-1)*dz;
         nn = nn +1;
         X(nn,1) = xpos;
         X(nn,2) = zpos;
     end
 end

%}

% Generating point clouds using Holton sequence 
%{
% Total number of point for Halton sequence 
Nop = 6400 - nb 
p=haltonseq(Nop,2);
sizep = size(p);

for i = 1:sizep(1)
    X(nb+i,1) = p(i,1);
    X(nb+i,2) = p(i,2);
end
%}

end
