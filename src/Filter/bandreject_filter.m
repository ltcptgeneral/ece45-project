function Output = bandreject_filter(Input, Fs, Low, High)
    % A filter that lets through most frequencies unaltered
    % but attentuates the frequencies in the specified range to
    % very low levels
    % (basically exliminates them)
    % By Yalu Ouyang
    

    % Input: the input signal in the time domain
    % Fs: the sampling frequency
    % Low: the lower limit of the specified range
    % High: the upper limit of the specified range
    % Returns Output: the filtered signal in the time domain

    len = length(Input);
    
    F = Fs * (-len/2 : (len/2 - 1)) / len ;
    
    % modified signal in the frequency domain
    % using Fourier Transform
    mod_freq = fftshift(fft(Input));
    
    len_f = length(mod_freq);
    
    % use this array to record the frequencies
    % that should pass through
    % 0 indicates reject
    % 1 indicates pass
    multiplier =  zeros([1,len_f]); 
    
    for index = 1 : len_f

        % within range of band reject
        % so elminate these frequencies
        if ((Low < abs(F(index))) && (abs(F(index)) < High))
            multiplier(index) = 0;
        
        % outside of specified range
        % so shoudln't be altered
        else
            multiplier(index) = 1;
        end
    end
    
    % filtered signal in the frequency domain
    filtered_mod_freq = fftshift(mod_freq .* multiplier);
    
    % convert signal back to the time domain
    Output = real(ifft(filtered_mod_freq));
    
end

% This function is useful for eliminating
% unwanted signals that have frequencies close to the 
% median frequency of the original signal
% (consider overall frequencies as one part, 
% this elminates the middle portion)

% Fourier transform is applied in this function
% to make it easier to eliminate specified 
% frequencies of the signal
% (easier to do so in the frequency domain)
