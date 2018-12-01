
declare
fun {Power Base Exponent}
   case Exponent of
      0 then 1
   [] Exponent then Base * {Power Base Exponent - 1}
   end
end
