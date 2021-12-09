function x = generate_halfCircles(amplitude, frequency, phase, fs, duration, duty)
    % Generates half circles.

    % By Conner Hsu

    % DOCUMENTATION:
    % amplitude scales how tall the half circle is.
    % phase shift is in number of periods
    % fs is the sampling frequency: how many sample points per second
    % duration is time in seconds
    % duty cycle should be a number between 0 and 1.
        % duty of 0 or less would return 0 for all sample points
        % duty of 0.25 would return a half circle for first quarter of each cycle
        % then return 0 for the remaining 3/4ths
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
            x(i) = sqrt((duty/2)^2-(st-duty/2)^2)/2*amplitude;
        else
            x(i) = 0;
        end
    end
    %Testing code.
    %t = 0:dt:duration;
    %t(n) = [];
    %plot(t, x);
    sound(x, fs);
end
