
type expression =
	| Value of bool
	| Variable of string
	| Let of string * expression * expression
	| If of expression * expression * expression

exception UnableToJoinTypes of string
exception InvalidConditionalExpression
exception UndefinedVariableInExpression of string

let rec type_of 
	(expression: expression) 
	(heap: Heap.heap) : Type.typ =
	match expression with
	| Value _ -> CoreBool
	| Variable name -> 
		let term = Heap.find name heap in
		(match term with
			| None -> raise (UndefinedVariableInExpression(name))
			| Some record -> Record.type_of record)
	| Let (name, value, expr) ->
		let typ = type_of value heap in 
		let new_record = Record.Record(name, typ) in
		let new_heap = Heap.save new_record heap in
			type_of expr new_heap
	| If (cond_term, then_term, else_term) ->
		let type_of_cond = type_of cond_term heap 
		and type_of_then = type_of then_term heap
		and type_of_else = type_of else_term heap in
		match (type_of_cond, type_of_then == type_of_else) with
		| (CoreBool, true) -> type_of_then
		| (CoreBool, _) -> 
			let type_left = Type.string_of type_of_then
			and type_right = Type.string_of type_of_else in
			let message = "Cannot join types " ^ type_left ^ " and " ^ type_right in
			UnableToJoinTypes(message) |> raise
			
					
let _ = 
	let expression = 
		If(Value(true), 
			Let("x", Value(false), Variable("x")), 
			Let("y", Value(true), Variable("y"))) in
	let result = type_of expression (Heap.Heap([])) in
	print_endline (Type.string_of result)
			