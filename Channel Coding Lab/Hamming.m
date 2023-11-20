function [SNR,BER]=Hamming(n,k,SNRmin,SNRmax)
i=1;
Fc=1000; 
Tsym=0.01;
Ts=0.0001;
Bits=10000;
data=randi([0 1],Bits*k,1);
encdata=encode(data,n,k,'hamming/binary');
for SNR=SNRmin:SNRmax
awgn_encdata=My_modem_ham(encdata,Fc,Tsym,Ts,'PSK',2,SNR);
decdata=decode(awgn_encdata',n,k,'hamming/binary');
[~,BER(i)]=biterr(decdata,data);
i=i+1;
end
SNR=SNRmin:SNRmax;
end





