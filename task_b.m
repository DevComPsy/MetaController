function [mc, task] = task_a(mc,task,g)
%Implementation of a more complex dimensions task. 

%% set up stimulus presentation
shown_stim(:,1) = [1 2];    %spatial position of the stimulus signs
shown_stim(:,2) = randperm(2); %stimulus
shown_stim(:,3) = repmat(randi(2),1,2); %background/context

%% fill in task structure
task.shown_stimulus(:,:,g) = shown_stim; %stimulus displayed

%%  determine potential outcomes
% high reward stimuli are stim1cont1 & stim2cont2
% position is not differentiated in this case, making the complex model in
% fact too complex

ps = [];
for s = 1:2 % both stimuli
    if shown_stim(s,2) == 1 && shown_stim(s,3) == 1 % stim 1, context 1
        ps(s) = .80;
    elseif shown_stim(s,2) == 2 && shown_stim(s,3) == 2 % stim 2, context 2
        ps(s) = .80;
    else
        ps(s) = .20;
    end
end

%% determine potential outcomes
task.pot_outcomes(1,g) = rand(1)<=ps(1); %outcome probability of the left stimulus sign
task.pot_outcomes(2,g) = rand(1)<=ps(1); %outcome probability of right stimulus sign

end 
