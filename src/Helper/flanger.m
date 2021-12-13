function output = flanger(input, time_delay, osc_freq, amp, Fs)


% DOCUMENTATION:
% FLANGER combines a single oscillating delayed signal with the original signal
% Interference between original and delayed signals create "flanging" effect
% Rocommedned delay time: 0-15 ms
% Recommended oscilating fequency: 0.1 - 5 Hz

% input: 1D array containing audio signal
% time_delay: maxinum value of the oscillating signal
% osc_freq: frequence of oscillation
% amp: amplitude of output signal
% fs: sampling frequency

% CONTRIBUTORS:
% Lance Zhu: Function Author

% SOURCES:
% Code inspired by information provided in:
% https://users.cs.cf.ac.uk/Dave.Marshall/CM0268/PDF/10_CM0268_Audio_FX.pdf


% create index array
len=length(input);
index=1:len;

% create reference wave to create oscillation
% taking only absoluted value for the reference wave
osc_wave = abs(sin(2*pi*index*(osc_freq/Fs)));
% convert delay in time to delay in samples
sample_delay=round(time_delay*Fs);
% create empty output array
output = zeros(1, len);

% Generating delay for each sample from reference oscillation wave
% start loop at sample_delay to make sure delayed sample is from t>=0
for i=sample_delay:len
% i_delay: delay for current sample
i_delay=round(osc_wave(i)*sample_delay);
% combine delayed sample with original sample
output(i) = (amp*input(i))+amp*(input(i-i_delay));

end