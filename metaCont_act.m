function [idx,mc,task] = metaCont_act(mc,task,g)
%Simulation of the meta-controller. 
%The meta-controller selects one system (with the highest phi, argmin)whose 
%chosen action will then be executed.

% phi = 1 - mc.phi(:,end);
% phi = phi - max(phi);
%      exqs = exp(phi*100);
%      if rand < exqs/sum(exqs)  %choice is made using a softmax                      
%          idx = 1;
%      else
%          idx = 2;
%      end

[~,idx] = min(mc.phi(:,end));

task.chosen_system(g) = idx;
task.choice(g) =  mc.act{idx}(g);
task.chosenstimulus(:,g)= task.shown_stimulus(task.choice(g),:,g);
end
