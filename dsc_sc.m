clc; clear all; close all;

t = 0:0.00001:0.1;
fm = 300;
fc = 5000;
fs = 30*fc;
am=2;
ac=5;

%mod
m = am.*cos(2*pi*fm*t);
c = ac.*cos(2*pi*fc*t);
st = m.*c;

%demod
ct = st.*c;
[b a] = butter(4,(2*fc)/fs);
dout = filter(b,a,ct);

%plot
subplot(4,1,1); plot(t,m);xlim([0 0.01]);
subplot(4,1,2); plot(t,c);xlim([0 0.01]);
subplot(4,1,3); plot(t,st);xlim([0 0.01]);
subplot(4,1,4); plot(t,dout);xlim([0 0.01]);