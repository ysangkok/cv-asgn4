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

[mask, unused_harris_values] = harris(im, sigma, fsize, threshold);
% Usage:   [mask, harris] = harris(img, sigma, fsize, th)
%
% Argument:
%   img    - 2D grayscale image
%   sigma  - kernel width of the Gaussian smoother
%   fsize  - filter size
%   th     - threshold for Harris function values

[x,y] = find(mask);

F = sift(im,x,y);
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
