clc; clear all; close all;

x = [1 2 3 4 5];
h = [1 2 3];
l1 = length(x);
l2 = length(h);

x = [x zeros(1,l2-1)]
h = [h zeros(1,l1-1)]
l = l1+l2-1;

y = [];
for(n = 1:l)
  y(n) = 0;
  for(k = 1:n)
    y(n) = y(n) + x(k)*h(n-k+1);
  end
end

c = conv(x,h);
disp(x);
disp(h);
disp(y);
disp(c);

subplot(3,1,1); stem(x, 'linewidth', 2);
subplot(3,1,2); stem(h, 'linewidth', 2);
subplot(3,1,3); stem(y, 'linewidth', 2);