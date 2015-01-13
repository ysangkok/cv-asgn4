function codebook = compute_codebook(X,K)
%% Builds a codebook for a given data matrix by k-means clustering.
%
% INPUTS
%   X           DIMxN data matrix where DIM is the dimension of the data
%               and N is the number of samples.
%   K           number of cluster centers (keypoints) to use for the codebook.
%
% OUTPUTS
%   codebook    DIMxK matrix where each column corresponds to a keypoint in the resulting codebook.
%%

codebook =

% format check
assert(all(size(codebook) == [size(X,1) K]));
