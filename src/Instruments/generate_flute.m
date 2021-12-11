function x = generate_flute(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_FLUTE: returns a matrix of sampled waveform similar to
% a flute.

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
    
    % initialize template time scale and frequency
    t = [1:n].*dt - phase;
    f = frequency .* (1 + 0.0002 .* sin(7.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (amplitude .* sin(4.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.396821591.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.157568887.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.151279648.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.106818975.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.0138755668.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.0100279037.*amplitude .* sin(14.*pi.*f.*t)); %seventh partial
    x = x .* (1 + 0.25 .* sin(7.*pi.*t)); %volume vibrato
end

