function x = generate_horn(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_HORN: returns a matrix of sampled waveform similar to
% a horn.

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
    f = frequency .* (1 + 0.0002 .* sin(4.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.21707879.*amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.234667056.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.088606568.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.0864485981.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.0275181724.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.0472968588.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.0246462876.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.00816134476.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.00691199377.*amplitude .* sin(20.*pi.*f.*t)) ... %tenth partial
        + (0.00494872793.*amplitude .* sin(22.*pi.*f.*t)) ... %eleventh partial
        + (0.0048026999.*amplitude .* sin(24.*pi.*f.*t)) ... %twelth partial
        + (0.00335864486.*amplitude .* sin(26.*pi.*f.*t)) ... %thirteenth partial
        + (0.00262850467.*amplitude .* sin(28.*pi.*f.*t)); %fourteenth partial
    x = x .* (1 + 0.05 .* sin(2.*pi.*t)); %volume vibrato
end

