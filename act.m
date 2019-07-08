function [mc,a] = act(mc)


for i = 1:length(mc.phi)
    % compute policy based on q values
    qs = mc.q_state{i}(:) - max(mc.q_state{i}(:));
    exqs = exp(qs);
    mc.pi{i}(:) = exqs/sum(exqs);
    
    % select action based on policy
    rdn = rand(1);
    a(i) = find([0; cumsum(mc.pi{i}(:))]<rdn,1,'last');
end