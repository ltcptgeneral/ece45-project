function x = generate_organ(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_ORGAN: returns a matrix of sampled waveform similar to
% an organ.

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
    f = frequency; %no frequency vibrato
    
    % generate proper fundamental and overtones
    x = (0.605975181.*amplitude .* sin(2.*pi.*f.*t)) ... %fundamental (first partial)
        + (0.96669476.*amplitude .* sin(4.*pi.*f.*t)) ... %second partial
        + (0.509982853.*amplitude .* sin(6.*pi.*f.*t)) ... %third partial
        + (amplitude .* sin(8.*pi.*f.*t)) ... %fourth partial
        + (0.138074341.*amplitude .* sin(10.*pi.*f.*t)) ... %fifth partial
        + (0.397744776.*amplitude .* sin(12.*pi.*f.*t)) ... %sixth partial
        + (0.00348745968.*amplitude .* sin(14.*pi.*f.*t)) ... %seventh partial
        + (0.350983754.*amplitude .* sin(16.*pi.*f.*t)) ... %eighth partial
        + (0.0326368101.*amplitude .* sin(18.*pi.*f.*t)) ... %ninth partial
        + (0.0121770467.*amplitude .* sin(20.*pi.*f.*t)) ... %tenth partial
        + (0.000406870296.*amplitude .* sin(22.*pi.*f.*t)) ... %eleventh partial
        + (0.0440001162.*amplitude .* sin(24.*pi.*f.*t)) ... %twelth partial
        + (0.00299340289.*amplitude .* sin(26.*pi.*f.*t)) ... %thirteenth partial
        + (0.00767241129.*amplitude .* sin(28.*pi.*f.*t)) ... %fourteenth partial
        + (0.00337121102.*amplitude .* sin(30.*pi.*f.*t)) ... %fifteenth partial
        + (0.0389432997.*amplitude .* sin(32.*pi.*f.*t)) ... %sixteenth partial
        + (0.00496963004.*amplitude .* sin(64.*pi.*f.*t)); %thirty-second partial
         %no volume vibrato
end

