clear all;
k = 4;
Cs = zpk([],[1],k);
Gp = zpk([],[-2],1);
CsGp = series(Cs,Gp);
sys_continuous = feedback(CsGp,1);
pole_continuous = pole(sys_continuous);
tf = 4;
t = 0:0.01:tf;
input = exp(t);
output = lsim(sys_continuous,input,t);

plot(t,output,'r');
hold on
plot(t,input,'b');
xlabel('Time (sec)');ylabel('data');