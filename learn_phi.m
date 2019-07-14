function mc = learn_phi(mc)

for i = 1:length(mc.phi)
    mc.phi_mf{i} = mc.phi(i) + abs(mc.pe_mf{i});
    
    mc.phi_mb{i} = mc.phi(i) + abs(mc.pe_mb{i});

end
