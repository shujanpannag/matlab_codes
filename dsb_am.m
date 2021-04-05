clc; clear all; close all;

fc = 50000;
fm = 3000;
fs = 5*fc;
t = 0:1/fs:1;
am = 5;
ac = 10;

%mod
m = am*cos(2*pi*fm*t);
c = ac*cos(2*pi*fc*t);
s= (ac + m) .* cos(2*pi*fc*t);
st = [];
%demod
for(i = 1:length(s))
  if(s(i)<0)
    st(i) = 0;
  else
    st(i) = s(i);
   end
end
rt = abs(st);
[b a] = butter(3,(2*fm)/fs);
dout = filter(b,a,rt);

%plot
subplot(5,1,1); plot(t,m);xlim([0 0.005]);
subplot(5,1,2); plot(t,c);xlim([0 0.005]);
subplot(5,1,3); plot(t,s);xlim([0 0.005]);
subplot(5,1,4); plot(t,rt);xlim([0 0.005]);
subplot(5,1,5); plot(t,dout);xlim([0 0.005]);