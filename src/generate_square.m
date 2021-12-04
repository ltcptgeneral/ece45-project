function x = generate_square(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SQUARE: returns a matrix of sampled square wave

% CONTRIBUTORS:
% Arthur Lu: Original author
% Benjamin Liou: refactoring and annotations

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty cycle should be a number between 0 and 1.
    % duty of 0 or less would return -amplitude for all sample points
    % duty of 0.25 would return +amplitude for first quarter of each cycle
        % then return -amplitude for the remaining three-fourths
    % duty of 1 would return all +amplitude


% initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        t = i * dt; % time at the i'th sample
        
        % periodic ramp from 0 to 1
        % progression through a cycle
        st = mod(frequency * t - phase, 1);
        
        if(st < duty)
            x(i) = amplitude;
        else
            x(i) = -amplitude;
        end
    end
end

