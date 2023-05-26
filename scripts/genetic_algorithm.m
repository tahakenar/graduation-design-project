%GA TO TUNE PID PARAMETERS

no_var = 6;
lb = [0 0 0 0 0 0];
ub = [2 2 2 2 2 2];
k0 = [0.1 0.04 0 0.1 0.04 0];


ga_opt = gaoptimset('CrossoverFcn',{@crossoverheuristic},'MutationFcn',{@mutationadaptfeasible},'Display','iter','Generations',25,'PopulationSize',40,'PlotFcns',{@gaplotbestf,@gaplotmaxconstr});
obj_fn = @(k) optimization_PID(k);
ga_opt.InitialPopulation = k0;

%GA Command

[k,best] = gamultiobj(@(k) optimization_PID(k), no_var,[],[],[],[],lb,ub,[],ga_opt);
