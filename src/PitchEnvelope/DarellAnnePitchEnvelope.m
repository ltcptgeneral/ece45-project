%Written by Darell and Anne
%If there is a frequency of 200Hz:
%1. it needs to ramp up a frequency from 0Hz to the 200Hz over the attack time
%2. It needs to ramp down to a set sustained frequency over the decay time e.g. 160Hz < 200Hz
%3. It maintains this 160Hz until the release time
%4. Release time: It decays from 160Hz further all the way back to 0Hz. 
%This envelope uses logarithmic calculations

% CONTRIBUTORS:
% Person1: Darell
% Person2: Anne

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty is a number between 0 and 1


function output = DarellAnnePitchEnvelope(input, Fs, attack,decay,sustain,release) %percentages for attack, decay, sustain, release
    len = length(input);
    T = (len-1)/Fs;
    attacktime = attack * T * Fs;
    decaytime = attacktime + decay * T * Fs;
    sustaintime = (T - (release * T)) * Fs;
    
    output =  zeros([1,len]); 
    
    tcounter = 1;
    %attack phase
    curr = attacktime;
    while tcounter <= curr
        ncount = round(curr*log(tcounter)/log(curr)+1);
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end
    
    %decay phase
    prevcur = curr;
    tcounter = prevcur;
    curr = decaytime;
    while tcounter <= curr
        ncount = round(sustain*curr*(1-log(tcounter)/log(prevcur)) + prevcur);
        tcounter = round(tcounter);
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end
    
    %sustain phase
    prevncount = ncount;
    prevcur = curr;
    tcounter = prevcur;
    curr = sustaintime;
    while tcounter <= curr
        ncount = round(sustain*(tcounter - prevcur) + prevncount);
        tcounter = round(tcounter);
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end

    %release phase
    prevncount = ncount;
    prevcur = curr;
    tcounter = prevcur;
    curr = Fs;
    while tcounter <= Fs
        ncount = round(curr*(1-log(tcounter)/log(prevcur)) + prevncount);
        tcounter = round(tcounter);
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end

end
