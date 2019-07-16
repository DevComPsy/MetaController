function plot(mc, settings)

c= struct('s', [1.0, 0.4, 0.4], ... 
    'c', [0.0, 0.0, 0.4]);

%% plotting phi/meta-confidence in each system.
plot((1:settings.niter+1),mc.phi(1,:),'Color',c.s)
hold on
plot((1:settings.niter+1),mc.phi(2,:),'Color',c.c)
box off
legend('Simple System','Complex System');
title('Development of meta-confidence of each system over iterations', 'fontsize', 18,'fontname','Times');
xlabel('Iterations','fontsize', 14,'fontname','Times');
xlim([1 settings.niter+1]);
ylabel('Phi','fontsize', 14, 'fontname','Times')

%% plotting the Q-values of each system for left and right stimulus.

%average the Q-values for right and left across contexts for the complex
%system
qnew=[]

for n =1: settings.niter+1
   qnew(1,n)  =mean(mc.Q{1,2}(:,1,2,n)+ mc.Q{1,2}(:,1,1,n))
   qnew(2,n)  =mean(mc.Q{1,2}(:,2,2,n)+ mc.Q{1,2}(:,2,1,n))
end
%plot simple system
plot((1:settings.niter+1), mc.Q{1,1}(1,:),'--','Color',c.s)
hold on 
plot((1:settings.niter+1), mc.Q{1,1}(2,:),'Color',c.s)

%plot complex system
hold on
plot((1:settings.niter+1),qnew(1,:),'--','Color',c.c)
hold on
plot((1:settings.niter+1),qnew(2,:),'Color',c.c);   
box off
legend('Simple System Left','Simple System Right','Complex System Left','Complex System Right');
title('Development of Q-values over iterations', 'fontsize', 18,'fontname','Times');
xlabel('Iterations','fontsize', 14,'fontname','Times');
xlim([1 settings.niter+1]);
ylabel('Q-value','fontsize', 14, 'fontname','Times')
end 