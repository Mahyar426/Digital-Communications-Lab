function [SNR,BER]=Convolutional(SNRmin,SNRmax,ConstraintLength,Coefficients)
Fc=1000;
Tsym=0.01;
Ts=0.0001; 
Bits=10000;
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
end