function output = Equalizer_Darell(input,EQplot,Fs)
%It's an EQ written by Darell
%   Split into frequencies and multiply by EQ 
    Mod_Freq = fftshift(fft(input));
    filtered_Mod_Freq = fftshift(Mod_Freq .* EQplot);
    output = real(ifft(filtered_Mod_Freq));
    %plot(output);
end

