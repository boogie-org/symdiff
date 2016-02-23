var str: [int]int;

procedure hash() returns (r: int);



implementation hash() returns (r: int)
{
  var i: int;
  var hash: int;

  anon0#2:
    i := 0;
    hash := 0;
    goto anon3_LoopHead#2;

  anon3_LoopHead#2:
    goto anon3_LoopDone#2, anon3_LoopBody#2;

  anon3_LoopBody#2:
    assume {:partition} str[i] != 0;
    hash := hash + str[i];
    i := i + 1;
    goto anon3_LoopHead#1;

  anon3_LoopHead#1:
    goto anon3_LoopDone#2, anon3_LoopBody#1;

  anon3_LoopBody#1:
    assume {:partition} str[i] != 0;
    hash := hash + str[i];
    i := i + 1;
    goto anon3_LoopHead#2;

  /*
  anon3_LoopHead#0:
    assume false;
    return;
  */

  anon3_LoopDone#2:
    assume {:partition} str[i] == 0;
    r := hash;
    return;
}



