function [mc] = mc_initialize(nsystems)

% structure with the following fields
    
mc = [];
    
for i = 1:nsystems
    mc.phi(i,1) = 0;         % inverse confidence
    mc.pe{i} = [];
    if i == 1   % simple system
        mc.Q{i} = zeros(2,1);
        mc.dims(i) = 1;
    elseif i == 2   % complex system
        mc.Q{i} = zeros(2,2,2);
        mc.dims(i) = 3;
    else
        mc.Q{i} = [];
        mc.dims(i) = 0;
    end
    mc.act{i} = [];
%     mc.pesystem(i) = nan; 
%     mc.vstate(i) = 0;
end
