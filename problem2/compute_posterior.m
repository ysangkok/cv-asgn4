function [lp_c0,lp_c1] = compute_posterior(bayes_classifier,histogram)
%% Computes the log class posteriors for the given bayes classifier
% and the given histograms.
%
% INPUTS
%   bayes_classifier   structure with following fields:
%     prior_c0            prior class 0
%     prior_c1            prior class 1
%     pc_c0               vector of length K corresponding to the class-conditional probabilities of each
%                         keyword for class 0
%     pc_c1               vector of length K corresponding to the class-conditional probabilities of each
%                         keyword for class 1
%
%   histogram           K x num_samples matrix, that assembles the histograms for all images
%                       (over the codebook).
%
% OUTPUTS:
%   lp_c0        log class posteriors for class 0
%   lp_c1        log class posteriors for class 1
%%


lp_c0 = arrayfun(@log, bayes_classifier.prior_c0 * bayes_classifier.pc_c0 )
lp_c1 = arrayfun(@log, bayes_classifier.prior_c1 * bayes_classifier.pc_c1 )


% format check
assert(length(lp_c0)==size(histogram,2) & length(lp_c1)==size(histogram,2));
