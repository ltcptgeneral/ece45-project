% An audio is distorted based on the value of HIGH. Nothing of a certain
% threshold should be played above this constant, or they are simply clipped to this 
% value. Inspired from Meghaj_Echo.m and epic_effect_schluep.m.
% Author: Jason Liang
% Mekhi Ellington: Added some comments and editted formatting

function y = distortion_filter(x, HIGH)
  len = length(X);    %Storing length of X.
  X = fft(x);         %X is the Fourier Transform of x.
  X = fftshift(X);    %Shifts X.
  Y = zeros(1, len);  %Matrix of length containing zeros.
  
  for ind = 1:len
    if (X(ind) > HIGH) 
       Y(ind) = HIGH;

    elseif (X(ind) < -HIGH)
      Y(ind) = -HIGH;

    else 
      Y(ind) = X(ind);

    end
  end
  
  Y = fftshift(Y); %Shifts Y.
  y = ifft(Y); %Inverse Fourier Transform of Y.
  y = real(y); %Stores only the real part of the complex y.

end