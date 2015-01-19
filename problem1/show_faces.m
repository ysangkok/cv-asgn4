function show_faces(U,mu,facedim)
%% Display mean face and first 10 Eigenfaces.
%
% INPUTS
%   fdir       Root directory of face images.
%   U          PCA bases
%   mu         mean face
%   facedim    face dimension
%%

figure
title('display_faces')

%% display mean face
subplot(5,2,1); imshow(mu);

%% TODO
%display the 10 first Eigenfaces
subplot(5,2,3); imshow(U(1,1));
%
