function output = MIDIDarell(dur,Fs)
%Darell Chua Yun Da
%   Use Qwerty Keys for each sound frequency.

    freq = [330 350 370 392 415 440 466 494 523 554];
    charls = ["q" "w" "e" "r" "t" "y" "u" "i" "o" "p"];
    bytedur = 0.5;
    x =  0:1/Fs:bytedur;
    yz0 = zeros([1,(length(x)-1)]); 
    y = [yz0 
        yz0 
        yz0 
        yz0 
        yz0 
        yz0 
        yz0 
        yz0 
        yz0 
        yz0];

    for c = 1:length(freq)
        for i=1:length(x)
            y(c,i) = 0.5*sin(2*pi*freq(c)*x(i));
        end
    end
    Len = dur*Fs;
    output = zeros([1,Len]);

    
    
    set(gcf,'CurrentCharacter', '@');
    figure(1)
    
    tStart = tic;  
    tEnd = toc(tStart);
    figure(1)
    
    while(tEnd <= dur)
        title("Midi Popup")
        drawnow
        char = get(gcf,'CurrentCharacter');
        while (char == '@' && tEnd <= dur)
            figure(1)
            char = get(gcf,'CurrentCharacter');
            tEnd = toc(tStart);
            drawnow
        end
        
        n = round((tEnd/dur)*Len);
        
        endt = tEnd + bytedur;
        overt = tEnd + bytedur/3;
        if overt> dur
            endt = dur;
        end
        if endt > dur
            endt = dur;
        end
        endn = round(endt*Fs);
        
        charno = 0;
        for i=1:length(freq)
            if char == charls(i)
                charno = i;
            end
        end
        if charno > 0
            sound(y(charno,:),Fs); 
            oldout = output(n:endn);
            output(n:endn) = oldout + y(charno,1:(endn-n+1));
            while(tEnd < overt)
                tEnd = toc(tStart);
                drawnow
            end
            figure(1)
            plot(output);
            title("Midi Popup")
            drawnow
            set(gcf,'CurrentCharacter', '@')
        else
            figure(1)
            drawnow
            set(gcf,'CurrentCharacter', '@')
        end
        tEnd = toc(tStart);
    end
    figure(1)
    plot(output);
    sound(output,Fs); 
    drawnow();
end

