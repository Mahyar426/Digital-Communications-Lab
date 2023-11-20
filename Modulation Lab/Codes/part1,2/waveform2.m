 
function [s,t]=waveform2(f,Ts,Tm,WF)
if Ts>1/(100*f)
msgbox('Ts*f must be less than 0.01','error'); s=0; t=0;
else
i=0;
for time=0:Ts:Tm
    i=i+1;
t(i)=time;
switch WF
case 'Sine', s1(i)=(1+sin(2*pi*f*time))/2;s(i)=2*s1(i)-1;
case 'Square', s1(i)=1-(mod(floor(time*f*2),2)>0);s(i)=2*s1(i)-1;
case 'Triangle', n=floor(time*f); ttime=time-(n+0.5)/f; s1(i)=2*f*abs(ttime);s(i)=2*s1(i)-1;
end
end
end
end
