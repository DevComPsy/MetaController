function [task] = task_initialize(niter, nactions, nstates)

% structure with the following fields
    
task = [];
for j = 1:length(niter)
    task.shown_stimulus(j,3) = 0;
    task.stimuli_sign(j,2) = 0;
    task.all_outcome_prob(j,2)= 0; 
    task.action(j,2) = 0;
    task.choice(j)= nan;
    task.chosenstimulus(j,3) = 0;
    task.outcome(j) = nan;
end 