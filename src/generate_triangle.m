function x = generate_triangle(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_TRIANGLE: returns a matrix of sampled square wave

% CONTRIBUTORS:
% Arthur Lu: Original author
% Benjamin Liou: refactoring and annotations

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty cycle should be a number between 0 and 1.
    % duty of 0.25 would have positive slope for first quarter of each cycle
        % then have negative slope for the remaining three-fourths



% initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        t = i * dt;
        
        % periodic ramp from 0 to 1
        % progression through a cycle
        st = mod(frequency * t - phase, 1);
        
        if(st < duty)
            slope = amplitude / duty;
            intercept = -0.5 * amplitude;
            x(i) = slope * st + intercept;
        else
            slope = -amplitude / (1 - duty);
            intercept = amplitude*( duty/(1-duty) + 0.5);
            x(i) = slope * st + intercept;
        end
    end
end