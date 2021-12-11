function output = seperate_prevalent_schluep(input, Fs, LOW, MED, HIGH)
% seperate_prevalent_schluep: Attempts to seperate the most prevalent frequencies
% from the input sound by finding the most prevalent frequencies and applying
% a band-pass filter to a small region around those frequencies.
% Try this function out with "Strong_Bassline.mp3".

% CONTRIBUTORS:
% Nicolas Schluep: Function Author

% DOCUMENTATION:
% input: The input sound in the time-domain.
% Fs: The sampling rate of the input signal. A typical value is 44100 Hz.
% HIGH: The maximum distance around the maximum frequency value that will
% not be attenuated. A good range of values is usually 250-500 Hz, but it
% depends on the input sound.

n = size(input, 2);

non_stereophonic = input;

if (n == 1) || (n == 2) 
    non_stereophonic = input(:, 1);     % Removes the sterophonic property of the input sound
    % by just taking the first column of data.
    non_stereophonic = transpose(non_stereophonic); 
end

modified_input = non_stereophonic(1, :);

Len = length(modified_input);
F = Fs * ((-Len/2) : ((Len/2) - 1)) / Len;  % Creating the array of frequencies
% which the FFT Shifted version of the signal can be plotted against.
inputFreq = fftshift(fft(modified_input));   % Creates the Fourier Transform of the
% input signal. fftshift() makes it such that the zero frequency is at the 
% center of the array.
bandPassFilter = zeros(1, length(inputFreq));

maxAmplitude = 0;
mostPrevalentFrequency = 0;

% Finding the most prevalent frequency.
for i = round(length(inputFreq)/2):length(inputFreq)
    if inputFreq(i) > maxAmplitude
        maxAmplitude = inputFreq(i);
        mostPrevalentFrequency = F(i);
    end
end

% Determining maximum and minimum frequency values for the Band Pass filter.
maxFrequency = mostPrevalentFrequency + HIGH;
minFrequency = mostPrevalentFrequency - HIGH;

if minFrequency < 0.0
    minFrequency = 0.0;
end

% Creating the Band-Pass filter.
for i = 1:length(bandPassFilter)
    if (abs(F(i)) < maxFrequency) && (abs(F(i)) > minFrequency)
        bandPassFilter(i) = 1;
    else
        bandPassFilter(i) = 0;
    end
end

bandPassedInput = inputFreq .* bandPassFilter; %Apply the Band-Pass Filter.

output = real(ifft(fftshift(bandPassedInput)));

end



    
