# ECE45-project

 Audio synthesizer project created by ECE 45 students, written using the MATLAB language and MATLAB GUI
 
 ## Contributors
 Will add member names shortly
 
 ## Function Prototypes
Templates to create your own functions. Please commit code in either src/ or src/NotWorking.

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
