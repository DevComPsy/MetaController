function [mc, task] = task_a(mc,task,g)
% Implementation of a simple motor task, one action gives rewards
% 
% task.stimuli_backgr=(randi([1 2]));
% task.stimuli_sign=(randperm(2)); % 1=star, 2= circle
% 
% %% play one game
% task.all_outcome_prob= [rand(1)<=.8 rand(1)<=.2];% action a (e.g. left press) 80% reward; action b (e.g. right press) 20% reward
% 
% task.shown_stimulus= [1 task.stimuli_sign(1)  task.stimuli_backgr];

%% set up stimulus presentation
shown_stim(:,1) = [1 2];    % spatial position in task
shown_stim(:,2) = randperm(2); % stimulus
shown_stim(:,3) = repmat(randi(2),1,2); % background/context

%% fill in task structure
task.shown_stimulus(:,:,g) = shown_stim;

%% determine potential outcomes
task.pot_outcomes(1,g) = rand(1)<=.8;   % good outcome (p=.80)
task.pot_outcomes(2,g) = rand(1)<=.2;   % bad outcome (p=.2)


end
