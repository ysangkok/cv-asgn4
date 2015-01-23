% Problem 1 - PCA for Face Images

% Load images (using load_faces)
fdir = '../../data/yale_faces'; % yale_faces directory
[data,facedim,nfaces] = load_faces(fdir); %load_faces2(fdir);

% Compute principal components (using compute_pca)
[U,lambda,mu,cumvar] = compute_pca(data);

%%

% Plot the cumulative variance
figure
title('cumulative variance')
plot(cumvar);

% Display number of necessary components (using compute_ncomponents)
[n80, n95] = compute_ncomponents(cumvar);

% Plot the mean face and the first 10 Eigenfaces (using show_faces)
show_faces(U,mu,facedim)

% Fetch a random face out of the data matrix (using take_face)
random_face = take_face(data, facedim, datasample(1:facedim,1));
figure
title('ramdom face picked')
imshow(random_face);

% Project and reconstruct this face varying the number of principal components (using compute_reconstruction).
% Use 5/15/50/150 components, respectively.

