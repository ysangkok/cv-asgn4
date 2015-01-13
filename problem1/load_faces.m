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

listing = dir('../../data/yale_faces/*');
yaleDirectoryNames = {listing.name};
yaleDirectoryNames(:,1) = []; % delete "."
yaleDirectoryNames(:,1) = []; % delete ".."

uint8mat = [];
nfaces = 0;

for i=1:size(yaleDirectoryNames)
   imgNames = dir(['../../data/yale_faces/' yaleDirectoryNames{i} '/*']);
   imgNames = {imgNames.name};
   imgNames(:,1) = []; % delete "."
   imgNames(:,1) = []; % delete ".."
   picturesInSubfolder = cellfun(@(x) imread(['../../data/yale_faces/' yaleDirectoryNames{i} '/' x],'pgm'), imgNames, 'UniformOutput', false);
   facedim = size(picturesInSubfolder{1}); % just take dimensions of the first
   nfaces = nfaces + size(picturesInSubfolder,2);
   uint8mat = [uint8mat; cell2mat(picturesInSubfolder)] ;
end

data = double(uint8mat) / 255;

% format check
assert(isfloat(data) && 0 <= min(data(:)) && max(data(:)) <= 1);