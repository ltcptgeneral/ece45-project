function x = generate_shepardsCarillon(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SHEPARDSCARILLON: returns a matrix of sampled waveform similar to
% tubular bells, doubled at octaves.
% Calls generate_tubularBells

% CONTRIBUTORS:
% Brandon Roberts: Original author
% MuseScore: Reference source for overtone information

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty does not apply for instruments
    
    % generate proper tone
    x = generate_tubularBells(amplitude/5, frequency/16, phase, fs, duration, duty) ... %4 octaves below
        + generate_tubularBells(amplitude/4, frequency/8, phase, fs, duration, duty) ... %3 octaves below
        + generate_tubularBells(amplitude/3, frequency/4, phase, fs, duration, duty) ... %2 octaves below
        + generate_tubularBells(amplitude/2, frequency/2, phase, fs, duration, duty) ... %1 octave below
        + generate_tubularBells(amplitude, frequency, phase, fs, duration, duty) ... %unison
        + generate_tubularBells(amplitude/2, frequency*2, phase, fs, duration, duty) ... %1 octave above
        + generate_tubularBells(amplitude/3, frequency*4, phase, fs, duration, duty) ... %2 octaves above
        + generate_tubularBells(amplitude/4, frequency*8, phase, fs, duration, duty) ... %3 octaves above
        + generate_tubularBells(amplitude/5, frequency*16, phase, fs, duration, duty); %4 octaves above
end

