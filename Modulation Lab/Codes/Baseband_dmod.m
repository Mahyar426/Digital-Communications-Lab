function [bit_stream] = Baseband_dmod (BB,AA, Mod_Type,k)
m1=length(BB)*k;
CC=BB+AA*1i;

 switch Mod_Type
    
    case 'OOK'
     for v=1:length(BB)
         if (BB(v)>=0.5)
             bit_stream(1,v)=1;
         end
         if (BB(v)<0.5)
             bit_stream(1,v)=0;
         end
        % we apply a thereshold on the input to determine bitstream   
     end    
        
    case 'PSK'
        eq_matrix=de2bi(pskdemod(CC,2^k),'left-msb')';
        bit_stream = reshape(eq_matrix,[1,m1]);
        % as it is described in the documentation,pskdemod(n,2^k) returns
        % a bitstream which is the result of psk demodulation of CC with 2^k
        % order , we convert decimal values to binary and then form a
        % vector with m coloumns
        %2pi/m
        
    case 'ASK'
         BB_round=round(BB);
         for u=1:length(BB_round)
             if(BB_round(u)<1)
                 BB_round(u)=1;
             end
             
             if(BB_round(u)>2^k)
                 BB_round(u)=2^k;
             end
         end
         BB_round=BB_round-1;
         % we use above lines to have our assumption in [1,2^k] span
         %then with deducting 1,we have data from 0 to 2^k -1
         eq_matrix=de2bi(BB_round,'left-msb')';
         bit_stream = reshape(eq_matrix,[1,m1]);
         % we convert our assumption to a set of binary numbers
         % then we transform our newly created matrix into a vector which
         % we claim it is inital bitstream
        
        
    case 'QAM'       
        eq_matrix=de2bi(qamdemod(CC,2^k),'left-msb')';
        bit_stream = reshape(eq_matrix,[1,m1]);        
        % as it is described in the documentation,qamdemod(n,2^k) returns
        % a bitstream which is the result of qam demodulation of CC with 2^k
        % order , we convert decimal values to binary and then form a
        % vector with m coloumns
 end
end
