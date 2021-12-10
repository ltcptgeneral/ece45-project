%Written by Darell 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
%Pass-through function used by app

function output = LFOSelect(amplitude, frequency, phase, fs, duration, input,number)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(number == "Option 1")
        output = lfo_sawtooth(amplitude, frequency, phase, fs, duration, input);
    elseif(number == "Option 2")
        output = lfo_sine(amplitude, frequency, phase, fs, duration, input);
    else
        output = input;
    end
end

