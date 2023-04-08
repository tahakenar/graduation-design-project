clc;clear;clf

run('multidrug2022parameters.m');

%cell vectors
S1 = zeros(1,length(t)-1);  S1(1) = 7*10^5;

S2 = zeros(1,length(t)-1);  S2(1) = 10*10^4;

S3  = zeros(1,length(t)-1); S3(1) = 10*10^4;

N = zeros(1,length(t)-1);   N(1) = 10*10^5;

C1 = zeros(1,length(t)-1);

C2 = zeros(1,length(t)-1);

V = zeros(1,length(t)-1);

%%variables
u=0;    v=0;

for i=1:length(t)
    V(i) = S1(i) + S2(i) + S3(i); 
    S1(i+1) = S1(i) + getDeltaS1(r1,S1(i),V(i),k1,tau1,alpha1,C1(i),beta1,C2(i));
    S2(i+1) = S2(i) + getDeltaS2(r2,S2(i),V(i),k2,tau1,S1(i),alpha2,C2(i),tau23,tau32,S3(i),C1(i));
    S3(i+1) = S3(i) + getDeltaS3(r3,S3(i),V(i),k3,tau2,S1(i),alpha3,C1(i),tau32,tau23,C2(i),S2(i));
    N(i+1) = N(i) + getDeltaN(r4,N(i),k4,gamma,V(i),T_star,an,C1(i),bn,C2(i));
    C1(i+1) = C1(i) + getDeltaC1(u,lambda1,C1(i));
    C2(i+1) = C2(i) + getDeltaC2(v,lambda2,C2(i));
end

figure(1); hold on;
subplot(6,1,1);
plot(S1);
title('Container 1 (SEN/SEN)')
subplot(6,1,2);
plot(S2);
title('Container 2 (RES/SEN))')
subplot(6,1,3);
plot(S3);
title('Container 3 (SEN/RES)')
subplot(6,1,4);
plot(N);
title('Normal Cell Count')
subplot(6,1,5);

plot(C1);
title('Drug 1 Conc');
subplot(6,1,6);

plot(C2);
title('Drug 2 Conc');

%differential equation functions
function output = getDeltaS1(r1,S1,V,k1,tau1,alpha1,C1,b1,C2)
    output = r1*S1*(1-(V)/(k1))-tau1*S1 - alpha1*(1-exp(-C1))-b1*(1-exp(-C2))*S1
end

function output = getDeltaS2(r2,S2,V,k2,tau1,S1,alpha2,C2,tau23,tau32,S3,C1)
    output = r2*S2*(1-(V)/(k2))+tau1*S1-alpha2*(1-exp(-C2))*S2 -tau23*(1-exp(-C2))*S2+tau32*(1-exp(-C1)*S3);
end

function output = getDeltaS3(r3,S3,V,k3,tau2,S1,alpha3,C1,tau32,tau23,C2,S2)
    output = r3*S3*(1-V/k3)+tau2*S1-alpha3*(1-exp(-C1))*S3 - tau32*(1-exp(-C1))*S3 + tau23*(1-exp(-C2))*S2
end

function output = getDeltaN(r4,N,k4,gamma,V,T_star,an,C1,bn,C2)
    output = r4*N*(1-N/k4)+gamma*V*(1-V/T_star)-an*(1-exp(-C1))*N-bn*(1-exp(-C2))*N;
end

function output = getDeltaC1(u,lambda1,C1)
    output = u- lambda1*C1;
end

function output = getDeltaC2(v,lambda2,C2)
    output = v-lambda2*C2;
end
