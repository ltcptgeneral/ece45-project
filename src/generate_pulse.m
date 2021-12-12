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
    f0=1e+6;  % 1MHz
    Fs=3e+6;
    Tf=0.001;  % 1 millisecond
    t=0:1/Fs:Tf-1/Fs;
    td=0.1;   % duty cycle 
    A0=10; % 10 Volts
    F=0;
    N=1000; % Number of points 

    % populate the matrix
    for n = 1:N
        F=F+(1/n)*cos(n*2*pi*f0*t).*sin(n*pi*td);
    end
    F=F*(2*A0/pi);
    F=F+A0*td;
end