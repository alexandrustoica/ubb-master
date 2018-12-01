declare
fun {FindPositionInList List X Index}
   case List of
      nil then Index
   [] H|T then if H == X then Index
               else {FindPositionInList T X Index + 1} end
   end
end


fun {FindPosition InList OfElement}
   {FindPositionInList InList OfElement 1}
end

fun {FindPositionInListOrZero List X Index}
   case List of
      nil then 0
   [] H|T then if H == X then Index
               else {FindPositionInListOrZero T X Index + 1} end
   end
end

fun {FindPositionOrZero InList OfElement}
   {FindPositionInListOrZero InList OfElement 1}
end

{Browse {FindPosition [1 3 2 4] 2}}
{Browse {FindPositionOrZero [1 3 2 4] 6}}
