# ECE45-project

 Audio synthesizer project created by ECE 45 students, written using the MATLAB language and MATLAB GUI
 
 Will add member names shortly
 
 ## Function Prototypes
 
function x = generate_wave(amplitude, frequency, phase, fs, duration, duty)
 
fuction x = envelope(input, fs, period, attack , decay, sustain, release)
where attack, decay, release are percentages between 0 to 1 of the period
sustain is the percentage of the amplitude it should sustain for
**envelope can be pitch or amplitude envelope**

function  output_timedomain = Filter(input_soundin_timedomain, Fs, LOW, MED, HIGH) 
where LOW, MED, HIGH are user-selected variables of any value. 
**output should be in time domain for all functions (new sound)**
 
 ## Useful websites
 
 - https://learningsynths.ableton.com
 - https://learningsynths.ableton.com/en/playground
 - https://blog.demofox.org/diy-synthesizer/
 - http://portaudio.com/
 - https://ccrma.stanford.edu/software/stk/
 - https://cycling74.com/products/max
 - http://msp.ucsd.edu/software.html
