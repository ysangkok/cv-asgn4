function faceim = take_face(data,facedim,index)
%% Fetch face with given index out of the data matrix
%
% INPUTS
%   data       face data matrix
%   facedim    face image dimensions
%   index      index of image
%
% OUTPUTS
%   faceim     fetched face image
%%

faceim = reshape(data(:,index),facedim);
