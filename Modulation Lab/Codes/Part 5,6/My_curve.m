function [total_bit_sent,BER,SNR]=My_curve(No_of_bits,No_of_runs,Fc,Tsym,Ts,Mod_Type,M)


SNRmax=40;
SNRmin=-20; 
Res=1;
m=0;


for S=SNRmin:Res:SNRmax
        number_of_errors=0;
        total_bit_sent=0;
    for n=1:No_of_runs
         while(number_of_errors<1)
              bitstream=randi(2,1,No_of_bits)-1;
              [~,number,RATIO(n)]=My_modem(bitstream,Fc,Tsym,Ts,Mod_Type,M,S);
              bit_errors=number*RATIO(n);
              number_of_errors=number_of_errors+bit_errors;
              total_bit_sent=total_bit_sent+number;

         end
    end
    
    m=m+1;
    BER(m)=mean(RATIO); 
    SNR(m)=S;
end

close all

plot (SNR,BER);
end





