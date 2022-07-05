%% Lista de atividades 02
clc
clear all
%(2.a-b)Encontre o per?odo T0 de cada um dos sinais
T0_t=((5*pi/2)-(pi/2));%Funcao triangular
T0_q=((5*pi)-(pi));%Funcao quadrada

%(2.c)Defina o intervalo dos dados baseado no per?odo
it_t=2.5*T0_t;%Funcao triangular
it_q=2.5*T0_q;%Funcao quadrada

%(2.d)Defina o numero de pontos desejados para o intervalo dos dados N
Np_t=1000;%Funcao triangular
Np_q=1000;%Funcao quadrada

%(2.e)Defina o valor equivalente a dt
dt_t=T0_t/(Np_t-1);%Funcao triangular
dt_q=T0_q/(Np_q-1);%Funcao quadrada

%(2.f)Defina o vetor t baseando-se no intervalo de dados e no valor de dt
t_t=-3*pi:dt_t:3*pi;%Funcao triangular
t_q=-6*pi:dt_q:6*pi;%Funcao quadrada

%% Encontrando a funcao f(t)

triag = triangular(t_t);
figure(1)
plot(t_t, triag,'b','LineWidth',2)
title('Função triangular (chapéu)')
xlabel('t')
ylabel('f(t)')
axis([-2.5*pi 2.5*pi 0 15*pi])
grid on;

quad = quadrado(t_q);
figure(2)
plot(t_q,quad,'g','LineWidth',2)
title('Onda quadrada')
xlabel('t');
ylabel('f(t)');
axis([-5.5*pi 5.5*pi 0 35])
grid on;

%% Série de Fourier - Onda Quadrada
syms n t
t=-2.5*pi:dt_q:2.5*pi;
n_max1=1;
n_max4=4;
n_max15=15;
n_max40=40;
a0_q = 15;
an_q = ((30)/(4*(pi^2)*(1/T0_q)*n))*((sin(2*(pi^2)*(1/T0_q)*n))+(sin(8*(pi^2)*(1/T0_q)*n))-(sin(6*(pi^2)*(1/T0_q)*n)));
bn_q = ((-30)/(4*(pi^2)*(1/T0_q)*n))*((cos(2*(pi^2)*(1/T0_q)*n))-(1)+(cos(8*(pi^2)*(1/T0_q)*n))-(cos(6*(pi^2)*(1/T0_q)*n)));
func1q = a0_q + symsum(an_q*cos(2*pi*(1/T0_q)*(t)*n),n,1,n_max1) + symsum(bn_q*sin(2*pi*(1/T0_q)*(t)*n),n,1,n_max1);
func4q = a0_q + symsum(an_q*cos(2*pi*(1/T0_q)*(t)*n),n,1,n_max4) + symsum(bn_q*sin(2*pi*(1/T0_q)*(t)*n),n,1,n_max4);
func15q = a0_q + symsum(an_q*cos(2*pi*(1/T0_q)*(t)*n),n,1,n_max15) + symsum(bn_q*sin(2*pi*(1/T0_q)*(t)*n),n,1,n_max15);
func40q = a0_q + symsum(an_q*cos(2*pi*(1/T0_q)*(t)*n),n,1,n_max40) + symsum(bn_q*sin(2*pi*(1/T0_q)*(t)*n),n,1,n_max40);
figure(3)
plot(t,func1q,'k');
hold on;
plot(t,func4q,'r');
hold on;
plot(t,func15q,'m');
hold on;
plot(t,func40q,'b');
hold off;
title('Série de Fourier para diferentes N')
legend('N=1','N=4','N=15','N=40')
xlabel('t')
ylabel('f(t)')
axis([-3*pi 3*pi -5 35])
grid on;

%% Série de Fourier - Função Triangular
syms n t
t=-1.5*pi:dt_t:1.5*pi;
n_max1=1;
n_max4=4;
n_max15=15;
n_max40=40;
a0_t = 2.5*pi;
an_t = (10/((pi^3)*((1/T0_t)^2)*(n^2)))*(1-cos((pi^2)*(1/T0_t)*n));
bn_t = 0;
func1t=a0_t + symsum(an_t*cos(2*pi*(1/T0_t)*(t)*n),n,1,n_max1);% + symsum(bn_t*sin(2*pi*(1/T0_t)*(t)*n),n,1,n_max1);
func4t=a0_t + symsum(an_t*cos(2*pi*(1/T0_t)*(t)*n),n,1,n_max4);% + symsum(bn_t*sin(2*pi*(1/T0_t)*(t)*n),n,1,n_max4);
func15t=a0_t + symsum(an_t*cos(2*pi*(1/T0_t)*(t)*n),n,1,n_max15);% + symsum(bn_t*sin(2*pi*(1/T0_t)*(t)*n),n,1,n_max15);
func40t=a0_t + symsum(an_t*cos(2*pi*(1/T0_t)*(t)*n),n,1,n_max40);% + symsum(bn_t*sin(2*pi*(1/T0_t)*(t)*n),n,1,n_max40);
figure(4)
plot(t,func1t,'k');
hold on;
plot(t,func4t,'r');
hold on;
plot(t,func15t,'m');
hold on;
plot(t,func40t,'b');
hold off;
title('Série de Fourier para diferentes N')
legend('N=1','N=4','N=15','N=40')
xlabel('t')
ylabel('f(t)')
axis([-2*pi 2*pi -2*pi 12*pi])
grid on;