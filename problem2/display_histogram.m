function [] = display_histogram(histogram, labelX, labelY, name, K)
%% Computes the histogram over the codebook for all input images
%
% INPUTS:
%   histogram       K x num_samples matrix, that assembles the histograms for all images (over the codebook)
%   labelX, labelY  legend for the axis
%   name            name of the figure
%   K               number of keypoints in the codebook
%%

% display the histogramm
figure('Name',name,'Position',[0,0,550,450]);
bar(histogram);
set(gca,'XTick',[1:length(histogram)]);
set(gca,'XTickLabel',1:K); 
xlabel(labelX); 
ylabel(labelY);