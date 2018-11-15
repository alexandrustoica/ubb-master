% Exercise 01:
% -----------
% Write a function Abs that computes the absolute value of a number.
% This should work for both integers and real numbers.

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

