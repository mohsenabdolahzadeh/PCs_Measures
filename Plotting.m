function Plotting(X, Variable)

xi = (X(:,1)) ; yi = (X(:,2)) ; z= Variable(:,1);
x1 = linspace(min(xi),max(xi));
y1 = linspace(min(yi),max(yi)) ;
[X,Y] = meshgrid(x1,y1) ;
Z = griddata(xi,yi,z,X,Y);
surf(X,Y,Z)
