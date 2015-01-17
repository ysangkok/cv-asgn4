function [U,lambda,mu,cumvar] = compute_pca(X)
%% Principal component analysis.
%
% INPUTS
%   X        MxN data matrix
%
% OUTPUTS
%   U        Eigenvectors of covariance matrix of X
%   lambda   Eigenvalues of covariance matrix of X
%   mu       mean data vector
%   cumvar   cumulative variance (in increasing order)
%%

% the following causes a dimension mismatch, how to fix?
X_hat = (X-mean(X)); % substract the mean, slide 50
[U,S,V_t] = svd(X_hat,0); % economic SVD, slide 50
lambda = eigenvals(X_hat); % using the definition of lambda
C_hat = U*lambda*U'; % slide 51


%U =
%lambda =
%mu =
%cumvar =
