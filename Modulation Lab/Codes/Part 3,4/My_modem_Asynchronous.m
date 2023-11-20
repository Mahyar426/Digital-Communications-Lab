function [bitstream,N,RATIO]=My_modem_Asynchronous(bit_stream,Fc,Tsym,Ts,Mod_Type,M,SNR)
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
%% Sycnhronous
% [BB,AA]=pass2base(vv,Fc,Tsym,Ts);
% 
% bitstream=Baseband_dmod(BB,AA, Mod_Type,k);
% 
% [NUMBER,RATIO]=biterr(bit_stream,round(bitstream));
%% Asynchronours
Pw=vv.*vv;
for n=1:(N/k)    
    S(n) = 2*sum(Pw(ceil((n-1)*(Tsym/Ts))+1:ceil(n*(Tsym/Ts))))/(Tsym/Ts);
end
if('ASK')   
        S=sqrt(S);       
end
 bitstreamm=round(S);
% % PART R34
% % for e=1:(N/k)
% %     if(S(e)>M-1)
% %         bitstreamm(e)=M-1;
% %     else
% %         bitstreamm(e)=floor(S(e));
% %     end
% % end
N1=numel(bitstreamm);
for nn =1:N1   
    if('ASK')
       bitstream(k*(nn-1)+1 : k*nn) = Makebin((bitstreamm(nn)-1),k);   
    end
    if('OOK')
       bitstream(k*(nn-1)+1 : k*nn) = Makebin((bitstreamm(nn)),k);  
    end
end   
% 
[NUMBER,RATIO]=biterr(bit_stream,bitstream);
%%
figure;
subplot(2,2,1)
scatter(B,A)
title('signal constellation in moderator')
subplot(2,2,2)
%stem(S,'linestyle','none');
scatter(S,zeros(size(S)))
%scatter(BB,AA)
title('noisy signal constellation')
subplot(2,2,3)
plot(v)
title('signal in time domain after moderator')
subplot(2,2,4)
plot(vv)
title('noisy signal in time domain (output of the awgn chanel)')



end