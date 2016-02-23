var a: [int]int;

procedure f(x: int) returns (r: int);



implementation f(x: int) returns (r: int)
{

  anon0#2:
    r := x + 1;
    return;
}



procedure Iterator(s: int) returns (r: int);
  modifies a;



implementation Iterator(s: int) returns (r: int)
{
  var i: int;
  var tmp: int;

  anon0#2:
    i := s;
    goto anon2_LoopHead#2;

  anon2_LoopHead#2:
    goto anon2_LoopDone#2, anon2_LoopBody#2;

  anon2_LoopBody#2:
    assume {:partition} a[i] != 0;
    call tmp := f(a[i]);
    a[i] := tmp;
    i := i + 1;
    goto anon2_LoopHead#1;

  anon2_LoopHead#1:
    goto anon2_LoopDone#2, anon2_LoopBody#1;

  anon2_LoopBody#1:
    assume {:partition} a[i] != 0;
    call tmp := f(a[i]);
    a[i] := tmp;
    i := i + 1;
    goto anon2_LoopHead#2;


  anon2_LoopDone#2:
    assume {:partition} a[i] == 0;
    return;
}



