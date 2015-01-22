function [training_inputs,testing_inputs] = load_data(dir_planes,dir_bikes)
%% Creates input structures by randomly separating the images
% into two equally sized sets for training/testing, respectively.
%
% INPUTS
%   dir_planes    Root folder of all airplane images
%   dir_bikes     Root folder of all motorbike images
%
% OUTPUTS
%   training_inputs    structure with following fields:
%      images            (1 x num_samples) cell array with random training images
%      labels            vector of length num_samples
%                        (should be '0' for an airplane and '1' for a motorbike)
%      num_samples       number of images in training set
%
%   testing_inputs    structure with following fields:
%      images            (1 x num_samples) cell array with random testing images
%      labels            vector of length num_samples
%                        (should be '0' for an airplane and '1' for a motorbike)
%      num_samples       number of images in testing set
%%

% Load images 
dir_planes = '../../data/planes';
planes = dir(sprintf('%s//*.png', dir_planes));
nbPlanes = length(planes);
seqTrainP = datasample(1:nbPlanes,floor(nbPlanes/2), 'Replace',false);

dir_bikes = '../../data/bikes';
bikes = dir(sprintf('%s//*.png', dir_bikes));
nbBikes = length(bikes);
seqTrainB = datasample(1:nbBikes,floor(nbBikes/2), 'Replace',false);

training_inputs.images = cell(1, floor(nbPlanes/2)+floor(nbBikes/2));
testing_inputs.images = cell(1, ceil(nbPlanes/2)+ceil(nbBikes/2));

training_inputs.num_samples = 0;
testing_inputs.num_samples = 0;
for i=1:nbPlanes
    if any(seqTrainP==i)
        % in training set
        training_inputs.num_samples = training_inputs.num_samples + 1;
        training_inputs.labels(i) = 0;
        training_inputs.images{training_inputs.num_samples} = im2double(imread(sprintf('%s//%s',dir_planes, planes(i).name)));
    else
        % in test data
        testing_inputs.num_samples = testing_inputs.num_samples + 1;
        testing_inputs.labels = 0;
        testing_inputs.images{testing_inputs.num_samples} = im2double(imread(sprintf('%s//%s',dir_planes, planes(i).name)));
    end
end

for i=1:nbBikes
    if any(seqTrainB==i)
        % in training set
        training_inputs.num_samples = training_inputs.num_samples + 1;
        training_inputs.labels(i) = 1;
        training_inputs.images{training_inputs.num_samples} = im2double(imread(sprintf('%s//%s',dir_bikes, bikes(i).name)));
    else
        % in test data
        testing_inputs.num_samples = testing_inputs.num_samples + 1;
        testing_inputs.labels = 1;
        testing_inputs.images{testing_inputs.num_samples} = im2double(imread(sprintf('%s//%s',dir_bikes, bikes(i).name)));
    end
end

assert( testing_inputs.num_samples == ceil(nbPlanes/2)+ceil(nbBikes/2) & training_inputs.num_samples == floor(nbPlanes/2)+floor(nbBikes/2))

% format check
fcheck = @(data) assert(isstruct(data) & isfield(data,'images') & ...
    isfield(data,'labels') & isfield(data,'num_samples') & iscell(data.images) & ...
    isvector(data.labels) & size(data.images,1)==1);
fcheck(training_inputs), fcheck(testing_inputs);
