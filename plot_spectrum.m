%Yash Agrawal

% Plots the frequency spectrum
function plot_spectrum(frequencies, spectrum)

figure;
plot(frequencies, spectrum);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum');

end

