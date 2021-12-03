%Basic Example test 
%Written by Darell
amplitude = 1;
frequency = 200;
phase = 0;
fs = 44800;
duration = 1;
duty = 0;

%example Sine Generation
x = generate_sine(amplitude, frequency, phase, fs, duration, duty);
x = x + generate_sine(amplitude, (frequency+5), phase, fs, duration, duty);

%play over 5 counts, should hear both frequencies, 5 beats per second between the 2 frequencies
playtime = 5;
play_continuous(x, fs, playtime)

LOW = 0;
HIGH = frequency + 1;
MED = "unused";
x = DarellbandpassFilter(x,fs,LOW,MED,HIGH);

%play over 5 counts, should only hear 200hz
playtime = 5;
play_continuous(x, fs, playtime)

attack = 0.2;
decay = 0.2;
sustain = 0.2;
release = 0.1;

x = DarellAmplitudeEnvelope(x, fs, attack,decay,sustain,release); %output new sound in time domain
%play over 5 counts, should only hear 200hz
playtime = 5;
play_continuous(x, fs, playtime)

