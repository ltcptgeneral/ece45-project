%Written by Darell, edited by Arthur Lu

% CONTRIBUTORS:
% Person1: Darell
% Person2: Arthur Lu

% DOCUMENTATION:
%Pass-through function used by app

function output = SoundGeneratorSelect(amplitude, frequency, phase, fs, duration, duty,number)
    if(number == "Sine")
        output = generate_sine(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Square")
        output = generate_square(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Triangle")
        output = generate_triangle(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Sawtooth")
        output = generate_sawtooth(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "WhiteNoise")
        output = generate_white(amplitude, fs, duration);
    elseif(number == "HalfCircle")
        output = generate_halfCircles(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Trapezoid")
        output = generate_trapezoid(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Pulse")
        output = generate_pulse(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Cosine")
        output = generate_cosine(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Heartbeat")
        output = generate_heartbeat(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Harmonics")
        u = floor(phase);
        o = floor(duty);
        undertones = zeros(1, u);
        overtones = zeros(1, o);
        for i=1:u
            undertones(i) = 1/i;
            overtones(i) = i;
        end
        harmonics = [undertones, overtones];
        output = add_sine(amplitude, frequency, harmonics, fs, duration);

    % instruments:
    elseif(number == "ArcoStrings")
        output = generate_arcoStrings(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Bassoon")
        output = generate_bassoon(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Clarinet")
        output = generate_clarinet(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Flute")
        output = generate_flute(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Horn")
        output = generate_horn(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Oboe")
        output = generate_oboe(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Organ")
        output = generate_organ(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Saxophone")
        output = generate_saxophone(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "ShepardsCarillon")
        output = generate_shepardsCarillon(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "ShepardsOrgan")
        output = generate_shepardsOrgan(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "ShepardsStrings")
        output = generate_shepardsStrings(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Trumpet")
        output = generate_trumpet(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "TubularBells")
        output = generate_tubularBells(amplitude, frequency, phase, fs, duration, duty);

    elseif(number == "Keyboard")
        output = generate_keyboard(amplitude, frequency, phase, fs, duration, duty);
    else
        output = zeros(1, fs * duration);
    end
end