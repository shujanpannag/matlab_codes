clc;
close all;
clear all;

a = [1 2 3 4];
b = [1 2 3 4];
c = [1 2 3 4 5];

% a(b+c) = ab + ac
y1 = conv(a,(b+c));
z1 = conv(a,b);
z2 = conv(a,c);
y2 = z1 + z2;

disp(y1);
disp(y2);