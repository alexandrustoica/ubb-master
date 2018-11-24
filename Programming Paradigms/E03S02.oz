
% Exercise 03:
% -----------

declare

fun {Filter List Element}
   case List of
      nil then nil
   [] H|T then if (H mod Element) == 0 then {Filter T Element}
               else H|{Filter T Element}
               end
   end
end


fun {Sieve List}
   case List of

      nil then nil
      [] H|T then H|{Sieve {Filter T H}}
   end
end

fun lazy {Generate N} N|{Generate N+1} end
fun lazy {Prime} {Sieve {Generate 2}} end

{Show {Generate 1}}

