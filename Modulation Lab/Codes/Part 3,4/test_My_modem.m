clc
clear all
close all
Fc=1000;
Tsym=0.01;
Ts=0.0001;
load('bitt.mat');
BiT_stream=bitt;
[bitstream,N,RATIO]=My_modem_Asynchronous(BiT_stream,Fc,Tsym,Ts,'ASK',8,20);
