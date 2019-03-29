function plot_geometric_shapes_back_right(data_matrix)

data = data_matrix.Trajectories.Labeled.Data;
labels = data_matrix.Trajectories.Labeled.Labels;

% Find index of back markers in data matrix
row_idx_rback = find(~cellfun('isempty',strfind(labels,'Back_R')));

% Extract matrices for back markers
Rback_matrix = squeeze(data(row_idx_rback, 1:3, :));

%Eliminate NaN from matrix
Rback_matrix = Rback_matrix(:,~all(isnan(Rback_matrix)));

for i = 1:10%size(Lback_matrix, 2)
    marker_coord = [Rback_matrix(1,i), Rback_matrix(2,i), Rback_matrix(3,i)];
    scatter3(Rback_matrix(1,i), Rback_matrix(2,i), Rback_matrix(3,i),'filled', 'MarkerFaceColor', 'b');
    hold on;
    plot_sphere_3D(marker_coord)
    getframe
    clf
end