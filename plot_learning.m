function plot_learning(mc,task,settings)

%% set up
close all
cols = [1.0, 0.4, 0.4; 0.0, 0.0, 0.4; 1 0 0; 0 1 0; 0 0 1];


%% evolution of meta-confidence
figure('Color','w');
set(gcf,'Unit','normalized','OuterPosition',[.5 .1 .5 .4]);
set(gca,'FontName','Arial','FontSize',10)
hold on
title('meta-confidence')
% plot confidence
for s = 1:settings.nsystems
    h(s) = plot(1-mc.phi(s,:),'color',cols(s,:),'LineWidth',2);
end

% plot chosen system
for s = 1:settings.nsystems
    plot(find(task.chosen_system==s), ones(numel(find(task.chosen_system==s)),1),'.','color',cols(s,:));
end
legend(h,settings.sys_labels)

xlabel('trial t')
ylabel('meta-confidence (1-phi)')
xlim([0 settings.niter])

%% evolution of Q values for each system
for s = 1:settings.nsystems
    figure('Color','w');
    set(gcf,'Unit','normalize','OuterPosition',[-.2+s/5 .9-s/5 .3 .3]);
    set(gca,'FontName','Arial','FontSize',10)
    hold on
    title(settings.sys_labels{s})
    
    sz = size(mc.Q{s});
    nstates = prod(sz(1:end-1));
    Q = reshape(mc.Q{s}(:),nstates,settings.niter+1);
    plot(Q')
    xlabel('trial t')
    ylabel('Q(s)')
    xlim([0 settings.niter])
end

%% performance of each system and total system
figure('Color','w');
set(gcf,'Unit','normalized','OuterPosition',[.1 .1 .4 .4]);
set(gca,'FontName','Arial','FontSize',10)
rew = [];
for s = 1:settings.nsystems
    rew(s) = (sum(task.pot_outcomes(1,find(mc.act{s}==1))) + sum(task.pot_outcomes(2,find(mc.act{s}==2))));
end
rew(3) = sum(task.outcome);
bar(rew,'k')
% ylim([min(rew)-std(task.outcome) max(rew)+std(task.outcome)])
ylim([min(rew)-30 max(rew)+30])
ylabel('total reward')
set(gca,'XTickLabels',{settings.sys_labels{:},'metacontroller'})
title('performance')
