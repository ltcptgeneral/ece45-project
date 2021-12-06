function x = generate_white(amplitude, fs, duration)
%GENERATE_WHITE: returns a matrix of sampled white noise

%CONTRIBUTORS:
%Benjamin Liou: Original author

%DOCUMENTATION:
% white noise can then be filtered to produce different hues of noises


%time domain matrix of random sample points between +-amplitude
x = amplitude * 2 * (rand(1, fs * duration) - 0.5);
end