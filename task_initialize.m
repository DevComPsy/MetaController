function [task] = task_initialize()
% Structure with the following fields:

task = [];
    task.shown_stimulus = []; %displayed stimulus for this specific iteration
    task.pot_outcomes = []; %potential stimulus outcomes for this specific iteration 
    task.choice = []; %choice (left(1) or right(2))for this specific iteration
    task.chosenstimulus = []; %stimulus sign chosen for this specific iteration
    task.outcome = []; %task outcome for this specific iteration
end
