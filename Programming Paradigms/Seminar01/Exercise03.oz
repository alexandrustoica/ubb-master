
declare
proc {Maximum Left Right ?Result}
   if Left == 0 then Result = Right
   elseif Right == 0 then Result = Left
   else Result = 1 + {Maximum Left - 1 Right - 1}
   end
end
