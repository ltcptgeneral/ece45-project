function x = generate_bassoon(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_BASSOON: returns a matrix of sampled waveform similar to
% a bassoon.

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
    f = frequency .* (1 + 0.0001 .* sin(4.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.0934091627.*amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.0257187994.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.120530806.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.216745656.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.0561137441.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.0300031596.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.0863949447.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.0574533965.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.0337819905.*amplitude .* sin(20.*pi.*f.*t)) ... %tenth partial
        + (0.0576176935.*amplitude .* sin(22.*pi.*f.*t)) ... %eleventh partial
        + (0.0107298578.*amplitude .* sin(24.*pi.*f.*t)) ... %twelth partial
        + (0.00582622433.*amplitude .* sin(26.*pi.*f.*t)) ... %thirteenth partial
        + (0.00540916272.*amplitude .* sin(28.*pi.*f.*t)) ... %fourteenth partial
        + (0.00615481833.*amplitude .* sin(30.*pi.*f.*t)) ... %fifteenth partial
        + (0.00480252765.*amplitude .* sin(32.*pi.*f.*t)) ... %sixteenth partial
        + (0.0100473934.*amplitude .* sin(34.*pi.*f.*t)) ... %seventeenth partial
        + (0.00528278041.*amplitude .* sin(36.*pi.*f.*t)); %eighteenth partial
    x = x .* (1 + 0.1 .* sin(4.*pi.*t)); %volume vibrato
end

