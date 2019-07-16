function mc = learn_phi(mc,settings,g)

for i = 1:settings.nsystems
    
    mc.phi(i,g+1) = mc.phi(i,g) + abs( mc.pe{i}(g));
    
    %     mc.pesystem = task.outcome - mc.vstate - cost;
    %     mc.vstate = mc.vstate + alphasystem*mc.pesystem;
    %     mc.phi{i,idx} = mc.phi{idx} + abs(mc.pesystem);
end
   
end
