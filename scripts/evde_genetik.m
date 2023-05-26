%GA TO TUNE PID PARAMETERS

no_var = 7;
lb = [0 0 0 0 0 0 0.4];
ub = [2 2 2 2 2 2 1.5];
k0 = [1.9319    0.1367    1.9585    0.1084    0.5046    1.1662 1.6784];


ga_opt = gaoptimset('CrossoverFcn',{@crossoverscattered},'MutationFcn',{@mutationadaptfeasible},'Display','iter','Generations',5,'PopulationSize',10,'PlotFcns',{@gaplotpareto,@gaplotscores});
obj_fn = @(kev) evde_optimizasyon(kev);
ga_opt.InitialPopulation = k0;

%GA Command

[kev,best] = gamultiobj(@(kev) evde_optimizasyon(kev), no_var,[],[],[],[],lb,ub,[],ga_opt);
