clc;
close all;
ap=input("Enter passband gain in dB : ");
as=input("Enter stopband gain in dB : ");
fp=input("Enter passband edge frequency : ");
fs=input("Enter stopband edge frequency : ");
f=input("Enter sampling frequency : ");
x=input("Enter 1:lowpass,2:highpass,3:bandpass,4:bandstop");
%Digital frequecnies
wp=2*pi*fp/f;
ws=2*pi*fs/f;
%Pre-Warping
p=2*tan(wp/2);
s=2*tan(ws/2);
%Finding order
[n,wn]=buttord(p,s,ap,as,"s");
%Design of filters
if x==1
    [b,a]=butter(n,wn,'low',"s");
end
if x==2
    [b,a]=butter(n,wn,'high',"s");
end
if x==3
    [b,a]=butter(n,wn,'pass',"s");
end
if x==4
    [b,a]=butter(n,wn,'stop',"s");
end

printsys(b,a);

t=1;
[num,den]=bilinear(b,a,t);
printsys(num,den,'z');
freqz(num,den,500);