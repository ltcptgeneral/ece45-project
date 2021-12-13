function x = generate_lullaby(amplitude, frequency, phase, fs, duration, duty)
    % Generates sine waves that play 'twinkle twinkle little star' 
    % by using the frequency parameter as the root note for the melody.
    % Currently the duty and duration parameters are not used within the
    % function as there is no need for the former and it is currently
    % difficult to constrain the melody duration based on user input.
    % A function such as this one could be useful as a demo for what a
    % melody sounds like on a synthesizer, and could even find use
    % in toys designed to help small children sleep.

    % CONTRIBUTORS:
    % generate_lullaby created by Gabriel Diaz

    % DOCUMENTATION:
    % phase shift is in number of periods
    % fs is the sampling frequency: how many sample points per second
    % duration is time in seconds
    % duty is a number between 0 and 1

    %NOTE: whatever's passed as the duration parameter doesn't get used at
    %the moment, since it's currently difficult to sync every note in the
    %melody to play in shorter duartions such that the entire song lasts about
    %as long as 'duration'
    duration = 0;
    duty = 0; %duty also isn't used in this function

    %current durations that the song will work with
    note_duration = 0.4;
    song_duration = note_duration * 48;

    %frequency multiples for all notes in melody, assuming that frequency is
    %the root note of this chord:
    maj_second_freq = frequency * 1.125;
    maj_third_freq = frequency * 1.25;
    fourth_freq = frequency * 1.33;
    fifth_freq = frequency * 1.5;
    maj_sixth_freq = frequency * 1.7;

    % initialize local variables from input arguments
    n = fs * note_duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    t = [1:n].*dt - phase; %initialize time scale template

    %sine waves for every note in 'frequency's' respective major scale: 
    first = amplitude * sin(2 * pi * frequency * t - phase);
    second = amplitude * sin(2 * pi * maj_second_freq * t - phase);
    third = amplitude * sin(2 * pi * maj_third_freq * t - phase);
    fourth = amplitude * sin(2 * pi * fourth_freq * t - phase);
    fifth = amplitude * sin(2 * pi * fifth_freq * t - phase);
    sixth = amplitude * sin(2 * pi * maj_sixth_freq * t - phase);

    %each one of the three melodies making up the song:
    melody1 = [first,first,fifth,fifth,sixth,sixth,fifth,fifth]; %size 8 notes
    melody2 = [fourth,fourth,third,third,second,second,first,first]; %size 8 notes
    melody3 = [fifth,fifth,fourth,fourth,third,third,second,second]; %size 8 notes

    % populate the matrix(total size is 44 notes wide, which means the song's
    % duration must fit within the specified duration parameter
    x = [melody1,melody2,melody3,melody3,melody1,melody2];

    %For testing
    %t = 0:dt:song_duration;
    %t(n) = [];
    %plot(t, x);
    %sound(x, fs);
end