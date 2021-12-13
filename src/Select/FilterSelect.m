%Written by Darell 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
%Pass-through function used by app

function output = FilterSelect(input,Fs,LOW,MED,HIGH,number)
    if(number == "IdealBandPass")
        output = DarellbandpassFilter(input,Fs,LOW,MED,HIGH);
    elseif(number == "AmplifyRange")
        output = amplifyFreqRange(input, Fs, LOW, MED, HIGH);
    elseif(number == "EpicEffect")
        output = epic_effect_schluep(input, Fs, LOW, MED, HIGH);
    elseif(number == "MuffledEffect")
        output = muffled_effect_schluep(input, Fs, LOW, MED, HIGH);
    elseif(number == "SeparatePrevalent")
        output = seperate_prevalent_schluep(input, Fs, LOW, MED, HIGH);
    elseif(number == "IdealBandReject")
        output = bandreject_filter(input, Fs, LOW, HIGH);
    elseif(number == "EnchanceTarget")
        output = AnuragEnhanceTarget(input, Fs, LOW, MED, HIGH);
    elseif(number == "DampenTarget")
        output = AnuragDampenTarget(input, Fs, LOW, MED, HIGH);
    elseif(number == "Distortion")
        if(LOW == 0)
            LOW = 1;
        end
        output = distortion_filter(input, Fs, LOW, MED, HIGH);
    else
        output = input;
    end
end 

