function [task] = determine_outcome(mc,task,g)

task.outcome(g) = task.pot_outcomes(task.choice(g),g);
end