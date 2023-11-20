clc
clear all
close all
ConstraintLength=[5 4];
Coefficients=[23 35 0;0 5 13];
SNRmax=-5;
SNRmin=-50;
Fc=1000;
Tsym=0.01;
Ts=0.0001;
Bits=1000;
data = randi([0 1],Bits,1);
Trellis1 = poly2trellis(ConstraintLength,Coefficients);
encdata = convenc(data,poly2trellis(ConstraintLength,Coefficients));
i=1;
for SNR=SNRmin:SNRmax
awgn_encdata=My_modem_ham(encdata,Fc,Tsym,Ts,'PSK',2,SNR);
decdata_agwn = vitdec(awgn_encdata,Trellis1,2,'trunc','hard')';
[~,BER(i)]=biterr(decdata_agwn,data);
i=i+1;
end
SNR=SNRmin:SNRmax;
plot(SNR,BER);