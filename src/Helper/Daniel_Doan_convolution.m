function x = Daniel_Doan_convolution(f,h)
    %input: two 1d arrays representing two sound signals in the time domain
    %output: the convolution of the two waves, which is the inverse FT of
    %FT(f)*FT(h)
    %author: Daniel Doan

    %padding to ensure the entire convolution is calculated
    pad = length(f);
    %take FT of f
    F = fft(f, pad);
    %take FT of h
    H = fft(h, pad);
    %multiply the two FTs
    X = F .* H;
    %take inverse FT of the product
    x = ifft(X);
end