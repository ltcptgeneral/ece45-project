function x = generate_trapezoid(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_TRAPEZOID: returns a matrix of sampled square wave

% CONTRIBUTORS:
% Daniel Doan: Author

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty cycle should be a number between 0 and 1.
    % duty of 0.5 would have 2 trapezoids in first half of each cycle
    % example of wave with duty of 0.5, where the peaks are amplitude/2: 
    % 
    %   ____ 
    %  /    \
    % /      \        ________________
    %         \      /
    %          \____/
    % 



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
        slope = (amplitude/2) / (duty/8);
        if(st < duty)
            if(st <= duty/8)
                x(i) = slope * st;
            else
                if(st <= 5*duty/8)
                    x(i) = amplitude/2 - slope * (st-(3*duty/8));
                end
                if(st <= 3*duty/8)
                    x(i) = amplitude/2;
                end
                if(st >= 5*duty/8)
                    x(i) = -amplitude/2;
                end
            end
            if(st >= 7* duty/8)
                x(i) = -amplitude/2 + slope*(st-(7*duty/8));
            end
        end
    end
end