declare
fun {Evaluate Expression}
   case Expression of
      int(N) then N
   [] add(LExpression RExpression) then
      {Evaluate LExpression} + {Evaluate RExpression}
   [] multiply(LExpression RExpression) then
      {Evaluate LExpression} * {Evaluate RExpression}
   end
end

{Browse {Evaluate add(int(1) multiply(int(3) int(4)))}}
