clc; clear all; close all;

pkg load signal

h = impz(1, [1, -1/4], 50);
t = 0:49;
grid on;
subplot(1,2,1);
grid on;
stem(t,h, 'linewidth', 2); hold on;
plot(t,h, 'linewidth', 2);

subplot(1,2,2);
sys = tf(1, [1, -1/4]);
step(sys);