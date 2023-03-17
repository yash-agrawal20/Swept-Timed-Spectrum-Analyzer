%Yash Agrawal

% Translates the input signal to a different frequency range
function y = translate_signal(x, fc, fs)

% Time vector
t = 0:1/fs:length(x)/fs-1/fs;  
% Perform frequency translation
y = x .* exp(1i*2*pi*fc*t);  

end
