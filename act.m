function [mc,a] = act(mc)
 
 % Input needed: 
 
 invtemp= 1;
 
%% action selection simplest system 
 [M,I] = max(mc.V_s);
 a(:,3)=I;
 
 
%% action selection mf system 
% compute policy based on q values
% state_value_b = (mc.Qmf | mc.shown_stimulus);  

state_value_b = mc.Qmf(find(shown_stimulus==1));

qs = state_value_b  - max(state_value_b);
exqs = exp(invtemp*qs);
mc.pi_b(:) = exqs/sum(exqs);


%% action selection mb system 

 

%     
%     qs = mc.V_b(:) - max(mc.V_b(:));
%     exqs = exp(invtemp*qs);
%     mc.pi(:) = exqs/sum(exqs);
%     
%     qs = mc.V_c(:) - max(mc.V_c(:));
%     exqs = exp(invtemp*qs);
%     mc.pi(:) = exqs/sum(exqs);
%     
% % select action dependent on stimuli outcome and based on policy
%     rdn = rand(1);
%     a = find([0; cumsum(mc.pi(:))]<rdn,1,'last');

    
end
