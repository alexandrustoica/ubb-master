functor
export
   new: NewStack
   push: Push
   pop: Pop
   empty: IsEmpty
define

fun {NewStack}
   stack(values: nil)
end

fun {Push N Stack}
   case Stack
   of nil then stack(values: N)
   [] stack(values: V) then stack(values: N|V)
   end
end

fun {Pop Stack}
   case Stack
   of nil then nil # nil
   [] stack(values: H|T) then H # stack(values: T)
   end
end

fun {IsEmpty Stack}
   case Stack
   of nil then true
   [] stack(values: nil) then true
   [] _ then false end
end
end
