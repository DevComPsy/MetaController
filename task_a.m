function [stimuli_outcome_a] = task_a(mc)
% Implementation of a simple motor task, one action gives rewards

stimuli_sign=(randperm(2));

pA1= find(stimuli_sign(1,1));
pA2= stimuli_sign(1,2);

pA1 = .8;   % action a (e.g. left press) 80% reward
pA2 = .2;   % action b (e.g. right press) 20% reward


%% play one game
rA1 = rand(1)<=pA1;
rA2 = rand(1)<=pA2;

%select an action

%outcome

chosen_stimulus= [stimuli_sign(1,1) NaN NaN]%position of the stimulus (1=left, 2=right), sign and context are diregarded
%outcome=

end
