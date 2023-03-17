%Yash Agrawal

% Sampling frequency
fs = 44100;  
% Duration of signal in seconds
duration = 1;
% Frequency of first sine wave
f1 = 1000;  
% Frequency of second sine wave
f2 = 5000;  
% Frequency of third sine wave
f3 = 10000; 
% Time vector
t = 0:1/fs:duration-1/fs;  

% Generate multi-tone signal
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);  

% Center frequency of translated signal
fc = 20000;  
% Perform frequency translation
y = translate_signal(x, fc, fs);  

% Define filter parameters
% Cutoff frequency 1
fc1 = 9000;  
% Cutoff frequency 2
fc2 = 11000;  
% Bandwidth
bw = fc2 - fc1;  
% Attenuation in dB
attenuation = 60;  

% Create filter
[b,a] = butter(10, [fc1 fc2]/(fs/2));
% Filter signal
y_filtered = filter_signal(y, b, a);  

% Length of signal
N = length(y_filtered);  
 % Perform FFT
Y = fft(y_filtered, N); 
% Frequency axis
frequencies = linspace(-fs/2, fs/2, N);
% Spectrum
spectrum = fftshift(abs(Y));  

% Calculate dynamic range
 % Signal power
signal_power = mean(abs(Y).^2); 
% Noise power
noise_power = mean(abs(Y(frequencies<fc1 | frequencies>fc2)).^2);  
% Dynamic range in dB
dynamic_range = 10*log10(signal_power/noise_power);  

% Calculate sensitivity
 % Sensitivity in dBm
sensitivity = -174 + 10*log10(bw) + dynamic_range; 

% Calculate resolution bandwidth
% Resolution bandwidth in Hz
resolution_bandwidth = fs/N;  

% Plot results
plot_spectrum(frequencies, spectrum);
xlim([fc1-2*resolution_bandwidth fc2+2*resolution_bandwidth]);

% Plot filtered signal
plot_signal(y_filtered, fs);

disp(['Dynamic range: ' num2str(dynamic_range) ' dB']);
disp(['Sensitivity: ' num2str(sensitivity) ' dBm']);
disp(['Resolution bandwidth: ' num2str(resolution_bandwidth) ' Hz']);



