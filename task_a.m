function [mc] = task_a(mc)
% Implementation of a simple motor task, one action gives rewards


mc.stimuli_sign=(randperm(2)); % 1=star, 2= circle

%% play one game
outcome_prob= [rand(1)<=.8 rand(1)<=.2];% action a (e.g. left press) 80% reward; action b (e.g. right press) 20% reward

mc.shown_stimulus= [mc.stimuli_sign(:,1) stimuli_sign(:,2) NaN NaN];

%% select an action
a = act(mc); %metacontroller determines the executed action given the presented stimuli
mc.choice = metaCont_act(mc,a);

mc.outcomes=[rand(1)<=outcome_prob]; 

end
