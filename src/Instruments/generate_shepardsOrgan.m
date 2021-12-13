function x = generate_shepardsOrgan(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_SHEPARDSORGAN: returns a matrix of sampled waveform similar to
% an organ, doubled at octaves.
% Calls generate_organ

% CONTRIBUTORS:
% Brandon Roberts: Original author
% MuseScore: Reference source for overtone information

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty does not apply for instruments
    
    % generate proper tone
    x = generate_organ(amplitude/8, frequency/128, phase, fs, duration, duty) ... %7 octaves below
        + generate_organ(amplitude/7, frequency/64, phase, fs, duration, duty) ... %6 octaves below
        + generate_organ(amplitude/6, frequency/32, phase, fs, duration, duty) ... %5 octaves below
        + generate_organ(amplitude/5, frequency/16, phase, fs, duration, duty) ... %4 octaves below
        + generate_organ(amplitude/4, frequency/8, phase, fs, duration, duty) ... %3 octaves below
        + generate_organ(amplitude/3, frequency/4, phase, fs, duration, duty) ... %2 octaves below
        + generate_organ(amplitude/2, frequency/2, phase, fs, duration, duty) ... %1 octave below
        + generate_organ(amplitude, frequency, phase, fs, duration, duty) ... %unison
        + generate_organ(amplitude/2, frequency*2, phase, fs, duration, duty) ... %1 octave above
        + generate_organ(amplitude/3, frequency*4, phase, fs, duration, duty) ... %2 octaves above
        + generate_organ(amplitude/4, frequency*8, phase, fs, duration, duty) ... %3 octaves above
        + generate_organ(amplitude/5, frequency*16, phase, fs, duration, duty) ... %4 octaves above
        + generate_organ(amplitude/6, frequency*32, phase, fs, duration, duty) ... %5 octaves above
        + generate_organ(amplitude/7, frequency*64, phase, fs, duration, duty) ... %6 octaves above
        + generate_organ(amplitude/8, frequency*128, phase, fs, duration, duty); %7 octaves above
end

