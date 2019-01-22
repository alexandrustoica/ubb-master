type typ = Bool

type expression =
	| Constant of bool
	| Variable of string
	| Let of expression * expression
	| Conditional of expression * expression * expression

