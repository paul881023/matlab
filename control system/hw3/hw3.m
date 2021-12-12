clear all;
k = 21.25;
Cs = zpk([-6 -2],[0],k);
Gp = zpk([],[-1],1);
G = series(Cs,Gp);
G_c1 = feedback(G,1)
t = 0:0.1:5;
alpha = 2;
input = alpha * t;
output = lsim(input,G_c1,t);
figure(1);
rlocus(G);
figure(2);
step(G_c1,10);
figure(3);
plot(output,'r');
hold on;
plot(input,'b');

