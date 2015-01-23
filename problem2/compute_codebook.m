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
[DIM N] = size(X);

%% choose randomly K data points as cluster centers
% to make it easier we just picked randomly K features
ccentersInd = datasample(1:N, K, 'Replace',false);
ccenters = X(:, ccentersInd);
done = false;
clusters.points = cell(1, K);
clusters.nbMembers = zeros(1, K);
while (~done)
    %% compute a Voronoi diagram with these chosen centers (initialize clusters)
    for i=1:N
        distances =
    end
    %% compute the new center for eah region of the diagram (mean of all the
    % features points of this region) 
    % and assign them as new cluster centers
    ccenters_p =
    %% check the criterion of stop
    if ( all(ccenters_p == ccenters) )
        % the cluster centers are unchanged
        done = true;
    end
    ccenters = centers_p;
end
codebook = ccenters;

% format check
assert(all(size(codebook) == [size(X,1) K]));
