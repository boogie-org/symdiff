type{:datatype} mem_opn;
function{:constructor} mem_opn(_mconst:int):mem_opn;

procedure foo(x:mem_opn) returns (ret:int)
{
  assume (_mconst#mem_opn(x) > 0);
  ret := 0;
  return;
}
