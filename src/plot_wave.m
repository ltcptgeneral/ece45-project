function plot_wave(waveform, fs, duration)
%PLOT_WAVE:Arthur Lu plots a waveform
    x = linspace(0, duration, fs * duration);
    plot(x, waveform);
    xlabel("time");
    ylabel("amplitude");
end

