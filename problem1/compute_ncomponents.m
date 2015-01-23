function [n80,n95] = compute_ncomponents(cumvar)
%% Computes required number of components to account for (at least) 80%/95% of variance.
%
% INPUTS
%   cumvar  cumulative variance
%
% OUTPUTS
%   n80     number of components required for 80% of variance.
%   n95     number of components required for 95% of variance.
%%

total = sum(cumvar);

n80 = 0;
n95 = 0;

for i=1:size(cumvar)
   if (n80 == 0 && sum(cumvar(1:i))/total > 0.8)
       n80 = i;
   end
   if (n95 == 0 && sum(cumvar(1:i))/total > 0.95)
       n95 = i;
       break;
   end
end