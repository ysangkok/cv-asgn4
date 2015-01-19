% Problem 1 - PCA for Face Images

% Load images (using load_faces)
fdir = '../../data/yale_faces'; % yale_faces directory
[data,facedim,nfaces] = load_faces(fdir); %load_faces2(fdir);

% Compute principal components (using compute_pca)
%% TODO [U,lambda,mu,cumvar] = compute_pca(data);
X = data;
M = size(X,2);
mu = mean(X,2);
X_hat = ( X - repmat(mu, 1, M) ); % substract the mean, slide 50
[U,S,V] = svd(X_hat,0); % economic SVD, slide 50

% TODO : check decreasing order in U
lambda = (S*S)/M;
%lambda = eigenvals(X_hat); % using the definition of lambda
C_hat = U*lambda*U'; % slide 51

% TODO cumvar : cumulative variance of the principal components (in increasing order)
%%
%{
% Plot the cumulative variance
figure
title('cumulative variance')
imshow(cumvar);

% Display number of necessary components (using compute_ncomponents)

%% TODO
% Plot the mean face and the first 10 Eigenfaces (using show_faces)
show_faces(U,mu,facedim)


% Fetch a random face out of the data matrix (using take_face)


% Project and reconstruct this face varying the number of principal components (using compute_reconstruction).
% Use 5/15/50/150 components, respectively.


% Display the reconstructions and the original face (in a single figure)
figure
title('display_reconstruction')
legend('1', '2', '3', '4', '5')
subplot(1,5,1); imshow(faceim)
subplot(1,5,2); imshow(f5)
subplot(1,5,3); imshow(f15)
subplot(1,5,4); imshow(f50)
subplot(1,5,5); imshow(f150)
%}
