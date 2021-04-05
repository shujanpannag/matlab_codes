clc;
close all;
x=input('Enter the value of first sequence  : ');
h=input("Enter the value of second sequence : ");
l1=length(x);
l2=length(h);

a=input("Enter 1 for linear convolution");

if a==1
    N=l1+l2-1;
    X=fft(x,N);
    H=fft(h,N);
    Y=X.*H;
    A=ifft(Y,length(Y));
    disp(A);
    B=cconv(x,h);
    disp(B);
    if A==B
        disp("Linear Convolution is verified..");
    end
else
    N=max(l1,l2);
    X=fft(x,N);
    H=fft(h,N);
    Y=X.*H;
    A=ifft(Y,length(Y));
    disp(A);
    B=cconv(x,h,N);
    disp(B);
    if A==B
        disp("Circular Convolution is verified..");
    end
end