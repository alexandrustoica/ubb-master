declare

fun {Join Left Right}
   {List.mapInd Right fun {$ Index Element}
                         {List.nth Left Index}#Element end}
end

fun {Zip ForTuple}
   {List.mapInd ForTuple.1
    fun {$ Index Element}
       Element#{List.nth ForTuple.2 Index} end}
end


fun {UnZipWithAccumulators L Left Right}
   case L of
      nil then Left#Right
   [] H|T then {UnZipWithAccumulators T
                {List.append Left [H.1]}
                {List.append Right [H.2]}}
   end
end

fun {UnZip L}
   {UnZipWithAccumulators L nil nil}
end


{Browse {Zip [1 2 3]#[a b c]}}
{Browse {UnZip [1#a 2#b 3#c]}}y
