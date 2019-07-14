function [mc] = mc_initialize(niter, nactions, nstates)

% structure with the following fields
    
mc = [];


%     mc.V_b{i} = zeros(nsigns);
%     mc.V_c{i} = zeros(ncontext*nsign);
    
for i = 1:length(niter)
%     mc.pi{i} = ones(nstates(i),nactions(i)) ./ (nactions(i)*nstates(i));    % action policy
    mc.phi(i) = 0;         % inverse confidence
    mc.act(i) = nan;
    mc.outcome(i) = nan;
    mc.choice(i) = nan; 
    mc.V_s{i} = [];
    mc.pe_mf{i} = [];
    mc.pe_mb{i} = [];
    mc.Qmf{i} = [];
    mc.Qmb{i} = [];
    mc.phi_mf{i} = [];
    mc.phi_mb{i} = [];
    mc.shown_stimulus(i) = [];
end
