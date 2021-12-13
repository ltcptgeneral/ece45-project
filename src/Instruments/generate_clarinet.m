function x = generate_clarinet(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_CLARINET: returns a matrix of sampled waveform similar to
% a clarinet.

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
    f = frequency; %clarinets play without vibrato
    
    % generate proper fundamental and overtones. Note that the clarinet has
    % heavily suppressed odd-numbered partials
    x = (amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.00290397158.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.368654023.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.0733323309.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.299729339.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.0483901284.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.0941300303.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.033165423.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.00803526117.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.0131383569.*amplitude .* sin(20.*pi.*f.*t)); %tenth partial
    x = x .* (1 + 0.05 .* sin(10.*pi.*t)); %slight volume vibrato added for character
end

