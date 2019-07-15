# MetaController

Code for the paper "Towards a Computational Psychiatry of Juvenile Obsessive-Compulsive Disorder" Loosen & Hauser JAACAP (in rev).
This repository contains the MATLAB code used to simulate the meta-controller framework proposed in the paper. 


-  RUN_mc_a.m sets all parameters (e.g. learning rate, iterations) and runs through task_a, a low-complexity game (see below). 
-  RUN_mc_b.m sets all parameters (e.g. learning rate, iterations) and runs through task_b, a more complex decision-making task (see below). 

The following functions will be described in the order that they are called by RUN_mc. 

-  mc_initialize.m is a initialization code assigning values to all variables during run time that are system specific. 
-  task_initialize.m is a initialization code assigning values to all variables during run time that task specific. 
 
We hypothesized that all systems should be able to perform a simple motor task. However, a complex reasoning system should outperform simple reasoning systems (simple S-R system and model-free system) on a more complex task with more dimensions. To simulate the behaviour of all reasoning systems across complexities, we implemented two different tasks:

-  task_a.m implements a simple motor task with one action (e.g. left or right click) giving rewards. E.g. two stimuli are presented and their reward probability depends on their location (left or right). All systems should be able to master this task.

-  task_b.m implements a more complex decision-making task (e.g. each stimulus is associated with a different reward probability depending on  symbol, context and position). The complex system was expected to outperform the simpler systems on this task. 

During the run of each task: 

-  act.m determines the action chosen by the different systems. 

-  metaCont_act.m simulates the system selection of the meta-controller. Based on the highest meta-confidence the meta-controller chooses the system to determine the executed action.

-  learn.m simulates the prediction-error learning/updating of the two systems. 

-  learn_phi.m updates the system's meta-confidence in an actor critic manner. 
