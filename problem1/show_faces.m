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
title('display_faces');

%% display mean face
%subplot(2,5,1);
imshow(reshape(mu,facedim));

%% TODO
%display the 10 first Eigenfaces
figure
title('first 10 Eigenfaces');
for i=1:10
    subplot(2,5,i);
    imshow(reshape(U(:,i),facedim));
    imagesc;
end
%
