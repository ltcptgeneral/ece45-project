function output = fade_out(input, time)
    % Creates a fade-out sound effect that lasts a given
    % time parameter of the input sound signal
    % By Yalu Ouyang
    
    % input: a 1D array that represents the sound signal in the time domain
    % time: how long the fade out effect should last
    % Shouldn't be longer than the input signal 
    % (in which case the function treats it as the duration of the signal)
    % Returns modified signal in the time domain (output).
    
    len = length(input);
    
    % need to use time as a whole number
    time = round(time);
    
    % if time parameter longer than signal, treat time as
    % the duration of original signal
    if time > len
        time = len
    end

    % in order to create array, time >=1
    % if not, it's arbitrarily set to 1
    % in which case the fade_in effect
    % is virtually nonexistent
    if time < 1
        time = 1;
    end
    
    % set multiplier as 1D array

    multiplier = (1 : time) / time;

    % fade out effect: from full volume of signal to no volume
    multiplier = flip(multiplier);
    
    while length(multiplier) < len
        multiplier = [multiplier 0];
    end 

    % the resulting fade-in output  
    output = input .* multiplier;
end


% This is useful for creating videos, specifically the outro part
