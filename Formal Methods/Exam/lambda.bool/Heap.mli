
type heap = Heap of Record.record list

val string_of: heap -> string
val save: Record.record -> heap -> heap
val find: string -> heap -> Record.record option
