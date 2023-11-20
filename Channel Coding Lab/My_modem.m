function [bitstream,N,RATIO]=My_modem(bit_stream,Fc,Tsym,Ts,Mod_Type,M,SNR)

k=log2(M);

len=numel(bit_stream);

if mod(len,k)>0 
       z=zeros(1,k-mod(len,k)); 
       
       bit_stream=[bit_stream,z];
end

N=numel(bit_stream);

[B,A]=Baseband_mod(bit_stream, Mod_Type,k);

v=base2pass(B,A,Fc,Tsym,Ts);

vv=awgn(v,SNR,'measured');

[BB,AA]=pass2base(vv,Fc,Tsym,Ts);


% BB=awgn(B,(SNR+10*log10(Tsym/Ts)),'measured');
% 
% AA=awgn(A,(SNR+10*log10(Tsym/2*Ts)),'measured');


bitstream=Baseband_dmod(BB,AA, Mod_Type,k);

[NUMBER,RATIO]=biterr(bit_stream,round(bitstream));

end