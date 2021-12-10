%Written by Darell
%Creates a Linear Amplitude Envelope 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
% fs is the sampling frequency
% attack, decay, release are in percentages of the period
% sustain is in the percentage of amplitude

function output = DarellAmplitudeEnvelope(input, Fs, attack,decay,sustain,release) %percentages for attack, decay, sustain, release
    len = length(input);
    T = (len-1)/Fs;
    attacktime = attack * T * Fs;
    decaytime = attacktime + decay * T * Fs;
    sustaintime = (T - (release * T))* Fs;
    
    x = 0:1/Fs:T;
    y = 0 .* x; %create zero array of y of len x
    output = y;%create zero array of output of len x
    tcounter = 1;
    %attack phase
    while tcounter <= attacktime
        y(tcounter) = (1/attacktime) * tcounter;
        tcounter = tcounter+1;
    end
    istart = tcounter;
    while tcounter<= decaytime
        y(tcounter) = 1 - (((1-sustain)/(decay * T * Fs)) * (tcounter - istart));
        tcounter = tcounter+1;
    end

    while tcounter<= sustaintime
        y(tcounter) = sustain;
        tcounter = tcounter+1;
    end
    istart = tcounter;
    while tcounter < (T * Fs)
        y(tcounter) = sustain - ((sustain/(release * T * Fs)) * (tcounter - istart));
        tcounter = tcounter+1;
    end
    
    for counter = 1:1:len
        output(counter) = y(counter) * input(counter);
    end
    
end