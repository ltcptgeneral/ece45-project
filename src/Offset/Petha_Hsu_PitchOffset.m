% Petha_Hsu_PitchOffset: input a wave and pitch offset (in percentage)
% This function takes a input sound signal and increases the pitch by the
% offset percentage. The output is not 100% accurate. It is only an
% estimation as the information we the function works with is very limited.
% If 100% output is expected, more information like the frequency and type
% of wave would be required. And the estimation only works for
% f_offset > 0.5. Below 0.5, the output is problematic. Again, the output
% is just a good estimation.

% CONTRIBUTORS:
% Pethaperumal Natarajan: I figured a way to increase the pitch of input
% signal by using fourier transform and shifting the frequency using a for
% loop. Then I used inverse transform to get a sound signal back in the time
% domain.
% Wesley Hsu: I helped solve the problem of being unable to lower frequency
% for the loop using the floor function. This allowed rounding to maintain
% the lower signals that were needed when the code returned the signal back
% into the time domain.

function y = Petha_Hsu_PitchOffset(x, f_offset)
    len = length(x);
    X = fft(x);
    X = fftshift(X);        %Fourier transform the input wave
    Y = zeros(1, len);
    
    midpoint = len/2;
    for i = 1:len
        %Shifting the Fourier transform in frequency domain to adjust the
        %frequency of signal.
        %Floor function is used as signals must be integers and not
        %doubles.
        if floor((i - midpoint) / f_offset + midpoint) < 1 || floor((i - midpoint) / f_offset + midpoint) > len
            continue;
        end
        Y(i) = X(floor((i - midpoint) / f_offset + midpoint));
    end
    
    %Plotted graphs to troubleshoot the problem.
    %Fs = 44800;
    %f = Fs *(-len/2 : len/2 -1) / len;
    %tiledlayout(1,3); nexttile;
    %plot(f, abs(X)); title("input"); nexttile;
    %plot(f, abs(Y)); title("output"); nexttile;
    
    
    Y = fftshift(Y);
    y = ifft(Y);
    y = real(y);
        
end