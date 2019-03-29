%generates a 3D cylinder surface along the axis specified between 
%the points r1 and r2 (which is along the z-axis for "cylinder").
N = 100;
R = 100;
i = 10;
r1=[Lback_matrix(1,i), Lback_matrix(2,i), Lback_matrix(3,i)];r2=[Rback_matrix(1,i), Rback_matrix(2,i), Rback_matrix(3,i)];
[X,Y,Z]=cylinder2P(R,N,r1,r2);
surf(X,Y,Z); 