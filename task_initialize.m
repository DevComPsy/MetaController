function [task] = task_initialize()

% structure with the following fields
    
task = [];
% for j = 1:length(niter)
    task.shown_stimulus = [];
%     task.stimuli_sign(j,2) = 0;
    task.pot_outcomes = []; 
    task.action = [];
    task.choice = [];
    task.chosenstimulus = [];
    task.outcome = [];
% end 