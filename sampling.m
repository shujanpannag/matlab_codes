clc; clear all; close all;

f = 50000;

f_nyq = 2*f; 
f_under = 1.5*f;
f_over = 10*f;

t = 0:1/f_under:1;
y = cos(2*pi*f*t);
subplot(3, 1, 1); plot(t, y, 'linewidth', 2);
hold on; stem(t,y);
xlim([0 0.0002]); title('US');

t = 0:1/f_nyq:2;
y = cos(2*pi*f*t);
subplot(3, 1, 2); plot(t, y, 'linewidth', 2); 
hold on; stem(t,y);
xlim([0 0.0002]); title('CS');

t = 0:1/f_over:2;
y = cos(2*pi*f*t);
subplot(3, 1, 3); plot(t, y, 'linewidth', 2);
hold on; stem(t,y);
xlim([0 0.0002]); title('OS');