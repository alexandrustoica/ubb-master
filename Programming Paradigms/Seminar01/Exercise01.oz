
declare
fun {AbsoluteNumber X Zero}
   if X >= Zero then X else ~X end
end

fun {Absolute Number}
   case {Int.is Number} of
      true then {AbsoluteNumber Number 0}
   [] false then {AbsoluteNumber Number 0.0}
   end
end

