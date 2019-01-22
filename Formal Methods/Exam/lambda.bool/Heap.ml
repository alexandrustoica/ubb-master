
type heap = Heap of Record.record list

let string_of =
	let compose it acc = it ^ "\n" ^ acc in   
	function Heap records -> records
		|> List.map Record.string_of
		|> List.fold_left compose ""

let save (record: Record.record) = function
	| Heap records -> Heap(record::records)
	
let find (name: string) =  
	let equal it = (compare (Record.name_of it) name) == 0 in
	function Heap records -> List.find_opt equal records
