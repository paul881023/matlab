%This is the 2 hw for control system
%design a system
%editor: Wang Bo An

clear all;
k = 3;
Cs = zpk([],[-1-0.3*sqrt(1-(1/0.3)^2)*i,-1+0.1*sqrt(1-(1/0.3)^2)*i],k);
Gp = zpk([],[-2],1);
CsGp = series(Cs,Gp);
sys_continuous = feedback(CsGp,1);
pole_continuous = pole(sys_continuous);
tf =  :0.01:tf;
input = exp(t);
output = lsim(sys_continuous,input,t);
plot(t,output,'r');
hold on
plot(t,input,'b');