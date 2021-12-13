%Written by Darell 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
%Pass-through function used by app

function output = LFOSelect(amplitude, frequency, phase, fs, duration, input,number)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(number == "AmplitudeSine")
        output = lfo_sawtooth(amplitude, frequency, phase, fs, duration, input);
    elseif(number == "AmplitudeSquare")
        output = lfo_square(amplitude, frequency, phase, fs, duration, input);
    elseif(number == "AmplitudeSawtooth")
        output = lfo_sine(amplitude, frequency, phase, fs, duration, input);
    
    elseif(number == "FrequencySine")
        output = lfo_freq_sine(amplitude, frequency, phase, fs, duration, input);
    elseif(number == "FrequencySquare")
        output = lfo_freq_square(amplitude, frequency, phase, fs, duration, input);
    elseif(number == "FrequencySawtooth")
        output = lfo_freq_saw(amplitude, frequency, phase, fs, duration, input);
    else
        output = input;
    end
end

