function F = im2feat(im,fsize,sigma,threshold,boundary)
%% Extract features for a single image
%
% INPUTS
%   im                 given image
%   fsize              Harris filter size
%   sigma              Harris filter sigma
%   threshold          Harris threshold
%   boundary           boundary for interest points
%
% OUTPUTS
%   F                  128xN SIFT features, where N is the number of interest points.
%%

[maskH, unused_harris_values] = harris(im, sigma, fsize, threshold);
% Usage:   [mask, harris] = harris(img, sigma, fsize, th)
%
% Argument:
%   img    - 2D grayscale image
%   sigma  - kernel width of the Gaussian smoother
%   fsize  - filter size
%   th     - threshold for Harris function values

width = size(im,2);
height = size(im,1);
half = fix(width/2);
mask = logical(zeros(height, width));
mask(1+boundary:height-boundary, half:width-boundary) = 1; % right half of the left image outside of the boundary

maskKey = mask .* maskH; % logical and
[py, px] = find(maskKey == 1);

F = sift(im,px,py);
%   im          image (rgb or grayscale)
%   x           vector of x-coordinates of keypoints
%   y           vector of y-coordinates of keypoints
%
% OUTPUTS:
%   F           128xM SIFT feature matrix,
%               where M is the number of keypoints.

%F = 0

% format check
assert(size(F,1) == 128);
