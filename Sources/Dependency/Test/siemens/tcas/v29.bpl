type {:extern} name;

type {:extern} byte;

function {:extern} OneByteToInt(byte) : int;

function {:extern} TwoBytesToInt(byte, byte) : int;

function {:extern} FourBytesToInt(byte, byte, byte, byte) : int;

axiom (forall b0: byte, c0: byte :: 
  { OneByteToInt(b0), OneByteToInt(c0) } 
  OneByteToInt(b0) == OneByteToInt(c0) ==> b0 == c0);

axiom (forall b0: byte, b1: byte, c0: byte, c1: byte :: 
  { TwoBytesToInt(b0, b1), TwoBytesToInt(c0, c1) } 
  TwoBytesToInt(b0, b1) == TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);

axiom (forall b0: byte, b1: byte, b2: byte, b3: byte, c0: byte, c1: byte, c2: byte, c3: byte :: 
  { FourBytesToInt(b0, b1, b2, b3), FourBytesToInt(c0, c1, c2, c3) } 
  FourBytesToInt(b0, b1, b2, b3) == FourBytesToInt(c0, c1, c2, c3)
     ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

var {:extern} Mem: [name][int]int;

var {:extern} alloc: int;

function {:extern} Field(int) : name;

function {:extern} Base(int) : int;

axiom (forall x: int :: { Base(x) } INT_LEQ(Base(x), x));

function {:extern} DT(int) : name;

var {:extern} Mem_T.A35CHAR: [int]int;

var {:extern} Mem_T.A44CHAR: [int]int;

var {:extern} Mem_T.A49CHAR: [int]int;

var {:extern} Mem_T.A4CHAR: [int]int;

var {:extern} Mem_T.A4INT4: [int]int;

var {:extern} Mem_T.A58CHAR: [int]int;

var {:extern} Mem_T.A63CHAR: [int]int;

var {:extern} Mem_T.INT4: [int]int;

var {:extern} Mem_T.PCHAR: [int]int;

var {:extern} Mem_T.PINT4: [int]int;

var {:extern} Mem_T.P_iobuf: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: 
  { Match(a, T.Ptr(t)) } 
  Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: 
  { MatchBase(b, a, T.Ptr(t)) } 
  MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: 
  { HasType(v, T.Ptr(t)) } 
  HasType(v, T.Ptr(t))
     <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.A35CHAR: name;

const {:extern} unique T.A44CHAR: name;

const {:extern} unique T.A49CHAR: name;

const {:extern} unique T.A4CHAR: name;

const {:extern} unique T.A4INT4: name;

const {:extern} unique T.A58CHAR: name;

const {:extern} unique T.A63CHAR: name;

const {:extern} unique T.CHAR: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PA35CHAR: name;

const {:extern} unique T.PA44CHAR: name;

const {:extern} unique T.PA49CHAR: name;

const {:extern} unique T.PA4CHAR: name;

const {:extern} unique T.PA4INT4: name;

const {:extern} unique T.PA58CHAR: name;

const {:extern} unique T.PA63CHAR: name;

const {:extern} unique T.PCHAR: name;

const {:extern} unique T.PINT4: name;

const {:extern} unique T.PPCHAR: name;

const {:extern} unique T.PPPCHAR: name;

const {:extern} unique T.PP_iobuf: name;

const {:extern} unique T.P_iobuf: name;

const {:extern} unique T._iobuf: name;

function {:extern}  INT_EQ(x: int, y: int) : bool
{
  x == y
}

function {:extern}  INT_NEQ(x: int, y: int) : bool
{
  x != y
}

function {:extern}  INT_ADD(x: int, y: int) : int
{
  x + y
}

function {:extern}  INT_SUB(x: int, y: int) : int
{
  x - y
}

function {:extern}  INT_MULT(x: int, y: int) : int
{
  x * y
}

function {:extern}  INT_LT(x: int, y: int) : bool
{
  x < y
}

function {:extern}  INT_ULT(x: int, y: int) : bool
{
  x < y
}

function {:extern}  INT_LEQ(x: int, y: int) : bool
{
  x <= y
}

function {:extern}  INT_ULEQ(x: int, y: int) : bool
{
  x <= y
}

function {:extern}  INT_GT(x: int, y: int) : bool
{
  x > y
}

function {:extern}  INT_UGT(x: int, y: int) : bool
{
  x > y
}

function {:extern}  INT_GEQ(x: int, y: int) : bool
{
  x >= y
}

function {:extern}  INT_UGEQ(x: int, y: int) : bool
{
  x >= y
}

function {:extern}  BV32_EQ(x: bv32, y: bv32) : bool
{
  x == y
}

function {:extern}  BV32_NEQ(x: bv32, y: bv32) : bool
{
  x != y
}

function {:extern} {:bvbuiltin "bvadd"} BV32_ADD(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvsub"} BV32_SUB(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvmul"} BV32_MULT(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvudiv"} BV32_DIV(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvult"} BV32_ULT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvslt"} BV32_LT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvule"} BV32_ULEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsle"} BV32_LEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvugt"} BV32_UGT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsgt"} BV32_GT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvuge"} BV32_UGEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsge"} BV32_GEQ(x: bv32, y: bv32) : bool;

function {:extern} MINUS_BOTH_PTR_OR_BOTH_INT(a: int, b: int, size: int) : int;

axiom (forall a: int, b: int, size: int :: 
  { MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } 
  INT_LEQ(INT_MULT(size, MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size)), INT_SUB(a, b))
     && INT_LT(INT_SUB(a, b), 
      INT_MULT(size, INT_ADD(MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size), 1))));

axiom (forall a: int, b: int, size: int :: 
  { MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } 
  MINUS_BOTH_PTR_OR_BOTH_INT(a, b, 1) == INT_SUB(a, b));

function {:extern} MINUS_LEFT_PTR(a: int, a_size: int, b: int) : int;

axiom (forall a: int, a_size: int, b: int :: 
  { MINUS_LEFT_PTR(a, a_size, b) } 
  MINUS_LEFT_PTR(a, a_size, b) == INT_SUB(a, INT_MULT(a_size, b)));

function {:extern} PLUS(a: int, a_size: int, b: int) : int;

axiom (forall a: int, a_size: int, b: int :: 
  { PLUS(a, a_size, b) } 
  PLUS(a, a_size, b) == INT_ADD(a, INT_MULT(a_size, b)));

function {:extern} MULT(a: int, b: int) : int;

axiom (forall a: int, b: int :: { MULT(a, b) } MULT(a, b) == INT_MULT(a, b));

function {:extern} DIV(a: int, b: int) : int;

function {:extern} BINARY_UNKNOWN(a: int, b: int) : int;

axiom (forall a: int, b: int :: 
  { DIV(a, b) } 
  a >= 0 && b > 0 ==> b * DIV(a, b) <= a && a < b * (DIV(a, b) + 1));

axiom (forall a: int, b: int :: 
  { DIV(a, b) } 
  a >= 0 && b < 0 ==> b * DIV(a, b) <= a && a < b * (DIV(a, b) - 1));

axiom (forall a: int, b: int :: 
  { DIV(a, b) } 
  a < 0 && b > 0 ==> b * DIV(a, b) >= a && a > b * (DIV(a, b) - 1));

axiom (forall a: int, b: int :: 
  { DIV(a, b) } 
  a < 0 && b < 0 ==> b * DIV(a, b) >= a && a > b * (DIV(a, b) + 1));

function {:extern} BINARY_BOTH_INT(a: int, b: int) : int;

function {:extern} POW2(a: int) : bool;

axiom POW2(1);

axiom POW2(2);

axiom POW2(4);

axiom POW2(8);

axiom POW2(16);

axiom POW2(32);

axiom POW2(64);

axiom POW2(128);

axiom POW2(256);

axiom POW2(512);

axiom POW2(1024);

axiom POW2(2048);

axiom POW2(4096);

axiom POW2(8192);

axiom POW2(16384);

axiom POW2(32768);

axiom POW2(65536);

axiom POW2(131072);

axiom POW2(262144);

axiom POW2(524288);

axiom POW2(1048576);

axiom POW2(2097152);

axiom POW2(4194304);

axiom POW2(8388608);

axiom POW2(16777216);

axiom POW2(33554432);

function {:extern} BIT_BAND(a: int, b: int) : int;

axiom (forall a: int, b: int :: { BIT_BAND(a, b) } a == b ==> BIT_BAND(a, b) == a);

axiom (forall a: int, b: int :: 
  { BIT_BAND(a, b) } 
  POW2(a) && POW2(b) && a != b ==> BIT_BAND(a, b) == 0);

axiom (forall a: int, b: int :: 
  { BIT_BAND(a, b) } 
  a == 0 || b == 0 ==> BIT_BAND(a, b) == 0);

function {:extern} BIT_BOR(a: int, b: int) : int;

function {:extern} BIT_BXOR(a: int, b: int) : int;

function {:extern} BIT_BNOT(a: int) : int;

function {:extern} choose(a: bool, b: int, c: int) : int;

axiom (forall a: bool, b: int, c: int :: 
  { choose(a, b, c) } 
  a ==> choose(a, b, c) == b);

axiom (forall a: bool, b: int, c: int :: 
  { choose(a, b, c) } 
  !a ==> choose(a, b, c) == c);

function {:extern} LIFT(a: bool) : int;

axiom (forall a: bool :: { LIFT(a) } a <==> LIFT(a) != 0);

function {:extern} PTR_NOT(a: int) : int;

axiom (forall a: int :: { PTR_NOT(a) } a == 0 ==> PTR_NOT(a) != 0);

axiom (forall a: int :: { PTR_NOT(a) } a != 0 ==> PTR_NOT(a) == 0);

function {:extern} NULL_CHECK(a: int) : int;

axiom (forall a: int :: { NULL_CHECK(a) } a == 0 ==> NULL_CHECK(a) != 0);

axiom (forall a: int :: { NULL_CHECK(a) } a != 0 ==> NULL_CHECK(a) == 0);

procedure {:extern} havoc_assert(i: int);
  requires i != 0;



procedure {:extern} havoc_assume(i: int);
  ensures i != 0;



procedure {:extern} __HAVOC_free(a: int);



function {:extern} NewAlloc(x: int, y: int) : int;

procedure {:extern} __HAVOC_malloc(obj_size: int) returns (new: int);
  free requires INT_GEQ(obj_size, 0);
  modifies alloc;
  ensures new == old(alloc);
  ensures INT_GT(alloc, INT_ADD(new, obj_size));
  ensures Base(new) == new;



procedure {:extern} __HAVOC_det_malloc(obj_size: int) returns (new: int);
  free requires INT_GEQ(obj_size, 0);
  modifies alloc;
  ensures new == old(alloc);
  ensures INT_GT(alloc, INT_ADD(new, obj_size));
  ensures Base(new) == new;
  ensures alloc == NewAlloc(old(alloc), obj_size);



procedure {:extern} __HAVOC_memset_split_1(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 1, n))
   && (forall i: int :: { ret[i] } Array(p, 1, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 1, n))
   && (forall i: int :: { ret[i] } Array(p, 1, n)[i] ==> ret[i] == c);



procedure {:extern} __HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 2, n))
   && (forall i: int :: { ret[i] } Array(p, 2, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 2, n))
   && (forall i: int :: { ret[i] } Array(p, 2, n)[i] ==> ret[i] == c);



procedure {:extern} __HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 4, n))
   && (forall i: int :: { ret[i] } Array(p, 4, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 4, n))
   && (forall i: int :: { ret[i] } Array(p, 4, n)[i] ==> ret[i] == c);



procedure {:extern} nondet_intrinsic() returns (x: int);



procedure {:extern} nondet_choice() returns (x: int);



var {:extern} detChoiceCnt: int;

function {:extern} DetChoiceFunc(a: int) : int;

procedure {:extern} det_choice() returns (x: int);
  modifies detChoiceCnt;
  ensures detChoiceCnt == INT_ADD(old(detChoiceCnt), 1);
  ensures x == DetChoiceFunc(old(detChoiceCnt));



procedure {:extern} _strdup(str: int) returns (new: int);



procedure {:extern} _xstrcasecmp(a0: int, a1: int) returns (ret: int);



procedure {:extern} _xstrcmp(a0: int, a1: int) returns (ret: int);



function {:extern} Equal([int]bool, [int]bool) : bool;

function {:extern} Subset([int]bool, [int]bool) : bool;

function {:extern} Disjoint([int]bool, [int]bool) : bool;

function {:extern} Empty() : [int]bool;

function {:extern} SetTrue() : [int]bool;

function {:extern} Singleton(int) : [int]bool;

function {:extern} Reachable([int,int]bool, int) : [int]bool;

function {:extern} Union([int]bool, [int]bool) : [int]bool;

function {:extern} Intersection([int]bool, [int]bool) : [int]bool;

function {:extern} Difference([int]bool, [int]bool) : [int]bool;

function {:extern} Dereference([int]bool, [int]int) : [int]bool;

function {:extern} Inverse(f: [int]int, x: int) : [int]bool;

function {:extern} AtLeast(int, int) : [int]bool;

function {:extern} Rep(int, int) : int;

axiom (forall n: int, x: int, y: int :: 
  { AtLeast(n, x)[y] } 
  AtLeast(n, x)[y] ==> INT_LEQ(x, y) && Rep(n, x) == Rep(n, y));

axiom (forall n: int, x: int, y: int :: 
  { AtLeast(n, x), Rep(n, x), Rep(n, y) } 
  INT_LEQ(x, y) && Rep(n, x) == Rep(n, y) ==> AtLeast(n, x)[y]);

axiom (forall n: int, x: int :: { AtLeast(n, x) } AtLeast(n, x)[x]);

axiom (forall n: int, x: int, z: int :: 
  { PLUS(x, n, z) } 
  Rep(n, x) == Rep(n, PLUS(x, n, z)));

axiom (forall n: int, x: int :: 
  { Rep(n, x) } 
  (exists k: int :: INT_SUB(Rep(n, x), x) == INT_MULT(n, k)));

function {:extern} Array(int, int, int) : [int]bool;

axiom (forall x: int, n: int, z: int :: 
  { Array(x, n, z) } 
  INT_LEQ(z, 0) ==> Equal(Array(x, n, z), Empty()));

axiom (forall x: int, n: int, z: int :: 
  { Array(x, n, z) } 
  INT_GT(z, 0)
     ==> Equal(Array(x, n, z), Difference(AtLeast(n, x), AtLeast(n, PLUS(x, n, z)))));

axiom (forall x: int :: !Empty()[x]);

axiom (forall x: int :: SetTrue()[x]);

axiom (forall x: int, y: int :: { Singleton(y)[x] } Singleton(y)[x] <==> x == y);

axiom (forall y: int :: { Singleton(y) } Singleton(y)[y]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: 
  { Union(S, T)[x] } { Union(S, T), S[x] } { Union(S, T), T[x] } 
  Union(S, T)[x] <==> S[x] || T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: 
  { Intersection(S, T)[x] } 
    { Intersection(S, T), S[x] } 
    { Intersection(S, T), T[x] } 
  Intersection(S, T)[x] <==> S[x] && T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: 
  { Difference(S, T)[x] } { Difference(S, T), S[x] } { Difference(S, T), T[x] } 
  Difference(S, T)[x] <==> S[x] && !T[x]);

axiom (forall S: [int]bool, T: [int]bool :: 
  { Equal(S, T) } 
  Equal(S, T) <==> Subset(S, T) && Subset(T, S));

axiom (forall x: int, S: [int]bool, T: [int]bool :: 
  { S[x], Subset(S, T) } { T[x], Subset(S, T) } 
  S[x] && Subset(S, T) ==> T[x]);

axiom (forall S: [int]bool, T: [int]bool :: 
  { Subset(S, T) } 
  Subset(S, T) || (exists x: int :: S[x] && !T[x]));

axiom (forall x: int, S: [int]bool, T: [int]bool :: 
  { S[x], Disjoint(S, T) } { T[x], Disjoint(S, T) } 
  !(S[x] && Disjoint(S, T) && T[x]));

axiom (forall S: [int]bool, T: [int]bool :: 
  { Disjoint(S, T) } 
  Disjoint(S, T) || (exists x: int :: S[x] && T[x]));

axiom (forall f: [int]int, x: int :: { Inverse(f, f[x]) } Inverse(f, f[x])[x]);

axiom (forall f: [int]int, x: int, y: int :: 
  { Inverse(f, y), f[x] } 
  Inverse(f, y)[x] ==> f[x] == y);

axiom (forall f: [int]int, x: int, y: int :: 
  { Inverse(f[x := y], y) } 
  Equal(Inverse(f[x := y], y), Union(Inverse(f, y), Singleton(x))));

axiom (forall f: [int]int, x: int, y: int, z: int :: 
  { Inverse(f[x := y], z) } 
  y == z || Equal(Inverse(f[x := y], z), Difference(Inverse(f, z), Singleton(x))));

axiom (forall x: int, S: [int]bool, M: [int]int :: 
  { Dereference(S, M)[x] } 
  Dereference(S, M)[x] ==> (exists y: int :: x == M[y] && S[y]));

axiom (forall x: int, S: [int]bool, M: [int]int :: 
  { M[x], S[x], Dereference(S, M) } 
  S[x] ==> Dereference(S, M)[M[x]]);

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: 
  { Dereference(S, M[x := y]) } 
  !S[x] ==> Equal(Dereference(S, M[x := y]), Dereference(S, M)));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: 
  { Dereference(S, M[x := y]) } 
  S[x] && Equal(Intersection(Inverse(M, M[x]), S), Singleton(x))
     ==> Equal(Dereference(S, M[x := y]), 
      Union(Difference(Dereference(S, M), Singleton(M[x])), Singleton(y))));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: 
  { Dereference(S, M[x := y]) } 
  S[x] && !Equal(Intersection(Inverse(M, M[x]), S), Singleton(x))
     ==> Equal(Dereference(S, M[x := y]), Union(Dereference(S, M), Singleton(y))));

function {:extern} Unified([name][int]int) : [int]int;

axiom (forall M: [name][int]int, x: int :: 
  { Unified(M)[x] } 
  Unified(M)[x] == M[Field(x)][x]);

axiom (forall M: [name][int]int, x: int, y: int :: 
  { Unified(M[Field(x) := M[Field(x)][x := y]]) } 
  Unified(M[Field(x) := M[Field(x)][x := y]]) == Unified(M)[x := y]);

var {:extern} Alt_Layer_Value: int;

var {:extern} Climb_Inhibit: int;

var {:extern} Cur_Vertical_Sep: int;

var {:extern} Down_Separation: int;

var {:extern} High_Confidence: int;

var {:extern} Other_Capability: int;

var {:extern} Other_RAC: int;

var {:extern} Other_Tracked_Alt: int;

var {:extern} Own_Tracked_Alt: int;

var {:extern} Own_Tracked_Alt_Rate: int;

const {:extern} unique Positive_RA_Alt_Thresh: int;

axiom Positive_RA_Alt_Thresh != 0;

axiom Base(Positive_RA_Alt_Thresh) == Positive_RA_Alt_Thresh;

var {:extern} Two_of_Three_Reports_Valid: int;

var {:extern} Up_Separation: int;

function {:extern} value_is(c: int, e: int) : bool;

const {:extern} {:model_const "Up_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 63} unique __ctobpl_const_3: int;

const {:extern} {:model_const "Positive_RA_Alt_Thresh[Alt_Layer_Value]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 58} unique __ctobpl_const_2: int;

const {:extern} {:model_const "Alt_Layer_Value"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 58} unique __ctobpl_const_1: int;

const {:extern} {:model_const "upward_preferred"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 72} unique __ctobpl_const_4: int;

const {:extern} {:model_const "Cur_Vertical_Sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_9: int;

const {:extern} {:model_const "result.ALIM"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_10: int;

const {:extern} {:model_const "Up_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_11: int;

const {:extern} {:model_const "upward_preferred"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 73} unique __ctobpl_const_7: int;

const {:extern} {:model_const "result.Own_Above_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_8: int;

const {:extern} {:model_const "upward_preferred"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 91} unique __ctobpl_const_28: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_13: int;

const {:extern} {:model_const "result"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_14: int;

const {:extern} {:model_const "result.ALIM"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_18: int;

const {:extern} {:model_const "result"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 81} unique __ctobpl_const_24: int;

const {:extern} {:model_const "result.Inhibit_Biased_Climb"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 90} unique __ctobpl_const_27: int;

const {:extern} {:model_const "result.Own_Above_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_30: int;

const {:extern} {:model_const "Down_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 90} unique __ctobpl_const_26: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_34: int;

const {:extern} {:model_const "result.Own_Below_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_37: int;

const {:extern} {:model_const "result.Own_Below_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_17: int;

const {:extern} {:model_const "result"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_22: int;

const {:extern} {:model_const "result.Own_Below_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_16: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_15: int;

const {:extern} {:model_const "Cur_Vertical_Sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_38: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_104: int;

const {:extern} {:model_const "result.ALIM"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_39: int;

const {:extern} {:model_const "Down_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_40: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_33: int;

const {:extern} {:model_const "Pred.5"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_41: int;

const {:extern} {:model_const "result"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_35: int;

const {:extern} {:model_const "Down_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_19: int;

const {:extern} {:model_const "Pred.6"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_20: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_36: int;

const {:extern} {:model_const "upward_preferred"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 90} unique __ctobpl_const_25: int;

const {:extern} {:model_const "result.ALIM"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_31: int;

const {:extern} {:model_const "Pred.6"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_21: int;

const {:extern} {:model_const "result.Own_Above_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_29: int;

const {:extern} {:model_const "Up_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 97} unique __ctobpl_const_32: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 79} unique __ctobpl_const_12: int;

const {:extern} {:model_const "Pred.6"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 75} unique __ctobpl_const_23: int;

const {:extern} {:model_const "result.Inhibit_Biased_Climb"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 72} unique __ctobpl_const_6: int;

const {:extern} {:model_const "result.Own_Below_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 126} unique __ctobpl_const_71: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 127} unique __ctobpl_const_81: int;

const {:extern} {:model_const "need_downward_RA"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 128} unique __ctobpl_const_83: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 127} unique __ctobpl_const_78: int;

const {:extern} {:model_const "alt_sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 138} unique __ctobpl_const_86: int;

const {:extern} {:model_const "argv[1]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_98: int;

const {:extern} {:model_const "argc"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 148} unique __ctobpl_const_95: int;

const {:extern} {:model_const "alt_sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 141} unique __ctobpl_const_90: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_97: int;

const {:extern} {:model_const "alt_sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 136} unique __ctobpl_const_87: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_99: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_100: int;

const {:extern} {:model_const "alt_sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 134} unique __ctobpl_const_88: int;

const {:extern} {:model_const "Cur_Vertical_Sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_101: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_102: int;

const {:extern} {:model_const "alt_sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 132} unique __ctobpl_const_89: int;

const {:extern} {:model_const "Positive_RA_Alt_Thresh[0]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 50} unique __ctobpl_const_91: int;

const {:extern} {:model_const "Pred.6"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 126} unique __ctobpl_const_75: int;

const {:extern} {:model_const "need_upward_RA"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 126} unique __ctobpl_const_74: int;

const {:extern} {:model_const "Pred.6"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 126} unique __ctobpl_const_73: int;

const {:extern} {:model_const "result.Non_Crossing_Biased_Descend"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 127} unique __ctobpl_const_76: int;

const {:extern} {:model_const "result.Own_Above_Threat"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 127} unique __ctobpl_const_77: int;

const {:extern} {:model_const "Pred.9"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 127} unique __ctobpl_const_79: int;

const {:extern} {:model_const "need_downward_RA"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 135} unique __ctobpl_const_85: int;

const {:extern} {:model_const "Positive_RA_Alt_Thresh[1]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 51} unique __ctobpl_const_92: int;

const {:extern} {:model_const "Positive_RA_Alt_Thresh[2]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 52} unique __ctobpl_const_93: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 158} unique __ctobpl_const_96: int;

const {:extern} {:model_const "need_upward_RA"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 128} unique __ctobpl_const_82: int;

const {:extern} {:model_const "Positive_RA_Alt_Thresh[3]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 53} unique __ctobpl_const_94: int;

const {:extern} {:model_const "Pred.6"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 126} unique __ctobpl_const_72: int;

const {:extern} {:model_const "need_downward_RA"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 127} unique __ctobpl_const_80: int;

const {:extern} {:model_const "need_upward_RA"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 133} unique __ctobpl_const_84: int;

const {:extern} {:model_const "Two_of_Three_Reports_Valid"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 120} unique __ctobpl_const_59: int;

const {:extern} {:model_const "tcas_equipped"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 124} unique __ctobpl_const_67: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_54: int;

const {:extern} {:model_const "Pred.5"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_44: int;

const {:extern} {:model_const "High_Confidence"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_50: int;

const {:extern} {:model_const "Cur_Vertical_Sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_52: int;

const {:extern} {:model_const "enabled"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 124} unique __ctobpl_const_66: int;

const {:extern} {:model_const "intent_not_known"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 124} unique __ctobpl_const_68: int;

const {:extern} {:model_const "tcas_equipped"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 124} unique __ctobpl_const_69: int;

const {:extern} {:model_const "Pred.5"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_42: int;

const {:extern} {:model_const "Other_RAC"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 120} unique __ctobpl_const_60: int;

const {:extern} {:model_const "Pred.3"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 120} unique __ctobpl_const_62: int;

const {:extern} {:model_const "alt_sep"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 122} unique __ctobpl_const_65: int;

const {:extern} {:model_const "result"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 93} unique __ctobpl_const_43: int;

const {:extern} {:model_const "Pred.3"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 120} unique __ctobpl_const_64: int;

const {:extern} {:model_const "result.Non_Crossing_Biased_Climb"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 126} unique __ctobpl_const_70: int;

const {:extern} {:model_const "Own_Tracked_Alt"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 104} unique __ctobpl_const_48: int;

const {:extern} {:model_const "Other_Tracked_Alt"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 109} unique __ctobpl_const_46: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_56: int;

const {:extern} {:model_const "enabled"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_55: int;

const {:extern} {:model_const "result"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 99} unique __ctobpl_const_45: int;

const {:extern} {:model_const "Other_Tracked_Alt"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 104} unique __ctobpl_const_49: int;

const {:extern} {:model_const "Own_Tracked_Alt_Rate"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_51: int;

const {:extern} {:model_const "Pred.3"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 120} unique __ctobpl_const_61: int;

const {:extern} {:model_const "tcas_equipped"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 119} unique __ctobpl_const_57: int;

const {:extern} {:model_const "intent_not_known"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 120} unique __ctobpl_const_63: int;

const {:extern} {:model_const "Own_Tracked_Alt"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 109} unique __ctobpl_const_47: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_103: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 118} unique __ctobpl_const_53: int;

const {:extern} {:model_const "Other_Capability"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 119} unique __ctobpl_const_58: int;

const {:extern} {:model_const "Down_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 72} unique __ctobpl_const_5: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_163: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_139: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_142: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_144: int;

const {:extern} {:model_const "Other_RAC"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_164: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_165: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_166: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_167: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_149: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_153: int;

const {:extern} {:model_const "Up_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_150: int;

const {:extern} {:model_const "Other_Tracked_Alt"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_136: int;

const {:extern} {:model_const "argv[7]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_140: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_148: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_152: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_138: int;

const {:extern} {:model_const "argv[8]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_147: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_145: int;

const {:extern} {:model_const "argv[9]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_154: int;

const {:extern} {:model_const "Down_Separation"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_157: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_146: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 165} unique __ctobpl_const_151: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_158: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_160: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_141: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_137: int;

const {:extern} {:model_const "Alt_Layer_Value"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 164} unique __ctobpl_const_143: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_159: int;

const {:extern} {:model_const "argv[10]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_161: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_156: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 166} unique __ctobpl_const_155: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 167} unique __ctobpl_const_162: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_130: int;

const {:extern} {:model_const "argv[6]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_133: int;

const {:extern} {:model_const "argv[5]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_126: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_134: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_135: int;

const {:extern} {:model_const "Two_of_Three_Reports_Valid"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_115: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_120: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_113: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_128: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_131: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_118: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_124: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_110: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 163} unique __ctobpl_const_132: int;

const {:extern} {:model_const "argv[2]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_105: int;

const {:extern} {:model_const "argv[4]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_119: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_107: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_117: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_109: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_121: int;

const {:extern} {:model_const "Own_Tracked_Alt"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_122: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 161} unique __ctobpl_const_123: int;

const {:extern} {:model_const "Own_Tracked_Alt_Rate"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_129: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_111: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_125: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_114: int;

const {:extern} {:model_const "High_Confidence"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_108: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_116: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 162} unique __ctobpl_const_127: int;

const {:extern} {:model_const "argv[3]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 160} unique __ctobpl_const_112: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 159} unique __ctobpl_const_106: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 153} unique __ctobpl_const_189: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 154} unique __ctobpl_const_190: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_174: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 150} unique __ctobpl_const_182: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_170: int;

const {:extern} {:model_const "Other_Capability"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_171: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_172: int;

const {:extern} {:model_const "argv[12]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_175: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_177: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 151} unique __ctobpl_const_184: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 171} unique __ctobpl_const_181: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 150} unique __ctobpl_const_183: int;

const {:extern} {:model_const "argv[11]"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_168: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 168} unique __ctobpl_const_169: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 152} unique __ctobpl_const_186: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_179: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 171} unique __ctobpl_const_180: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_173: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 152} unique __ctobpl_const_187: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 153} unique __ctobpl_const_188: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 151} unique __ctobpl_const_185: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 154} unique __ctobpl_const_191: int;

const {:extern} {:model_const "Climb_Inhibit"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_178: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v29\tcas.c"} {:sourceLine 169} unique __ctobpl_const_176: int;

procedure {:extern} __iob_func() returns (__dummy_ret__iob_func: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} atoi(__dummy_formal_atoi_0.__1: int) returns (__dummy_retatoi: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} ALIM() returns (result.ALIM$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} ALIM() returns (result.ALIM$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    result.ALIM$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 58} true;
    assert Positive_RA_Alt_Thresh != 0;
    result.ALIM$1 := Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, Alt_Layer_Value)];
    assume value_is(__ctobpl_const_1, Alt_Layer_Value);
    assume value_is(__ctobpl_const_2, Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, Alt_Layer_Value)]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 59} true;
    return;
}



procedure {:extern} Inhibit_Biased_Climb() returns (result.Inhibit_Biased_Climb$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} Inhibit_Biased_Climb() returns (result.Inhibit_Biased_Climb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    result.Inhibit_Biased_Climb$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 63} true;
    result.Inhibit_Biased_Climb$1 := Up_Separation;
    assume value_is(__ctobpl_const_3, Up_Separation);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 64} true;
    return;
}



procedure {:extern} Non_Crossing_Biased_Climb() returns (result.Non_Crossing_Biased_Climb$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} Non_Crossing_Biased_Climb() returns (result.Non_Crossing_Biased_Climb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.6$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} result: int;
  var {:extern} result.ALIM$5: int;
  var {:extern} result.ALIM$8: int;
  var {:extern} result.Inhibit_Biased_Climb$2: int;
  var {:extern} result.Own_Above_Threat$7: int;
  var {:extern} result.Own_Below_Threat$3: int;
  var {:extern} result.Own_Below_Threat$4: int;
  var {:extern} upward_crossing_situation: int;
  var {:extern} upward_preferred: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    $Pred.6$ := 0;
    $Pred.9$ := 0;
    result := 0;
    result.ALIM$5 := 0;
    result.ALIM$8 := 0;
    result.Inhibit_Biased_Climb$2 := 0;
    result.Non_Crossing_Biased_Climb$1 := 0;
    result.Own_Above_Threat$7 := 0;
    result.Own_Below_Threat$3 := 0;
    result.Own_Below_Threat$4 := 0;
    upward_crossing_situation := 0;
    upward_preferred := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 68} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 69} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 70} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 72} true;
    call result.Inhibit_Biased_Climb$2 := Inhibit_Biased_Climb();
    goto label_9;

  label_9:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 72} true;
    upward_preferred := LIFT(INT_LT(Down_Separation, result.Inhibit_Biased_Climb$2));
    assume value_is(__ctobpl_const_4, upward_preferred);
    assume value_is(__ctobpl_const_5, Down_Separation);
    assume value_is(__ctobpl_const_6, result.Inhibit_Biased_Climb$2);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 73} true;
    goto label_10_true, label_10_false;

  label_10_false:
    assume upward_preferred == 0;
    assume value_is(__ctobpl_const_7, upward_preferred);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    call result.Own_Above_Threat$7 := Own_Above_Threat();
    goto label_30;

  label_30:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    goto label_30_true, label_30_false;

  label_30_false:
    assume result.Own_Above_Threat$7 == 0;
    assume value_is(__ctobpl_const_8, result.Own_Above_Threat$7);
    goto label_31;

  label_31:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    $Pred.9$ := 0;
    assume value_is(__ctobpl_const_12, $Pred.9$);
    goto label_38;

  label_38:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    result := $Pred.9$;
    assume value_is(__ctobpl_const_14, result);
    assume value_is(__ctobpl_const_15, $Pred.9$);
    goto label_29;

  label_29:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 81} true;
    result.Non_Crossing_Biased_Climb$1 := result;
    assume value_is(__ctobpl_const_24, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 82} true;
    return;

  label_30_true:
    assume result.Own_Above_Threat$7 != 0;
    assume value_is(__ctobpl_const_8, result.Own_Above_Threat$7);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    goto label_32_true, label_32_false;

  label_32_false:
    assume !INT_LEQ(300, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_9, Cur_Vertical_Sep);
    goto label_31;

  label_32_true:
    assume INT_LEQ(300, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_9, Cur_Vertical_Sep);
    goto label_33;

  label_33:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    call result.ALIM$8 := ALIM();
    goto label_36;

  label_36:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    goto label_36_true, label_36_false;

  label_36_false:
    assume !INT_LEQ(result.ALIM$8, Up_Separation);
    assume value_is(__ctobpl_const_10, result.ALIM$8);
    assume value_is(__ctobpl_const_11, Up_Separation);
    goto label_31;

  label_36_true:
    assume INT_LEQ(result.ALIM$8, Up_Separation);
    assume value_is(__ctobpl_const_10, result.ALIM$8);
    assume value_is(__ctobpl_const_11, Up_Separation);
    goto label_37;

  label_37:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 79} true;
    $Pred.9$ := 1;
    assume value_is(__ctobpl_const_13, $Pred.9$);
    goto label_38;

  label_10_true:
    assume upward_preferred != 0;
    assume value_is(__ctobpl_const_7, upward_preferred);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    call result.Own_Below_Threat$3 := Own_Below_Threat();
    goto label_17;

  label_17:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    goto label_17_true, label_17_false;

  label_17_false:
    assume result.Own_Below_Threat$3 == 0;
    assume value_is(__ctobpl_const_16, result.Own_Below_Threat$3);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    $Pred.6$ := 1;
    assume value_is(__ctobpl_const_20, $Pred.6$);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    result := $Pred.6$;
    assume value_is(__ctobpl_const_22, result);
    assume value_is(__ctobpl_const_23, $Pred.6$);
    goto label_29;

  label_17_true:
    assume result.Own_Below_Threat$3 != 0;
    assume value_is(__ctobpl_const_16, result.Own_Below_Threat$3);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    call result.Own_Below_Threat$4 := Own_Below_Threat();
    goto label_22;

  label_22:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    goto label_22_true, label_22_false;

  label_22_false:
    assume result.Own_Below_Threat$4 == 0;
    assume value_is(__ctobpl_const_17, result.Own_Below_Threat$4);
    goto label_23;

  label_23:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    $Pred.6$ := 0;
    assume value_is(__ctobpl_const_21, $Pred.6$);
    goto label_28;

  label_22_true:
    assume result.Own_Below_Threat$4 != 0;
    assume value_is(__ctobpl_const_17, result.Own_Below_Threat$4);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    call result.ALIM$5 := ALIM();
    goto label_27;

  label_27:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 75} true;
    goto label_27_true, label_27_false;

  label_27_false:
    assume !INT_LEQ(result.ALIM$5, Down_Separation);
    assume value_is(__ctobpl_const_18, result.ALIM$5);
    assume value_is(__ctobpl_const_19, Down_Separation);
    goto label_18;

  label_27_true:
    assume INT_LEQ(result.ALIM$5, Down_Separation);
    assume value_is(__ctobpl_const_18, result.ALIM$5);
    assume value_is(__ctobpl_const_19, Down_Separation);
    goto label_23;
}



procedure {:extern} Non_Crossing_Biased_Descend() returns (result.Non_Crossing_Biased_Descend$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} Non_Crossing_Biased_Descend() returns (result.Non_Crossing_Biased_Descend$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.5$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} result: int;
  var {:extern} result.ALIM$4: int;
  var {:extern} result.ALIM$8: int;
  var {:extern} result.Inhibit_Biased_Climb$2: int;
  var {:extern} result.Own_Above_Threat$6: int;
  var {:extern} result.Own_Above_Threat$7: int;
  var {:extern} result.Own_Below_Threat$3: int;
  var {:extern} upward_crossing_situation: int;
  var {:extern} upward_preferred: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    $Pred.5$ := 0;
    $Pred.9$ := 0;
    result := 0;
    result.ALIM$4 := 0;
    result.ALIM$8 := 0;
    result.Inhibit_Biased_Climb$2 := 0;
    result.Non_Crossing_Biased_Descend$1 := 0;
    result.Own_Above_Threat$6 := 0;
    result.Own_Above_Threat$7 := 0;
    result.Own_Below_Threat$3 := 0;
    upward_crossing_situation := 0;
    upward_preferred := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 86} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 87} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 88} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 90} true;
    call result.Inhibit_Biased_Climb$2 := Inhibit_Biased_Climb();
    goto label_9;

  label_9:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 90} true;
    upward_preferred := LIFT(INT_LT(Down_Separation, result.Inhibit_Biased_Climb$2));
    assume value_is(__ctobpl_const_25, upward_preferred);
    assume value_is(__ctobpl_const_26, Down_Separation);
    assume value_is(__ctobpl_const_27, result.Inhibit_Biased_Climb$2);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 91} true;
    goto label_10_true, label_10_false;

  label_10_false:
    assume upward_preferred == 0;
    assume value_is(__ctobpl_const_28, upward_preferred);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    call result.Own_Above_Threat$6 := Own_Above_Threat();
    goto label_27;

  label_27:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    goto label_27_true, label_27_false;

  label_27_false:
    assume result.Own_Above_Threat$6 == 0;
    assume value_is(__ctobpl_const_29, result.Own_Above_Threat$6);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    $Pred.9$ := 1;
    assume value_is(__ctobpl_const_34, $Pred.9$);
    goto label_38;

  label_38:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    result := $Pred.9$;
    assume value_is(__ctobpl_const_35, result);
    assume value_is(__ctobpl_const_36, $Pred.9$);
    goto label_26;

  label_26:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 99} true;
    result.Non_Crossing_Biased_Descend$1 := result;
    assume value_is(__ctobpl_const_45, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 100} true;
    return;

  label_27_true:
    assume result.Own_Above_Threat$6 != 0;
    assume value_is(__ctobpl_const_29, result.Own_Above_Threat$6);
    goto label_29;

  label_29:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    call result.Own_Above_Threat$7 := Own_Above_Threat();
    goto label_32;

  label_32:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    goto label_32_true, label_32_false;

  label_32_false:
    assume result.Own_Above_Threat$7 == 0;
    assume value_is(__ctobpl_const_30, result.Own_Above_Threat$7);
    goto label_33;

  label_33:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    $Pred.9$ := 0;
    assume value_is(__ctobpl_const_33, $Pred.9$);
    goto label_38;

  label_32_true:
    assume result.Own_Above_Threat$7 != 0;
    assume value_is(__ctobpl_const_30, result.Own_Above_Threat$7);
    goto label_34;

  label_34:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    call result.ALIM$8 := ALIM();
    goto label_37;

  label_37:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 97} true;
    goto label_37_true, label_37_false;

  label_37_false:
    assume !INT_LEQ(result.ALIM$8, Up_Separation);
    assume value_is(__ctobpl_const_31, result.ALIM$8);
    assume value_is(__ctobpl_const_32, Up_Separation);
    goto label_33;

  label_37_true:
    assume INT_LEQ(result.ALIM$8, Up_Separation);
    assume value_is(__ctobpl_const_31, result.ALIM$8);
    assume value_is(__ctobpl_const_32, Up_Separation);
    goto label_28;

  label_10_true:
    assume upward_preferred != 0;
    assume value_is(__ctobpl_const_28, upward_preferred);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    call result.Own_Below_Threat$3 := Own_Below_Threat();
    goto label_17;

  label_17:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    goto label_17_true, label_17_false;

  label_17_false:
    assume result.Own_Below_Threat$3 == 0;
    assume value_is(__ctobpl_const_37, result.Own_Below_Threat$3);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    $Pred.5$ := 0;
    assume value_is(__ctobpl_const_41, $Pred.5$);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    result := $Pred.5$;
    assume value_is(__ctobpl_const_43, result);
    assume value_is(__ctobpl_const_44, $Pred.5$);
    goto label_26;

  label_17_true:
    assume result.Own_Below_Threat$3 != 0;
    assume value_is(__ctobpl_const_37, result.Own_Below_Threat$3);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    goto label_19_true, label_19_false;

  label_19_false:
    assume !INT_LEQ(300, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_38, Cur_Vertical_Sep);
    goto label_18;

  label_19_true:
    assume INT_LEQ(300, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_38, Cur_Vertical_Sep);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    call result.ALIM$4 := ALIM();
    goto label_23;

  label_23:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    goto label_23_true, label_23_false;

  label_23_false:
    assume !INT_LEQ(result.ALIM$4, Down_Separation);
    assume value_is(__ctobpl_const_39, result.ALIM$4);
    assume value_is(__ctobpl_const_40, Down_Separation);
    goto label_18;

  label_23_true:
    assume INT_LEQ(result.ALIM$4, Down_Separation);
    assume value_is(__ctobpl_const_39, result.ALIM$4);
    assume value_is(__ctobpl_const_40, Down_Separation);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 93} true;
    $Pred.5$ := 1;
    assume value_is(__ctobpl_const_42, $Pred.5$);
    goto label_25;
}



procedure {:extern} Own_Above_Threat() returns (result.Own_Above_Threat$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} Own_Above_Threat() returns (result.Own_Above_Threat$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    result.Own_Above_Threat$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 109} true;
    result.Own_Above_Threat$1 := LIFT(INT_LT(Other_Tracked_Alt, Own_Tracked_Alt));
    assume value_is(__ctobpl_const_46, Other_Tracked_Alt);
    assume value_is(__ctobpl_const_47, Own_Tracked_Alt);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 110} true;
    return;
}



procedure {:extern} Own_Below_Threat() returns (result.Own_Below_Threat$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} Own_Below_Threat() returns (result.Own_Below_Threat$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    result.Own_Below_Threat$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 104} true;
    result.Own_Below_Threat$1 := LIFT(INT_LT(Own_Tracked_Alt, Other_Tracked_Alt));
    assume value_is(__ctobpl_const_48, Own_Tracked_Alt);
    assume value_is(__ctobpl_const_49, Other_Tracked_Alt);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 105} true;
    return;
}



procedure {:extern} alt_sep_test() returns (result.alt_sep_test$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} alt_sep_test() returns (result.alt_sep_test$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.2$: int;
  var {:extern} $Pred.3$: int;
  var {:extern} $Pred.6$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} alt_sep: int;
  var {:extern} enabled: int;
  var {:extern} intent_not_known: int;
  var {:extern} need_downward_RA: int;
  var {:extern} need_upward_RA: int;
  var {:extern} result.Non_Crossing_Biased_Climb$4: int;
  var {:extern} result.Non_Crossing_Biased_Descend$7: int;
  var {:extern} result.Own_Above_Threat$8: int;
  var {:extern} result.Own_Below_Threat$5: int;
  var {:extern} tcas_equipped: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    $Pred.2$ := 0;
    $Pred.3$ := 0;
    $Pred.6$ := 0;
    $Pred.9$ := 0;
    alt_sep := 0;
    enabled := 0;
    intent_not_known := 0;
    need_downward_RA := 0;
    need_upward_RA := 0;
    result.Non_Crossing_Biased_Climb$4 := 0;
    result.Non_Crossing_Biased_Descend$7 := 0;
    result.Own_Above_Threat$8 := 0;
    result.Own_Below_Threat$5 := 0;
    result.alt_sep_test$1 := 0;
    tcas_equipped := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 114} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 114} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 114} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 115} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 115} true;
    goto label_8;

  label_8:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 116} true;
    goto label_9;

  label_9:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 118} true;
    goto label_9_true, label_9_false;

  label_9_false:
    assume High_Confidence == 0;
    assume value_is(__ctobpl_const_50, High_Confidence);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 118} true;
    $Pred.2$ := 0;
    assume value_is(__ctobpl_const_53, $Pred.2$);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 118} true;
    enabled := $Pred.2$;
    assume value_is(__ctobpl_const_55, enabled);
    assume value_is(__ctobpl_const_56, $Pred.2$);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 119} true;
    tcas_equipped := LIFT(INT_EQ(Other_Capability, 1));
    assume value_is(__ctobpl_const_57, tcas_equipped);
    assume value_is(__ctobpl_const_58, Other_Capability);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 120} true;
    goto label_16_true, label_16_false;

  label_16_false:
    assume Two_of_Three_Reports_Valid == 0;
    assume value_is(__ctobpl_const_59, Two_of_Three_Reports_Valid);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 120} true;
    $Pred.3$ := 0;
    assume value_is(__ctobpl_const_62, $Pred.3$);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 120} true;
    intent_not_known := $Pred.3$;
    assume value_is(__ctobpl_const_63, intent_not_known);
    assume value_is(__ctobpl_const_64, $Pred.3$);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 122} true;
    alt_sep := 0;
    assume value_is(__ctobpl_const_65, alt_sep);
    goto label_22;

  label_22:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 124} true;
    goto label_22_true, label_22_false;

  label_22_false:
    assume enabled == 0;
    assume value_is(__ctobpl_const_66, enabled);
    goto label_23;

  label_23:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 141} true;
    result.alt_sep_test$1 := alt_sep;
    assume value_is(__ctobpl_const_90, alt_sep);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 142} true;
    return;

  label_22_true:
    assume enabled != 0;
    assume value_is(__ctobpl_const_66, enabled);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 124} true;
    goto label_24_true, label_24_false;

  label_24_false:
    assume tcas_equipped == 0;
    assume value_is(__ctobpl_const_67, tcas_equipped);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 124} true;
    goto label_25_true, label_25_false;

  label_25_false:
    assume tcas_equipped == 0;
    assume value_is(__ctobpl_const_69, tcas_equipped);
    goto label_27;

  label_27:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    call result.Non_Crossing_Biased_Climb$4 := Non_Crossing_Biased_Climb();
    goto label_30;

  label_30:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    goto label_30_true, label_30_false;

  label_30_false:
    assume result.Non_Crossing_Biased_Climb$4 == 0;
    assume value_is(__ctobpl_const_70, result.Non_Crossing_Biased_Climb$4);
    goto label_31;

  label_31:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    $Pred.6$ := 0;
    assume value_is(__ctobpl_const_72, $Pred.6$);
    goto label_37;

  label_37:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    need_upward_RA := $Pred.6$;
    assume value_is(__ctobpl_const_74, need_upward_RA);
    assume value_is(__ctobpl_const_75, $Pred.6$);
    goto label_38;

  label_38:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    call result.Non_Crossing_Biased_Descend$7 := Non_Crossing_Biased_Descend();
    goto label_41;

  label_41:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    goto label_41_true, label_41_false;

  label_41_false:
    assume result.Non_Crossing_Biased_Descend$7 == 0;
    assume value_is(__ctobpl_const_76, result.Non_Crossing_Biased_Descend$7);
    goto label_42;

  label_42:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    $Pred.9$ := 0;
    assume value_is(__ctobpl_const_78, $Pred.9$);
    goto label_48;

  label_48:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    need_downward_RA := $Pred.9$;
    assume value_is(__ctobpl_const_80, need_downward_RA);
    assume value_is(__ctobpl_const_81, $Pred.9$);
    goto label_49;

  label_49:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 128} true;
    goto label_49_true, label_49_false;

  label_49_false:
    assume need_upward_RA == 0;
    assume value_is(__ctobpl_const_82, need_upward_RA);
    goto label_50;

  label_50:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 133} true;
    goto label_50_true, label_50_false;

  label_50_false:
    assume need_upward_RA == 0;
    assume value_is(__ctobpl_const_84, need_upward_RA);
    goto label_53;

  label_53:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 135} true;
    goto label_53_true, label_53_false;

  label_53_false:
    assume need_downward_RA == 0;
    assume value_is(__ctobpl_const_85, need_downward_RA);
    goto label_55;

  label_55:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 138} true;
    alt_sep := 0;
    assume value_is(__ctobpl_const_86, alt_sep);
    goto label_23;

  label_53_true:
    assume need_downward_RA != 0;
    assume value_is(__ctobpl_const_85, need_downward_RA);
    goto label_56;

  label_56:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 136} true;
    alt_sep := 2;
    assume value_is(__ctobpl_const_87, alt_sep);
    goto label_23;

  label_50_true:
    assume need_upward_RA != 0;
    assume value_is(__ctobpl_const_84, need_upward_RA);
    goto label_54;

  label_54:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 134} true;
    alt_sep := 1;
    assume value_is(__ctobpl_const_88, alt_sep);
    goto label_23;

  label_49_true:
    assume need_upward_RA != 0;
    assume value_is(__ctobpl_const_82, need_upward_RA);
    goto label_51;

  label_51:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 128} true;
    goto label_51_true, label_51_false;

  label_51_false:
    assume need_downward_RA == 0;
    assume value_is(__ctobpl_const_83, need_downward_RA);
    goto label_50;

  label_51_true:
    assume need_downward_RA != 0;
    assume value_is(__ctobpl_const_83, need_downward_RA);
    goto label_52;

  label_52:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 132} true;
    alt_sep := 0;
    assume value_is(__ctobpl_const_89, alt_sep);
    goto label_23;

  label_41_true:
    assume result.Non_Crossing_Biased_Descend$7 != 0;
    assume value_is(__ctobpl_const_76, result.Non_Crossing_Biased_Descend$7);
    goto label_43;

  label_43:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    call result.Own_Above_Threat$8 := Own_Above_Threat();
    goto label_46;

  label_46:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    goto label_46_true, label_46_false;

  label_46_false:
    assume result.Own_Above_Threat$8 == 0;
    assume value_is(__ctobpl_const_77, result.Own_Above_Threat$8);
    goto label_42;

  label_46_true:
    assume result.Own_Above_Threat$8 != 0;
    assume value_is(__ctobpl_const_77, result.Own_Above_Threat$8);
    goto label_47;

  label_47:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 127} true;
    $Pred.9$ := 1;
    assume value_is(__ctobpl_const_79, $Pred.9$);
    goto label_48;

  label_30_true:
    assume result.Non_Crossing_Biased_Climb$4 != 0;
    assume value_is(__ctobpl_const_70, result.Non_Crossing_Biased_Climb$4);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    call result.Own_Below_Threat$5 := Own_Below_Threat();
    goto label_35;

  label_35:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    goto label_35_true, label_35_false;

  label_35_false:
    assume result.Own_Below_Threat$5 == 0;
    assume value_is(__ctobpl_const_71, result.Own_Below_Threat$5);
    goto label_31;

  label_35_true:
    assume result.Own_Below_Threat$5 != 0;
    assume value_is(__ctobpl_const_71, result.Own_Below_Threat$5);
    goto label_36;

  label_36:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 126} true;
    $Pred.6$ := 1;
    assume value_is(__ctobpl_const_73, $Pred.6$);
    goto label_37;

  label_25_true:
    assume tcas_equipped != 0;
    assume value_is(__ctobpl_const_69, tcas_equipped);
    goto label_23;

  label_24_true:
    assume tcas_equipped != 0;
    assume value_is(__ctobpl_const_67, tcas_equipped);
    goto label_26;

  label_26:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 124} true;
    goto label_26_true, label_26_false;

  label_26_false:
    assume intent_not_known == 0;
    assume value_is(__ctobpl_const_68, intent_not_known);
    goto label_25;

  label_26_true:
    assume intent_not_known != 0;
    assume value_is(__ctobpl_const_68, intent_not_known);
    goto label_27;

  label_16_true:
    assume Two_of_Three_Reports_Valid != 0;
    assume value_is(__ctobpl_const_59, Two_of_Three_Reports_Valid);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 120} true;
    goto label_18_true, label_18_false;

  label_18_false:
    assume Other_RAC == 0;
    assume value_is(__ctobpl_const_60, Other_RAC);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 120} true;
    $Pred.3$ := 1;
    assume value_is(__ctobpl_const_61, $Pred.3$);
    goto label_20;

  label_18_true:
    assume Other_RAC != 0;
    assume value_is(__ctobpl_const_60, Other_RAC);
    goto label_17;

  label_9_true:
    assume High_Confidence != 0;
    assume value_is(__ctobpl_const_50, High_Confidence);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 118} true;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_LEQ(Own_Tracked_Alt_Rate, 600);
    assume value_is(__ctobpl_const_51, Own_Tracked_Alt_Rate);
    goto label_10;

  label_11_true:
    assume INT_LEQ(Own_Tracked_Alt_Rate, 600);
    assume value_is(__ctobpl_const_51, Own_Tracked_Alt_Rate);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 118} true;
    goto label_12_true, label_12_false;

  label_12_false:
    assume !INT_LT(600, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_52, Cur_Vertical_Sep);
    goto label_10;

  label_12_true:
    assume INT_LT(600, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_52, Cur_Vertical_Sep);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 118} true;
    $Pred.2$ := 1;
    assume value_is(__ctobpl_const_54, $Pred.2$);
    goto label_14;
}



procedure {:extern} initialize();
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} initialize()
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 50} true;
    assert Positive_RA_Alt_Thresh != 0;
    Mem_T.INT4 := Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 0) := 400];
    assume value_is(__ctobpl_const_91, Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 0)]);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 51} true;
    assert Positive_RA_Alt_Thresh != 0;
    Mem_T.INT4 := Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 1) := 500];
    assume value_is(__ctobpl_const_92, Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 1)]);
    goto label_5;

  label_5:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 52} true;
    assert Positive_RA_Alt_Thresh != 0;
    Mem_T.INT4 := Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 2) := 640];
    assume value_is(__ctobpl_const_93, Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 2)]);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 53} true;
    assert Positive_RA_Alt_Thresh != 0;
    Mem_T.INT4 := Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 3) := 740];
    assume value_is(__ctobpl_const_94, Mem_T.INT4[PLUS(Positive_RA_Alt_Thresh, 4, 3)]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 54} true;
    return;
}



procedure {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int);
  free requires INT_LT(0, alloc);
  modifies Alt_Layer_Value, Climb_Inhibit, Cur_Vertical_Sep, Down_Separation, High_Confidence, Other_Capability, Other_RAC, Other_Tracked_Alt, Own_Tracked_Alt, Own_Tracked_Alt_Rate, Two_of_Three_Reports_Valid, Up_Separation;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} argc: int;
  var {:extern} argv: int;
  var {:extern} $atoi.arg.1$19$: int;
  var {:extern} $atoi.arg.1$21$: int;
  var {:extern} $atoi.arg.1$23$: int;
  var {:extern} $atoi.arg.1$25$: int;
  var {:extern} $atoi.arg.1$27$: int;
  var {:extern} $atoi.arg.1$29$: int;
  var {:extern} $atoi.arg.1$31$: int;
  var {:extern} $atoi.arg.1$33$: int;
  var {:extern} $atoi.arg.1$35$: int;
  var {:extern} $atoi.arg.1$37$: int;
  var {:extern} $atoi.arg.1$39$: int;
  var {:extern} $atoi.arg.1$41$: int;
  var {:extern} $fprintf.arg.1$10$: int;
  var {:extern} $fprintf.arg.1$13$: int;
  var {:extern} $fprintf.arg.1$16$: int;
  var {:extern} $fprintf.arg.1$4$: int;
  var {:extern} $fprintf.arg.1$45$: int;
  var {:extern} $fprintf.arg.1$7$: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.__iob_func$6: int;
  var {:extern} result.__iob_func$9: int;
  var {:extern} result.__iob_func$12: int;
  var {:extern} result.__iob_func$15: int;
  var {:extern} result.__iob_func$44: int;
  var {:extern} result.alt_sep_test$43: int;
  var {:extern} result.atoi$18: int;
  var {:extern} result.atoi$20: int;
  var {:extern} result.atoi$22: int;
  var {:extern} result.atoi$24: int;
  var {:extern} result.atoi$26: int;
  var {:extern} result.atoi$28: int;
  var {:extern} result.atoi$30: int;
  var {:extern} result.atoi$32: int;
  var {:extern} result.atoi$34: int;
  var {:extern} result.atoi$36: int;
  var {:extern} result.atoi$38: int;
  var {:extern} result.atoi$40: int;
  var {:extern} result.exit$17: int;
  var {:extern} result.exit$46: int;
  var {:extern} result.fprintf$2: int;
  var {:extern} result.fprintf$5: int;
  var {:extern} result.fprintf$8: int;
  var {:extern} result.fprintf$11: int;
  var {:extern} result.fprintf$14: int;
  var {:extern} result.fprintf$42: int;
  var {:extern} tempBoogie0: int;
  var {:extern} tempBoogie1: int;
  var {:extern} tempBoogie2: int;
  var {:extern} tempBoogie3: int;
  var {:extern} tempBoogie4: int;
  var {:extern} tempBoogie5: int;
  var {:extern} tempBoogie6: int;
  var {:extern} tempBoogie7: int;
  var {:extern} tempBoogie8: int;
  var {:extern} tempBoogie9: int;
  var {:extern} tempBoogie10: int;
  var {:extern} tempBoogie11: int;
  var {:extern} tempBoogie12: int;
  var {:extern} tempBoogie13: int;
  var {:extern} tempBoogie14: int;
  var {:extern} tempBoogie15: int;
  var {:extern} tempBoogie16: int;
  var {:extern} tempBoogie17: int;
  var {:extern} tempBoogie18: int;
  var {:extern} tempBoogie19: int;

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    assume INT_LT(argv.__1, alloc);
    argc := 0;
    argv := 0;
    $atoi.arg.1$19$ := 0;
    $atoi.arg.1$21$ := 0;
    $atoi.arg.1$23$ := 0;
    $atoi.arg.1$25$ := 0;
    $atoi.arg.1$27$ := 0;
    $atoi.arg.1$29$ := 0;
    $atoi.arg.1$31$ := 0;
    $atoi.arg.1$33$ := 0;
    $atoi.arg.1$35$ := 0;
    $atoi.arg.1$37$ := 0;
    $atoi.arg.1$39$ := 0;
    $atoi.arg.1$41$ := 0;
    $fprintf.arg.1$10$ := 0;
    $fprintf.arg.1$13$ := 0;
    $fprintf.arg.1$16$ := 0;
    $fprintf.arg.1$4$ := 0;
    $fprintf.arg.1$45$ := 0;
    $fprintf.arg.1$7$ := 0;
    result.__iob_func$3 := 0;
    result.__iob_func$6 := 0;
    result.__iob_func$9 := 0;
    result.__iob_func$12 := 0;
    result.__iob_func$15 := 0;
    result.__iob_func$44 := 0;
    result.alt_sep_test$43 := 0;
    result.atoi$18 := 0;
    result.atoi$20 := 0;
    result.atoi$22 := 0;
    result.atoi$24 := 0;
    result.atoi$26 := 0;
    result.atoi$28 := 0;
    result.atoi$30 := 0;
    result.atoi$32 := 0;
    result.atoi$34 := 0;
    result.atoi$36 := 0;
    result.atoi$38 := 0;
    result.atoi$40 := 0;
    result.exit$17 := 0;
    result.exit$46 := 0;
    result.fprintf$2 := 0;
    result.fprintf$5 := 0;
    result.fprintf$8 := 0;
    result.fprintf$11 := 0;
    result.fprintf$14 := 0;
    result.fprintf$42 := 0;
    result.main$1 := 0;
    argc := argc.__1;
    argv := argv.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 148} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume !INT_LT(argc, 13);
    assume value_is(__ctobpl_const_95, argc);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 157} true;
    call initialize();
    goto label_45;

  label_45:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 158} true;
    assert argv != 0;
    $atoi.arg.1$19$ := Mem_T.PCHAR[PLUS(argv, 4, 1)];
    assume value_is(__ctobpl_const_96, $atoi.arg.1$19$);
    assume value_is(__ctobpl_const_97, argv);
    assume value_is(__ctobpl_const_98, Mem_T.PCHAR[PLUS(argv, 4, 1)]);
    goto label_46;

  label_46:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 158} true;
    call result.atoi$18 := atoi($atoi.arg.1$19$);
    assume value_is(__ctobpl_const_99, $atoi.arg.1$19$);
    assume value_is(__ctobpl_const_100, $atoi.arg.1$19$);
    goto label_49;

  label_49:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 158} true;
    Cur_Vertical_Sep := result.atoi$18;
    assume value_is(__ctobpl_const_101, Cur_Vertical_Sep);
    assume value_is(__ctobpl_const_102, result.atoi$18);
    goto label_50;

  label_50:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 159} true;
    assert argv != 0;
    $atoi.arg.1$21$ := Mem_T.PCHAR[PLUS(argv, 4, 2)];
    assume value_is(__ctobpl_const_103, $atoi.arg.1$21$);
    assume value_is(__ctobpl_const_104, argv);
    assume value_is(__ctobpl_const_105, Mem_T.PCHAR[PLUS(argv, 4, 2)]);
    goto label_51;

  label_51:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 159} true;
    call result.atoi$20 := atoi($atoi.arg.1$21$);
    assume value_is(__ctobpl_const_106, $atoi.arg.1$21$);
    assume value_is(__ctobpl_const_107, $atoi.arg.1$21$);
    goto label_54;

  label_54:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 159} true;
    High_Confidence := result.atoi$20;
    assume value_is(__ctobpl_const_108, High_Confidence);
    assume value_is(__ctobpl_const_109, result.atoi$20);
    goto label_55;

  label_55:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 160} true;
    assert argv != 0;
    $atoi.arg.1$23$ := Mem_T.PCHAR[PLUS(argv, 4, 3)];
    assume value_is(__ctobpl_const_110, $atoi.arg.1$23$);
    assume value_is(__ctobpl_const_111, argv);
    assume value_is(__ctobpl_const_112, Mem_T.PCHAR[PLUS(argv, 4, 3)]);
    goto label_56;

  label_56:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 160} true;
    call result.atoi$22 := atoi($atoi.arg.1$23$);
    assume value_is(__ctobpl_const_113, $atoi.arg.1$23$);
    assume value_is(__ctobpl_const_114, $atoi.arg.1$23$);
    goto label_59;

  label_59:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 160} true;
    Two_of_Three_Reports_Valid := result.atoi$22;
    assume value_is(__ctobpl_const_115, Two_of_Three_Reports_Valid);
    assume value_is(__ctobpl_const_116, result.atoi$22);
    goto label_60;

  label_60:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 161} true;
    assert argv != 0;
    $atoi.arg.1$25$ := Mem_T.PCHAR[PLUS(argv, 4, 4)];
    assume value_is(__ctobpl_const_117, $atoi.arg.1$25$);
    assume value_is(__ctobpl_const_118, argv);
    assume value_is(__ctobpl_const_119, Mem_T.PCHAR[PLUS(argv, 4, 4)]);
    goto label_61;

  label_61:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 161} true;
    call result.atoi$24 := atoi($atoi.arg.1$25$);
    assume value_is(__ctobpl_const_120, $atoi.arg.1$25$);
    assume value_is(__ctobpl_const_121, $atoi.arg.1$25$);
    goto label_64;

  label_64:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 161} true;
    Own_Tracked_Alt := result.atoi$24;
    assume value_is(__ctobpl_const_122, Own_Tracked_Alt);
    assume value_is(__ctobpl_const_123, result.atoi$24);
    goto label_65;

  label_65:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 162} true;
    assert argv != 0;
    $atoi.arg.1$27$ := Mem_T.PCHAR[PLUS(argv, 4, 5)];
    assume value_is(__ctobpl_const_124, $atoi.arg.1$27$);
    assume value_is(__ctobpl_const_125, argv);
    assume value_is(__ctobpl_const_126, Mem_T.PCHAR[PLUS(argv, 4, 5)]);
    goto label_66;

  label_66:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 162} true;
    call result.atoi$26 := atoi($atoi.arg.1$27$);
    assume value_is(__ctobpl_const_127, $atoi.arg.1$27$);
    assume value_is(__ctobpl_const_128, $atoi.arg.1$27$);
    goto label_69;

  label_69:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 162} true;
    Own_Tracked_Alt_Rate := result.atoi$26;
    assume value_is(__ctobpl_const_129, Own_Tracked_Alt_Rate);
    assume value_is(__ctobpl_const_130, result.atoi$26);
    goto label_70;

  label_70:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 163} true;
    assert argv != 0;
    $atoi.arg.1$29$ := Mem_T.PCHAR[PLUS(argv, 4, 6)];
    assume value_is(__ctobpl_const_131, $atoi.arg.1$29$);
    assume value_is(__ctobpl_const_132, argv);
    assume value_is(__ctobpl_const_133, Mem_T.PCHAR[PLUS(argv, 4, 6)]);
    goto label_71;

  label_71:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 163} true;
    call result.atoi$28 := atoi($atoi.arg.1$29$);
    assume value_is(__ctobpl_const_134, $atoi.arg.1$29$);
    assume value_is(__ctobpl_const_135, $atoi.arg.1$29$);
    goto label_74;

  label_74:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 163} true;
    Other_Tracked_Alt := result.atoi$28;
    assume value_is(__ctobpl_const_136, Other_Tracked_Alt);
    assume value_is(__ctobpl_const_137, result.atoi$28);
    goto label_75;

  label_75:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 164} true;
    assert argv != 0;
    $atoi.arg.1$31$ := Mem_T.PCHAR[PLUS(argv, 4, 7)];
    assume value_is(__ctobpl_const_138, $atoi.arg.1$31$);
    assume value_is(__ctobpl_const_139, argv);
    assume value_is(__ctobpl_const_140, Mem_T.PCHAR[PLUS(argv, 4, 7)]);
    goto label_76;

  label_76:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 164} true;
    call result.atoi$30 := atoi($atoi.arg.1$31$);
    assume value_is(__ctobpl_const_141, $atoi.arg.1$31$);
    assume value_is(__ctobpl_const_142, $atoi.arg.1$31$);
    goto label_79;

  label_79:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 164} true;
    Alt_Layer_Value := result.atoi$30;
    assume value_is(__ctobpl_const_143, Alt_Layer_Value);
    assume value_is(__ctobpl_const_144, result.atoi$30);
    goto label_80;

  label_80:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 165} true;
    assert argv != 0;
    $atoi.arg.1$33$ := Mem_T.PCHAR[PLUS(argv, 4, 8)];
    assume value_is(__ctobpl_const_145, $atoi.arg.1$33$);
    assume value_is(__ctobpl_const_146, argv);
    assume value_is(__ctobpl_const_147, Mem_T.PCHAR[PLUS(argv, 4, 8)]);
    goto label_81;

  label_81:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 165} true;
    call result.atoi$32 := atoi($atoi.arg.1$33$);
    assume value_is(__ctobpl_const_148, $atoi.arg.1$33$);
    assume value_is(__ctobpl_const_149, $atoi.arg.1$33$);
    goto label_84;

  label_84:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 165} true;
    Up_Separation := result.atoi$32;
    assume value_is(__ctobpl_const_150, Up_Separation);
    assume value_is(__ctobpl_const_151, result.atoi$32);
    goto label_85;

  label_85:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 166} true;
    assert argv != 0;
    $atoi.arg.1$35$ := Mem_T.PCHAR[PLUS(argv, 4, 9)];
    assume value_is(__ctobpl_const_152, $atoi.arg.1$35$);
    assume value_is(__ctobpl_const_153, argv);
    assume value_is(__ctobpl_const_154, Mem_T.PCHAR[PLUS(argv, 4, 9)]);
    goto label_86;

  label_86:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 166} true;
    call result.atoi$34 := atoi($atoi.arg.1$35$);
    assume value_is(__ctobpl_const_155, $atoi.arg.1$35$);
    assume value_is(__ctobpl_const_156, $atoi.arg.1$35$);
    goto label_89;

  label_89:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 166} true;
    Down_Separation := result.atoi$34;
    assume value_is(__ctobpl_const_157, Down_Separation);
    assume value_is(__ctobpl_const_158, result.atoi$34);
    goto label_90;

  label_90:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 167} true;
    assert argv != 0;
    $atoi.arg.1$37$ := Mem_T.PCHAR[PLUS(argv, 4, 10)];
    assume value_is(__ctobpl_const_159, $atoi.arg.1$37$);
    assume value_is(__ctobpl_const_160, argv);
    assume value_is(__ctobpl_const_161, Mem_T.PCHAR[PLUS(argv, 4, 10)]);
    goto label_91;

  label_91:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 167} true;
    call result.atoi$36 := atoi($atoi.arg.1$37$);
    assume value_is(__ctobpl_const_162, $atoi.arg.1$37$);
    assume value_is(__ctobpl_const_163, $atoi.arg.1$37$);
    goto label_94;

  label_94:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 167} true;
    Other_RAC := result.atoi$36;
    assume value_is(__ctobpl_const_164, Other_RAC);
    assume value_is(__ctobpl_const_165, result.atoi$36);
    goto label_95;

  label_95:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 168} true;
    assert argv != 0;
    $atoi.arg.1$39$ := Mem_T.PCHAR[PLUS(argv, 4, 11)];
    assume value_is(__ctobpl_const_166, $atoi.arg.1$39$);
    assume value_is(__ctobpl_const_167, argv);
    assume value_is(__ctobpl_const_168, Mem_T.PCHAR[PLUS(argv, 4, 11)]);
    goto label_96;

  label_96:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 168} true;
    call result.atoi$38 := atoi($atoi.arg.1$39$);
    assume value_is(__ctobpl_const_169, $atoi.arg.1$39$);
    assume value_is(__ctobpl_const_170, $atoi.arg.1$39$);
    goto label_99;

  label_99:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 168} true;
    Other_Capability := result.atoi$38;
    assume value_is(__ctobpl_const_171, Other_Capability);
    assume value_is(__ctobpl_const_172, result.atoi$38);
    goto label_100;

  label_100:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 169} true;
    assert argv != 0;
    $atoi.arg.1$41$ := Mem_T.PCHAR[PLUS(argv, 4, 12)];
    assume value_is(__ctobpl_const_173, $atoi.arg.1$41$);
    assume value_is(__ctobpl_const_174, argv);
    assume value_is(__ctobpl_const_175, Mem_T.PCHAR[PLUS(argv, 4, 12)]);
    goto label_101;

  label_101:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 169} true;
    call result.atoi$40 := atoi($atoi.arg.1$41$);
    assume value_is(__ctobpl_const_176, $atoi.arg.1$41$);
    assume value_is(__ctobpl_const_177, $atoi.arg.1$41$);
    goto label_104;

  label_104:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 169} true;
    Climb_Inhibit := result.atoi$40;
    assume value_is(__ctobpl_const_178, Climb_Inhibit);
    assume value_is(__ctobpl_const_179, result.atoi$40);
    goto label_105;

  label_105:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 171} true;
    call result.alt_sep_test$43 := alt_sep_test();
    goto label_108;

  label_108:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 171} true;
    call result.__iob_func$44 := __iob_func();
    goto label_111;

  label_111:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 171} true;
    assert result.__iob_func$44 != 0;
    $fprintf.arg.1$45$ := PLUS(result.__iob_func$44, 32, 1);
    assume value_is(__ctobpl_const_180, $fprintf.arg.1$45$);
    assume value_is(__ctobpl_const_181, result.__iob_func$44);
    goto label_112;

  label_112:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 171} true;
    call result.fprintf$42 := det_choice();
    goto label_115;

  label_115:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 172} true;
    call result.exit$46 := det_choice();
    return;

  label_3_true:
    assume INT_LT(argc, 13);
    assume value_is(__ctobpl_const_95, argc);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 150} true;
    call result.__iob_func$3 := __iob_func();
    goto label_10;

  label_10:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 150} true;
    assert result.__iob_func$3 != 0;
    $fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1);
    assume value_is(__ctobpl_const_182, $fprintf.arg.1$4$);
    assume value_is(__ctobpl_const_183, result.__iob_func$3);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 150} true;
    call result.fprintf$2 := det_choice();
    goto label_14;

  label_14:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 151} true;
    call result.__iob_func$6 := __iob_func();
    goto label_17;

  label_17:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 151} true;
    assert result.__iob_func$6 != 0;
    $fprintf.arg.1$7$ := PLUS(result.__iob_func$6, 32, 1);
    assume value_is(__ctobpl_const_184, $fprintf.arg.1$7$);
    assume value_is(__ctobpl_const_185, result.__iob_func$6);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 151} true;
    call result.fprintf$5 := det_choice();
    goto label_21;

  label_21:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 152} true;
    call result.__iob_func$9 := __iob_func();
    goto label_24;

  label_24:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 152} true;
    assert result.__iob_func$9 != 0;
    $fprintf.arg.1$10$ := PLUS(result.__iob_func$9, 32, 1);
    assume value_is(__ctobpl_const_186, $fprintf.arg.1$10$);
    assume value_is(__ctobpl_const_187, result.__iob_func$9);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 152} true;
    call result.fprintf$8 := det_choice();
    goto label_28;

  label_28:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 153} true;
    call result.__iob_func$12 := __iob_func();
    goto label_31;

  label_31:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 153} true;
    assert result.__iob_func$12 != 0;
    $fprintf.arg.1$13$ := PLUS(result.__iob_func$12, 32, 1);
    assume value_is(__ctobpl_const_188, $fprintf.arg.1$13$);
    assume value_is(__ctobpl_const_189, result.__iob_func$12);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 153} true;
    call result.fprintf$11 := det_choice();
    goto label_35;

  label_35:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 154} true;
    call result.__iob_func$15 := __iob_func();
    goto label_38;

  label_38:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 154} true;
    assert result.__iob_func$15 != 0;
    $fprintf.arg.1$16$ := PLUS(result.__iob_func$15, 32, 1);
    assume value_is(__ctobpl_const_190, $fprintf.arg.1$16$);
    assume value_is(__ctobpl_const_191, result.__iob_func$15);
    goto label_39;

  label_39:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 154} true;
    call result.fprintf$14 := det_choice();
    goto label_42;

  label_42:
    assert {:sourcefile ".\v29\tcas.c"} {:sourceline 155} true;
    call result.exit$17 := det_choice();
    return;
}


