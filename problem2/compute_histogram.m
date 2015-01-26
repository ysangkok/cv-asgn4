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

assert(size(codebook,2) == K);
num_samples = size(features,2);

histogram = zeros([K, num_samples]);

for featNum=1:num_samples
    for keypointNum=1:K
        rm = repmat(codebook(:,keypointNum), 1, size(features{featNum}, 2));
        dists = sum((features{featNum} - rm) .^ 2);
        [val, idx] = max(dists);
        assert(size(idx,1) == 1 && size(idx,2) == 1);
        histogram(keypointNum, idx) = histogram(keypointNum, idx) + 1;
    end
end

% format check
assert(all(size(histogram) == [K size(features,2)]));
