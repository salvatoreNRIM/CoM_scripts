function plot_sphere_3D(data, r, x, y, z)
%data = rand(3,1000);
[a,b,c] = sphere;
h = surf(a*r+data(1)+x, b*r+data(2)+y, c*r+data(3)+z)
colormap([0  0.5  1])
set(h, 'FaceAlpha', 0.2)
%set(gca, 'XLim', [-2 2],'YLim', [-2 2],'ZLim', [-2 2]);
shading interp
