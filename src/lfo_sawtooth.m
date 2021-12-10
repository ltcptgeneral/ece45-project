function x = lfo_sawtooth(amplitude, frequency, phase, fs, duration, input)
% LFO_SAWTOOTH: modulates an input matrix to a sawtooth parameter

% CONTRIBUTORS:
% Ben Zhang: Function Author

% DOCUMENTATION:
% frequency is below 20Hz for people to hear the sound
% fs and duration should be same as input


    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize lfo, which will be used to modulate the input
    lfo = zeros(1, n);
    period = 1 / frequency; % period of the wave
    slope = 2 * amplitude / period; % the incline slope from start to amplitude
     
    % populate lfo matrix
    for i = 1:n
        t = i * dt; % time at the i'th sample
        st = mod(frequency * t - phase, 1); % Progression through cycle
        %part before the straght vertical line
        if(st < period /2) 
            lfo(i) = amplitude * slope;
        %part after the straght vertical line
        else
            lfo(i) = amplitude * (slope - 1);
    
    end
    
    % modulate input
    x = lfo .* input;
    
end