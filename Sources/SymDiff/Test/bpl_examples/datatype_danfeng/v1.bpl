type{:datatype} mem_opn;
function{:constructor} MConst(_mconst:int):mem_opn;

procedure foo(x:mem_opn) returns (ret:int)
{
  assume (_mconst#MConst(x) > 0);
  ret := 0;
  return;
}

