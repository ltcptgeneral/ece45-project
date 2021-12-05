function output = freqResponse(input, H, fs)

    %midterm 1 function:
    %H = @(w) (100*j*w*(1+j*w))/(10^(-7)*(1000+j*w)^2*(10+j*w))
    
    len = length(input);
    f = fs*(-len/2:len/2-1)/len;
    
    Input = fftshift(fft(input));
    
    
    Output = zeros(1, length(Input));
    for i=1:length(f)
        Output(i) = Input(i) * H(f(i));
    end
    output = real(ifft(Output));
end