%GA TO TUNE PID PARAMETERS

no_var = 3;
lb = [-1 -1 -1];
ub = [1 1 1];

ga_opt = gaoptimset('Display','off','Generations',5,'PopulationSize',10,'PlotFcns',@gaplotbestf);
obj_fn = @(k) optimization_PID(k);

%GA Command

[k,best] = ga(@(k) optimization_PID(k), no_var,[],[],[],[],lb,ub,[],ga_opt);
