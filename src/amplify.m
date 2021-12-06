function output = amplify(input, multiplier)
    %input: a 1D array representing the sound signal in the time domain
    %multiplier: a scalar that multiplier all values in the input array to
    %            amplify or decrease the volume.
    %Returns: input signal scaled by the multiplier in the time domain.
    %Author: Conner Hsu
    output = input*multiplier;
end