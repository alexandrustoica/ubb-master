declare

fun {OnComb N K Index Prev}
   if (Index >= K) then Prev
   else R A B in
      A = (Prev div (Index + 1)) * (N - Index)
      B = (Prev mod (Index + 1)) * (N - Index)
      R = A + (B div (Index + 1))
      {OnComb N K Index + 1 R}
   end
end

fun {Comb N K}
   if K < (N - K) then {OnComb N K 0 1}
   else {OnComb N (N - K) 0 1} end
end


fun {Combinations N K}
   if {Or (N == K) (K == 0)} then 1
   else {Combinations N - 1 K - 1} + {Combinations N - 1 K}
   end
end

{Browse {Comb 30 5}}

