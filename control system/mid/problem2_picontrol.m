clear all;clc;
% for k = 1:100
%     x = k;
%     Gp = zpk([],[-2 -4 -8],2); 
%     Gc = zpk([],[0],k);
%     G = series(Gc,Gp);
%     G_c1 = feedback(G,1);
%     G_c1_pole = pole(G_c1);
%     %steaay state step error
%     SP = 1;
%     [y,t]=step(SP*G_c1);
%     t = 0:0.1:20;
%     yi = y(end);
%     sserror(x)=abs(SP-yi);
%     kp = dcgain(G);
%     sserror_theory(x) = 1/(1+kp);
%     data = stepinfo(G_c1);
%     time_constant(x) = (max(find(abs(y-yi)>=0.37*yi))+1)/10;
%     settling_time(x) = data.SettlingTime;
% end
tau = 0.5;
csi = 0.5;
d_p = -(1/tau) + (1/tau)*((1-csi^2)/(csi^2))^(1/2)*1i;
d_n = -(1/tau) - (1/tau)*((1-csi^2)/(csi^2))^(1/2)*1i;
for z = 1:100
    s = d_p;
    Gp_tf =2/((s+2)*(s+4)*(s+8));
    Gc_tf = (s+z)/s; 
    k_2(z,1) = -1/(Gp_tf*Gc_tf);
end
% settle_time_min = min(settling_time);
% %plot
% figure(1);
% plot(sserror,'-');
% hold on;
% plot(sserror_theory,'.')
% legend('sserror','sserror_theory')
% title('steady state error(step) from k 1 to 100')
% xlabel('k');
% ylabel('error');
% figure(2);
% plot(time_constant,'-');
% title('time cinstant')
% xlabel('k');
% ylabel('time constant');
% figure(3)
% plot(settling_time,'-');
% title('settling time')
% xlabel('k');
% ylabel('settling time');