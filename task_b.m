function [mc, task] = task_b(mc, task)
%Implementation of a more complex dimensions task. 
  


task.stimuli_backgr=(randi([1 2]));
task.stimuli_sign=(randperm(2));

if task.stimuli_backgr==1 & task.stimuli_backgr== [1,2];
r1=1; else r1=0;end

if task.stimuli_backgr==1 & task.stimuli_backgr== [2,1];
r2=1; else r2=0; end 

if task.stimuli_backgr==2 & task.stimuli_backgr== [1,2];
r3=1; else r3=0; end 

if task.stimuli_backgr==2 & task.stimuli_backgr== [2,1];
r4=1; else r4=0; end 

mc.stimuli_outcome=[r1 r2 r3 r4];%row - no background (1) or background (2); column is stimulus shape (e.g. 1= star; 2=circle)

if r2==1 | r1==1
task.all_outcome_prob=[.4 .2], s1=1, s2=1;  else task.all_outcome_prob=[.6 .8], s1=0, s2=0; 
end 

if r3==1 | r4==1;
 s3=1, s4=1;  else   s3=0, s4=0; 
end 

%% play one game

%outcome 

task.shown_stimulus=  [1 task.stimuli_sign(1)  task.stimuli_backgr];%position of the stimulus (1=left, 2=right), sign of the stimulus, context 

end 
