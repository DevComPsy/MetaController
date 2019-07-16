function [mc, task] = task_a(mc,task,g)
%Implementation of a more complex dimensions task. 

%% set up stimulus presentation
shown_stim(:,1) = [1 2];    %spatial position of the stimulus signs
shown_stim(:,2) = randperm(2); %stimulus
shown_stim(:,3) = repmat(randi(2),1,2); %background/context

%% fill in task structure
task.shown_stimulus(:,:,g) = shown_stim; %stimulus displayed

%%  determine potential outcomes
if  shown_stim(:,2) == [1 2], shown_stim(:,3) == [1 1];
    prob1 = 0.40  , prob2 = 0.70 ; 
elseif shown_stim(:,2) == [2 1], shown_stim(:,3) == [1 1];
    prob1 = 0.30  , prob2 = 0.60 ; 
elseif shown_stim(:,2) == [1 2], shown_stim(:,3) == [2 2];   
    prob1 = 0.60  , prob2 = 0.30 ; 
else shown_stim(:,2) == [2 1], shown_stim(:,3) == [2 2];
    prob1 = 0.70  , prob2 = 0.40 ; end

%% determine potential outcomes
task.pot_outcomes(1,g) = rand(1)<=prob1; %outcome probability of the left stimulus sign
task.pot_outcomes(2,g) = rand(1)<=prob2; %outcome probability of right stimulus sign

end 
