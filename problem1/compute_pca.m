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
N = size(X,2);
mu = mean(X,2);
X_hat = ( X - repmat(mu, 1, N) ); % substract the mean, slide 50
[U,S,V] = svd(X_hat,0); % economic SVD, slide 50

% check decreasing order in U  : ok
lambda = (S*S)/N;
%lambda = eigenvals(X_hat); % using the definition of lambda
C_hat = U*lambda*U'; % slide 51

% TODO cumvar : cumulative variance of the principal components (in increasing order)
cumvar = cumsum(C_hat * U);

%U =
%lambda =
%mu =
%cumvar =
