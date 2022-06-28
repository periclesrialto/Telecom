%% BPSK
clear all
clc

%Define a quantidade  de bits
bits=5000000;

%Define um valor aleatório entre 0 e 1 para os bits
b=randn(1,bits)>0.5;

%Define o sinal a ser transmitido
sinal=2*b-1;

%Definindo intervalo EbN0
EbN0dB_ini=0;
EbN0dB_fim=12;
EbN0dB=EbN0dB_ini:1:EbN0dB_fim;

ber_sim = zeros([1 length(EbN0dB)]);
ber_teo = zeros([1 length(EbN0dB)]);

for i=1:1:length(EbN0dB)
    N0=1/EbN0dB(i);
    variancia=N0/2;
    ruido=(randn(1,length(sinal))+1i*randn(1,length(sinal)))*sqrt(variancia);
    EbN0=10.^(EbN0dB/10);
    Eb=EbN0(i)*N0;
    Amplitude = sqrt(Eb);
    recebido=Amplitude*sinal+ruido;
    media = mean((Amplitude.*sinal).^2);
    b_est=recebido>0;
    erros=sum(b~=b_est);
    ber_sim(i)=erros/bits;
    ber_teo(i)=qfunc(sqrt(2*EbN0(i))); 
    str = sprintf('BPSK - Eb/N0: %d dB', i-1);
    scatterplot(recebido)
    title(str)
    xlim([-6 6])
    ylim([-6 6])
    grid on
end

figure()
semilogy(EbN0dB,ber_sim,'*')
hold on
semilogy(EbN0dB, ber_teo)
xlabel('Eb/N0 [dB]')
ylabel('BER')
legend('Simulado','Teórico')
title('BER - BPSK')
grid on
hold off


