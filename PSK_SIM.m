%% PSK
clear all
clc

%Definindo a PSK
M=2;
n=0:M-1;
psk = exp(1i*pi*(2*n+1)/M);

%Definindo o ru�do de 30dB
SNR_dB=1;
SNR=10^(SNR_dB/10);

%Definindo a densidade espectral bilateral
N0=1/SNR;
variancia=N0/2;

%Definindo 1000 elementos para cada s�mbolo transmitido
dados=kron(ones(1,1000000),psk);

%Definindo o ru�do para cada componente em fase e em quadratura
ruido=(randn(1,length(dados))+1i*randn(1,length(dados)))*sqrt(variancia);

%Definindo o sinal recebido
recebido=dados+ruido;

%Plot de constela��o sem ru�do
scatterplot(recebido)
title('16 PKS - SNR:5dB')
grid on