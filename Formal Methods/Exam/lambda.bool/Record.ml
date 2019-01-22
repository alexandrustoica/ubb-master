
type record = Record of string * Type.typ

let string_of = function
	| Record (name, typ) ->
			name ^ " -- " ^ (Type.string_of typ)

let name_of = function Record (name, _) -> name

let type_of = function Record (_, typ) -> typ
