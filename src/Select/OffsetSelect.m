%Written by Darell 

% CONTRIBUTORS:
% Person1: Darell

% DOCUMENTATION:
%Pass-through function used by app

function output = OffsetSelect(input,value,number)
    if(number == "Echo")
        output =  Meghaj_Echo(input, value);
    elseif(number == "PitchOffset")
        output = Petha_Hsu_PitchOffset(input, value);
    else
        output = input;
    end
end 


