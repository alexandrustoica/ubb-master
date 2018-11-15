% Exercise 02:
% -----------
% Compute n ^ m where n is an integer and m is a natural number.

declare
fun {Power Base Exponent}
   case Exponent of
      0 then 1
   [] Exponent then Base * {Power Base Exponent - 1}
   end
end
