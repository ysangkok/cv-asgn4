function show_faces(U,mu,facedim)
%% Display mean face and first 10 Eigenfaces.
%
% INPUTS
%   fdir       Root directory of face images.
%   U          PCA bases
%   mu         mean face
%   facedim    face dimension
%%



%% display mean face
figure('Name', 'mean face')
imshow(reshape(mu,facedim))

%% display the 10 first Eigenfaces
figure('Name', '10 first Eigenfaces')
colormap('gray')
title('first 10 Eigenfaces')
for i=1:10
    subplot(2,5,i)
    imagesc(reshape(U(:,i),facedim))
end
%
