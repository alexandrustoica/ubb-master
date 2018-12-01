
declare
fun {Fractorial Start End Accumulator}
   case End == Start of
      true then Accumulator * Start
   [] false then {Fractorial Start End - 1 Accumulator * End}
   end
end

fun {Comb N K}
    {Fractorial N-K+1 N 1} div {Fractorial 1 K 1}
end

{Browse {Comb 25 }}
