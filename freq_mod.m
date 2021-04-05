clc; clear all; close all;

fc = 50000;
fm = 3000;
fs = 20*fc;
t = 0:1/fs:1;
am = 5;
ac = 10;
beta_f = 10;
m = am * cos(2*pi*fm*t);
c = ac * sin(2*pi*fc*t);

%mod
s = ac * cos(2*pi*fc*t + beta_f*sin(2*pi*fm*t));

%demod - still not working
syms x
f = ac * cos(2*pi*fc*x + beta_f*sin(2*pi*fm*x));
df = diff(f);
st = df(t);
rst = [];
for(i = 1:length(st))
  if(st(i)<0)
    rst(i) = 0;
  else
    rst(i) = st(i);
   end
end
rt = abs(rst);
[b a] = butter(3,(2*fm)/fs);
dout = filter(b,a,rt);

%plot
subplot(4,1,1); plot(t,m);xlim([0 0.001]);
subplot(4,1,2); plot(t,c);xlim([0 0.001]);
subplot(4,1,3); plot(t,s);xlim([0 0.001]);
subplot(4,1,4); plot(t,dout);xlim([0 0.001]);
