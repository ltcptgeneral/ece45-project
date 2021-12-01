function x = generate_triangle(amplitude, frequency, phase, fs, duration, duty)
%GENERATE_SINE:Arthur Lu returns a matrix of sampled sine wave, where the
%phase shift is in number of periods
    x = zeros(1, fs * duration);
    A = amplitude;
    f = frequency;
    p = phase;
    n = fs * duration;
    dt = 1 / fs;
    for i = 1:n
        t = i * dt;
        st = mod(f * t - p, 1);
        if(st < duty)
            x(i) = A*(1/duty * st - 0.5);
        else
            x(i) = A*(-(1/(1-duty))*st + (duty/(1-duty)) + 1 - 0.5);
        end
    end
end