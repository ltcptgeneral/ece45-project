function x = generate_arcoStrings(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_ARCOSTRINGS: returns a matrix of sampled waveform similar to
% strings played arco.

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
    f = frequency .* (1 + 0.0002 .* sin(10.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.237992723.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.0523347308.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.124586119.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.0854326396.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.0578741297.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.0291070237.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.0270171595.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.0290818446.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.0356787652.*amplitude .* sin(20.*pi.*f.*t)) ... %tenth partial
        + (0.0112928202.*amplitude .* sin(22.*pi.*f.*t)) ... %eleventh partial
        + (0.00547645126.*amplitude .* sin(24.*pi.*f.*t)) ... %twelth partial
        + (0.00800694943.*amplitude .* sin(26.*pi.*f.*t)) ... %thirteenth partial
        + (0.00463295187.*amplitude .* sin(28.*pi.*f.*t)); %fourteenth partial
    x = x .* (1 + 0.1 .* sin(10.*pi.*t)); %volume vibrato
end

