%% QPSK
clear all
clc

%Define a quantidade  de bits
bits=5000000;

%Define um valor aleatório entre 0 e 1 para os bits
b=randn(1,bits)>0.5;
b_est=zeros([1 length(b)]);
%Define o sinal a ser transmitido
sinal=f_qpsk(b);

%Definindo intervalo EbN0
EbN0dB_ini=0;
EbN0dB_fim=12;
EbN0dB=EbN0dB_ini:1:EbN0dB_fim;

ber_sim = zeros([1 length(EbN0dB)]);
ber_teo = zeros([1 length(EbN0dB)]);

erros = 0;

for i=1:1:length(EbN0dB)
    N0=1/EbN0dB(i);
    variancia=N0/2;
    ruido=(randn(1,length(sinal))+1i*randn(1,length(sinal)))*sqrt(variancia);
    EbN0=10.^(EbN0dB/10);
    Eb=EbN0(i)*N0;
    Amplitude = sqrt(Eb);
    recebido=Amplitude*sinal+ruido;
    p=1;
    for j=1:length(recebido)
        if real(recebido(j))>0 && imag(recebido(j))>0
            b_est(p)=1;
            b_est(p+1)=1;
        elseif real(recebido(j))<0 && imag(recebido(j))>0
            b_est(p)=1;
            b_est(p+1)=0;
        elseif real(recebido(j))<0 && imag(recebido(j))<0
            b_est(p)=0;
            b_est(p+1)=0;
        elseif real(recebido(j))>0 && imag(recebido(j))<0
            b_est(p)=0;
            b_est(p+1)=1;
        end
        p=p+2;
    end
    erros=sum(b~=b_est);
    ber_sim(i)=erros/bits;
    ber_teo(i)=qfunc(sqrt(EbN0(i))); 
    str = sprintf('QPSK - Eb/N0: %d dB', i-1);
    scatterplot(recebido)
    title(str)
    xlim([-4.5 4.5])
    ylim([-4.5 4.5])
    grid on
end

figure()
semilogy(EbN0dB,ber_sim,'*')
hold on
semilogy(EbN0dB, ber_teo)
xlabel('Eb/N0 [dB]')
ylabel('BER')
legend('Simulado','Teórico')
title('BER - QPSK')
grid on
hold off