function x = generate_heartbeat(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SINE: returns a matrix of sampled heart monitor wave

% CONTRIBUTORS:
% Alex Nguyen: Original Author
% Conner Hsu: Reviewed Code and Assisted in polishing

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty cycle should be a number between 0 and 0.5.
    % duty of 0 or less would return 0 for all sample points
    % duty of 0.5 or less would return a heartbeat signal since there would be
        % equal amount of space within 1 period to have the right and left sides be equal
    % duty of greater than 0.5 but less than 1 would return a slope starting at that duty i.e.
        % the left side but leaving little room to the right side
    % duty of between 1 and 2 would give a sawtooth wave in the +amplitude.
    % duty greater than 2 would return 0 for all sample points
   

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        t = i * dt; % time at the i'th sample
        st = mod(frequency * t - phase, 1);

        if (duty-(duty / 2) < st && st < duty)
            slope = amplitude / duty;
            intercept = -0.5 * amplitude;
            x(i) = slope * st + intercept;
        elseif (duty < st && st < duty+(duty / 2)) 
            slope = amplitude / duty;
            intercept = -amplitude;
            x(i) = slope * st + (1.5 * intercept);
        else
            x(i) = 0;
    end
end