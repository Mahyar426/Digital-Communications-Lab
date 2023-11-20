
clc
close all
clear all
%% waveform
[s1,T1]=waveformm(10,0.00001,0.5,'Sine')
%figure;
 %plot(T1,s1)
[s2,T2]=waveformm(10,0.00001,0.5,'Square')
%figure;
%plot(T2,s2)
 [s3,T3]=waveformm(10,0.00001,0.5,'Triangle')
 %figure;
 %plot(T3,s3)


%%  FM modulation
[s12,T12]=FMmod(s1,T1,100,90)
%figure;
%plot(T12,s12)
[s22,T22]=FMmod(s2,T2,100,90)
%figure;
%plot(T22,s22)
[s32,T32]=FMmod(s3,T3,100,90)
%figure;
%plot(T32,s32)



%% FM demodulation using FMdmod  
%  FMdmod(s12,T12,100,90)
%  FMdmod(s22,T22,100,90);
%  FMdmod(s32,T32,100,90)
 
%% FM demodulation using fmdemod
% plot(fmdemod(s12,100,100000,90,-pi/2))
% plot(fmdemod(s22,100,100000,90,-pi/2))
% plot(fmdemod(s32,100,100000,90,-pi/2))
 

 

