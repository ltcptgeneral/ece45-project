%Written by Darell and Anne
%If there is a frequency of 200Hz:
%1. it needs to ramp up a frequency from 0Hz to the 200Hz over the attack time
%2. It needs to ramp down to a set sustained frequency over the decay time e.g. 160Hz < 200Hz
%3. It maintains this 160Hz until the release time
%4. Release time: It decays from 160Hz further all the way back to 0Hz. 
%This envelope uses linear calculations

% CONTRIBUTORS:
% Person1: Darell
% Person2: Anne

% DOCUMENTATION:
% fs is the sampling frequency
% attack, decay, release are in percentages of the period
% sustain is in the percentage of amplitude

function output = DarellAnneLinearPitchEnvelope(input, Fs, attack,decay,sustain,release) %percentages for attack, decay, sustain, release
    len = length(input);
    T = (len-1)/Fs;
    attacktime = attack * T * Fs;
    decaytime = attacktime + decay * T * Fs;
    sustaintime = (T - (release * T)) * Fs;
    
    output =  zeros([1,len]); 
    
    tcounter = 1;
    %attack phase
    curr = attacktime;
    x = 1:len;
    y = x .* 0;
    g = x .* 0;
    while tcounter <= curr
        ncount = round((tcounter^2)/(2*curr)+ curr/2);
        y(tcounter) = ncount; %For Debug Purposes
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end
    
    %decay phase
    prevcur = curr;
    tcounter = prevcur;
    curr = decaytime;
    while tcounter <= curr
      
        t = round(tcounter-prevcur);
        dur = round(curr-prevcur);
        dsus = (1-sustain);
        
        dn = (1 - (dsus)*t/(2*dur))*t;
        ncount = round(prevcur + dn);
        tcounter = round(tcounter);
        
        y(tcounter) = ncount; %For Debug Purposes
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end
    hold on
    plot(x,y)
    plot(x,g)
    hold off
    %sustain phase
    prevncount = ncount;
    prevcur = curr;
    tcounter = prevcur;
    curr = sustaintime;
    while tcounter <= curr
        t = round(tcounter-prevcur);
        ncount = round(sustain*(t) + prevncount);
        tcounter = round(tcounter);
        
        y(tcounter) = ncount; %For Debug Purposes
        output(tcounter) = input(ncount);
        tcounter = tcounter+1;
    end

    %release phase
    prevncount = ncount;
    prevcur = curr;
    tcounter = prevcur;
    curr = Fs;
    while tcounter <= curr
        t = round(tcounter-prevcur);
        dur = round(curr-prevcur);
        
        dn = (sustain - (sustain)*t/(2*dur))*t;
        ncount = round(prevncount + dn);
        
        %ncount = round(prevncount + ((curr-prevcur)*(tcounter-prevcur)/(curr))*(1-log(tcounter+1-prevcur)/log(curr-prevcur)));
        
        %ncount = round(curr*(1-log(tcounter)/log(prevcur)) + prevncount);
        
        tcounter = round(tcounter);
        y(tcounter) = ncount; %For Debug Purposes
        if ncount > len
            output(tcounter) = 0;
        else
            output(tcounter) = input(ncount);
        end
        tcounter = tcounter+1;
    end
    plot(x,y) %For Debug Purposes
end