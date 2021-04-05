clc;
clear all;
close all;

pkg load signal;

N = 50;
fc = 5000;
fs = 10000;
wc = fc/fs;
H = rectwin(N);
F = fir1(N-1,wc,H);
freqz(F);