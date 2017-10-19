var arr: [int]int;

procedure EQ_InsertSort(size: int);
  modifies arr;



implementation EQ_InsertSort(size: int)
{
  var arr0: [int]int;
  var arr1: [int]int;
  var i: int;
  var j: int;
  var key: int;

  anon0#3:
    arr0 := arr;
    j := 1;
    goto anon9_LoopHead#3;

  anon9_LoopHead#3:
    goto anon9_LoopDone#3, anon9_LoopBody#3;

  anon9_LoopBody#3:
    assume {:partition} j < size;
    key := arr[j];
    i := j - 1;
    goto anon10_LoopHead#3;

  anon10_LoopHead#3:
    goto anon10_LoopDone#3, anon10_LoopBody#3;

  anon10_LoopBody#3:
    assume {:partition} i >= 0 && arr[i] < key;
    arr[i + 1] := arr[i];
    i := i - 1;
    goto anon10_LoopHead#2;

  anon10_LoopDone#3:
    assume {:partition} !(i >= 0 && arr[i] < key);
    arr[i + 1] := key;
    j := j + 1;
    goto anon9_LoopHead#2;

  anon9_LoopHead#2:
    goto anon9_LoopDone#3, anon9_LoopBody#2;

  anon9_LoopBody#2:
    assume {:partition} j < size;
    key := arr[j];
    i := j - 1;
    goto anon10_LoopHead#2;

  anon10_LoopHead#2:
    goto anon10_LoopDone#2, anon10_LoopBody#2;

  anon10_LoopBody#2:
    assume {:partition} i >= 0 && arr[i] < key;
    arr[i + 1] := arr[i];
    i := i - 1;
    goto anon10_LoopHead#1;

  anon10_LoopDone#2:
    assume {:partition} !(i >= 0 && arr[i] < key);
    arr[i + 1] := key;
    j := j + 1;
    goto anon9_LoopHead#1;

  anon9_LoopHead#1:
    goto anon9_LoopDone#3, anon9_LoopBody#1;

  anon9_LoopBody#1:
    assume {:partition} j < size;
    key := arr[j];
    i := j - 1;
    goto anon10_LoopHead#1;

  anon10_LoopHead#1:
    goto anon10_LoopDone#1, anon10_LoopBody#1;

  anon10_LoopBody#1:
    assume {:partition} i >= 0 && arr[i] < key;
    arr[i + 1] := arr[i];
    i := i - 1;
    goto anon10_LoopHead#0;

  anon10_LoopHead#0:
    assume false;
    return;

  anon10_LoopDone#1:
    assume {:partition} !(i >= 0 && arr[i] < key);
    arr[i + 1] := key;
    j := j + 1;
    goto anon9_LoopHead#0;

  anon9_LoopHead#0:
    assume false;
    return;

  anon9_LoopDone#3:
    assume {:partition} size <= j;
    arr1 := arr;

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 



    arr := arr0;
    j := 2;
    goto anon11_LoopHead#3;

  anon11_LoopHead#3:
    goto anon11_LoopDone#3, anon11_LoopBody#3;

  anon11_LoopBody#3:
    assume {:partition} j < size;
    key := arr[j];
    i := j - 1;
    goto anon12_LoopHead#3;

  anon12_LoopHead#3:
    goto anon12_LoopDone#3, anon12_LoopBody#3;

  anon12_LoopBody#3:
    assume {:partition} i >= 0 && arr[i] < key;
    arr[i + 1] := arr[i];
    i := i - 1;
    goto anon12_LoopHead#2;

  anon12_LoopDone#3:
    assume {:partition} !(i >= 0 && arr[i] < key);
    arr[i + 1] := key;
    j := j + 1;
    goto anon11_LoopHead#2;

  anon11_LoopHead#2:
    goto anon11_LoopDone#3, anon11_LoopBody#2;

  anon11_LoopBody#2:
    assume {:partition} j < size;
    key := arr[j];
    i := j - 1;
    goto anon12_LoopHead#2;

  anon12_LoopHead#2:
    goto anon12_LoopDone#2, anon12_LoopBody#2;

  anon12_LoopBody#2:
    assume {:partition} i >= 0 && arr[i] < key;
    arr[i + 1] := arr[i];
    i := i - 1;
    goto anon12_LoopHead#1;

  anon12_LoopDone#2:
    assume {:partition} !(i >= 0 && arr[i] < key);
    arr[i + 1] := key;
    j := j + 1;
    goto anon11_LoopHead#1;

  anon11_LoopHead#1:
    goto anon11_LoopDone#3, anon11_LoopBody#1;

  anon11_LoopBody#1:
    assume {:partition} j < size;
    key := arr[j];
    i := j - 1;
    goto anon12_LoopHead#1;

  anon12_LoopHead#1:
    goto anon12_LoopDone#1, anon12_LoopBody#1;

  anon12_LoopBody#1:
    assume {:partition} i >= 0 && arr[i] < key;
    arr[i + 1] := arr[i];
    i := i - 1;
    goto anon12_LoopHead#0;

  anon12_LoopHead#0:
    assume false;
    return;

  anon12_LoopDone#1:
    assume {:partition} !(i >= 0 && arr[i] < key);
    arr[i + 1] := key;
    j := j + 1;
    goto anon11_LoopHead#0;

  anon11_LoopHead#0:
    assume false;
    return;

  anon11_LoopDone#3:
    assume {:partition} size <= j;
    assert arr[size - 1] == arr1[size - 1];
    return;
}

