clc; clear all; close all;

fc = 10000;
Tb = 0.01;
fs = 10*fc;
t = 0:1/fs:5;
ct1 = cos(2*pi*fc*t);
ct2 = -cos(2*pi*fc*t);

% bit wave gen
bits = [0 1 0 1 0 1 0 1];
bit_wave = [];
st = [];
for(i = 1:length(bits))
    if bits(i) == 1
        bit_wave = [bit_wave, ones(1,1/Tb)];
    else
        bit_wave = [bit_wave, zeros(1,1/Tb)];
end
end

% mod
for(i = 1:length(bit_wave))
  if(bit_wave(i) == 1)
    st(i) = ct1(i);
  else
    st(i) = ct2(i);
   end 
end

% demod and filter
fst = st + ct1(1:length(st));
ast = fst./2;
r = abs(ast);
[b a] = butter(8, (2*fc)/fs);
rt = filter(b,a,r);

% comparator
dmod = [];
th = 0.2;
for(i = 1:length(rt))
    if rt(i) > th
        dmod(i) = 1;
    else
        dmod(i) = 0;
    end
end

% plotting
grid on; subplot(4,1,1); plot(t(1:length(bit_wave)),bit_wave);
grid on; subplot(4,1,2); plot(t(1:length(bit_wave)),st);
grid on; subplot(4,1,3); plot(t(1:length(bit_wave)),rt);
grid on; subplot(4,1,4); plot(t(1:length(bit_wave)),dmod);