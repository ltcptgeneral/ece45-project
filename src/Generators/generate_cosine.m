function x = generate_cosine(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_WAVENAME: returns a matrix of sampled WAVENAME wave

% CONTRIBUTORS:
% Mekhi Ellington: Original Creator

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty is a number between 0 and 1

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        t = i * dt;
        x(i) = amplitude * cos(2*pi*frequency*t-phase);
    end
end