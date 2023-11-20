
function [s,t]=FMdmod(S,T,Fc,df)
 differential=diff(S);
 p2=zeros(size(differential))
 p2=abs(hilbert(differential))
  p3=p2-mean(p2)%dc removal
  T=T:T(2):T((numel(T))-1);
 s=p3;
 t=T;
  plot(T,p3)
  title('FMdmod')
end
  







 
