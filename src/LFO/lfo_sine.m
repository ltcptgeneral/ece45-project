function x = lfo_sine(amplitude, frequency, phase, fs, duration, input)
% LFO_SINE: modulates an input matrix

% CONTRIBUTORS:
% Benjamin Liou: Original author

% DOCUMENTATION:
% frequency is typically below 20Hz (according to wikipedia)
% fs and duration should be same as input



    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize lfo, which will be used to modulate the input
    lfo = zeros(1, n);
    
    % populate lfo matrix
    for i = 1:n
        t = i * dt; % time at the i'th sample
        lfo(i) = amplitude * sin(2 * pi * frequency * t - phase);
    end
    
    % modulate input
    x = lfo .* input;
    
end