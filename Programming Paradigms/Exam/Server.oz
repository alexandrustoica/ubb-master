declare
proc {ServerAction Message}
   case Message
   of double(X Result) then Result = X * 2
   end
end

fun {NewAgent Process} Port Stream in
   Port = {NewPort Stream}
   thread {ForAll Stream Process} end
   Port
end

Server = {NewAgent ServerAction}

proc {ClientAction Message}
   case Message
   of calculate(Result) then {Send Server double(2 Result)}
   end
end

Client = {NewAgent ClientAction}

local R in
   {Send Client calculate(R)}
   {Browse R}
end

