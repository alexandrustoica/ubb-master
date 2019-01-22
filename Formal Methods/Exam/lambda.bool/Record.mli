
type record = Record of string * Type.typ

val string_of: record -> string
val name_of: record -> string
val type_of: record -> Type.typ
