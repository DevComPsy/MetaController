function mc = learn_phi(mc,alphasystem,cost,idx, task, nsystem)

for i = 1:length(nsystem)
    
    mc.pesystem = task.outcome - mc.vstate - cost;
    mc.vstate = mc.vstate + alphasystem*mc.pesystem;
    mc.phi{i,idx} = mc.phi{idx} + abs(mc.pesystem); 
end 
   
end
