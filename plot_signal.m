%Yash Agrawal

% Plots the filtered signal
function plot_signal(y, fs)

% Time axis
t = 0:1/fs:length(y)/fs-1/fs;  

figure;
plot(t, real(y));
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal');

end
