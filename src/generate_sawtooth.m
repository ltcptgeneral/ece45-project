function x = generate_sawtooth(amplitude, frequency, phase, fs, duration, duty)
% generate_sawtooth: returns a matrix of sampled sawtooth wave

% CONTRIBUTORS:
% Ben Zhang: Function author

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty is a number between 0 and 1 
    %duty does not apply for sawtooth wave

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    period = 1 / frequency; % period of the wave
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    
    % populate the matrix
    for i = 1:n
        t = i * dt; % time of the i'th sample
        st = mod(frequency * t - phase, 1); % Progression through cycle
        
        slope = 2 * amplitude / period; % the incline slope from start to amplitude
        mid = period / 2;
        
        %part before the straght vertical line
        if(st < mid)
            x(i) = slope * st; % amplitude from start to +amplitude
        
        %part after the straght vertical line
        else
            x(i) = slope * (st - 0.5) - amplitude; %amplitude from -amplitude to start
        
    end
end
