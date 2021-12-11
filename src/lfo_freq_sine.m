function output = lfo_freq_sine(amplitude, frequency, phase, fs, duration, input)
%LFO_FREQ_SINE Modulates the frequency of an input with a sine LFO

% CONTRIBUTORS:
% Neelay Joglekar: Original author

% SOURCES:
% Code based off of Benjamin Liou's functions (lfo_sine)
% https://dsp.stackexchange.com/questions/2349/help-with-algorithm-for-modulating-oscillator-pitch-using-lfo

% DOCUMENTATION:
% Frequency is modulated by 20 semitones (20 above, 20 below)

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points

    % create output array
    output = zeros([1, n]);
    
    x = 0.0; % theoretical input index, assuming input not discrete
    % populate output
    for i = 1:n
        t = i * dt; % time at the i'th sample
        omega_ratio = 2 ^ (20/12 * sin(2 * pi * frequency * t - phase));
        x = mod(x + omega_ratio, n);
        x_0 = floor(x) + 1;
        x_1 = mod(x_0 + 1, n) + 1;
        output(i) = (input(x_1) - input(x_0)) * (x - x_0) + input(x_0);
    end
end

