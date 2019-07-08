function [rew] = task_a(mc)
% Implementation of a simple motor task, one action gives rewards

pA1 = .8;   % action a 80% reward
pA2 = .2;   % action b 20% reward


%% play one game
rA1 = rand(1)<=pA1;
rA2 = rand(1)<=pA2;

%% set up reward matrix
rew = [];
for i = 1:length(mc.phi)
    rew{i} = repmat([rA1 rA2]',1,size(mc.q_state{i},2)); %repmat(input, nr of rows, nr of columns (number of columns mc.q_state)
end