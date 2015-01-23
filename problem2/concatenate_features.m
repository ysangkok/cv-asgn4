function X = concatenate_features(features)
%% Build a (concatenated) feature matrix from the given cell array of features.
%
% INPUTS
%   features          (1 x num_samples) cell array of features.
%
% OUTPUTS
%   X                 data matrix of size 128xN, where N is the number of all interest points
%                     in all images.
%%
nbImages = length(features);
X = [];
for j=1:nbImages
    N_p = size(X,2);
    feature_matrix = features{j};
    M = size(feature_matrix, 2);
    for i=N_p+1:N_p+M
        X(:,i) = feature_matrix(:,i-N_p);
    end
end


% format check
assert(size(X,1) == 128);