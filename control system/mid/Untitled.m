clear all;
%dominent  pole
tau = 1;
csi = 0.707;
d_p = -(1/tau) + (1/tau)*((1-csi^2)/(csi^2))^(1/2)*1i;
d_n = -(1/tau) - (1/tau)*((1-csi^2)/(csi^2))^(1/2)*1i;
%set parameter by dominent
s = d_p;
z1 = 1;
z2 = 2;
k = 2;
Gp = zpk([],[0 -2],1); 
Gc = zpk([-1 -2],[0],k);
%compute
G = series(Gc,Gp);
G_c1 = feedback(G,1);
G_c1_pole = pole(G_c1);
%steaay state step error
SP = 1;
[y,t]=step(SP*G_c1);
t = 0:0.1:20;
yi = y(end);
sserror=abs(SP-yi);
kp = dcgain(G);
sserror_theory = 1/(kp+1);
%steady ramp state error
alpha = 2;
ramp_input = alpha * t;
ramp_output = lsim(ramp_input,G_c1,t);
ramp_err = ramp_output'-ramp_input;
kv = dcgain(s*G);
ramp_err_theory = 1/(kv);
%system check
[w,zeta,p] = damp(G_c1);
time_constant = (max(find(abs(y-yi)>=0.37*yi))+1)/10;
%plot
data = stepinfo(G_c1);
figure(1);
rlocus(G_c1);
figure(2);
step(G_c1);
figure(3);
plot(ramp_output,'.');
hold on;
plot(ramp_input);
legend('ramp output','ramp input');
hold off;
