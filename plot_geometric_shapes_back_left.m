function plot_geometric_shapes_back_left(data_matrix)

data = data_matrix.Trajectories.Labeled.Data;
labels = data_matrix.Trajectories.Labeled.Labels;

% Find index of back markers in data matrix
row_idx_lback = find(~cellfun('isempty',strfind(labels,'hip_l')));
row_idx_rback = find(~cellfun('isempty',strfind(labels,'hip_r')));
row_idx_lfront = find(~cellfun('isempty',strfind(labels,'back_l')));
row_idx_rfront = find(~cellfun('isempty',strfind(labels,'back_r')));


% Extract matrices for back markers
Lback_matrix = squeeze(data(row_idx_lback, 1:3, :));
Rback_matrix = squeeze(data(row_idx_rback, 1:3, :));
Lfront_matrix = squeeze(data(row_idx_lfront, 1:3, :));
Rfront_matrix = squeeze(data(row_idx_rfront, 1:3, :));

% 3D plot of markers and geometric shape
%set(gca, 'XLim', [0 200],'YLim', [0 200],'ZLim', [0 200]);

%Eliminate NaN from matrix
%Lback_matrix(~any(~isnan(Lback_matrix), 2),:)=[];
Lback_matrix = Lback_matrix(:,~all(isnan(Lback_matrix)));
Rback_matrix = Rback_matrix(:,~all(isnan(Rback_matrix)));
Lfront_matrix = Lfront_matrix(:,~all(isnan(Lfront_matrix)));
Rfront_matrix = Rfront_matrix(:,~all(isnan(Rfront_matrix)));

for i = 1:50%size(Lback_matrix, 2)
    %Set triplets of value that correspond to coordinate of time series,
    %one triplet for each marker
    marker_coordLB = [Lback_matrix(1,i), Lback_matrix(2,i), Lback_matrix(3,i)];
    marker_coordRB = [Rback_matrix(1,i), Rback_matrix(2,i), Rback_matrix(3,i)];
    marker_coordLF = [Lfront_matrix(1,i), Lfront_matrix(2,i), Lfront_matrix(3,i)];
    marker_coordRF = [Rfront_matrix(1,i), Rfront_matrix(2,i), Rfront_matrix(3,i)];
    %Plot markers on 3d plot
    scatter3(Lback_matrix(1,i), Lback_matrix(2,i), Lback_matrix(3,i),'filled', 'MarkerFaceColor', 'b');hold on;
    scatter3(Rback_matrix(1,i), Rback_matrix(2,i), Rback_matrix(3,i),'filled', 'MarkerFaceColor', 'b');
    scatter3(Lfront_matrix(1,i), Lfront_matrix(2,i), Lfront_matrix(3,i),'filled', 'MarkerFaceColor', 'b');
    scatter3(Rfront_matrix(1,i), Rfront_matrix(2,i), Rfront_matrix(3,i),'filled', 'MarkerFaceColor', 'b');
    %Plot spheres based on markers coordinates and with a certain radius (1st value)
    plot_sphere_3D(marker_coordLB, 10, 0, 0, 0)
    plot_sphere_3D(marker_coordRB, 10, 0, 0, 0)
    plot_sphere_3D(marker_coordLF, 10, 0, 0, 0)
    plot_sphere_3D(marker_coordRF, 10, 0, 0, 0)
    getframe
    clf
end
