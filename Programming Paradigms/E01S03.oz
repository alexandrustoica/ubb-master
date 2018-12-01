declare
fun {FindElementInList List Element}
   case List of
      nil then false
   [] H|T then
      if H == Element then true
      else {FindElementInList T Element} end
   end
end

{Browse {FindElementInList [a b c] d}}



