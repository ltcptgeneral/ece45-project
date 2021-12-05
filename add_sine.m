function x = add_sine(amplitude, fundamental, harmonics, fs, duration)
% ADD_SINE: Additive sine wave synthesis

%CONTRIBUTORS:
%Benjamin Liou: Original author

% DOCUMENTATION:
% harmonics should ideally be a 1D matrix of:
    % overtones: positive integers
    % undertones: 1/ positive integers
    % example: [1/2, 1, 2, 3]
    % NOTE: pitch of the fundamental frequency will still be perceived even
        % when the fundamental itself is missing. ex. [4,5,6]
    
% NOTE: it seems like when MATLAB's built in sound() takes in values,
    % magnitudes over 1 get distorted.
    
    
    
    % initialize local variables from input arguments
    n = fs * duration; % number of samples (length of matrix)
    
    % initialize a one dimensional zero matrix to be populated
    x = zeros(1, n);
    
    % populate matrix by adding sine waves
    for harmonic = harmonics
        x = x + generate_sine(1, fundamental * harmonic, 0, fs, duration);
    end
    
    % scale to amplitude
    scalar = max(abs(x));
    x = x / scalar * amplitude;
end