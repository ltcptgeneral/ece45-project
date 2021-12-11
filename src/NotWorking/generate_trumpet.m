function x = generate_trumpet(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_TRUMPET: returns a matrix of sampled waveform similar to
% a trumpet.

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
    f = frequency .* (1 + 0.00005 .* sin(10.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.802698298.*amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.700319932.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.748098515.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.909272003.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.471477725.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.200863214.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.264578051.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.282234698.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.128787879.*amplitude .* sin(20.*pi.*f.*t)) ... %tenth partial
        + (0.100688156.*amplitude .* sin(22.*pi.*f.*t)) ... %eleventh partial
        + (0.0874984909.*amplitude .* sin(24.*pi.*f.*t)) ... %twelth partial
        + (0.0488047809.*amplitude .* sin(26.*pi.*f.*t)) ... %thirteenth partial
        + (0.0261680551.*amplitude .* sin(28.*pi.*f.*t)) ... %fourteenth partial
        + (0.0186224798.*amplitude .* sin(30.*pi.*f.*t)) ... %fifteenth partial
        + (0.0255342267.*amplitude .* sin(32.*pi.*f.*t)) ... %sixteenth partial
        + (0.0111674514.*amplitude .* sin(34.*pi.*f.*t)) ... %seventeenth partial
        + (0.010020524.*amplitude .* sin(36.*pi.*f.*t)) ... %eighteenth partial
        + (0.00694192925.*amplitude .* sin(38.*pi.*f.*t)) ... %nineteenth partial
        + (0.00307859471.*amplitude .* sin(40.*pi.*f.*t)) ... %twentieth partial
        + (0.00338041772.*amplitude .* sin(42.*pi.*f.*t)) ... %twentyfirst partial
        + (0.0026862248.*amplitude .* sin(44.*pi.*f.*t)); %twentysecond partial
    x = x .* (1 + 0.02 .* sin(10.*pi.*t)); %volume vibrato
end

