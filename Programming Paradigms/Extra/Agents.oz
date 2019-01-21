declare
local Stream MP Sum Product in

   proc {Evaluate Expr}
      case Expr
      of add(L R Result) then Result = L + R
      [] times(L R Result) then Result = L * R
      end
   end

   MP = {NewPort Stream}
   thread {ForAll Stream Evaluate} end
   thread {Send MP add(2 4 Sum)} end
   thread {Send MP times(3 4 Product)} end
   {Browse Sum#Product}
end
