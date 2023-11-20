
clc
close all
clear all
 
  [s3,T3]=waveformm(10,0.0001,0.5,'Triangle')
  AMnoise(s3,T3,1000,0.0001,50)
