clear all;clc;
%dominent  pole
tau = 0.625;
csi = 0.5;
d_p = -(1/tau) + (1/tau)*((1-csi^2)/(csi^2))^(1/2)*1i;
d_n = -(1/tau) - (1/tau)*((1-csi^2)/(csi^2))^(1/2)*1i;
%set pole by dominent
s = d_p;
z = 1;
Gp_tf =2/((s+2)*(s+4)*(s+8));
Gc_tf = (s+z)/s; 
k = 15;
Gp = zpk([],[-2 -4 -8],2); 
Gc = zpk([-3.6],[0],k);
%compute
G = series(Gc,Gp);
G_c1 = feedback(G,1);
G_c1_pole = pole(G_c1);
%steaay state step error
SP = 1;
[y,t]=step(SP*G_c1);
yi = y(end);
sserror=abs(SP-yi);
kp = dcgain(G);
sserror_theory = 1/(1+kp);
%steady ramp state error
t = 0:0.1:150;
alpha = 2;
ramp_input = alpha * t;
ramp_output = lsim(ramp_input,G_c1,t);
ramp_err = abs(ramp_output'-ramp_input);
kv = dcgain(G);
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
