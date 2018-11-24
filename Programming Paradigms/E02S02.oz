
% Exercise 02:
% -----------

declare

fun {Reverse List Accumulator}
   case List of nil then Accumulator
   [] H|T then {Reverse T H|Accumulator}
   end
end

{Browse {Reverse ['I' 'want' 'to' 'go' 'there'] nil}}




