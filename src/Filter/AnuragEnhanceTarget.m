function output_x = AnuragEnchanceTarget(x, Fs,LOW, MID, HIGH) 
%Amplify a range of frequencies a percentage around the target frequency
%Also damnpen the other frequencies so that the target is easier to hear
%percentage is expressed as a number between 0 and 1.
%target is the midpoint of the frequency range to amplify
%x and Fs are the signal and frequency
% CONTRIBUTORS:
% Anurag Jadhav: function creator

%   Detailed explanation goes here
    TARGET = MID;
    AreaPercentage = 0.15;
    len = length(x); %get length of the input
    F = Fs * ((-len/2) : ((len/2) - 1)) / len;
    lenf = length(F);
    Mod_Freq = fftshift(fft(x)); %Fourier Transform of the input signal
    output =  zeros([1,lenf]); % zero array of size Mod_freq

    %set the bounds
    lowerBound = (1-AreaPercentage) * TARGET;
    upperBound = (1+AreaPercentage) * TARGET;
%% Amplify the target frequencies and dampen the others
    for n = 1:lenf
        if ((lowerBound < abs(F(n))) && abs(F(n)) < upperBound)
            output(n) = 2;
        else
            output(n) = 0.75;
        end
    end
%%Filter the original signal and transform 
    filtered_Mod_Freq = fftshift(Mod_Freq .* output);
    output_x = real(ifft(filtered_Mod_Freq));

end