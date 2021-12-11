function output = epic_effect_schluep(input, Fs, LOW, MED, HIGH)
% epic_effect_schluep: Outputs a more "epic" version of the input sound.
% This is done by amplifying low frequencies and by implementing a chorus
% effect. A chorus effect is created when multiple copies of sound delayed
% by a small, random amount are added to the original signal. Works best on
% songs with a stronger bassline.
% Try this function out with "Strong_Bassline.mp3".

% CONTRIBUTORS:
% Nicolas Schluep: Function Author

% DOCUMENTATION:
% input: The input sound in the time-domain.
% Fs: The sampling rate of the input signal. A typical value is 44100 Hz.
% HIGH: The maximum frequency the filter will amplify. A typical value for 
% this variable is 1000 Hz.

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
lowAmplifyFilter = zeros(1, length(inputFreq));

% Creating a filter which amplifies lower frequencies.
for i = 1:length(lowAmplifyFilter)
    if abs(F(i)) < HIGH
        lowAmplifyFilter(i) = 1.25;
    else
        lowAmplifyFilter(i) = 1.00;
    end
end

lowPassedInput = inputFreq .* lowAmplifyFilter; %Apply the "lowAmplifyFilter".
lowPassedInput = transpose(lowPassedInput);

% Adding the chorus effect.
realOutput = real(ifft(fftshift(lowPassedInput)));
output = realOutput;

% Adding 100 randomly delayed signals to the original signal which creates the chorus effect.
for i = 1:100
    currentDelay = 0.003 * rand();  % The current delay of the sound in seconds.
    currentIndex = round(currentDelay * Fs);    % Find the first index where the sound should start playing.
    delayedOutput = [zeros(currentIndex, 1); realOutput];      % Adds "currentIndex" zeros to the front of the 
    % "realOutput" vector to create a slightly delayed version of the signal.
    delayedOutput = delayedOutput(1:length(realOutput));    % Truncates the "delayedOutput"
    % vector so that it can be added to the "realOutput" vector.
    output = output + delayedOutput; 
end

output = output ./ 100;     % Divide by 100 to decrease the amplitude of the sound to a normal level.

output = transpose(output);

end