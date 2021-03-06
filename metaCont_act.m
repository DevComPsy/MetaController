function [idx,mc,task] = metaCont_act(mc,task,settings,g)
%Simulation of the meta-controller. 
%The meta-controller selects one system (with the highest phi, argmin)whose 
%chosen action will then be executed.

[~,idx] = min(mc.phi(:,end));

% broken metacontroller
% idx = randi(settings.nsystems);

task.chosen_system(g) = idx;
task.choice(g) =  mc.act{idx}(g);
task.chosenstimulus(:,g)= task.shown_stimulus(task.choice(g),:,g);
end
