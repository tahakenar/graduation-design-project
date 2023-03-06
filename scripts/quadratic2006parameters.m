%%parameters
a = 4.31*10^-3; %growth rate
b = 1.02*10^-14; %1/b is tumor carrying capacity
c = 3.41*10^-10; %fractional tumor cell kill by effector cells
f = 4.12*10^-2; %death rate of effector cells
g = 1.5*10^-2; %max effector cell recruitment
h = 20.2; %steepnes coff of effector cell recruitment curve
kc = 0.6; %fractional effector cell killed by kemo
kn = 0.6; %lemfosit killed by kemo
kt = 0.8; %fractional tumor cell killed by chemo
p = 2*10^-11; %effector cell inactivation rate by tumor cells
alpha1 = 1.2*10^4; %constant source of effector cells
alpha2 = 7.5*10^8; %constant source of circulating lemfosit
beta = 1.2*10^-2; %death rate of circulating lemfosit
gamma = 0.9; %rate of chemotherapy decay
t = 0:1:100; %days array
Vm = 0; %treatment (no treatment for now)