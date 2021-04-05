clc;
clear all;
close all;

x = [1 2 3 4];
N = 4;

x=[x,zeros(N-length(x))];

i=sqrt(-1);
w = exp(-i*2*pi/N);
n=0:N-1;
k=0:N-1;
nk=n'*k;
W = w.^nk;
X = x*W;
ax = abs(X);
wx = angle(X);
disp(x);
disp(X);

w1 = exp(i*2*pi/N);
W1 = w1.^nk;
ix = (1/N)*X*W1;
disp(ix);

subplot(4,1,1); stem(n,x);
subplot(4,1,2); stem(n,ax);
subplot(4,1,3); stem(n,wx);
subplot(4,1,4); stem(n,ix);