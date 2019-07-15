function [mc] = mc_initialize(niter, nactions, nstates, nsystems)

% structure with the following fields
    
mc = [];
    
for i = 1:length(nsystems)
    mc.phi{i} = 0;         % inverse confidence
    mc.pe{i} = 0;
    mc.Qs{i} = zeros(2,1);
    mc.Qc{i} = zeros(2,2,2);
    mc.pesystem (i) = nan; 
    mc.vstate (i) = 0;
end
