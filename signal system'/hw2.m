% Matlab code f o r Gibbs phenomenon
clear all;
N = 11;% configurable parameters
t_d = 0.001;
t = -3:t_d:3;
y = zeros (1 , length(t));% rectangular signal
y((-2.5+3)/ t_d +1:(-1.5+3)/ t_d ) = ones ( 1,1 /t_d ) ;
y((-0.5+3)/ t_d +1:(0.5+3)/ t_d ) = ones ( 1,1 /t_d ) ;
y ((1.5+3)/ t_d +1:(2.5+3)/ t_d ) = ones ( 1,1 /t_d ) ;
omega_0 = pi ;% The fundamental period i s 2 .
a_0 = 0.5; % Fourier series coefficients ( k=0)
x_N = a_0*ones ( 1 , length ( t )); % a 0 i s a constant .
for k = 1:N
a_k = (sin(k*pi/2))/(k*pi);
a_minus_k=a_k ; % a {−k} = a k
x_N = x_N + a_k * exp(1i*k*pi*t)+ a_minus_k * exp(-1i*k*pi*t);
end
plot ( t,y,'r' ) ;
hold on ;
plot ( t , x_N , 'b' ) ;
grid ;
legend (  'Rectangular signal' ,' x N( t )' ) ;
xlabel ( 't' ) ;
ylabel ('x N( t )' ) ;
axis ( [ -3 3 -0.5 1.5 ] ) ;