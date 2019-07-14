function [idx] = metaCont_act(mc,g)


% select action of the system with highest confidence (argmin) for the
% specific states

mc.shown_stimulus

[~,idx] = min(mc.phi);

tmp_a = mc.act(idx,g);

[mc_a,mc_s] = ind2sub(size(mc.pi{idx}),tmp_a);
