function [data,facedim,nfaces] = load_faces(fdir)
%% Loads images from the yale_faces directory.
%
% INPUTS
%   fdir       Root directory of face images.
%
% OUTPUTS
%   data       linearized and concatenated image data with size MxN,
%              where M is is the number of pixels per face, and N
%              is the number of face images
%   facedim    image dimensions (of a single face)
%   nfaces     number of all face images
%%

listing = dir([fdir '/*']);
yaleDirectoryNames = {listing.name};
yaleDirectoryNames(:,1) = []; % delete "."
yaleDirectoryNames(:,1) = []; % delete ".."

uint8mat = zeros(8064, 20*38);
nfaces = 0;

for i=1:size(yaleDirectoryNames,2)
   imgNames = dir(['../../data/yale_faces/' yaleDirectoryNames{i} '/*']);
   imgNames = {imgNames.name};
   imgNames(:,1) = []; % delete "."
   imgNames(:,1) = []; % delete ".."
   picturesInSubfolder = cellfun(@(x) imread(['../../data/yale_faces/' yaleDirectoryNames{i} '/' x],'pgm'), imgNames, 'UniformOutput', false);
   
   fprintf('%s\n', yaleDirectoryNames{i})
   for j=1:size(picturesInSubfolder,2)
       facedim = size(picturesInSubfolder{j}); % just take dimensions of the first
       uint8mat(:,nfaces+1) = reshape(picturesInSubfolder{j}, facedim(1)*facedim(2), 1);
       nfaces = nfaces + 1;
   end
end

data = double(uint8mat) / 255;

assert(facedim(1)*facedim(2) > 8000)
assert(size(data,1) == facedim(1)*facedim(2), 'image dimensions not on first axis (M): %d != %d', size(data,1), facedim(1)*facedim(2))
assert(nfaces == 20*38, 'nfaces is %d but should be %d', nfaces, 20*38)
assert(size(data,2) == nfaces, 'size is %d but should be %d', size(data,2), nfaces)

% format check
assert(isfloat(data) && 0 <= min(data(:)) && max(data(:)) <= 1);
