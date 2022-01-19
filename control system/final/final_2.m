clear all;clc;
%compute
k = 10^(-18/20);
theta_m = 60;
% x is the propotion of wz and wp 
x =(1-sind(theta_m))/(1+sind(theta_m));
Gp_m = 20*log(sqrt(0.0718));

syms wz wp; 
[wz,wp] = solve((wp/wz) - 0.0718 ,  -3.56 + (wz*wp)^(1/2));

wz_2 = 0.275;
wp_2 = wz_2*10^(-7.61/20);
%set pole by dominent ;
Gp = tf([2 1],[1 0.1 5 0]);
Gc = zpk([-0.95],[-13.3],14);
Gc_pole = pole(Gc);
G = series(Gp,Gc);
Gp_pole = pole(Gp);
Gp_cl = feedback(Gp,1);
G_cl = feedback(G,1);
Gc_2 = zpk([-0.28],[-0.11],0.416);
G_2 = series(G,Gc_2);
Gp_cl_pole = pole(Gp_cl);
G_cl_2 = feedback(G_2,1);
G_cl_2_pole = pole(G_cl_2);
%data
data = stepinfo(G_cl_2);
[mag,phase,w]=bode(G_cl_2,{0.1,10}); 
magdb=20*log10(mag(:)); 
%steaay state step error
SP = 1;
[y,t]=step(SP*G_cl_2);
t = 0:0.1:20;
yi = y(end);
sserror=abs(SP-yi);
kp = dcgain(G_2);
sserror_theory = 1/(kp+1);
%plot
%nypuis plot
figure(1);
nyquist(G_2);
axis([-6 6 -4 4])

figure(2);
nyquist(G_2);
xlim([-inf inf])
ylim([-inf inf])

figure(3);
margin(Gp);

figure(4);
margin(G);

figure(5);
margin(G_2);

figure(6);
step(G_cl_2);

figure(7);
semilogx(w,magdb) 
axis([0.1 2 -10 10]); 
xlabel("frequency (rad/sec)") 
ylabel("magnitude (db)") 
grid on;

figure(8)
rlocus(G_cl_2);
