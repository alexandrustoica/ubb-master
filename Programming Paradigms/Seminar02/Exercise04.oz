declare

fun {CreateTree Root Element}
   case Element =< Root of
      true then tree(root: Root left: Element right: nil)
   [] false then tree(root: Root left: nil right: Element)
   end
end


fun {Insert BTree Element}
   if BTree == nil then tree(root: Element left: nil right: nil)
   elseif {Number.is BTree} then {CreateTree BTree Element}
   else case BTree.root >= Element of
           true then tree(root: BTree.root left: {Insert BTree.left Element} right: BTree.right)
        else tree(root: BTree.root left: BTree.left right: {Insert BTree.right Element})
      end
   end
end


fun {Smallest BTree}
   if BTree == nil then nil
   elseif {Number.is BTree} then BTree
   else case BTree.left of nil then BTree.root
        else {Smallest BTree.left} end
   end
end

fun {Biggest BTree}
   if BTree == nil then nill
   elseif {Number.is BTree} then BTree
   else case BTree.right of nill then BTree.root else {Biggest BTree.right} end
   end
end

fun {IsSorted BTree}
   if BTree == nil then false
   elseif {Number.is BTree} then true
   else {And {And {Biggest BTree.left} =< BTree.root
            {Smallest BTree.right} >= BTree.root}
         {And {IsSorted BTree.left} {IsSorted BTree.right}}}
   end
end


{Browse {IsSorted tree(root: 6
                       left: tree(root: 1 left: 0 right: 2)
                       right: tree(root: 10 left: 9 righty: 122))}}

