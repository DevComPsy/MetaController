clear all; close all; clc


     alpha = .3
     niter = 20;
     nstates = 2;
     nactions = 2;

%% initialize
 [mc] = mc_initialize(alpha,nstates,nactions);


%% loop through games
for g = 1:niter
    [chosen_stimulus,outcomes] = task_b(mc); %function simulating task b
    
    % action selection each system  
    [mc,a] = act(mc);
    mc.act(:,g) = a;
    
    % action selection meta-controller
    [nstates,nactions,sys_chos] = metaCont_act(mc,g);
    mc.outcome(g) = outcome{sys_chos}( nstates,nactions);
    
    % PE learning
    mc = learn(mc,nstates,alpha);
  
    
    % update confidence
    mc = learn_phi(mc,g);
    
end

 % plot