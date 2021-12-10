% Meghaj_Echo: input a wave (in time domain) and a frequency to induce an 
% echo/lag effect to. The outputted wave amplifies frequencies above the 
% cutoff and creates an echo in the frequencies below the cutoff creating 
% a beat lag effect. Inspired by "muffled_effect_schluep" and lecture notes
% Works best on songs that have a clear snare line with a frequency of 
% HIGH = 1000. Use on song files like "Strong-Bassline.mp3"

% CONTRIBUTORS:
% Meghaj Vadlaputi: Function Author



function y = Meghaj_Echo(x, HIGH)
    len = length(x);
    X = fft(x);
    X = fftshift(X);        %Fourier transform the input wave
    Y = zeros(1, len);
    
    for ind = 1:len
        %Multiplying the Fourier transform in frequency domain by e^jw(0.05)
        %to induce a time shift of 0.05 seconds creating the "lag" effect on
        %frequencies below HIGH (HIGH = 1000 works best)
        %Multiplying the remaining signal by 1.25 amplifies other
        %frequencies to balance
        if abs(X(ind)) < HIGH
            Y(ind) = X(ind) + 0.5*(X(ind)*exp(1i*ind*0.05));
        else
            Y(ind) = 1.25*X(ind);
        end
    end
    
    
    Y = fftshift(Y);
    y = ifft(Y);
    y = real(y);
        
end