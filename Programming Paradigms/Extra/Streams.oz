declare

fun {From Start ToLimit}
   if Start < ToLimit
   then Start | {From Start + 1 ToLimit}
   else nil end
end

local Stream FilterResult Result in
thread Stream = {From 0 10} end
thread FilterResult = {Filter Stream IsOdd} end
thread Result = {FoldL FilterResult fun {$ X Acc} X + Acc end 0} end
{Browse Result}
end
