% An audio is distorted based on the value of HIGH. Nothing of a certain
% threshold should be played above this constant, or they are simply clipped to this 
% value. Inspired from Meghaj_Echo.m and epic_effect_schluep.m.
% Author: Jason Liang

function y = distortion_filter(x, HIGH)
  len = length(X);
  X = fft(x);
  X = fftshift(X);
  Y = zeros(1, len);
  
  for ind = 1:len
    if (X(ind) > HIGH) 
       Y(ind) = HIGH;
    elseif (X(ind) < -HIGH)
      Y(ind) = -HIGH;
    else 
      Y(ind) = X(ind);
    end
  end
  
  Y = fftshift(Y);
  y = ifft(Y);
  y = real(y);

end
