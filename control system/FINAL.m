clear all;clc;
%set pole by dominent 
k = 15;
Gp = zpk([],[-2 -4 -8],2); 
Gc = zpk([-1.8],[0],k);
%compute
G = series(Gc,Gp);
G_cl = feedback(G,1);
[mag,phase,w]=bode(G_cl,{0.1,2}); 
magdb=20*log10(mag(:)); 
figure(1);
semilogx(w,magdb) 
axis([0.1 2 -10 10]); 
xlabel("frequency (rad/sec)") 
ylabel("magnitude (db)") 
%plot
%bode plot
figure(2);
margin(G);
grid on;
%step plot
figure(3);
step(G_cl);
%nypuis plot
figure(4);
nyquist(G);


