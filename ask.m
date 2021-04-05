clc; clear all; close all;

fc = 150000;
fs = 30*fc;
t = 0:1/fs:5;
ac = 5;
c = ac.*cos(2*pi*fc*t);
Tb = 0.005;
bits = [0 1 0 1 0 1 0 1];
bit_wave = [];

% bit wave gen
for(i = 1:length(bits))
  if(bits(i) == 1)
    bit_wave = [bit_wave, ones(1, 1/Tb)];
  else
    bit_wave = [bit_wave, zeros(1, 1/Tb)];
  end
end

% mod
s = c(1:length(bit_wave)) .* bit_wave;

% filter
[b a] = butter(4, fc/fs);
rs = abs(s);
d = filter(b,a, rs);

% comparator
r = [];
threshold = 1;
for(i = 1:length(d))
  if(d(i) > threshold)
    r(i) = 1;
  else
    r(i) = 0;
  end
end

% plotting
subplot(4, 1, 1); plot(t(1:length(bit_wave)), bit_wave);
subplot(4, 1, 2); plot(t(1:length(bit_wave)), s);
subplot(4, 1, 3); plot(t(1:length(bit_wave)), d);
subplot(4, 1, 4); plot(t(1:length(bit_wave)), r);
