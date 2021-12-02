function play_continuous(wave, fs, time)
%play_continuous: Darell Continuously Playing
    soundfile = audioplayer(wave,fs);
    countmax = time / (length(wave) / fs);
    for count = 0:1:countmax %change to counts/while play button active
        playblocking(soundfile);
    end
end

