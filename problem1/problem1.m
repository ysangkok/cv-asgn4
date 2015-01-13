% Problem 1 - PCA for Face Images

% Load images (using load_faces)
fdir = '../../data/yale_faces'; % yale_faces directory
[data,facedim,nfaces] = load_faces(fdir);

% Compute principal components (using compute_pca)


% Plot the cumulative variance


% Display number of necessary components (using compute_ncomponents)


% Plot the mean face and the first 10 Eigenfaces (using show_faces)


% Fetch a random face out of the data matrix (using take_face)


% Project and reconstruct this face varying the number of principal components (using compute_reconstruction).
% Use 5/15/50/150 components, respectively.


% Display the reconstructions and the original face (in a single figure)

