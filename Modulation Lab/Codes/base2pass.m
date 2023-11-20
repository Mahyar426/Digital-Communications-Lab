function v=base2pass(B,A,Fc,Tsym,Ts)

n=0:Tsym/Ts-1;
v=0;
I=cos(2*pi*Fc*n*Ts);
Q=sin(2*pi*Fc*n*Ts);
v=[];
for k=1:length(A)
    vk=B(k)*I+A(k)*Q;
    v=[v,vk];
end


end