clc
clear all
close all

%% USING WAVEFORM2 (-1 < AMPLITUDE < 1)
[g1,TT1]=waveform2(100,0.0001,0.05,'Sine')
  %figure;
  %plot(TT1,g1)
 [g2,TT2]=waveform2(100,0.0001,0.05,'Square')
 %figure;
 %plot(TT2,g2)
  [g3,TT3]=waveform2(100,0.0001,0.05,'Triangle')
  %figure;
  %plot(TT3,g3)

 %% MODULATION
 [M1,T11]=AMmod(g1,TT1,1000)
 %figure;
 %plot(T11,M1)
 [M2,T22]=AMmod(g2,TT2,1000)
 %figure;
 %plot(T22,M2)
 [M3,T33]=AMmod(g3,TT3,1000)
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

 