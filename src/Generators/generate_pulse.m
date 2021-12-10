function x = generate_pulse(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_puse: returns a matrix of sampled pulse wave

% CONTRIBUTORS:
% Brian Tran: Created the wave

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty is a number between 0 and 1

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
       F=F+(1/n)*cos(n*2*pi*(1e+6)*t).*sin(n*pi*0.1);
    end
    F=F*(2*10/pi);
    F=F+10*0.1;
end