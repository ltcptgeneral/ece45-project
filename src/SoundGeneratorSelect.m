function output = SoundGeneratorSelect(amplitude, frequency, phase, fs, duration, duty,number)
    if(number == "Option 1")
        output = generate_sine(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Option 2")
        output = generate_square(amplitude, frequency, phase, fs, duration, duty);
    elseif(number == "Option 3")
        output = generate_triangle(amplitude, frequency, phase, fs, duration, duty);
    
    else
        output = 0;
    end
end 

