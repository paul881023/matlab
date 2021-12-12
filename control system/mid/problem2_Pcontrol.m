for k = 1:100
    x = k;
    Gp = zpk([],[-2 -4 -8],2); 
    Gc = zpk([],[],k);
    G = series(Gc,Gp);
    G_c1 = feedback(G,1);
    G_c1_pole = pole(G_c1);
    %steaay state step error
    t = 0:0.1:20;
    SP = 1;
    [y,t]=step(SP*G_c1);
    yi = y(end);
    sserror(x)=abs(SP-yi);
    kp = dcgain(G);
    sserror_theory(x) = 1/(1+kp);
    data = stepinfo(G_c1);
    time_constant(x) = (max(find(abs(y-yi)>=0.37*yi))+1)/10;
    settling_time(x) = data.SettlingTime;
end
%plot
figure(1);
plot(sserror,'-');
hold on;
plot(sserror_theory,'.')
legend('sserror','sserror_theory')
title('steady state error(step) from k 1 to 100')
xlabel('k');
ylabel('error');
figure(2);
plot(time_constant,'-');
title('time cinstant')
xlabel('k');
ylabel('time constant');
figure(3)
plot(settling_time,'-');
title('settling time')
xlabel('k');
ylabel('settling time');
%