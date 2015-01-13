function imrecon = compute_reconstruction(faceim,U,mu,ncomp)
%% Project given face on low-dimensional space and reconstruct it with a
% given number of principal components.
%
% INPUTS
%   faceim   face image
%   U        pca basis vectors
%   mu       mean face
%   ncomp    number of components to use for projection/reconstruction
%
% OUTPUTS
%   imrecon  reconstructed face image
%%

imrecon =
