# ECE45-project

 Audio synthesizer project created by ECE 45 students, written using the MATLAB language and MATLAB GUI. Refer to the [writeup](https://docs.google.com/document/d/e/2PACX-1vRtwPITEnNgeDQYebnDpnPfZVANtMwlxmwCSED1xUDSGX1I5sZoGS-eaei-uj1CBg5ASOSuldcZhKPa/pub) for more information and usage guidelines.
 
 The project has been submitted, and the repository has been archived. Great work everyone!
 
 ## Contributors
 Brief summary of contributors and their contributions. 

Anne Lin: I co-authored “DarellAnneLinearPitchEnvelope.m” and “DarellAnnePitchEnvelope.m” with Darell. The pitch envelope ramps up the frequency from 0Hz to the desired frequency over the attack time. The frequency is then ramped down to a sustainable frequency (such as 160Hz). The sustainable frequency is maintained until the release time. At the release time, the frequency decays to 0Hz.  “DarellAnnePitchEnvelope.m” uses logarithmic calculations and  “DarellAnneLinearPitchEnvelope.m” uses linear calculations.

Anurag Jadhav: I authored “AnuragEnhanceTarget.m” and “AnuragDampenTarget.m”  which enhance or dampen a range of frequencies around the given frequencies while letting the other frequencies through the filter. 

Arthur Lu: I wrote the original code for generating the three general periodic functions we used frequently in class (generate_sine.m, generate_square.m, generate_triangle.m). These waves are fundamental to the synthesizer, and can be added together simply to create more complex waves. I also helped organize the github repository and helped integrate most student submissions into the GUI. 

Ben(Han) Zhang: I am the author of “generate_sawtooth.m” and “lfo_sawtooth.m”. The “generate_sawtooth.m” file is to create an input wave for the synthesizer to use and to create more complex waves. The “lfo_sawtooth.m” file is adding an lfo to modulate the parameter of the input wave in the synthesizer to also make the wave more complex and provide an opportunity to create more sounds. 

Benjamin Liou: I refactored and commented on Arthur Lu's generate_sine.m, generate_square.m and generate_sawtooth.m files to make them more understandable and easier for more students to use the code as a template to create their unique wave generating functions. I am also the original author of generate_white.m, add_sine.m, and lfo_sine.m . I also coordinated zoom meetings and worked on the google doc report.

Daniel Doan: Created the “generate_trapezoid.m” function.

Darell Chua Yun Da: I authored “DarellAmplitudeEnvelope.m”, “DarellbandpassFilter.m”, “Equalizer_Darell.m”, “MIDIDarell.m”, “AmpEnvelopeSelect.m”, “FilterSelect.m”, “LFOSelect.m”, “OffsetSelect.m”, “PitchEnvelopeSelect.m”, and the “Main_test.m”. I co-authored “DarellAnneLinearPitchEnvelope.m” and “DarellAnnePitchEnvelope.m” with Anne. The description for these two functions are under her contributions. I co-authored “SoundGeneratorSelect.m” with Arthur. The “DarellAmplitudeEnvelope.m” creates a linear amplitude envelope. The “DarellbandpassFilter.m” uses fourier transforms to get the series of all signals.  “Equalizer_Darell.m” allows for the boosting or cutting of specific frequencies. The “MIDIDarell.m” is a Musical Instrument Digital Interface function that uses Qwerty keys for each sound frequency. The following 6 functions are pass through functions used by the app. The “AmpEnvelopeSelect.m” function is used to determine if the “DarellAmplitudeEnvelope.m” function needs to be applied to the function. The “FilterSelect.m” takes in an input used by the app and applies the desired filter to it. The function then returns the filtered input. The “LFOSelect.m” function takes the input and determines which low frequency oscillation function to apply. It then returns the output after the desired LFO function is applied. The “OffsetSelect.m” function applies either an echo, pitch offset, or no change to the input that is passed in.  The “PitchEnvelopeSelect.m” functions determine whether or not to use logarithmic or linear calculations for the pitch envelope.  The “SoundGeneratorSelect.m” function determines which signals will be used as the input (sine wave, squarewave, etc.). There is also the option to choose an instrument sound as the signal in this function.
The “Main_test.m” file is used to test files prior to the use in the synthesizer. I also wrote and designed the GUI which was later edited in tandem with Arthur prior to final submission.

Gabriel Diaz: I authored the "generate_lullaby.m" file, which generates a sample lullaby melody using the the frequency argument as its musical root. Using interval ratios, the other notes in the melody can be obtained which facilitates the output of melody for any musical key.

Jason Liang: I authored the “distortion_filter.m” file, which contains a function that takes in an input signal in time domain and some constant called LOW and clips all values in the sound file so that the signal contains frequencies within that specific range (distorted by that constant). It then converts the signal back to the time domain via fft. 

Lance Zhu: I authored “flanger.m” that creates a flanger effect to a signal by combining the original signal with its oscillating-delayed copy.

Meghaj Vadlaputi:  Created the Meghaj_Echo.m function that adds an echo to a signal by applying a time shift using the Fourier Transform of a signal and adding it to the original signal. 

Mekhi Ellington:  Created “generate_cosine.m” to make things faster when working with multiple functions at once. I also added comments to Jason Liang's “distortion_filter.m” and reformatted it to make it look a lot more understandable and easier for use. 

Neelay Joglekar: I authored “lfo_freq_sine.m,” “lfo_freq_saw.m,” and “lfo_freq_square.m,” which are LFOs that modulate the pitch of an input signal. Each function modulates the signal according to a different wave type (sine, sawtooth, and square waves, respectively). The amplitude of modulation is defined in octaves. The modulation is performed using octaves to make it sound more natural to the listener, as opposed to modulation using Hz.

Nicolas Schluep: Created the “epic_effect_schluep.m”, “muffled_effect_schluep.m”, and “seperate_prevalent_schluep.m” functions. The “epic_effect_schluep.m” function applies a low-pass filter and various random delays (chorus effect) to the input sound to make it sound more epic. The  “muffled_effect_schluep.m” uses a low pass filter and reverb to make it sound like the audio is playing in another room. The “seperate_prevalent_schluep.m” function finds the most prevalent frequency in the input sound and applies a band-pass filter to a specified range around that frequency. This makes it such that only the most prevalent frequencies can be heard in the output (For example, one could use this function to separate the bassline from a song). 

Ryan Goh: I authored the “generate_keybaord.m” function which produces a sound wave similar to that of a keyboard or digital piano. The function takes in any frequency, however, using frequencies that are in the range of the middle octave sound most similar to a keyboard. A list of the frequencies of each piano key can be found at the following link. https://en.wikipedia.org/wiki/Piano_key_frequencies

Wesley Hsu: Co-authored the Petha_Hsu_PitchOffset.m file which was a pitch offset function with shifting by harmonics. This function is used primarily, as its name states, to change the pitch of the sound from high to lower frequency. During my time working with Pethaperumal, I was the one who solved a problem regarding changing to a lower pitch using a floor function. We also provided plots of the adjustments in order to visualize the pitch changes.

Yalu Ouyang: I am the original author of fade_in.m, fade_out.m, and bandreject_filter.m files. True to their names, the fade_in() function creates a fade-in audio effect that modifies a given input signal, the fade_out()  function creates a fade-out audio effect that that modifies a given input signal, and bandreject_filter() eliminates (attenuates to 0) frequencies of the input signal in a specified range. I’ve also edited the README file so that it’s more descriptive of our project, and added several helpful sites found in the project guidelines file.


## Abridged Writeup
The [writeup](https://docs.google.com/document/d/e/2PACX-1vRtwPITEnNgeDQYebnDpnPfZVANtMwlxmwCSED1xUDSGX1I5sZoGS-eaei-uj1CBg5ASOSuldcZhKPa/pub) includes usage, documentation, citations.
 
 ## Function Prototypes
Templates to create your own functions. Please commit code in either src/ (the base directopry) or src/NotWorking (please dont commit in any other subfolder).

 ### Wave generating function
```
function x = generate_NAME(amplitude, frequency, phase, fs, duration, duty)
```
NOTE: duty does not apply to some functions (such as sinusoids)

 ### Envelope function
```
function x = envelope_NAME(input, fs, period, attack , decay, sustain, release)
```
where attack, decay, release are percentages between 0 to 1 of the period
sustain is the percentage of the amplitude it should sustain for
**envelope can be pitch or amplitude envelope**


### Filter function
```
function x = Filter_NAME(input_soundin_timedomain, Fs, LOW, MED, HIGH) 
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
