function cost = optimization_PID(k)
%multi objective function
assignin('base','k',k);
sim("multidrug2022simulation.slx");
cost(1) = (total_tumor_pop(end));
cost(2) = -(normal_cell_pop(end));
end