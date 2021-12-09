function x = generate_heartbeat(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SINE: returns a matrix of sampled heart monitor wave

% CONTRIBUTORS:
% Alex Nguyen: Original Author
% Conner Hsu: Reviewed Code and Assisted in polishing

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
        st = mod(frequency * t - phase, 1);

        if (duty-0.25 < st && st < duty)
            slope = amplitude / duty;
            intercept = -0.5 * amplitude;
            x(i) = slope * st + intercept;
        elseif (duty < st && st < duty+0.25) 
            slope = amplitude / duty;
            intercept = -amplitude;
            x(i) = slope * st + (1.5 * intercept);
        else
            x(i) = 0;
    end
end