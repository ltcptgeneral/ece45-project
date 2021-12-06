function output = PitchEnvelopeSelect(input, Fs, attack,decay,sustain,release,number)
    if(number == "Option 1")
        output = DarellAnnePitchEnvelope(input, Fs, attack,decay,sustain,release);
    else
        output = input;
    end
end 

