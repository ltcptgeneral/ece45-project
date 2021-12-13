function x = lfo_square(amplitude, frequency, phase, fs, duration, input)
% LFO_SQUARE: modulates an input matrix to a square

% CONTRIBUTORS:
% Aleksandra Desens: Author

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency - below 20 Hz
% duration - same as input

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    lfo = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        
        t = i * dt;
        duty = 0.5;  % duty of 0.5 generates a square wave

        st = mod((frequency * t - phase), 1);

        if (st < duty) 
            lfo(i) = amplitude;
        else
            lfo(i) = -amplitude;

    end

    % modulate input
    x = lfo .* input;

end
