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
% to make it easier we just picked randomly K samples
ccentersInd = datasample(1:N, K, 'Replace', false);
ccenters = X(:, ccentersInd);
done = false;

while (~done)

    %% compute a Voronoi diagram with these chosen centers (initialize clusters)
    clusters.nbMembers = zeros(1, K); % vector 1xK
    clusters.points = cell(1, K); % cell of matrices DIMxclusters.nbMembers{i}
    	% for each sample i
		% compute the distance to each cluster center
    D = pdist2(X',ccenters');
		% min of the distances gives you the cluster the sample belongs to
    for i=1:N
      [A clusterNo(i)] = min( D(i,:) );
		% add the sample in his cluster representation
      clusters.nbMembers{clusterNo(i)} = clusters.nbMembers{clusterNo(i)} + 1;
      clusters.points{clusterNo(i)}(:, clusters.nbMembers{clusterNo(i)}) = X(:, i);
    end

    %% compute the new center for eah region of the diagram (mean of all the
    % sample points of this cluster) 
    % and save them as the new cluster centers
    for i=1:K
      ccenters_p(:, i) = mean(clusters.points{i}, 2 );
    end

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
