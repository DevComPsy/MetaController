function [mc, task] = act(mc, task,settings, g)
 %Action determination of each system based on Q-values associated with the
 %dispalyed stimulus. 
 
 % Input needed: 
 invtemp=settings.invtemp;

 for i = 1:settings.nsystems
     
%% get Q values for given stimuli
     Q = [];
     
     for q = 1:2 %2 stimuli
         if mc.dims(i) == 1
             Q(q) = mc.Q{i}(task.shown_stimulus(q,1,g),end);
         elseif mc.dims(i) == 2
             Q(q) = mc.Q{i}(task.shown_stimulus(q,1,g),task.shown_stimulus(q,2,g),end);
         elseif mc.dims(i) == 3
             Q(q) = mc.Q{i}(task.shown_stimulus(q,1,g),task.shown_stimulus(q,2,g),task.shown_stimulus(q,3,g),end);
         else
             error('undefined model')
         end
     end
     
     
%% action selection of system
     Q = Q - max(Q);
     exqs = exp(invtemp*Q);
     if rand < exqs/sum(exqs)  %choice is made using a softmax                      
         mc.act{i}(g) = 1;
     else
         mc.act{i}(g) = 2;
     end

 end
end
