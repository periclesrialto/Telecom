f=10000
tempo=0:1/(100*f):10/f;
sinal=sin(2*pi*f*tempo);

%f1
fs1=500000;
Ts1=1/fs1;
t_sample1=0:Ts1:max(tempo);
N1=length(t_sample1);
n1=0:1:N1-1;
sinal_sample1=sin(2*pi*f.*t_sample1);
%f2
fs2=250000;
Ts2=1/fs2;
t_sample2=0:Ts2:max(tempo);
N2=length(t_sample2);
n2=0:1:N2-1;
sinal_sample2=sin(2*pi*f.*t_sample2);
%f3
fs3=125000;
Ts3=1/fs3;
t_sample3=0:Ts3:max(tempo);
N3=length(t_sample3);
n3=0:1:N3-1;
sinal_sample3=sin(2*pi*f.*t_sample3);
%f4
fs4=62500;
Ts4=1/fs4;
t_sample4=0:Ts4:max(tempo);
N4=length(t_sample4);
n4=0:1:N4-1;
sinal_sample4=sin(2*pi*f.*t_sample4);
%f5
fs5=31250;
Ts5=1/fs5;
t_sample5=0:Ts5:max(tempo);
N5=length(t_sample5);
n5=0:1:N5-1;
sinal_sample5=sin(2*pi*f.*t_sample5);
%f6
fs6=15625;
Ts6=1/fs6;
t_sample6=0:Ts6:max(tempo);
N6=length(t_sample6);
n6=0:1:N6-1;
sinal_sample6=sin(2*pi*f.*t_sample6);

figure(1)
subplot(6,1,1);
plot(t_sample1,sinal_sample1,'r--o');
title('f_s=500000hz');
axis([0 max(tempo) -1.2 1.2])
xlabel('t');
ylabel('x(t), x[nT_S]')
grid on

subplot(6,1,2);
plot(t_sample2,sinal_sample2,'r--o');
title(['f_s=250000hz']);
axis([0 max(tempo) -1.2 1.2])
xlabel('t');
ylabel('x(t), x[nT_S]')
grid on

subplot(6,1,3);
plot(t_sample3,sinal_sample3,'r--o');
title(['f_s=125000hz']);
axis([0 max(tempo) -1.2 1.2])
xlabel('t');
ylabel('x(t), x[nT_S]')
grid on

subplot(6,1,4);
plot(t_sample4,sinal_sample4,'r--o');
title(['f_s=62500hz']);
axis([0 max(tempo) -1.2 1.2])
xlabel('t');
ylabel('x(t), x[nT_S]')
grid on

subplot(6,1,5);
plot(t_sample5,sinal_sample5,'r--o');
title(['f_s=31250hz']);
axis([0 max(tempo) -1.2 1.2])
xlabel('t');
ylabel('x(t), x[nT_S]')
grid on

subplot(6,1,6);
plot(t_sample6,sinal_sample6,'r--o');
title(['f_s=15625hz']);
axis([0 max(tempo) -1.2 1.2])
xlabel('t');
ylabel('x(t), x[nT_S]')
grid on



