# ECE45-project

 Audio synthesizer project created by ECE 45 students, written using the MATLAB language and MATLAB GUI
 
 ## Contributors
 ```
Anne Lin: The various pitch envelope functions could be incorporated into apps that have sound warping functionality. This could include apps such as Snapchat or TikTok where they have various filters that can warp one’s voice for a certain amount of time.

Anurag Jadhav: “AnuragEnhanceTarget.m” and “AnuragDampenTarget.m” could be helpful for enhancing a specific range or ignoring a range of frequencies. For example, if you were looking to present an animal’s calls in a recording of a forest, and you knew they were in a certain range, you could use the enhance filter to enhance only that specific range to present the animal’s calls while still maintaining the forest ambience.

Ben(Han) Zhang: The  “generate_sawtooth.m” and “lfo_sawtooth.m” can be called to use as a sawtooth oscillator and modify waves in sawtooth. The sounds created by sawtooth waves are widely used in electro music and sound effects. The sound created through sawtooth wave creation and modulation cannot be recreated through regular music instruments, giving artists a new “instrument”. 

Benjamin Liou: Our synthesizer can be used to generate cool sounds for electronic music. For music, frequencies should be within the human range of hearing, which is around 20 Hz to 20 kHz. generate_white.m can be used to generate white noise for creating drum beats and also to help some people go to sleep. add_sine.m is powerful because it allows us to custom build different periodic functions besides square and triangle waves. lfo_sine.m adds vibrato for music but can also be repurposed to modulate signals for broadcasting.

Darell Chua Yun Da: The potential application to the numerous functions that I wrote would be that I could create an automatic music creating machine. This could be useful because one could generate virtually any combination of sounds as long as they have one sample of each instrument they want to use. Changes in frequency and volume can all be customized with a comprehensive synthesizer app.

Neelay Joglekar: “lfo_freq_sine.m,” “lfo_freq_saw.m,” and “lfo_freq_square.m” can be used to easily make vibrato and the oscillating sounds often used in electronic music, such as the base wobble.

Nicolas Schluep: The  “epic_effect_schluep.m”, “muffled_effect_schluep.m”, and “seperate_prevalent_schluep.m” functions can all be used to quickly modify audio. While the “epic_effect_schluep.m” and “muffled_effect_schluep.m” would probably only be used on Instagram or Snapchat filters, the “seperate_prevalent_schluep.m” could legitimately be helpful for listening to only the bassline of a song, for example.

Ryan Goh: The “generate_keyboard” function would be useful if the user wants to replicate the sound of a digital keyboard. They would be able to play sound waves that sound like a keyboard and apply any of the other filters onto the sound.

Yalu Ouyang: fade_in() and fade_out() functions can be used to create the intro and outro of a video or a piece of audio. The bandreject_filter() function is also massively useful in eliminating from a piece of audio/video the middle-ranged frequencies whilst keeping the lower and higher frequencies intact.
```
 
 ## Function Prototypes
Templates to create your own functions. Please commit code in either src/ (the base directopry) or src/NotWorking (please dont commit in any other subfolder).

 ### Wave generating function
```
function x = generate_WAVENAME(amplitude, frequency, phase, fs, duration, duty)
% GENERATE_WAVENAME: returns a matrix of sampled WAVENAME wave

% CONTRIBUTORS:
% Person1: how you contributed
% Person2: how you contributed
% etc

% DOCUMENTATION:
% phase shift is in number of periods
% fs is the sampling frequency: how many sample points per second
% duration is time in seconds
% duty is a number between 0 and 1

    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    dt = 1 / fs; % sampling period: time between two sample points
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate the matrix
    for i = 1:n
        YOUR CODE HERE
    end
end
```
NOTE: duty does not apply to some functions (such as sinusoids)

 ### Envelope function
```
function x = envelope(input, fs, period, attack , decay, sustain, release)
```
where attack, decay, release are percentages between 0 to 1 of the period
sustain is the percentage of the amplitude it should sustain for
**envelope can be pitch or amplitude envelope**


### Filter function
```
function  output_timedomain = Filter(input_soundin_timedomain, Fs, LOW, MED, HIGH) 
```
where LOW, MED, HIGH are user-selected variables of any value. 
**output should be in time domain for all functions (new sound)**
 
 ## Useful websites
 
 - [Learning Synths](https://learningsynths.ableton.com)
 - [Learning Synths Playground](https://learningsynths.ableton.com/en/playground)
 - [DIY Synthesisers](https://blog.demofox.org/diy-synthesizer/)
 - [Port Audio (audio I/O library)](http://portaudio.com/)
 - [Synthesis ToolKit in C++](https://ccrma.stanford.edu/software/stk/)
 - [Max](https://cycling74.com/products/max)
 - [Software by Miller Puckette](http://msp.ucsd.edu/software.html)
