%Yash Agrawal

% Filters the input signal using a digital filter
function y_filtered = filter_signal(y, b, a)

y_filtered = filter(b, a, y);

end
