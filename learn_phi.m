function mc = learn_phi(mc,settings,g)
%function updating the phi associated with each system after having
%executedan action and encountered an outcome

for i = 1:settings.nsystems
    
%     mc.phi(i,g+1) = ((g-1)/g) * mc.phi(i,g) + (1/g) * abs( mc.pe{i}(g));    % build mean
%     
     mc.phi(i,g+1) = mean(abs( mc.pe{i}));
     
    % add a little cost for complexity of system
    sz = size(mc.Q{i});
    nstates = prod(sz(1:end-1));
    mc.phi(i,g+1) = mc.phi(i,g+1) + nstates*settings.complexity_cost;


end
   
end
