var array: [int]int;
const n:int;

function uif(history:int, block:int) returns (b:int);
var cf:int;

procedure BubbleSort()
{
  var i:int, j:int, t:int;
  i, j, t := n - 1, 0, 0;
  call i, j, t := BubbleSort_Outer_Loop(i, j, t);
  cf := uif(cf, 6);
  return;
}

procedure BubbleSort_Inner_Loop(i: int, j:int, t:int) returns (out_j:int, out_t:int)
{
  out_j, out_t := j, t;
  if (out_j < i) {
    cf := uif(cf, 2);
      if (array[out_j] > array[out_j + 1]) {
        cf := uif(cf, 3);

        out_t := array[out_j];
        array[out_j] := array[out_j + 1];
        array[out_j + 1] := out_t;
      }
      cf := uif(cf, 4);

      out_j := out_j + 1;
      call out_j, out_t := BubbleSort_Inner_Loop(i, out_j, out_t);
      return;
  } else {
    return;
  }
}

procedure BubbleSort_Outer_Loop(i: int, j: int, t:int) returns (out_i: int, out_j: int, out_t:int)
{
  out_i, out_j, out_t := i, j, t;
  if (out_i > 0) {
    cf := uif(cf, 1);
    out_j := 0;
    call out_j, out_t := BubbleSort_Inner_Loop(out_i, out_j, out_t);
    cf := uif(cf, 5);
    out_i := out_i - 1;
    call out_i, out_j, out_t := BubbleSort_Outer_Loop(out_i, out_j, out_t);
    return;
  } else {
    return;
  }
}

function {:inline true} ArrEqAfter(a:[int]int, b:[int]int, i:int) : bool
{
  (forall j:int :: {a[j]}{b[j]} j >= i ==> a[j] == b[j])
}

function {:inline true} ArrEqBefore(a:[int]int, b:[int]int, i:int) : bool
{
  (forall j:int :: {a[j]}{b[j]} j <= i ==> a[j] == b[j])
}
