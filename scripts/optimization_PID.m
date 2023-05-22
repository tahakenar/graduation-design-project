function cost = optimization_PID(k)
assignin('base','k',k);
sim("multidrug2022simulation.slx");
cost = total_tumor_ise(length(total_tumor_ise));
end