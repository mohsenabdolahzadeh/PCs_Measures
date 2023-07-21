function[fill_distance,DT,cir_center] = fill_dis(X,nb)


DT = delaunayTriangulation(X);
IC = incenter(DT);
[num, ~] = size(X);
  
for k = nb+1:num
    i = k - nb;
    c_center = [];
    dx2 = [];
    dz2 = [];
    dx2 = (X(DT(i,1:3),1)-IC(i,1)).^2;
    dz2 = (X(DT(i,1:3),2)-IC(i,2)).^2; 
    ver1(i) = min(sqrt(dx2+dz2));
    p1 = [X(DT(i,1),1), X(DT(i,1),2)];
    p2 = [X(DT(i,2),1), X(DT(i,2),2)];
    p3 = [X(DT(i,3),1), X(DT(i,3),2)];
    c_center = circumCenter(p1,p2,p3);  
   % cir_center(i,1) = c_center(1); cir_center(i,2) = c_center(2);
  cir_center(i,1) = sqrt((X(DT(i,1),1)-c_center(1))^2+(X(DT(i,1),2)-c_center(2))^2);
end
fill_distance = mean(cir_center);