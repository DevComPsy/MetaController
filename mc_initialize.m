function [mc] = mc_initialize(nsystems)
%Structure with the following fields:   
mc = [];
    
for i = 1:nsystems
    mc.phi(i,1) = .5; %inverse confidence for each system
    mc.pe{i} = []; %prediction error for each system
    if i == 1   % Q-values for the simple system
        mc.Q{i} = zeros(2,1);
        mc.dims(i) = 1;
    elseif i == 2   % Q-values for the complex system
        mc.Q{i} = zeros(2,2,2);
        mc.dims(i) = 3;
    else
        mc.Q{i} = [];
        mc.dims(i) = 0;
    end
    mc.act{i} = []; %chosen action by each system
end
