function [mc] = mc_initialize(n_iter,a_tot, s_tot)

% n: number of systems
% a_tot: number of actions for each system (1*n vector)
% s_tot: number of state dimensions for each system (1*n vector)

mc = [];

for i = 1:length(a_tot)
    mc.pi{i} = ones(a_tot(i),s_tot(i)) ./ (a_tot(i)*s_tot(i));    % action policy
%     mc.pi_b{i} = ones(a_tot(i),s_tot(i)) ./ (a_tot(i)*s_tot(i));    % action policy game b
    mc.q_state{i} = ones(a_tot(i),s_tot(i)) ./ (a_tot(i)*s_tot(i));    % value of state space (equal value for all states)
    mc.phi(i) = 0;         % inverse confidence
    mc.cp(i) = numel(mc.q_state{i});         % complexity
    mc.act(i,n_iter) = nan; % action chosen
    mc.rew(i,n_iter) = nan;     % outcome game a
%     mc.rew_b(i,n_iter) = nan; % outcome game b
    mc.pe{i} = [];  % prediction errors on game a
end