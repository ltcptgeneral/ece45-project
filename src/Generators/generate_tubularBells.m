function x = generate_tubularBells(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_TUBULARBELLS: returns a matrix of sampled waveform similar to
% a tubular bell.

% CONTRIBUTORS:
% Brandon Roberts: Original author
% MuseScore: Reference source for overtone information

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty does not apply for instruments
% amplitude decays exponentially at varying rates for different paritals
   

    % setup needed variables
    n = fs * duration; % total data points
    dt = 1 / fs; % space between samples
    
    % initialize template time scale
    t = [1:n].*dt - phase;
    f = frequency; %no frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.105668016.*amplitude .* sin(pi.*f.*t))./(2.^(t./10)) ... %hum tone
        + (0.143724696.*amplitude .* sin(2.*pi.*f.*t))./(2.^(t./5)) ... %strike tone
        + (0.12.*amplitude .* sin(12./5.*pi.*f.*t))./(2.^(t./3)) ... %minor third overtone
        + (0.10.*amplitude .* sin(3.*pi.*f.*t))./(2.^(t./2.5)) ... %perfect fifth overtone
        + (0.8.*amplitude .* sin(4.*pi.*f.*t))./(2.^(t./2)) ... %perfect octave overtone
        + (0.6.*amplitude .* sin(5.*pi.*f.*t))./(2.^(t./1.5)) ... %major third overtone
        + (0.4.*amplitude .* sin(8.*pi.*f.*t))./(2.^(t)) ... %second perfect fifth overtone
        + (0.4.*amplitude .* sin(2.2.*pi.*f.*t))./(2.^(4.*t)) ... %transient 1
        + (0.4.*amplitude .* sin(1.8.*pi.*f.*t))./(2.^(8.*t)) ... %transient 2
        + (0.4.*amplitude .* sin(2.7.*pi.*f.*t))./(2.^(10.*t));%transient 3
    x = x .* (1 + 0.02 .* sin(10.*pi.*t)); %volume vibrato
end

