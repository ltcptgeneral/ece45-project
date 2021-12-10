%Written by Darell 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
%Pass-through function used by app

function output = FilterSelect(input,Fs,LOW,MED,HIGH,number)
    if(number == "Option 1")
        output = DarellbandpassFilter(input,Fs,LOW,MED,HIGH);
    elseif(number == "Option 2")
        output = amplifyFreqRange(input, Fs, LOW, MED, HIGH);
    elseif(number == "Option 3")
        output = epic_effect_schluep(input, Fs, LOW, MED, HIGH);
    elseif(number == "Option 4")
        output = muffled_effect_schluep(input, Fs, LOW, MED, HIGH);
    elseif(number == "Option 5")
        output = seperate_prevalent_schluep(input, Fs, LOW, MED, HIGH);
    elseif(number == "Option 6")
        output = bandreject_filter(input, Fs, LOW, HIGH);
    elseif(number == "Option 7")
        output = AnuragEnhanceTarget(input, Fs, LOW,MID, HIGH);
    elseif(number == "Option 8")
        output = AnuragDampenTarget(input, Fs, LOW,MID, HIGH);
    else
        output = input;
    end
end 

