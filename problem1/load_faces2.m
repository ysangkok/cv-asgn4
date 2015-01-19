function [data, facedim, nfaces] = load_faces(fdir)
%{
 Loads images from yale database.

 Inputs:
   fdir       Root directory containing the face images.

 Outputs:
   data       linearized and concatenated image data with size MxN,
              where M is is the number of pixels per face, and N
              is the number of face images
   facedim    2D face image dimensions [rows,cols]
   nfaces     number of all face images
%}

%% load pgm files
%{files = dir(sprintf('%s//*', fdir)); %.pgm',fdir));
%nfaces = length(files(:,1));
%}
nfaces = 0;
data = [];
facedim = [];

% Load images from all repertories except . and ..
reps = dir(sprintf('%s//*',fdir));
for (i=3:length(reps(:,1)))
  rep = reps(i).name;
  if (reps(i).isdir)
     %disp(rep)
     files = dir(sprintf('%s//%s//*.pgm', fdir, rep));
     for ( i=1:length(files(:,1)) )
       img = [];
       %disp(files(i).name)
       img = im2double(imread(sprintf('%s//%s//%s',fdir, rep, files(i).name)));
       nfaces = nfaces+1;
       data(:,nfaces) = img(:);
     end
  end
end
%{
%% load images directly in one directory
img = [];
data = [];
for (i=1:nfaces)
  img = [];
  disp(files(i).name)
  %disp(sprintf('%s//%s',fdir, files(i).name))
  %img = load_image(sprintf('%s//%s',fdir, files(i).name));
  data(:,i) = img(:);
end
%}
facedim = size(img);



% format check
assert(isfloat(data) && 0 <= min(data(:)) && max(data(:)) <= 1);
dataSize = size(data);
assert(dataSize(1) == facedim(1)*facedim(2) && dataSize(2) == nfaces);
