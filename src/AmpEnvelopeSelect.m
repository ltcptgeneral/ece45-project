function output = AmpEnvelopeSelect(input, Fs, attack,decay,sustain,release,number)
    if(number == "Option 1")
        output = DarellAmplitudeEnvelope(input, Fs, attack,decay,sustain,release);
    else
        output = input;
    end
end 

