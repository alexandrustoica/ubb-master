declare
fun {TakeFromList L Accumulator Limit}
   if Limit == 0 then Accumulator else
      case L of
         nil then Accumulator
      [] H|T then {TakeFromList T {Append Accumulator [H]} Limit - 1} end
   end
end

fun {Take List Limit}
   {TakeFromList List nil Limit}
end

fun {Drop List Limit}
   if Limit == 0 then List else
      case List of
         nil then List
      [] H|T then {Drop T Limit - 1}
      end
   end
end


{Browse {Drop [1 2 3 4] 3}}
{Browse {Take [1 2 3 4] 3}}

