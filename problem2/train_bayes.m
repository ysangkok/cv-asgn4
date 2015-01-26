function bayes_classifier = train_bayes(labels,num_samples,histogram,K)
%%
% Train a naive Bayes classifier for separating two classes.
%
% INPUTS:
%   labels              vector of class labels (0/1)
%   num_samples         number of samples
%   histogram           K x num_samples matrix, that assembles the histograms
%                       for all images (over the codebook).
%   K                   number of keypoints in codebook.
%
% OUTPUTS:
%    bayes_classifier   structure with following fields:
%       prior_c0          prior class 0
%       prior_c1          prior class 1
%       pc_c0             vector of length K corresponding to the class-conditional probabilities of each
%                         keyword for class 0
%       pc_c1             vector of length K corresponding to the class-conditional probabilities of each
%                         keyword for class 1
%%

bayes_classifier.prior_c0 = (1/num_samples)*length( find( labels == 0 ) )
bayes_classifier.prior_c1 = (1/num_samples)*length( find( labels == 1 ) )

sumC = sum(histogram, 2);
iC0 = find( labels == 0 );
iC1 = find( labels == 1 );

bayes_classifier.pc_c0 = zeros([1 K]);
bayes_classifier.pc_c1 = zeros([1 K]);
for i=1:K
    if (sumC(i) > eps)
        bayes_classifier.pc_c0(i) = sum(histogram(i, iC0)) / sumC(i);
        bayes_classifier.pc_c1(i) = sum(histogram(i, iC1)) / sumC(i);
    end
end

assert(all( (bayes_classifier.pc_c0  +  bayes_classifier.pc_c1) == 1 ) );
assert(bayes_classifier.prior_c0 + bayes_classifier.prior_c1 == 1);
% format check
assert(isstruct(bayes_classifier) & isfield(bayes_classifier,'prior_c0') & ...
       isfield(bayes_classifier,'prior_c1') &  isfield(bayes_classifier,'pc_c0') & ...
       isfield(bayes_classifier,'pc_c1') & length(bayes_classifier.pc_c0) == K & ...
       length(bayes_classifier.pc_c1) == K);
