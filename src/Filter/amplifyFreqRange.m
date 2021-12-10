function output = amplifyFreqRange(input, fs, low, high, multiplier)
    %Amplifies frequencies within a specified range, leaves all other
    %frequencies the same.
    %By Conner Hsu
    
    %input: 1D array representing the sound signal in the time domain
    %fs: sampling frequency
    %low: a scalar representing the lower bound of frequencies to be amplified
    %high: a scalar representing the upper bound of frequencies to be amplified
    %multiplier: a scalar that multiplies frequencies between low and high
    %Returns modified signal in the time domain.
    
    len = length(input);
    f = fs*(-len/2:len/2-1)/len;
    
    outputW = fftshift(fft(input));
    for i = 1:length(outputW)
       if (low < abs(f(i)) && abs(f(i)) < high)
           outputW(i) = outputW(i)*multiplier;
       end
    end
    output = real(ifft(fftshift(outputW)));
end