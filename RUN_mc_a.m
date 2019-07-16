clear all; close all; clc
     

%% parameter settings
settings = [];
settings.alpha = .3;
% settings.alphasystem = .3;
settings.niter = 20;
% settings.nstates = 2;
% settings.nactions = 2;
settings.invtemp= 1;
settings.nsystems=2;
% settings.cost = 1;


%% initialize
[mc] = mc_initialize(settings.nsystems);
[task] = task_initialize();

%% loop through games
for g = 1:settings.niter
    disp(g)
    
    % function simulating task a
    [mc, task] = task_a(mc,task,g);
    
    % action selection each system
    [mc, task] = act(mc, task,settings,g);
    
    % action selection meta-controller
    [idx, mc, task] = metaCont_act(mc, task, g);
    
    % determine outcome
    [task] = determine_outcome(mc,task,g);
    %     task.outcome_prob = task.all_outcome_prob(task.choice);
    %     task.outcome=rand(1)<=task.outcome_prob;
    
    % PE learning
    [mc] = learn(mc,task,settings,g);
    
    % update confidence
    [mc] = learn_phi(mc,settings,g);
    
end