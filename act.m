function [mc, task] = act(mc, task)
 
 % Input needed: 
 
 invtemp=1;

for i = 1:length(mc.phi)

%% action selection mf system 
% compute policy based on q values

qs = mc.Qs{i}(:) - max(mc.Qs{i}(:));
exqs = exp(invtemp*qs);
if rand < exqs/sum(exqs)                        % make choice using softmax
        task.action(:,1) = 1;
    else
        task.action(:,1) = 2;
end


%% action selection mb system 


qs = mc.Qc{i}(:)- max(mc.Qc{i}(:));
exqs = exp(invtemp*qs);
if rand < exqs/sum(exqs)                        % make choice using softmax
        task.action(:,2) = 1;
    else
        task.action(:,2) = 2;
end

end    
end
