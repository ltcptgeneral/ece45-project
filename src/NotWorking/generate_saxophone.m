function x = generate_saxophone(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SAXOPHONE: returns a matrix of sampled waveform similar to
% a saxophone.

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
    f = frequency .* (1 + 0.0001 .* sin(9.*pi.*t)./t); %frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.64011635.*amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.558462369.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (0.156636999.*amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.102886106.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.289185376.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.21277411.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.108250745.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.077212478.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.285980527.*amplitude .* sin(20.*pi.*f.*t)) ... %tenth partial
        + (0.167644958.*amplitude .* sin(22.*pi.*f.*t)) ... %eleventh partial
        + (0.115479073.*amplitude .* sin(24.*pi.*f.*t)) ... %twelth partial
        + (0.0345740512.*amplitude .* sin(26.*pi.*f.*t)) ... %thirteenth partial
        + (0.0192987651.*amplitude .* sin(28.*pi.*f.*t)) ... %fourteenth partial
        + (0.0140386324.*amplitude .* sin(30.*pi.*f.*t)) ... %fifteenth partial
        + (0.0102938359.*amplitude .* sin(32.*pi.*f.*t)) ... %sixteenth partial
        + (0.0166338634.*amplitude .* sin(34.*pi.*f.*t)) ... %seventeenth partial
        + (0.0128019786.*amplitude .* sin(36.*pi.*f.*t)) ... %eighteenth partial
        + (0.00442408514.*amplitude .* sin(38.*pi.*f.*t)); %nineteenth partial
    x = x .* (1 + 0.1 .* sin(9.*pi.*t)); %volume vibrato
end

