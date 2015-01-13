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


F =

% format check
assert(size(F,1) == 128);
