clear all;clc;
Gs = zpk([],[0 1],1);
figure(1);
nyquist(Gs);
axis([-4 4 -5000 5000]);
Gc_s = feedback(Gs,1);
figure(2);
rlocus(Gc_s);