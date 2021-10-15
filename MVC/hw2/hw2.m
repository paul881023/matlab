%This is the first hw2 for MVC
%Simulation for input time-delay sampled-data system
%editor: Wang Bo An

%clc;clear all;close all;

%set u function input
%load('input_u.mat')

u = [0:0.18:5.4;normrnd(0,1,[1 31])]';
A = [0 1;-3 -2]; B = [0;1]; C = [1 1];Ts = 0.18; D = 0;
G = expm(A*Ts);G2 = expm(A*0.06);

sys = ss(A,B,C,D,'InputDelay',0.12);
timespan = 0:0.18:5.4;
timespan2 = 0:0.06:5.4;
tau0 = (G^(1/3)-eye(2))/A*B;
tau01 = (G2^(-1)-eye(2))/A*B;
tau1 = (G-G^(1/3))/A*B;
tau11 = (G2-G2^(-1))/A*B;

options2 = simset('solver','ode45','AbsTol',1e-11,'RelTol',1e-11);
sim('Hw2_sim.slx',0:0.0001:5.4,options2);

options = odeset('AbsTol',1e-11,'Reltol',1e-11);
func = @(t,x)[x(2);(-3)*x(1)-2*x(2)+ input_u(u,t-0.12)];
[t,x] = ode45(func,0:0.06:5.4,[0 0],options);
yd_Tf = x(:,1)+x(:,2);

sys = ss(A,B,C,D,'InputDelay',0.12);
yd_4_Tf = lsim(sys,out.ud,0:0.06:5.4);

for i=1:length(timespan)
    yd(i) = yd_Tf(1+3*(i-1));
    yd_4(i) = yd_4_Tf(1+3*(i-1));
end