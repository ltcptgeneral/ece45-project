function output = muffled_effect_schluep(input, Fs, LOW, MED, HIGH)
% muffled_effect_schluep: Outputs a muffled version of the the original input
% sound in the time domain. This makes it sound as if the audio is being 
% played in another room.
% Try this function out with "Strong_Bassline.mp3".

% CONTRIBUTORS:
% Nicolas Schluep: Function Author

% DOCUMENTATION:
% input: The input sound in the time-domain.
% Fs: The sampling rate of the input signal. A typical value is 44100 Hz.
% HIGH: The maximum frequency that the low-pass filter will let pass. A
% typical value for this variable is 1000 Hz.

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
lowPassFilter = zeros(1, length(inputFreq));

% Creating Low Pass Filter
for i = 1:length(lowPassFilter)
    if abs(F(i)) < HIGH
        lowPassFilter(i) = 1;
    else
        lowPassFilter(i) = 0;
    end
end

lowPassedInput = inputFreq .* lowPassFilter; %Apply the low-pass filter.
lowPassedInput = transpose(lowPassedInput);

% Adding a slight reverb effect.
realOutput = real(ifft(fftshift(lowPassedInput)));

delay = 0.001;     % The delay of the sound in seconds.
index = round(delay*Fs);    % Find the first index where sound should start playing
% by multiplying the delay by the sampling frequency.
delayedOutput = [zeros(index, 1); realOutput];      % Adds "index" zeros to the front of the 
% "realOutput" vector to create a slightly delayed version of the signal.
delayedOutput = delayedOutput(1:length(realOutput));    % Truncates the "delayedOutput"
% vector so that it can be added to the "realOutput" vector.

output = (realOutput + delayedOutput) ./ 2.0;    % Adds the "realOutput" and "delayedOutput"
% vectors to create a reverb effect. Divides by 2 to avoid clipping
% effects.

output = transpose(output);

end





