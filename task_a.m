function [mc, task] = task_a(mc,task,g)
% Implementation of a simple motor task, one action gives rewards

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
