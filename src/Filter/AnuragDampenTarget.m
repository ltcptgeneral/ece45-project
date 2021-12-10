function output_x = AnuragDampenTarget(x, Fs,LOW, MID, HIGH) 
%Dampen a range of frequencies a percentage around the target frequency
%Also maintain the other frequencies so that the target is muted
%percentage is expressed as a number between 0 and 1.
%target is the midpoint of the frequency range to dampen
%x and Fs are the signal and frequency
% CONTRIBUTORS:
% Anurag Jadhav: function creator

%   Detailed explanation goes here
    TARGET = MID;
    AreaPercentage = 0.15;
    [dim,len] = size(x); %get length of the input
    F = Fs * ((-len/2) : ((len/2) - 1)) / len;
    lenf = length(F);
    Mod_Freq = ifft(fft(x)); %Fourier Transform of the input signal
    output =  zeros([1,lenf]); % zero array of size Mod_freq
    if(dim == 2) %check for dual channel audio
       F = [F;F]; 
       output = [output;output];
    end
    %set the bounds
    lowerBound = (1-AreaPercentage) * TARGET;
    upperBound = (1+AreaPercentage) * TARGET;
%% Dampen the target frequencies and maintain the others
    if(dim == 2) %iterate through both channels if track is dual channel
        for n = 1:lenf
            if ((lowerBound < abs(F(1,n))) && abs(F(1,n)) < upperBound)
              output(1,n) = 1;
            else
              output(1,n) = 0.5;
            end
        end
        for n = 1:lenf
            if ((lowerBound < abs(F(2,n))) && abs(F(2,n)) < upperBound)
              output(2,n) = 1;
            else
              output(2,n) = .5;
            end
        end
    else %iterate onnly once for monochannel
        for n = 1:lenf
            if ((lowerBound < abs(F(n))) && abs(F(n)) < upperBound)
                output(n) = 1;
            else
                output(n) = .5;
            end
        end
    end
%%Filter the original signal and transform 
    filtered_Mod_Freq = fftshift(Mod_Freq .* output);
    output_x = real(ifft(filtered_Mod_Freq));

end