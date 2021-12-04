function x = generate_sine(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SINE: returns a matrix of sampled sine wave

% CONTRIBUTORS:
% Arthur Lu: Original author
% Benjamin Liou: refactoring and annotations

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty does not apply for sinusoids
   

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        t = i * dt; % time at the i'th sample
        x(i) = amplitude * sin(2 * pi * frequency * t - phase);
    end
end

