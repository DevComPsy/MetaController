function [task] = determine_outcome(mc,task,g)
%Determination of the action outcome.

task.outcome(g) = task.pot_outcomes(task.choice(g),g);
end