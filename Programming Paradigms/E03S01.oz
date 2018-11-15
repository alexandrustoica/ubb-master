% Exercise 03:
% -----------
% Compute the maximum of two natural numbers, knowing that the only
% allowed test with a conditional is the test whether a number is zero
% (that is, if N == 0 then … else … end).

declare
proc {Maximum Left Right ?Result}
   if Left == 0 then Result = Right
   elseif Right == 0 then Result = Left
   else Result = 1 + {Maximum Left - 1 Right - 1}
   end
end
