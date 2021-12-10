%Written by Darell 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
%Pass-through function used by app

function output = PitchEnvelopeSelect(input, Fs, attack,decay,sustain,release,number)
    if(number == "Logarithmic")
        output = DarellAnnePitchEnvelope(input, Fs, attack,decay,sustain,release);
    elseif(number == "Linear")
        output = DarellAnneLinearPitchEnvelope(input, Fs, attack,decay,sustain,release);
    else
        output = input;
    end
end 

