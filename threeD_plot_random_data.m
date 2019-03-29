function threeD_plot_random_data
data = rand(3,10);
set(gca, 'XLim', [0 200],'YLim', [0 200],'ZLim', [0 200]);
for i =1:size(data,2)
    scatter3(data(1,i), data(2,i), data(3,i))
    F =getframe
    
end
