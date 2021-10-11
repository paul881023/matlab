function dy = lorenz(t,x)
% Set ode function
global a;
global b;
global c;
dy = [a*(x(2)-x(1));(c-a)*x(1)-x(1)*x(3)+c*x(2);x(1)*x(2)-b*x(3)];
end