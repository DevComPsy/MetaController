function [mc] = learn(mc,task,settings,g)

    
%% calc PEs for each system

for i = 1:settings.nsystems
    
    % get chosen Q value of system
    q_val_chosen = [];
    if mc.dims(i) == 1
        q_val_chosen = mc.Q{i}(task.chosenstimulus(1,g),end);
    elseif mc.dims(i) == 2
        q_val_chosen = mc.Q{i}(task.chosenstimulus(1,g),task.chosenstimulus(2,g),end);
    elseif mc.dims(i) == 3
        q_val_chosen = mc.Q{i}(task.chosenstimulus(1,g),task.chosenstimulus(2,g),task.chosenstimulus(3,g),end);
    else
        error('undefined model')
    end    
    
    % compute PE
    mc.pe{i}(g) = task.outcome(g) - q_val_chosen;
    
    % update  Q value for chosen state
    if mc.dims(i) == 1
        mc.Q{i}(:,end+1) = mc.Q{i}(:,end);
        mc.Q{i}(task.chosenstimulus(1,g),end) =  mc.Q{i}(task.chosenstimulus(1,g),end) + settings.alpha * mc.pe{i}(g);
    elseif mc.dims(i) == 2
        mc.Q{i}(:,:,end+1) = mc.Q{i}(:,:,end);
        mc.Q{i}(task.chosenstimulus(1,g), task.chosenstimulus(2,g),end) =  mc.Q{i}(task.chosenstimulus(1,g), task.chosenstimulus(2,g),end) + settings.alpha * mc.pe{i}(g);
    elseif mc.dims(i) == 3
        mc.Q{i}(:,:,:,end+1) = mc.Q{i}(:,:,:,end);
        mc.Q{i}(task.chosenstimulus(1,g), task.chosenstimulus(2,g),task.chosenstimulus(3,g), end) =  mc.Q{i}(task.chosenstimulus(1,g), task.chosenstimulus(2,g), task.chosenstimulus(3,g), end) + settings.alpha * mc.pe{i}(g);
    else
        error('undefined model')
    end 
    
    

%     %simple system
% if task.choice==1; 
% mc.pe{1} =  task.outcome - mc.Qs{1}(1);
% else   mc.pe{1,1} =  task.outcome - mc.Qs{1}(2); end
% 
%     %complex system
% 
%  Qtemp=mc.Qc{1}(task.chosenstimulus(1),task.chosenstimulus(2),task.chosenstimulus(3));
%     
%     Qtemp(isnan(Qtemp))=0;
% mc.pe{2,2} =  task.outcome - Qtemp; 
%      
% %% update 
% 
%    %simple system
% if task.choice==1
% mc.Qs{1}(1,1)   = mc.Qs{1, 1}(1,1)+ alpha*mc.pe{1,1};
% else
% mc.Qs{1}(2,1)   = mc.Qs{1, 1}(2,1) + alpha*mc.pe{1,1};
% end
%  
%    %complex system
% 
%  mc.Qc{1}(task.chosenstimulus(1),task.chosenstimulus(2),task.chosenstimulus(3))=  mc.Qc{1}(task.chosenstimulus(1),task.chosenstimulus(2),task.chosenstimulus(3)) + alpha * mc.pe{2,2}; 

end
