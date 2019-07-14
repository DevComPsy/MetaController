function mc = learn(mc,nactions,alpha, nstates, niter)


for i = 1:length(n_iter)
    
 % update 
% mc.shown_stimulus

% mc.choice

mc.V_s=[mean(mc.outcome|mc.choice==1); mean(mc.outcome|mc.choice==2)];

mc.pe_mf= mc.outcomes - mc.Qmf
mc.Qmf= mc.Qmf+ alpha*(mc.pe_mf);

mc.pe_mb= mc.outcomes - mc.Qmb
mc.Qmb = mc.Qmb + alpha*(mc.pe_mb);
end
