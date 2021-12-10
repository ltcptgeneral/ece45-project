function output = fade_in(input, time)
    % Creates a fade-in sound effect that lasts a given
    % time parameter of the input sound signal
    % By Yalu Ouyang
    

    % input: a 1D array that represents the sound signal in the time domain
    % time: how long the fade in effect should last
    % Shouldn't be longer than the input signal (in which case the function
    % treats it as the duration of the signal)
    % Returns modified signal in the time domain (output).
    
    len = length(input);
    
    % need to use whole number for time
    time = round(time);
    
    % if time parameter longer than signal, treat time as
    % the duration of original signal
    if time > len
        time = len;
    end
    
    % in order to create array, time >=1
    % if not, it's arbitrarily set to 1
    % in which case the fade_in effect
    % is virtually nonexistent
    if time < 1
        time = 1;
    end

    % set multiplier as 1D array
    % fade in effect: from no volume to full volume of signal
    multiplier = (1 : time) / time;
    
    while length(multiplier) < len
        multiplier = [multiplier 1];
    end
    % the resulting fade-in output  
    output = input .* multiplier;
end

% This is useful for making videos, specifically the intro part 
