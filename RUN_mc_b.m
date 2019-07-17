clear all; close all; clc
     

%% parameter settings
settings = [];
settings.alpha = .3;
settings.complexity_cost = 0;
settings.niter = 1000;
settings.invtemp= 1;
settings.nsystems=2;
settings.sys_labels = {'simple motor','complex'};


%% initialize
[mc] = mc_initialize(settings.nsystems);
[task] = task_initialize();

%% loop through game B
for g = 1:settings.niter
%     disp(g)
    
    % function simulating task a
    [mc, task] = task_b(mc,task,g);
    
    % action selection each system
    [mc, task] = act(mc, task,settings,g);
    
    % action selection meta-controller
    [idx, mc, task] = metaCont_act(mc, task, g);
    
    % determine outcome
    [task] = determine_outcome(mc,task,g);
    
    % PE learning
    [mc] = learn(mc,task,settings,g);
    
    % update confidence
    [mc] = learn_phi(mc,settings,g);
    
end
%% plot simulations
plot_learning(mc,task,settings)
