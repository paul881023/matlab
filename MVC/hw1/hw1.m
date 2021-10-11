global a;
global b;
global c;

%set parameters
a = 35;b = 3;c = 28;
f0 = [-10,0,37];
%10 sec
t0_10s = 0:0.005:10;
[t,x_10s_ode] = ode45(@lorenz,t0_10s,f0);
%60 sec
t0_60s = 0:0.005:60;
[t,x_60s_ode] = ode45(@lorenz,t0_60s,f0);

figure(1);
tiledlayout(2,2);

%Plot a fiqure by simlulink
nexttile
%60s 3D plot
plot3(out.x3_sim_60s,out.x1_sim_60s,out.x2_sim_60s);
title('sim60s')
box on
ax = gca;
ax.ZGrid = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
%10s time series
nexttile
plot(out.x1_sim_10s)
hold on;
plot(out.x2_sim_10s)
hold on;
plot(out.x3_sim_10s)
hold off;
xlim([0,2001])
title('sim10s')
legend({'out.x1sim10s','out.x2sim10s','out.x3sim10s'},'Location','southeast')

%Plot a fiqure by ode45
nexttile
%60s 3D plot
plot3(x_60s_ode(:,3),x_60s_ode(:,1),x_60s_ode(:,2));
title('ode60s')
box on
ax = gca;
ax.ZGrid = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
%10s time series
nexttile
plot(x_10s_ode(:,1))
hold on;
plot(x_10s_ode(:,2))
hold on;
plot(x_10s_ode(:,3))
hold off;
title('ode10s')
xlim([0,2001])
legend({'out.x1ode10s','out.x2ode10s','out.x3ode10s'},'Location','southeast')

figure(2);
tiledlayout(2,3);

% compare x_1(t)
nexttile
plot(out.x1_sim_10s)
title('x1sin')
xlim([0,2001])
nexttile
plot(x_10s_ode(:,1))
title('x1ode')
xlim([0,2001])

% compare x_2(t)
nexttile
plot(out.x2_sim_10s)
title('x2sin')
xlim([0,2001])
nexttile
plot(x_10s_ode(:,2))
title('x2ode')
xlim([0,2001])

% compare x_3(t)
nexttile
plot(out.x3_sim_10s)
title('x3sin')
xlim([0,2001])
nexttile
plot(x_10s_ode(:,3))
title('x3ode')
xlim([0,2001])

figure(3)
tiledlayout(2,3)

x1_sim = out.x1_sim_10s(1:2001,1);
x2_sim = out.x2_sim_10s(1:2001,1);
x3_sim = out.x3_sim_10s(1:2001,1);

%compare absolute error

x1_abs_error = x1_sim - x_10s_ode(:,1);
x2_abs_error = x2_sim - x_10s_ode(:,1);
x3_abs_error = x3_sim - x_10s_ode(:,1);

%compare relative error
for i = 1 :2001
    x1_sim_error = x1_sim(i,1);
    x2_sim_error = x2_sim(i,1);
    x3_sim_error = x3_sim(i,1);
    
    x1_ode_error = x_10s_ode(i,1);
    x2_ode_error = x_10s_ode(i,2);
    x3_ode_error = x_10s_ode(i,3);
    
    x1_rel_error = (x1_ode_error - x1_sim_error) / x1_ode_error;
    x2_rel_error = (x2_ode_error - x2_sim_error) / x2_ode_error;
    x3_rel_error = (x3_ode_error - x3_sim_error) / x3_ode_error;
    
    x1_rel(i,1) = x1_rel_error;
    x2_rel(i,1) = x2_rel_error;
    x3_rel(i,1) = x3_rel_error;

end
%plot
nexttile
plot(x1_abs_error);
title('x1abs')

nexttile
plot(x2_abs_error);
title('x2abs')

nexttile
plot(x3_abs_error);
title('x3abs')

nexttile
plot(x1_rel);
title('x1rel')

nexttile
plot(x2_rel);
title('x2rel')

nexttile
plot(x3_rel);
title('x3rel')

clear  x1_rel_error x2_rel_error x3_rel_error;
%%  disscution 
% 比較ode45以及simulink的情況下，ode45使用的是Runge Kutta 4 order & 5 order，是variable step solver，這樣的計算方式，可以省略不必要的step size
% 不僅增加準確度，也可以增加執行速度，而simulink則是fixed step solver，執行較沒有效率，也比較不準確。

