function y = distortion_filter(input, fs, LOW, MED, HIGH)
    %Author: Jason Liang
    %input: 1D array representing the sound signal in the time domain
    %fs: sampling frequency
    %low: lower bound of frequencies
    %med: median of all frequencies
    %high: upper bound of frequencies
    %y: output signal 
    %This function distorts a signal based on the constant LOW; all
    %frequencies in between the specified range are clipped by the constant
    %LOW.
    
    len = length(input);
    f = fs*(-len/2:len/2-1)/len;
    
    outputW = fftshift(fft(input));
    for i = 1:length(outputW)
       if ((LOW < abs(f(i))) && HIGH > abs(f(i))) 
           outputW(i) = outputW(i) / LOW;
       end
    end
    y = real(ifft(fftshift(outputW)));
end
