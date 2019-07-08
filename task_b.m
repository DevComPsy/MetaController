function [outcome_b] = task_b(mc)
%Implementation of a more complex dimensions task. 

outcome_prob=[];
outcome=[];
stimuli_outcome[];
stimuli= [];%presented stimuli   
for i=1:length(5)
    
stimuli_backgr=(randi([1 2]));%random stimulus pair- star (1) vs circle (2); background for both stimuli - without (1) or with(2)
stimuli_sign=(randperm(2));

if stimuli_backgr==1 & stimuli_sign== [1,2];
r1=1; else r1=0;end
if stimuli_backgr==1 & stimuli_sign== [2,1];
r2=1; else r2=0; end 
if stimuli_backgr==2 & stimuli_sign== [1,2];
r3=1; else r3=0; end 
if stimuli_backgr==2 & stimuli_sign== [2,1];
r4=1; else r4=0; end 

stimuli_outcome=[r1 r2 r3 r4];%row - background (1) or no background (2); column is stimulus shape (e.g. 1= star; 2=circle)

if r2==1 | r1==1
 outcome_prob=[.4 .2];  else outcome_prob=[.6 .8]; 
end 

%% play one game

% if rand < metaCont_act(stimuli_outcome); %metacontroller determines the executed action given the presented stimuli
% 	r= rand(1)<=outcome_prob(1,1) a=1 ; else r= rand(1)<=outcome_prob(1,2) a=2; 
% end

chosen_stimulus= [a stimuli_sign(a)  stimuli_backgr];%position of the stimulus (1=left, 2=right), sign of the stimulus, context 

%outcome=

end

end 



