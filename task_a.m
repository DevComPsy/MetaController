function [mc, task] = task_a(mc)
% Implementation of a simple motor task, one action gives rewards

task.stimuli_backgr=(randi([1 2]));
task.stimuli_sign=(randperm(2)); % 1=star, 2= circle

%% play one game
task.all_outcome_prob= [rand(1)<=.8 rand(1)<=.2];% action a (e.g. left press) 80% reward; action b (e.g. right press) 20% reward

task.shown_stimulus= [1 task.stimuli_sign(1)  task.stimuli_backgr];
end
