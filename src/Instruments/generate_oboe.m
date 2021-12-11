function x = generate_oboe(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_OBOE: returns a matrix of sampled waveform similar to
% an oboe.

% CONTRIBUTORS:
% Brandon Roberts: Original author
% MuseScore: Reference source for overtone information

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty does not apply for instruments
   

    % setup needed variables
    n = fs * duration; % total data points
    dt = 1 / fs; % space between samples
    
    % initialize template time scale
    t = [1:n].*dt - phase;
    f = frequency .* (1 + 0.0001 .* sin(10.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.274577037.*amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.612336031.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.105870314.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.00825325944.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.0767380354.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.0381430831.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.010765121.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.0024454102.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.00963544782.*amplitude .* sin(20.*pi.*f.*t)); %tenth partial
    x = x .* (1 + 0.1 .* sin(10.*pi.*t)); %volume vibrato
end

