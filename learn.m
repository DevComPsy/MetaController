function mc = learn(mc,mc_a,mc_s,g,alpha)

rew = mc.rew(g);
% rew_b = mc.rew_b(g);

for i = 1:length(mc.phi)
    % calc PE
    if size(mc.q_state{i},2) < mc_s     % too simplistic model
        q = mean(mc.q_state{i}(mc_a,:));    % mean prediction
    else
        q = mc.q_state{i}(mc_a,mc_s);
    end
    
    mc.pe{i}(g) = rew - q;
    
%     mc.pe_b{i}(g) = rew_b - q;
%     
    % update Q
    if size(mc.q_state{i},2) < mc_s
        mc.q_state{i}(mc_a,:) = mc.q_state{i}(mc_a,:) + alpha*mc.pe{i}(g);
    else
        mc.q_state{i}(mc_a,mc_s) = mc.q_state{i}(mc_a,mc_s) + alpha*mc.pe{i}(g);
    end
    
    
%     % update Q for b    
%     if size(mc.q_state{i},2) < mc_s
%         mc.q_state{i}(mc_a,:) = mc.q_state{i}(mc_a,:) + alpha*mc.pe_b{i}(g);
%     else
%         mc.q_state{i}(mc_a,mc_s) = mc.q_state{i}(mc_a,mc_s) + alpha*mc.pe_b{i}(g);
%     end
%     
    

end