clc;
clear all;
close all;

x = [1 2 3 4];
h = [1 2 3 4];
N = max(length(x),length(h));
%N = length(x)+length(h)-1;
x = [x zeros(1,N-length(x))];
h = [h zeros(1,N-length(h))];

disp(x); disp(h);

for n=1:N
    y(n)=0;
    for k=1:N
        i=n-k+1;
        if(i<=0)
            i=i+N;
        end
        y(n)=y(n)+x(k)*h(i);
    end
end

disp(y);
C = cconv(x,h,N);
disp(C);