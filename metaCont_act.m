function [mc_a,mc_s,idx,idx_b] = metaCont_act(outcome)

% select action of the system with highest conficence (argmin)
[~,idx] = min(mc.phi);


tmp_a = mc.act(idx,g);


[mc_a,mc_s] = ind2sub(size(mc.pi{idx}),tmp_a);


