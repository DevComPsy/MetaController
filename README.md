# MetaController

Code for paper "Self-evaluation of decision-making: A general Bayesian framework for metacognitive computation" Loosen & Hauser JAACAP (in rev)
This repository contains MATLAB code used to simulate the meta-controller framework proposed in the paper. 


RUN_mc.m sets all parameters (e.g. learning rate, iterations) and runs through two games of different complexities. 
The following functions will be described in the order that they are called by RUN_mc. 

task_a.m implements a simple motor task with one action (e.g. left or right click) giving rewards. 

task_b.m implements a more complex dimensions task (e.g. each stimulus is associated with a different reward probability depending on symbol, context and position). 

act.m determines the action chosen by the different systems. 

metaCont_act.m simulates the system selection of the meta-controller. Based on the highest meta-confidence the meta-controller chooses the system to determine the executed action.

learn.m simulates the prediction-error learning/updating of the different systems. 

learn_phi.m updates the system's meta-confidence. 
