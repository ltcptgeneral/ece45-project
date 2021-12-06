%Written by Darell and Anne

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
        output(tcounter)
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