function plot_geometric_shapes_back(data_matrix)

data = data_matrix.Trajectories.Labeled.Data;
labels = data_matrix.Trajectories.Labeled.Labels;

% Find index of back markers in data matrix
row_idx_lback = find(~cellfun('isempty',strfind(labels,'Back_L')));
row_idx_rback = find(~cellfun('isempty',strfind(labels,'Back_R')));

% Extract matrices for back markers
Lback_matrix = squeeze(data(row_idx_lback, 1:3, :));
Rback_matrix = squeeze(data(row_idx_rback, 1:3, :));

% 3D plot of markers and geometric shape
%set(gca, 'XLim', [0 200],'YLim', [0 200],'ZLim', [0 200]);

%Eliminate NaN from matrix
%Lback_matrix(~any(~isnan(Lback_matrix), 2),:)=[];
Lback_matrix = Lback_matrix(:,~all(isnan(Lback_matrix)));

for i = 1:10%size(Lback_matrix, 2)
    marker_coord = [Lback_matrix(1,i), Lback_matrix(2,i), Lback_matrix(3,i)];
    scatter3(Lback_matrix(1,i), Lback_matrix(2,i), Lback_matrix(3,i),'filled', 'MarkerFaceColor', 'b');
    hold on;
    plot_sphere_3D(marker_coord)
    getframe
    clf
end
