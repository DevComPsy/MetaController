function [mc] = learn(mc,task, nactions,alpha,nstates, idxn, niter)

    
%% calc PEs

    %simple system
if task.choice==1; 
mc.pe{1} =  task.outcome - mc.Qs{1}(1);
else   mc.pe{1,1} =  task.outcome - mc.Qs{1}(2); end

    %complex system

 Qtemp=mc.Qc{1}(task.chosenstimulus(1),task.chosenstimulus(2),task.chosenstimulus(3));
    
    Qtemp(isnan(Qtemp))=0;
mc.pe{2,2} =  task.outcome - Qtemp; 
     
%% update 

   %simple system
if task.choice==1
mc.Qs{1}(1,1)   = mc.Qs{1, 1}(1,1)+ alpha*mc.pe{1,1};
else
mc.Qs{1}(2,1)   = mc.Qs{1, 1}(2,1) + alpha*mc.pe{1,1};
end
 
   %complex system

 mc.Qc{1}(task.chosenstimulus(1),task.chosenstimulus(2),task.chosenstimulus(3))=  mc.Qc{1}(task.chosenstimulus(1),task.chosenstimulus(2),task.chosenstimulus(3)) + alpha * mc.pe{2,2}; 

end
