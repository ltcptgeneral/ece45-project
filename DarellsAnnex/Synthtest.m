
filename = '/Users/DarellCHUA/OneDrive - UC San Diego/FA2021/ECE 45/SynthesizerProject/Be Epic.mp3';
[y,Fs] = audioread(filename);

lengthy = length(y);
new_y = zeros(1,lengthy);
for n = 1:lengthy
    new_y(n) = y(n,1) + y(n,2);
end

y = new_y;

Time = (length(y)-1)/Fs;


Freq = 200; %Hz
Time = 20;

LFO = 1; %Hz

RangeFs = [20 22050];
Fs = 2*RangeFs(2); %should be 44.1 khz


x = 0:1/Fs:Time;
Len = length(x);

y = sin(Freq*2*pi*x); %sin wave

beats = 1;
y = y + sin((Freq+beats)*2*pi*x); %adding beats based on superposition
y = y + sin((2*Freq)*2*pi*x);
y = y + sin((2*Freq+beats)*2*pi*x);
y = y + sin((2*Freq+5)*2*pi*x);
y = y + sin((2*Freq+beats+5)*2*pi*x);
y = y + sin((3*Freq)*2*pi*x);
y = y + sin((3*Freq+beats)*2*pi*x);
y = y + sin((3*Freq+5)*2*pi*x);
y = y + sin((3*Freq+beats+5)*2*pi*x);
y = y + 5*sin((10)*2*pi*x);
y = y + sin((10*Freq+5)*2*pi*x);

y = y + square(Freq*2*pi*x); %square wave
y = y + square((Freq+beats)*2*pi*x);
y = y + square(Freq*2*pi*x); %square wave
y = y + square((Freq+beats)*2*pi*x);

T = 4;
overlay = Envelope(0.2,0.1,0.5,0.3,T,Fs);
y = overlayAmp(x,y,overlay,T,Fs);

f = Fs * (-Len/2 : (Len/2 - 1))/Len ;
Mod_Freq = fft(y);
figure(1)
plot(f, abs(fftshift(Mod_Freq)));

y = bandpassFilter(f,y,0,22000);
Mod_Freq = fft(y);
figure(2)
plot(f, abs(fftshift(Mod_Freq)));

T = 2;
overlayPitch = Envelope(0.4,0.1,0.9,0.3,T,Fs);
y = PitchEnvelope(f,y,1,overlayPitch,T,Fs,Time);
sound(y,Fs);



function output = bandpassFilter(F,y,LOW,HIGH)
    Mod_Freq = fftshift(fft(y));
    Mod_f = fftshift(fft(F));
    lenf = length(F);
    output =  0 .* Mod_f; % zero array of len f
    
    for n = 1:lenf
        if ((LOW < abs(F(n))) && HIGH > abs(F(n)))
            output(n) = 1;
        else
            output(n) = 0;
        end
    end
        
    filtered_Mod_Freq = fftshift(Mod_Freq .* output);
    
    output = real(ifft(filtered_Mod_Freq));
    
end

function output = PitchEnvelope(f,y,percentile,shift,T,Fs,Time) %just need to change percentile to a graph
    
    x = 0:1/Fs:Time;
    leny = length(y); %create zero array of y of len x
    lengthxol = T * Fs;
    shift = 1 - shift;
    for n = 1:leny
        y(n) = y(n)*cos(shift(mod(n,lengthxol)+1)*2*pi*x(n)); 
    end
    
    Mod_Freq = fftshift(fft(y));
    Mod_f = fftshift(fft(f));
    lenf = length(f);
    output =  0 .* Mod_f; % zero array of len f
    midpoint = round(lenf/2);
    
    Filtered_Signal = fftshift(fft(bandpassFilter(f,y,0,22000)));
    filtered_Signal = real(ifft(Filtered_Signal));
    
    demod_Signal = filtered_Signal .* 0; %create zero array of y of len filtersignal
    
    for n = 1:leny
        demod_Signal(n) = 2* filtered_Signal(n) *cos(shift(mod(n,lengthxol)+1)*2*pi*x(n)); 
    end
    
    
    Message = fftshift(fft(bandpassFilter(f,demod_Signal,-5000,5000)));
    message = real(ifft(Message));
    output = y;
    
end
function output = overlayAmp(x,y,overlay,T,Fs)
    counter = 1;
    lengthx = length(x);
    lengthxol = T * Fs;
    while counter < lengthx
        y(counter) = y(counter) * overlay(mod(counter,lengthxol)+1);
        counter = counter+1;
    end
    output = y;
end


function output = Envelope(attack,decay,sustain,release,T,Fs) %percentages for attack, decay, sustain, release
    attacktime = attack * T * Fs;
    decaytime = attacktime + decay * T * Fs;
    sustaintime = (T - (release * T))* Fs;
    
    x = 0:1/Fs:T;
    y = 0 .* x; %create zero array of y of len x
    
    tcounter = 1;
    %attack phase
    
    while tcounter <= attacktime
        y(tcounter) = (1/attacktime) * tcounter;
        tcounter = tcounter+1;
    end
    istart = tcounter;
    while tcounter<= decaytime
        y(tcounter) = 1 - (((1-sustain)/(decay * T * Fs)) * (tcounter - istart));
        tcounter = tcounter+1;
    end

    while tcounter<= sustaintime
        y(tcounter) = sustain;
        tcounter = tcounter+1;
    end
    istart = tcounter;
    while tcounter < (T * Fs)
        y(tcounter) = sustain - ((sustain/(release * T * Fs)) * (tcounter - istart));
        tcounter = tcounter+1;
    end
    
    plot(x,y)
    output = y;
end