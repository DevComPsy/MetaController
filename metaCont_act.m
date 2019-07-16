function [idx,mc,task] = metaCont_act(mc,task,g)


% selecting a system (with highest confidence, argmin)from which we collect 
% a Q value determining the action


[~,idx] = min(mc.phi(:,end));

task.choice(g) =  mc.act{idx}(g);
task.chosenstimulus(:,g)= task.shown_stimulus(task.choice(g),:,g);
end
