% DFT without using builtin function
clc;
close all;

x=input('Input sequence: ');
N=input('Enter the number of points: ');
if(N>length(x))
  x=[x zeros(1,N-length(x))];
end

z=(-1i*2*pi/N);

for k=1:N
  X(k)=0;
  for n=1:N
    X(k)=x(n)*exp(z*(k-1)*(n-1));
  end
end

disp(X);
n=0:N-1;
subplot(4,1,1);
stem(n,x);
xlabel('time');
ylabel('Amplitude');
title('Input');

M=abs(X);
subplot(4,1,2);
stem(n,M);
xlabel('time');
ylabel('Amplitude');
title('Magnitude');

A=angle(X);
subplot(4,1,3);
stem(n,A);
xlabel('time');
ylabel('Amplitude');
title('Angle');

z1=(1i*2*pi/N);
for n=1:N
  y(n)=0;
  for k=1:N
    y(n)=(y(n)+X(k)*exp(z1*(n-1)*(k-1))*(1/N));
  end
end

disp(y);
n1=0:N-1;
subplot(4,1,4);
stem(n1,abs(y));
xlabel('time');
ylabel('Amplitude');
title('IFFT output');
