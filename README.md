# MetaController

Code for the paper "Towards a Computational Psychiatry of Juvenile Obsessive-Compulsive Disorder" Loosen & Hauser JAACAP (in rev).
This repository contains the MATLAB code used to simulate the meta-controller framework proposed in the paper. 


-  RUN_mc_a.m sets all free parameters and runs through task_a, a low-complexity game (see description below). 
-  RUN_mc_b.m sets all free parameters and runs through task_b, a more complex decision-making task (see description below). 

The following functions will be described in the order that they are called by RUN_mc_a.m and RUN_mc_b.m. 

-  mc_initialize.m is a initialization code assigning values to all variables during run time that are system specific. 
-  task_initialize.m is a initialization code assigning values to all variables during run time that task specific. 

-  task_a.m implements a simple motor task with one action (e.g. left or right click) giving rewards. E.g. two stimuli are presented and their reward probability depends on their location (left or right). All systems should be able to master this task.
-  task_b.m implements a more complex decision-making task (e.g. each stimulus is associated with a different reward probability depending on  symbol, context and position). The complex system was expected to outperform the simpler systems on this task. 

-  act.m determines the actions chosen by the different systems. 
-  metaCont_act.m simulates the system selection of the meta-controller. Based on the highest meta-confidence/phi the meta-controller chooses the system determining the executed action.
-  determine_outcome.m determines the outcome (e.g. reward(1) versus no reward (0))following the action of the chosen system.
-  learn.m simulates the Q-learning of each system.
-  learn_phi.m updates the system's meta-confidence/phi after each executed action and encountered outcome.

-  plot_learning.m plots the Q-value of each system associated with the right and the left stimulus as well as the the meta-confidence/1-phi of each system over all trials.

# POTENTIAL PATHOMECHANISMS as described in the paper.

1. One potential pathomechanism could be that the meta-controller inherently asigns a cost to the complex system that is too high. 
Simulation: Increase the free parameter "settings.complexity_cost" in RUN_mc_b.m to see the effect. 

2. Alternatively, the complex system itself could be impaired. The complex system might not take the third (context) dimension into account. 
Simulation: Uncomment line 12-14 and comment line 16-21 for the complex system not to take the third dimension into account. 