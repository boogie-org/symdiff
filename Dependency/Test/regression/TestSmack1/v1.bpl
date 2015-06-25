function {: inline true} foo(p: int) : int
{
	bar(baz(p))
}

function {: inline true} bar(p: int) : int
{
	p
}

function {: inline true} baz(p: int) : int
{
	p
}
