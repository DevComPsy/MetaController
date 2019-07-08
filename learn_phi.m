function mc = learn_phi(mc,g)

for i = 1:length(mc.phi)
    mc.phi(i) = mc.phi(i) + abs(mc.pe{i}(g));
    
end