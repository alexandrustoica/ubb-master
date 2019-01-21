declare
fun {Digit}
   choice 0 [] 1 [] 2 [] 3 [] 4 [] 5 [] 6 [] 7 [] 8 [] 9 end
end

fun {TwoDigitsNumber}
   10 * {Digit} + {Digit}
end

{Browse {SearchAll Digit}}
