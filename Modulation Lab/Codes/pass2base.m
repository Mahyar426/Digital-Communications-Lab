function [B,A]=pass2base(v,Fc,Tsym,Ts)

len=Tsym/Ts;

n=0:len-1;

I=cos(2*pi*Fc*n*Ts);
Q=sin(2*pi*Fc*n*Ts);

for k=1:(length(v)/len)
    B(k)=2*sum(v((k-1)*len+1:k*len).*I)/len;
    A(k)=2*sum(v((k-1)*len+1:k*len).*Q)/len;
end

end