clear all; close all; clc
     alpha = .3;
     alphasystem = .3;
     niter = 20;
     nstates = 2;
     nactions = 2;
     invtemp= 1;
     nsystems=2;
     cost = 1;
     

%% initialize
[mc] = mc_initialize(alpha,nstates,nactions, nsystems);
[task] = task_initialize(niter,nstates,nactions);

%% loop through games
for g = 1:niter
    
      % function simulating task a
    [mc, task] = task_b(mc, task);
    
      % action selection each system
    [mc, task]=act(mc, task); 
    
      % action selection meta-controller
    [idx, mc, task] = metaCont_act(mc, task);

    task.outcome_prob = task.all_outcome_prob(task.choice); 
    task.outcome=rand(1)<=task.outcome_prob; 
      
     % PE learning
    [mc] = learn(mc,task, nactions,alpha,nstates, idx, niter);

     % update confidence
    [mc] = learn_phi(mc,alphasystem,cost,idx, task, nsystems);
    
end
