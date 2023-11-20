clc
clear all
close all
%% Parameters
tic;
Fc=1000;
Tsym=0.01;
Ts=0.01;
numberofbits=5000;
numberofruns=10;
M=64;
%% Calling Function
[totalbitsent,biterrorrate,signalnoiseratio]=My_curve(numberofbits,numberofruns,Fc,Tsym,Ts,'PSK',M);
runningtime=toc;
