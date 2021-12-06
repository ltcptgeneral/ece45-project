function output = FilterSelect(input,Fs,LOW,MED,HIGH,number)
    if(number == "Option 1")
        output = DarellbandpassFilter(input,Fs,LOW,MED,HIGH);
    else
        output = input;
    end
end 

