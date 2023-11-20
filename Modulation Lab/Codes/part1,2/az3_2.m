
clc
close all
clear all
%% USING WAVEFORM
[s1,T1]=waveformm(100,0.0001,0.05,'Sine')
%figure;
 %plot(T1,s1)
[s2,T2]=waveformm(100,0.0001,0.05,'Square')
%figure;
%plot(T2,s2)
 [s3,T3]=waveformm(100,0.0001,0.05,'Triangle')
 %figure;
 %plot(T3,s3)

%% FM MODULATION
[s12,T12]=FMmod(s1,T1,1000,500)
%figure;
%plot(T12,s12)
[s22,T22]=FMmod(s2,T2,1000,500)
%figure;
%plot(T22,s22)
[s32,T32]=FMmod(s3,T3,1000,500)
%figure;
%plot(T32,s32)


%% DEMODULATION USING FMdmod
%figure;  
%FMdmod(s12,T12,1000,500)
%FMdmod(s22,T22,1000,500)
%FMdmod(s32,T32,1000,500)
 
%% DEMODULATION USING fmdemod
%plot(fmdemod(s12,1000,10000,500))
%plot(fmdemod(s22,1000,10000,500))
%plot(fmdemod(s32,1000,10000,500))

%% SPECTRUM OF THE SIGNAL
figure;
v=s12;
a=length(v);
v=fft(v)
v=fftshift(v)
p=(-a/2:a/2-1)*(10000/a)
plot(p,abs(v))


% figure;
% v=s22;
% a=length(v);
% v=fft(v)
% v=fftshift(v)
% p=(-a/2:a/2-1)*(10000/a)
% plot(p,abs(v))
 
% figure;
% v=s32;
% a=length(v);
% v=fft(v)
% v=fftshift(v)
% p=(-a/2:a/2-1)*(10000/a)
% plot(p,abs(v))
 
 
 

