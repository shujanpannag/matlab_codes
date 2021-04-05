clc;
clear all;
close all;

x = [1 2 3 4];
N = 4;

X = fft(x,N);
n = 0:N-1;
wx = angle(X);
xi = ifft(X,N);
disp(X);

subplot(4,1,1); stem(n,x);
subplot(4,1,2); stem(n,abs(X));
subplot(4,1,3); stem(n,wx);
subplot(4,1,4); stem(n,xi);
