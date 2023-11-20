
clc
close all
clear all
 %% WAVEFORM
 [s1,T1]=waveformm(100,0.0001,0.05,'Sine')
  %figure;
  %plot(T1,s1)
 [s2,T2]=waveformm(100,0.0001,0.05,'Square')
 %figure;
 %plot(T2,s2)
  [s3,T3]=waveformm(100,0.0001,0.05,'Triangle')
  %figure;
  %plot(T3,s3)
  
  %% MODULATION
  
 [M1,T11]=AMmod(s1,T1,1000)
 %figure;
 %plot(T11,M1)
 [M2,T22]=AMmod(s2,T2,1000)
 %figure;
 %plot(T22,M2)
 [M3,T33]=AMmod(s3,T3,1000)
 %figure;
 %plot(T33,M3)
 %% DEMODULATION WITH ENVELOPE_DETECTOR
 
 %figure;
 %Envelope_detector(M1,T11)
 %figure;
% Envelope_detector(M2,T22)
 %figure;
 %Envelope_detector(M3,T33)
 
 
 %% DEMODULATION WITH amdemod
%plot(T11,amdemod(M1,1000,10000,-pi/2))
 
%plot(T22,amdemod(M2,1000,10000,-pi/2))
 
%plot(T33,amdemod(M3,1000,10000,-pi/2))

%% SPECTROM OF THE SIGNSL
% figure;
% v=M1;
% a=length(v);
% v=fft(v)
% v=fftshift(v)
% p=(-a/2:a/2-1)*(10000/a)
% plot(p,abs(v))

% figure;
% v=M2;
% a=length(v);
% v=fft(v)
% v=fftshift(v)
% p=(-a/2:a/2-1)*(10000/a)
% plot(p,abs(v))

% figure;
% v=M3;
% a=length(v);
% v=fft(v)
% v=fftshift(v)
% p=(-a/2:a/2-1)*(10000/a)
% plot(p,abs(v))



