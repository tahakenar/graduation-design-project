clc;clear;clf;

run('quadratic2006parameters.m');


%%cell vectors
T = zeros(1,length(t)-1); %Tumor cell count
N = zeros(1,length(t)-1); %effector immune cell
C = zeros(1,length(t)-1); %lemfosit count
M = zeros(1,length(t)-1); %drug concentration


%%initial vector values
T(1) = 10^7;
N(1) = 3*10^5;
C(1) = 6.25*10^10;


for i = 1:99
    T(i+1) = T(i) + getDeltaT(T(i),a,b,c,N(i),kt,M(i));
    N(i+1) = N(i) + getDeltaN(alpha1,f,N(i),g,T(i),h,p,kn,M(i));
    C(i+1) = C(i) + getDeltaC(alpha2,beta,C(i),kc,M(i));
    M(i+1) = M(i) + getDeltaM(gamma,M(i),Vm)
end

figure(1); hold on;
subplot(4,1,1);
plot(T);
title('Tumor Count')
subplot(4,1,2);
plot(N);
title('Effector Immune Cell Count')
subplot(4,1,3);
plot(C);
title('Lemfosit Count')
subplot(4,1,4);
plot(M);
title('Drug Concentration')

%system differentatial equations functions
function output = getDeltaT(T, a, b, c, N, kt, M)
    output = a*T*(1-b*T)-c*N*T - kt*M*T;
end

function output = getDeltaN(alpha1,f,N,g,T,h,p,kn,M)
    output = alpha1-f*N+g*(T)/(h+T)*N - p*N*T - kn*M*N;
end

function output = getDeltaC(alpha2,beta,C,kc,M)
    output = alpha2 - beta*C - kc*M*C;
end

function output = getDeltaM(gamma,M, Vm)
    output = -gamma*M + Vm;
end
