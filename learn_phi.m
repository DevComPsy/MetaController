function mc = learn_phi(mc,settings,g)
%function updating the phi associated with each system after having
%executedan action and encountered an outcome

for i = 1:settings.nsystems
    
    mc.phi(i,g+1) = mc.phi(i,g) + abs( mc.pe{i}(g));

end
   
end
