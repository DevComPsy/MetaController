clear all; close all; clc

%% settings
a_tot = [2,2,2];%number of actions 
s_tot = [1,2,3];%number of state dimensions
n_iter = 20;
alpha = .3;


%% initialize
[mc] = mc_initialize(n_iter,a_tot,s_tot);


%% loop through games
for g = 1:n_iter
    [rew] = task_a(mc);%function simulating task a
    
    
    % action selection each system
    [mc,a] = act(mc);
    mc.act(:,g) = a;
    
    % action selection meta controller
    [mc_a,mc_s,sys_chos] = metaCont_act(mc,g);
    mc.rew(g) = rew{sys_chos}(mc_a,mc_s);
    
    % PE learning
    mc = learn(mc,mc_a,mc_s,g,alpha);
    
    % update confidence
    mc = learn_phi(mc,g);
    
end
    % plot