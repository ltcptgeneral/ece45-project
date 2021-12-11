function output = lfo_freq_saw(amplitude, frequency, phase, fs, duration, input)
%LFO_FREQ_SAW Modulates the frequency of an input with a saw LFO

% CONTRIBUTORS:
% Neelay Joglekar: Original author

% SOURCES:
% Code inspired by Benjamin Liou's lfo functions
% Code also inspired by Darren and Anne's pitch envelopes
% Source for frequency modulation equation:
%   https://dsp.stackexchange.com/questions/2349/help-with-algorithm-for-modulating-oscillator-pitch-using-lfo

% DOCUMENTATION:
% Frequency is modulated by saw wave with given amplitude (in octaves, not Hz)

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points

    % create output array
    output = zeros([1, n]);
    
    x = 0.0; % the theoretical input index if the input were not discrete
    % populate output
    for i = 1:n
        t = i * dt; % time at the i'th sample

        % Increment x based off of saw wave output
        omega_ratio = 2 ^ (amplitude * (2 * mod((t - phase / (2*pi)) * frequency, 1) - 1));
        x = mod(x + omega_ratio, n);

        % Linearly interpolate the actual indicies adjacent to x
        % to get an output value
        x_0 = floor(x) + 1;
        x_1 = mod(x_0 + 1, n) + 1;
        output(i) = (input(x_1) - input(x_0)) * (x - x_0) + input(x_0);
    end
end
