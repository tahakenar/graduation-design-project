function cost = optimization_PID(kev)
%multi objective function
assignin('base','kev',kev);
sim("multidrug2022simulation.slx");
cost(1) = (total_tumor_pop(end)*4);
cost(2) = -(normal_cell_pop(end)*2);
ripple_min = min(normal_cell_pop(1100:1501));
ripple_max = max(normal_cell_pop(1100:1501));
cost(3) = ripple_max - ripple_min;
end