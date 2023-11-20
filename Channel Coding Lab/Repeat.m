function [SNR,BER]=Repeat(m,SNRmin,SNRmax)
SNR=SNRmin:SNRmax;
Fc=1000;
Tsym=0.01;
Ts=0.0001;
Bits=10000;
BiT_stream_in=randi(2,1,Bits)-1;
matrix_stream=zeros(m,Bits);
for i=1:numel(BiT_stream_in)
    for j=1:m
        matrix_stream(j,i)=BiT_stream_in(1,i);
    end
end

for k=1:size(matrix_stream,2)
    coded_stream(1,(k-1)*m+1:k*m)=transpose(matrix_stream(:,k));
end

for SS=SNRmin:SNRmax
[output,~,~]=My_modem(coded_stream,Fc,Tsym,Ts,'PSK',2,SS);
for i=1:m:numel(output)
  counter1=0;
  counter0=0;
  selected=output(1,i:i+m-1);
  for j=1:numel(selected)
       if(selected(1,j)==1)
            counter1=counter1+1;
        else
             counter0=counter0+1;
        end
   end
      if(counter1>=counter0)
             BiT_stream_out(1,((i+m-1)/m))=1;
      else
             BiT_stream_out(1,((i+m-1)/m))=0;
      end
end
Sum=0;
for i=1:numel(BiT_stream_out) 
    if ( BiT_stream_out(1,i)~=BiT_stream_in(1,i) ) 
        Sum=Sum+1;
    end
end
BER(1,SS-SNRmin+1)=Sum/(numel(BiT_stream_out));
end
end