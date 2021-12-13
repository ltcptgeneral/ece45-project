function x = generate_keyboard(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_KEYBOARD: returns a matrix of a sum of sine waves

% CONTRIBUTORS:
% Ryan Goh: author

% DOCUMENTATION:
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% amplitude, phase, and duty are not used in this function

% This function's purpose is to generate a wave that can simulate the sound of a digital keyboard.
% Sound is best suited for frequencies near the middle octave of the
% piano(261.6 - 523.2). Frequencies too high or too low do not sound
% similar to the intended sound.

% Referenced Arthur Lu and Benjamin Liou's generate sine function. Also
% adapted wave model from https://dsp.stackexchange.com/questions/46598/mathematical-equation-for-the-sound-wave-that-a-piano-makes


    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        t = i * dt; % time at the i'th sample
        
        %wave model of keyboard sound. 
        %Original version from https://dsp.stackexchange.com/questions/46598/mathematical-equation-for-the-sound-wave-that-a-piano-makes
        y = sin(2 * pi * frequency * t) * exp(-0.002 * 2 * pi * frequency * t) ...
        + (sin(3*2*pi*frequency*t)*exp(-0.002 * 2 * pi * frequency * t)) / 2 ...
        + (sin(4*2*pi*frequency*t)*exp(-0.002 * 2 * pi * frequency * t)) / 8 ...
        + (sin(5 * 2 * pi * frequency * t) * exp(-0.002 * 2 * pi * frequency * t)) / 16 ...
        + (sin(6 * 2 * pi * frequency * t) * exp(-0.002 * 2 * pi * frequency * t)) / 25 ...
        + (sin(7 * 2 * pi * frequency * t) * exp(-0.002 * 2 * pi * frequency * t)) / 50 ...
        + (sin(8 * 2 * pi * frequency * t) * exp(-0.002 * 2 * pi * frequency * t)) / 100 ...
        + (sin(9 * 2 * pi * frequency * t) * exp(-0.002 * 2 * pi * frequency * t)) / 200;
        
        %Further adjustments to improve sound
        y = y + y * y * y;
        y = y * (1 + 16*t*exp(-1000*t));
        
        x(i) = 0.15 * y;%multiplied by fixed amplitude value of 0.15
    end
end