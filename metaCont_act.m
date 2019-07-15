function [idx,mc, task] = metaCont_act(mc,task)


% selecting a system (with highest confidence, argmin)from which we collect 
% a Q value determining the action


[~,idx] = min([mc.phi{:}]);

task.choice= task.action(idx);
task.chosenstimulus=[task.choice task.stimuli_sign(task.choice) task.stimuli_backgr];
end
