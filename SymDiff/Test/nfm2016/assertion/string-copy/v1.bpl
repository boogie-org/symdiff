var src, dest: [int]int;

//var dest: [int]int;

const src_l: int;

const dest_l: int;

procedure string_copy();
  modifies dest;



implementation string_copy()
{
  var i: int;

  anon0#2:
    i := 0;
    assert i < src_l;
    goto anon3_LoopHead#2;

  anon3_LoopHead#2:
    assume {:inferred} 0 <= i;
    goto anon3_LoopDone#2, anon3_LoopBody#2;

  anon3_LoopBody#2:
    assume {:partition} src[i] != 0;
    assert i < dest_l;
    dest[i] := src[i];
    i := i + 1;
    assert i < src_l;
    goto anon3_LoopHead#1;

  anon3_LoopHead#1:
    assume {:inferred} 0 <= i;
    goto anon3_LoopDone#2, anon3_LoopBody#1;

  anon3_LoopBody#1:
    assume {:partition} src[i] != 0;
    assert i < dest_l;
    dest[i] := src[i];
    i := i + 1;
    assert i < src_l;
    goto anon3_LoopHead#2;

  /*
  anon3_LoopHead#0:
    assume {:inferred} 0 <= i;
    assume false;
    return;
  */

  anon3_LoopDone#2:
    assume {:partition} src[i] == 0;
    assert i < dest_l;
    dest[i] := 0;
    return;
}
