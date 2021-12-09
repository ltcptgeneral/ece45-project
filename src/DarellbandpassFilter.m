%Written by Darell 
%uses fourier transform to get the series of all signals

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
% fs is the sampling frequency
% y is the signal input
% LOW and HIGH are used for the band of frequency
% MEDIUM IS NOT USED

function output_y = DarellbandpassFilter(y,Fs,LOW,MED,HIGH)
    Len = length(y);
    F = Fs * (-Len/2 : (Len/2 - 1))/Len ;
    Mod_Freq = fftshift(fft(y));
    lenf = length(F);
    output =  zeros([1,lenf]); % zero array of size Mod_freq
    
    for n = 1:lenf
        if ((LOW < abs(F(n))) && HIGH > abs(F(n)))
            output(n) = 1;
        else
            output(n) = 0;
        end
    end
        
    filtered_Mod_Freq = fftshift(Mod_Freq .* output);
    output_y = real(ifft(filtered_Mod_Freq));
    
end