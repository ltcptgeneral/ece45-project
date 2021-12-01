function x = generate_sine(amplitude, frequency, phase, fs, duration)
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
        x(i) = A * sin(2 * pi * f * t - p);
    end
end

