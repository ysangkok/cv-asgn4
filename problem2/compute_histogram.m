function histogram = compute_histogram(features,codebook,K)
%% Computes the histogram over the codebook for all input images
%
% INPUTS:
%   features     (1 x num_samples) cell array of features.
%   codebook     128xK matrix where each column corresponds to a keypoint in the codebook.
%   K            number of keypoints in the codebook.
%
% OUTPUTS:
%   histogram    K x num_samples matrix, that assembles the histograms for all images (over the codebook).
%%

histogram =

% format check
assert(all(size(histogram) == [K size(features,2)]));
