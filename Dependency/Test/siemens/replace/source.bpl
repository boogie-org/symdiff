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

var {:extern} Mem_T.A100CHAR: [int]int;

var {:extern} Mem_T.A25CHAR: [int]int;

var {:extern} Mem_T.A26CHAR: [int]int;

var {:extern} Mem_T.A28CHAR: [int]int;

var {:extern} Mem_T.A29CHAR: [int]int;

var {:extern} Mem_T.A32CHAR: [int]int;

var {:extern} Mem_T.CHAR: [int]int;

var {:extern} Mem_T.INT4: [int]int;

var {:extern} Mem_T.PCHAR: [int]int;

var {:extern} Mem_T.PINT4: [int]int;

var {:extern} Mem_T.P_iobuf: [int]int;

var {:extern} Mem_T.UINT4: [int]int;

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

const {:extern} unique T.A100CHAR: name;

const {:extern} unique T.A25CHAR: name;

const {:extern} unique T.A26CHAR: name;

const {:extern} unique T.A28CHAR: name;

const {:extern} unique T.A29CHAR: name;

const {:extern} unique T.A32CHAR: name;

const {:extern} unique T.CHAR: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PA100CHAR: name;

const {:extern} unique T.PA25CHAR: name;

const {:extern} unique T.PA26CHAR: name;

const {:extern} unique T.PA28CHAR: name;

const {:extern} unique T.PA29CHAR: name;

const {:extern} unique T.PA32CHAR: name;

const {:extern} unique T.PCHAR: name;

const {:extern} unique T.PINT4: name;

const {:extern} unique T.PPCHAR: name;

const {:extern} unique T.PPINT4: name;

const {:extern} unique T.PPPCHAR: name;

const {:extern} unique T.PP_iobuf: name;

const {:extern} unique T.P_iobuf: name;

const {:extern} unique T.UINT4: name;

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

function {:extern} value_is(c: int, e: int) : bool;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 58} unique __ctobpl_const_10: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 60} unique __ctobpl_const_15: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 428} unique __ctobpl_const_24: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_29: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 55} unique __ctobpl_const_3: int;

const {:extern} {:model_const "pat[j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 428} unique __ctobpl_const_25: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_26: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 561} unique __ctobpl_const_1: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 55} unique __ctobpl_const_4: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 59} unique __ctobpl_const_12: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 56} unique __ctobpl_const_16: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 62} unique __ctobpl_const_17: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 561} unique __ctobpl_const_2: int;

const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_155: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 55} unique __ctobpl_const_5: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 427} unique __ctobpl_const_19: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 427} unique __ctobpl_const_20: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 59} unique __ctobpl_const_14: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 58} unique __ctobpl_const_8: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 59} unique __ctobpl_const_11: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_156: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 427} unique __ctobpl_const_21: int;

const {:extern} {:model_const "pat[j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 427} unique __ctobpl_const_22: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 428} unique __ctobpl_const_23: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 58} unique __ctobpl_const_7: int;

const {:extern} {:model_const "outset"} {:sourceFile ".\source\replace.c"} {:sourceLine 58} unique __ctobpl_const_6: int;

const {:extern} {:model_const "outset[* j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 58} unique __ctobpl_const_9: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 59} unique __ctobpl_const_13: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 426} unique __ctobpl_const_18: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_27: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_28: int;

const {:extern} {:model_const "src[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_201: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_192: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_200: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_203: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_205: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_191: int;

const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_206: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_208: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 108} unique __ctobpl_const_212: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 108} unique __ctobpl_const_213: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_188: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_193: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_196: int;

const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_202: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_199: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_207: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_209: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_211: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_198: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_204: int;

const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_197: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 112} unique __ctobpl_const_210: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 108} unique __ctobpl_const_215: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_218: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_219: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_195: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 108} unique __ctobpl_const_214: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_190: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 108} unique __ctobpl_const_216: int;

const {:extern} {:model_const "result.esc"} {:sourceFile ".\source\replace.c"} {:sourceLine 108} unique __ctobpl_const_217: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_189: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 114} unique __ctobpl_const_194: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_161: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_170: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_158: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_160: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 122} unique __ctobpl_const_177: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_157: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_166: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_159: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_167: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_163: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_164: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_178: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_180: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_165: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 122} unique __ctobpl_const_176: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_179: int;

const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_168: int;

const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_173: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_181: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_182: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_183: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 125} unique __ctobpl_const_162: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_172: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_185: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 122} unique __ctobpl_const_175: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_186: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_187: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 122} unique __ctobpl_const_174: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_169: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 118} unique __ctobpl_const_171: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 120} unique __ctobpl_const_184: int;

const {:extern} {:model_const "amatch.arg.4"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_79: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_64: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_65: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 436} unique __ctobpl_const_71: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_61: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_66: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 437} unique __ctobpl_const_73: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 437} unique __ctobpl_const_74: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_82: int;

const {:extern} {:model_const "amatch.arg.4"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_85: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_84: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_77: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_75: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_78: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 434} unique __ctobpl_const_70: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 433} unique __ctobpl_const_69: int;

const {:extern} {:model_const "result.patsize"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_81: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_83: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_67: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_63: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 437} unique __ctobpl_const_72: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_80: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_87: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_88: int;

const {:extern} {:model_const "amatch.arg.4"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_89: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_90: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_62: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_76: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_86: int;

const {:extern} {:model_const "result.amatch"} {:sourceFile ".\source\replace.c"} {:sourceLine 438} unique __ctobpl_const_91: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 439} unique __ctobpl_const_92: int;

const {:extern} {:model_const "result.omatch"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_68: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_31: int;

const {:extern} {:model_const "result.omatch"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_35: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_39: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_43: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_44: int;

const {:extern} {:model_const "result.patsize"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_45: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_46: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_34: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 450} unique __ctobpl_const_38: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_47: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_41: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 430} unique __ctobpl_const_53: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 431} unique __ctobpl_const_55: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 448} unique __ctobpl_const_36: int;

const {:extern} {:model_const "result.patsize"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_52: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_40: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_49: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_51: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 431} unique __ctobpl_const_57: int;

const {:extern} {:model_const "lin[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 431} unique __ctobpl_const_58: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_59: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_48: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 432} unique __ctobpl_const_60: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 430} unique __ctobpl_const_54: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 431} unique __ctobpl_const_56: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 429} unique __ctobpl_const_50: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_33: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 449} unique __ctobpl_const_37: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 452} unique __ctobpl_const_42: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_30: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 447} unique __ctobpl_const_32: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 284} unique __ctobpl_const_550: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 286} unique __ctobpl_const_552: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_566: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 286} unique __ctobpl_const_551: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 274} unique __ctobpl_const_561: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 283} unique __ctobpl_const_549: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 271} unique __ctobpl_const_556: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 279} unique __ctobpl_const_539: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_541: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_548: int;

const {:extern} {:model_const "* sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_542: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 288} unique __ctobpl_const_554: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 271} unique __ctobpl_const_555: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 279} unique __ctobpl_const_538: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 280} unique __ctobpl_const_553: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 271} unique __ctobpl_const_557: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_544: int;

const {:extern} {:model_const "* sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_545: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 279} unique __ctobpl_const_537: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_543: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 274} unique __ctobpl_const_558: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 274} unique __ctobpl_const_559: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 274} unique __ctobpl_const_560: int;

const {:extern} {:model_const "delim"} {:sourceFile ".\source\replace.c"} {:sourceLine 279} unique __ctobpl_const_540: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 274} unique __ctobpl_const_562: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_536: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_547: int;

const {:extern} {:model_const "result.esc"} {:sourceFile ".\source\replace.c"} {:sourceLine 274} unique __ctobpl_const_563: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 282} unique __ctobpl_const_546: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_564: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_565: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_535: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 272} unique __ctobpl_const_575: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 347} unique __ctobpl_const_596: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_567: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 343} unique __ctobpl_const_593: int;

const {:extern} {:model_const "pat[j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 347} unique __ctobpl_const_597: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 337} unique __ctobpl_const_581: int;

const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_586: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 272} unique __ctobpl_const_574: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 272} unique __ctobpl_const_577: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_587: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_571: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_569: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_588: int;

const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_590: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 337} unique __ctobpl_const_583: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 272} unique __ctobpl_const_572: int;

const {:extern} {:model_const "result.in_pat_set"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_592: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 277} unique __ctobpl_const_578: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 336} unique __ctobpl_const_580: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 343} unique __ctobpl_const_594: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 272} unique __ctobpl_const_573: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_788: int;

const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_591: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 338} unique __ctobpl_const_585: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 337} unique __ctobpl_const_582: int;

const {:extern} {:model_const "pat[j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 341} unique __ctobpl_const_589: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 277} unique __ctobpl_const_579: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_568: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 272} unique __ctobpl_const_576: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 275} unique __ctobpl_const_570: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 337} unique __ctobpl_const_584: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 347} unique __ctobpl_const_595: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 354} unique __ctobpl_const_629: int;

const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 374} unique __ctobpl_const_603: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_609: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_611: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_606: int;

const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_608: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 374} unique __ctobpl_const_600: int;

const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_618: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 374} unique __ctobpl_const_599: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 371} unique __ctobpl_const_622: int;

const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 374} unique __ctobpl_const_598: int;

const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 374} unique __ctobpl_const_602: int;

const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_615: int;

const {:extern} {:model_const "pat[j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 374} unique __ctobpl_const_601: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_612: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_613: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_619: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 362} unique __ctobpl_const_623: int;

const {:extern} {:model_const "result.locate"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_621: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_605: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_604: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_616: int;

const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_610: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_614: int;

const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_620: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 362} unique __ctobpl_const_624: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_607: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 362} unique __ctobpl_const_625: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 362} unique __ctobpl_const_626: int;

const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 370} unique __ctobpl_const_617: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 363} unique __ctobpl_const_627: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 354} unique __ctobpl_const_628: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_640: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 378} unique __ctobpl_const_659: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_637: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 358} unique __ctobpl_const_632: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 367} unique __ctobpl_const_650: int;

const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_643: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_652: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_656: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 358} unique __ctobpl_const_633: int;

const {:extern} {:model_const "result.locate"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_649: int;

const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_636: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 359} unique __ctobpl_const_635: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_639: int;

const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_646: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 358} unique __ctobpl_const_634: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_641: int;

const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_645: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_651: int;

const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_638: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_654: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 355} unique __ctobpl_const_630: int;

const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_642: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_644: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 358} unique __ctobpl_const_631: int;

const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_648: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_653: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 366} unique __ctobpl_const_647: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_655: int;

const {:extern} {:model_const "pat[j + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 350} unique __ctobpl_const_657: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 351} unique __ctobpl_const_658: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 383} unique __ctobpl_const_660: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_148: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 113} unique __ctobpl_const_130: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_150: int;

const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_151: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_135: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_143: int;

const {:extern} {:model_const "result.isalnum"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_147: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_152: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_153: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_154: int;

const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 113} unique __ctobpl_const_131: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 111} unique __ctobpl_const_123: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_134: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_142: int;

const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_132: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 113} unique __ctobpl_const_126: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 113} unique __ctobpl_const_128: int;

const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_136: int;

const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_140: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 111} unique __ctobpl_const_124: int;

const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_138: int;

const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_145: int;

const {:extern} {:model_const "src[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 111} unique __ctobpl_const_125: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 113} unique __ctobpl_const_127: int;

const {:extern} {:model_const "result.isalnum"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_139: int;

const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_144: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 113} unique __ctobpl_const_129: int;

const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_146: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 116} unique __ctobpl_const_149: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_133: int;

const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_137: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 115} unique __ctobpl_const_141: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 516} unique __ctobpl_const_107: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 440} unique __ctobpl_const_95: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 454} unique __ctobpl_const_99: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 514} unique __ctobpl_const_102: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 515} unique __ctobpl_const_104: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 445} unique __ctobpl_const_98: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 515} unique __ctobpl_const_105: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 444} unique __ctobpl_const_96: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 442} unique __ctobpl_const_93: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 515} unique __ctobpl_const_103: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_110: int;

const {:extern} {:model_const "k"} {:sourceFile ".\source\replace.c"} {:sourceLine 444} unique __ctobpl_const_97: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_111: int;

const {:extern} {:model_const "src[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_112: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_109: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 515} unique __ctobpl_const_106: int;

const {:extern} {:model_const "result.getline"} {:sourceFile ".\source\replace.c"} {:sourceLine 516} unique __ctobpl_const_108: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_116: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 442} unique __ctobpl_const_94: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 107} unique __ctobpl_const_119: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 107} unique __ctobpl_const_118: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 107} unique __ctobpl_const_120: int;

const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 107} unique __ctobpl_const_121: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 142} unique __ctobpl_const_282: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 111} unique __ctobpl_const_122: int;

const {:extern} {:model_const "delim"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_113: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 513} unique __ctobpl_const_100: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_115: int;

const {:extern} {:model_const "src"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_114: int;

const {:extern} {:model_const "src[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 105} unique __ctobpl_const_117: int;

const {:extern} {:model_const "result.getline"} {:sourceFile ".\source\replace.c"} {:sourceLine 513} unique __ctobpl_const_101: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 78} unique __ctobpl_const_242: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 78} unique __ctobpl_const_243: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 78} unique __ctobpl_const_244: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 126} unique __ctobpl_const_230: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 79} unique __ctobpl_const_246: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 71} unique __ctobpl_const_234: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 79} unique __ctobpl_const_247: int;

const {:extern} {:model_const "s[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 79} unique __ctobpl_const_248: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 82} unique __ctobpl_const_249: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 82} unique __ctobpl_const_250: int;

const {:extern} {:model_const "dest"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_223: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 126} unique __ctobpl_const_231: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_220: int;

const {:extern} {:model_const "s[* i + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 74} unique __ctobpl_const_239: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 79} unique __ctobpl_const_245: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_224: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_227: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 126} unique __ctobpl_const_228: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_221: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_222: int;

const {:extern} {:model_const "maxset"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_225: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 126} unique __ctobpl_const_229: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 71} unique __ctobpl_const_232: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 182} unique __ctobpl_const_345: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 71} unique __ctobpl_const_233: int;

const {:extern} {:model_const "s[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 71} unique __ctobpl_const_235: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 74} unique __ctobpl_const_236: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 74} unique __ctobpl_const_237: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 74} unique __ctobpl_const_238: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 75} unique __ctobpl_const_240: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 78} unique __ctobpl_const_241: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 109} unique __ctobpl_const_226: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 140} unique __ctobpl_const_269: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 140} unique __ctobpl_const_267: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 141} unique __ctobpl_const_270: int;

const {:extern} {:model_const "s[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 72} unique __ctobpl_const_264: int;

const {:extern} {:model_const "s[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 82} unique __ctobpl_const_252: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 72} unique __ctobpl_const_260: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 72} unique __ctobpl_const_263: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 72} unique __ctobpl_const_262: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 140} unique __ctobpl_const_266: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 145} unique __ctobpl_const_278: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 142} unique __ctobpl_const_280: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 142} unique __ctobpl_const_281: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 141} unique __ctobpl_const_271: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 80} unique __ctobpl_const_259: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 85} unique __ctobpl_const_254: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 145} unique __ctobpl_const_277: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 85} unique __ctobpl_const_256: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 140} unique __ctobpl_const_268: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 85} unique __ctobpl_const_253: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 87} unique __ctobpl_const_265: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 83} unique __ctobpl_const_258: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 145} unique __ctobpl_const_275: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 82} unique __ctobpl_const_251: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 72} unique __ctobpl_const_261: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 85} unique __ctobpl_const_255: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 141} unique __ctobpl_const_272: int;

const {:extern} {:model_const "s[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 85} unique __ctobpl_const_257: int;

const {:extern} {:model_const "arg[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 141} unique __ctobpl_const_273: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 145} unique __ctobpl_const_276: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 145} unique __ctobpl_const_274: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 145} unique __ctobpl_const_279: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 143} unique __ctobpl_const_289: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_300: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 149} unique __ctobpl_const_307: int;

const {:extern} {:model_const "pat[jstart]"} {:sourceFile ".\source\replace.c"} {:sourceLine 149} unique __ctobpl_const_309: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 147} unique __ctobpl_const_298: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 147} unique __ctobpl_const_295: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_302: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 146} unique __ctobpl_const_291: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_303: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_306: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 149} unique __ctobpl_const_311: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 142} unique __ctobpl_const_284: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_299: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_305: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 147} unique __ctobpl_const_296: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 147} unique __ctobpl_const_294: int;

const {:extern} {:model_const "jstart"} {:sourceFile ".\source\replace.c"} {:sourceLine 146} unique __ctobpl_const_290: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_304: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 147} unique __ctobpl_const_297: int;

const {:extern} {:model_const "jstart"} {:sourceFile ".\source\replace.c"} {:sourceLine 149} unique __ctobpl_const_312: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 143} unique __ctobpl_const_286: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 142} unique __ctobpl_const_283: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 149} unique __ctobpl_const_310: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 142} unique __ctobpl_const_285: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 148} unique __ctobpl_const_301: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 150} unique __ctobpl_const_313: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 150} unique __ctobpl_const_314: int;

const {:extern} {:model_const "jstart"} {:sourceFile ".\source\replace.c"} {:sourceLine 149} unique __ctobpl_const_308: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 146} unique __ctobpl_const_292: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 143} unique __ctobpl_const_288: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 143} unique __ctobpl_const_287: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 147} unique __ctobpl_const_293: int;

const {:extern} {:model_const "arg[* i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 150} unique __ctobpl_const_316: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_319: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 298} unique __ctobpl_const_336: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 298} unique __ctobpl_const_338: int;

const {:extern} {:model_const "makeres"} {:sourceFile ".\source\replace.c"} {:sourceLine 298} unique __ctobpl_const_339: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 252} unique __ctobpl_const_329: int;

const {:extern} {:model_const "maxsize"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_320: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 182} unique __ctobpl_const_344: int;

const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_317: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_325: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 298} unique __ctobpl_const_335: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_318: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 45} unique __ctobpl_const_327: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 182} unique __ctobpl_const_342: int;

const {:extern} {:model_const "result.makepat"} {:sourceFile ".\source\replace.c"} {:sourceLine 252} unique __ctobpl_const_333: int;

const {:extern} {:model_const "makeres"} {:sourceFile ".\source\replace.c"} {:sourceLine 299} unique __ctobpl_const_341: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 150} unique __ctobpl_const_315: int;

const {:extern} {:model_const "result.makesub"} {:sourceFile ".\source\replace.c"} {:sourceLine 298} unique __ctobpl_const_340: int;

const {:extern} {:model_const "s"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_322: int;

const {:extern} {:model_const "maxsize"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_323: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 182} unique __ctobpl_const_343: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 252} unique __ctobpl_const_328: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 252} unique __ctobpl_const_331: int;

const {:extern} {:model_const "makeres"} {:sourceFile ".\source\replace.c"} {:sourceLine 253} unique __ctobpl_const_334: int;

const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_321: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 252} unique __ctobpl_const_330: int;

const {:extern} {:model_const "result.fgets"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_326: int;

const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\source\replace.c"} {:sourceLine 44} unique __ctobpl_const_324: int;

const {:extern} {:model_const "makeres"} {:sourceFile ".\source\replace.c"} {:sourceLine 252} unique __ctobpl_const_332: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 298} unique __ctobpl_const_337: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_408: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 200} unique __ctobpl_const_402: int;

const {:extern} {:model_const "getsub.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_392: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_382: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_378: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 534} unique __ctobpl_const_384: int;

const {:extern} {:model_const "argv[2]"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_391: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 529} unique __ctobpl_const_400: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_534: int;

const {:extern} {:model_const "sub[0]"} {:sourceFile ".\source\replace.c"} {:sourceLine 550} unique __ctobpl_const_388: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 202} unique __ctobpl_const_405: int;

const {:extern} {:model_const "argc"} {:sourceFile ".\source\replace.c"} {:sourceLine 540} unique __ctobpl_const_387: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 543} unique __ctobpl_const_396: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_390: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 545} unique __ctobpl_const_398: int;

const {:extern} {:model_const "argv[1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_379: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 536} unique __ctobpl_const_386: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 536} unique __ctobpl_const_385: int;

const {:extern} {:model_const "getsub.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_389: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_394: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 545} unique __ctobpl_const_397: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 201} unique __ctobpl_const_404: int;

const {:extern} {:model_const "start"} {:sourceFile ".\source\replace.c"} {:sourceLine 200} unique __ctobpl_const_403: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_406: int;

const {:extern} {:model_const "argc"} {:sourceFile ".\source\replace.c"} {:sourceLine 527} unique __ctobpl_const_376: int;

const {:extern} {:model_const "result.getpat"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_383: int;

const {:extern} {:model_const "getpat.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_380: int;

const {:extern} {:model_const "result.getsub"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_395: int;

const {:extern} {:model_const "getsub.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 542} unique __ctobpl_const_393: int;

const {:extern} {:model_const "getpat.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_381: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 529} unique __ctobpl_const_399: int;

const {:extern} {:model_const "getpat.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 533} unique __ctobpl_const_377: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 199} unique __ctobpl_const_401: int;

const {:extern} {:model_const "flag"} {:sourceFile ".\source\replace.c"} {:sourceLine 323} unique __ctobpl_const_366: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 183} unique __ctobpl_const_348: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 321} unique __ctobpl_const_371: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 176} unique __ctobpl_const_354: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 176} unique __ctobpl_const_352: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_407: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 314} unique __ctobpl_const_361: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 319} unique __ctobpl_const_374: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 176} unique __ctobpl_const_353: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 314} unique __ctobpl_const_359: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 317} unique __ctobpl_const_368: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 319} unique __ctobpl_const_375: int;

const {:extern} {:model_const "pat[offset]"} {:sourceFile ".\source\replace.c"} {:sourceLine 314} unique __ctobpl_const_363: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 183} unique __ctobpl_const_349: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 176} unique __ctobpl_const_355: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 317} unique __ctobpl_const_369: int;

const {:extern} {:model_const "flag"} {:sourceFile ".\source\replace.c"} {:sourceLine 318} unique __ctobpl_const_373: int;

const {:extern} {:model_const "flag"} {:sourceFile ".\source\replace.c"} {:sourceLine 313} unique __ctobpl_const_358: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 183} unique __ctobpl_const_346: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 183} unique __ctobpl_const_347: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 315} unique __ctobpl_const_365: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 314} unique __ctobpl_const_362: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 183} unique __ctobpl_const_350: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 314} unique __ctobpl_const_360: int;

const {:extern} {:model_const "offset"} {:sourceFile ".\source\replace.c"} {:sourceLine 315} unique __ctobpl_const_364: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 176} unique __ctobpl_const_357: int;

const {:extern} {:model_const "c"} {:sourceFile ".\source\replace.c"} {:sourceLine 317} unique __ctobpl_const_367: int;

const {:extern} {:model_const "pat[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 317} unique __ctobpl_const_370: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 321} unique __ctobpl_const_372: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 176} unique __ctobpl_const_356: int;

const {:extern} {:model_const "Pred.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 182} unique __ctobpl_const_351: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 222} unique __ctobpl_const_473: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 210} unique __ctobpl_const_488: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 208} unique __ctobpl_const_497: int;

const {:extern} {:model_const "getres"} {:sourceFile ".\source\replace.c"} {:sourceLine 214} unique __ctobpl_const_486: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 206} unique __ctobpl_const_502: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 206} unique __ctobpl_const_503: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_477: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 210} unique __ctobpl_const_490: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 208} unique __ctobpl_const_496: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_478: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_481: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 210} unique __ctobpl_const_489: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 208} unique __ctobpl_const_494: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_482: int;

const {:extern} {:model_const "getres"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_483: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 208} unique __ctobpl_const_493: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 208} unique __ctobpl_const_495: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 206} unique __ctobpl_const_499: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 222} unique __ctobpl_const_472: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 214} unique __ctobpl_const_485: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 206} unique __ctobpl_const_500: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_475: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 220} unique __ctobpl_const_474: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_480: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 210} unique __ctobpl_const_492: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 208} unique __ctobpl_const_498: int;

const {:extern} {:model_const "result.getccl"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_484: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_476: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 206} unique __ctobpl_const_501: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 213} unique __ctobpl_const_479: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 210} unique __ctobpl_const_487: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 210} unique __ctobpl_const_491: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 231} unique __ctobpl_const_507: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 206} unique __ctobpl_const_504: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 234} unique __ctobpl_const_511: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 234} unique __ctobpl_const_512: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 234} unique __ctobpl_const_515: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 234} unique __ctobpl_const_510: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 269} unique __ctobpl_const_528: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 235} unique __ctobpl_const_518: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_530: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_531: int;

const {:extern} {:model_const "delim"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_533: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 241} unique __ctobpl_const_523: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 239} unique __ctobpl_const_522: int;

const {:extern} {:model_const "from"} {:sourceFile ".\source\replace.c"} {:sourceLine 269} unique __ctobpl_const_529: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 234} unique __ctobpl_const_513: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 234} unique __ctobpl_const_514: int;

const {:extern} {:model_const "lj"} {:sourceFile ".\source\replace.c"} {:sourceLine 230} unique __ctobpl_const_506: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 242} unique __ctobpl_const_526: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 270} unique __ctobpl_const_532: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 230} unique __ctobpl_const_505: int;

const {:extern} {:model_const "done"} {:sourceFile ".\source\replace.c"} {:sourceLine 235} unique __ctobpl_const_516: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 236} unique __ctobpl_const_525: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 380} unique __ctobpl_const_661: int;

const {:extern} {:model_const "delim"} {:sourceFile ".\source\replace.c"} {:sourceLine 235} unique __ctobpl_const_520: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 232} unique __ctobpl_const_509: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 232} unique __ctobpl_const_508: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 238} unique __ctobpl_const_521: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 235} unique __ctobpl_const_519: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 241} unique __ctobpl_const_524: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 268} unique __ctobpl_const_527: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 235} unique __ctobpl_const_517: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 211} unique __ctobpl_const_431: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 211} unique __ctobpl_const_432: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 211} unique __ctobpl_const_433: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_428: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 216} unique __ctobpl_const_434: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 216} unique __ctobpl_const_435: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 205} unique __ctobpl_const_417: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_426: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 216} unique __ctobpl_const_436: int;

const {:extern} {:model_const "start"} {:sourceFile ".\source\replace.c"} {:sourceLine 216} unique __ctobpl_const_437: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 216} unique __ctobpl_const_438: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 226} unique __ctobpl_const_439: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 226} unique __ctobpl_const_440: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_409: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 207} unique __ctobpl_const_420: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 207} unique __ctobpl_const_421: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_411: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 207} unique __ctobpl_const_422: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_412: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_413: int;

const {:extern} {:model_const "lj"} {:sourceFile ".\source\replace.c"} {:sourceLine 204} unique __ctobpl_const_414: int;

const {:extern} {:model_const "start"} {:sourceFile ".\source\replace.c"} {:sourceLine 207} unique __ctobpl_const_423: int;

const {:extern} {:model_const "arg[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 205} unique __ctobpl_const_418: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_424: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_425: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_427: int;

const {:extern} {:model_const "delim"} {:sourceFile ".\source\replace.c"} {:sourceLine 203} unique __ctobpl_const_410: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 204} unique __ctobpl_const_415: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 207} unique __ctobpl_const_419: int;

const {:extern} {:model_const "arg[i + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_429: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 205} unique __ctobpl_const_416: int;

const {:extern} {:model_const "delim"} {:sourceFile ".\source\replace.c"} {:sourceLine 209} unique __ctobpl_const_430: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 227} unique __ctobpl_const_446: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 227} unique __ctobpl_const_449: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 227} unique __ctobpl_const_448: int;

const {:extern} {:model_const "result.esc"} {:sourceFile ".\source\replace.c"} {:sourceLine 227} unique __ctobpl_const_450: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_451: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_456: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_457: int;

const {:extern} {:model_const "in_set_2.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_461: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 226} unique __ctobpl_const_442: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 226} unique __ctobpl_const_441: int;

const {:extern} {:model_const "lj"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_463: int;

const {:extern} {:model_const "pat[lj]"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_464: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 222} unique __ctobpl_const_469: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 222} unique __ctobpl_const_470: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 227} unique __ctobpl_const_445: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_452: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_462: int;

const {:extern} {:model_const "arg"} {:sourceFile ".\source\replace.c"} {:sourceLine 227} unique __ctobpl_const_447: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_455: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 226} unique __ctobpl_const_444: int;

const {:extern} {:model_const "in_set_2.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_465: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 218} unique __ctobpl_const_460: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 226} unique __ctobpl_const_443: int;

const {:extern} {:model_const "escjunk"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_454: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_453: int;

const {:extern} {:model_const "in_set_2.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_466: int;

const {:extern} {:model_const "lj"} {:sourceFile ".\source\replace.c"} {:sourceLine 218} unique __ctobpl_const_459: int;

const {:extern} {:model_const "result.in_set_2"} {:sourceFile ".\source\replace.c"} {:sourceLine 219} unique __ctobpl_const_467: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 222} unique __ctobpl_const_468: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 228} unique __ctobpl_const_458: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 222} unique __ctobpl_const_471: int;

const {:extern} {:model_const "n"} {:sourceFile ".\source\replace.c"} {:sourceLine 405} unique __ctobpl_const_690: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 380} unique __ctobpl_const_664: int;

const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_673: int;

const {:extern} {:model_const "pat[n + 1]"} {:sourceFile ".\source\replace.c"} {:sourceLine 405} unique __ctobpl_const_691: int;

const {:extern} {:model_const "advance"} {:sourceFile ".\source\replace.c"} {:sourceLine 380} unique __ctobpl_const_665: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 384} unique __ctobpl_const_667: int;

const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_668: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 394} unique __ctobpl_const_675: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 397} unique __ctobpl_const_677: int;

const {:extern} {:model_const "n"} {:sourceFile ".\source\replace.c"} {:sourceLine 411} unique __ctobpl_const_682: int;

const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 411} unique __ctobpl_const_680: int;

const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 411} unique __ctobpl_const_685: int;

const {:extern} {:model_const "size"} {:sourceFile ".\source\replace.c"} {:sourceLine 399} unique __ctobpl_const_692: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_669: int;

const {:extern} {:model_const "* i"} {:sourceFile ".\source\replace.c"} {:sourceLine 380} unique __ctobpl_const_662: int;

const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_672: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 394} unique __ctobpl_const_676: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 411} unique __ctobpl_const_681: int;

const {:extern} {:model_const "pat[n]"} {:sourceFile ".\source\replace.c"} {:sourceLine 411} unique __ctobpl_const_683: int;

const {:extern} {:model_const "size"} {:sourceFile ".\source\replace.c"} {:sourceLine 402} unique __ctobpl_const_687: int;

const {:extern} {:model_const "result"} {:sourceFile ".\source\replace.c"} {:sourceLine 381} unique __ctobpl_const_666: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 380} unique __ctobpl_const_663: int;

const {:extern} {:model_const "n"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_670: int;

const {:extern} {:model_const "result.in_pat_set"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_674: int;

const {:extern} {:model_const "pat[n]"} {:sourceFile ".\source\replace.c"} {:sourceLine 393} unique __ctobpl_const_671: int;

const {:extern} {:model_const "pat[n]"} {:sourceFile ".\source\replace.c"} {:sourceLine 397} unique __ctobpl_const_679: int;

const {:extern} {:model_const "size"} {:sourceFile ".\source\replace.c"} {:sourceLine 408} unique __ctobpl_const_686: int;

const {:extern} {:model_const "size"} {:sourceFile ".\source\replace.c"} {:sourceLine 405} unique __ctobpl_const_688: int;

const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 411} unique __ctobpl_const_684: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 405} unique __ctobpl_const_689: int;

const {:extern} {:model_const "n"} {:sourceFile ".\source\replace.c"} {:sourceLine 397} unique __ctobpl_const_678: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 466} unique __ctobpl_const_694: int;

const {:extern} {:model_const "sub[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_706: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_702: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 468} unique __ctobpl_const_698: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 469} unique __ctobpl_const_711: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_707: int;

const {:extern} {:model_const "s1"} {:sourceFile ".\source\replace.c"} {:sourceLine 469} unique __ctobpl_const_712: int;

const {:extern} {:model_const "s2"} {:sourceFile ".\source\replace.c"} {:sourceLine 469} unique __ctobpl_const_714: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 477} unique __ctobpl_const_715: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_705: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 477} unique __ctobpl_const_716: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_717: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_708: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_718: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_719: int;

const {:extern} {:model_const "sub[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 467} unique __ctobpl_const_697: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 467} unique __ctobpl_const_696: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_720: int;

const {:extern} {:model_const "sub[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 468} unique __ctobpl_const_700: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_721: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 468} unique __ctobpl_const_699: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_701: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_703: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_709: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 469} unique __ctobpl_const_713: int;

const {:extern} {:model_const "lin[j]"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_722: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_723: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_724: int;

const {:extern} {:model_const "size"} {:sourceFile ".\source\replace.c"} {:sourceLine 413} unique __ctobpl_const_693: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 467} unique __ctobpl_const_695: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_710: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 475} unique __ctobpl_const_704: int;

const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_746: int;

const {:extern} {:model_const "jt"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_748: int;

const {:extern} {:model_const "jp"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_744: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_750: int;

const {:extern} {:model_const "jt"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_751: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 170} unique __ctobpl_const_738: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 164} unique __ctobpl_const_729: int;

const {:extern} {:model_const "result.addstr"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_753: int;

const {:extern} {:model_const "jp"} {:sourceFile ".\source\replace.c"} {:sourceLine 164} unique __ctobpl_const_754: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_743: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 169} unique __ctobpl_const_735: int;

const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_742: int;

const {:extern} {:model_const "lastj"} {:sourceFile ".\source\replace.c"} {:sourceLine 164} unique __ctobpl_const_731: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 164} unique __ctobpl_const_730: int;

const {:extern} {:model_const "jp"} {:sourceFile ".\source\replace.c"} {:sourceLine 164} unique __ctobpl_const_732: int;

const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_749: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 469} unique __ctobpl_const_727: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 169} unique __ctobpl_const_734: int;

const {:extern} {:model_const "jp"} {:sourceFile ".\source\replace.c"} {:sourceLine 166} unique __ctobpl_const_741: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 170} unique __ctobpl_const_737: int;

const {:extern} {:model_const "jt"} {:sourceFile ".\source\replace.c"} {:sourceLine 166} unique __ctobpl_const_740: int;

const {:extern} {:model_const "junk"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_752: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_747: int;

const {:extern} {:model_const "lastm"} {:sourceFile ".\source\replace.c"} {:sourceLine 489} unique __ctobpl_const_755: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 490} unique __ctobpl_const_756: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_726: int;

const {:extern} {:model_const "* j"} {:sourceFile ".\source\replace.c"} {:sourceLine 169} unique __ctobpl_const_736: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 471} unique __ctobpl_const_725: int;

const {:extern} {:model_const "pat[lastj]"} {:sourceFile ".\source\replace.c"} {:sourceLine 170} unique __ctobpl_const_739: int;

const {:extern} {:model_const "pat[jp]"} {:sourceFile ".\source\replace.c"} {:sourceLine 167} unique __ctobpl_const_745: int;

const {:extern} {:model_const "jp"} {:sourceFile ".\source\replace.c"} {:sourceLine 164} unique __ctobpl_const_728: int;

const {:extern} {:model_const "j"} {:sourceFile ".\source\replace.c"} {:sourceLine 169} unique __ctobpl_const_733: int;

const {:extern} {:model_const "lin[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 491} unique __ctobpl_const_759: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_761: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_762: int;

const {:extern} {:model_const "pat"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_765: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 494} unique __ctobpl_const_768: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_774: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_766: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_776: int;

const {:extern} {:model_const "sub"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_778: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 491} unique __ctobpl_const_757: int;

const {:extern} {:model_const "lastm"} {:sourceFile ".\source\replace.c"} {:sourceLine 496} unique __ctobpl_const_779: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 496} unique __ctobpl_const_780: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_786: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_787: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 498} unique __ctobpl_const_781: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 498} unique __ctobpl_const_783: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 498} unique __ctobpl_const_782: int;

const {:extern} {:model_const "lastm"} {:sourceFile ".\source\replace.c"} {:sourceLine 494} unique __ctobpl_const_769: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_771: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 502} unique __ctobpl_const_784: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 502} unique __ctobpl_const_785: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_764: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 494} unique __ctobpl_const_770: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_773: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_760: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_772: int;

const {:extern} {:model_const "result.amatch"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_767: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 491} unique __ctobpl_const_758: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 493} unique __ctobpl_const_763: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_775: int;

const {:extern} {:model_const "m"} {:sourceFile ".\source\replace.c"} {:sourceLine 495} unique __ctobpl_const_777: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_794: int;

const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_792: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_793: int;

const {:extern} {:model_const "lin[i]"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_791: int;

const {:extern} {:model_const "lin"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_789: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 500} unique __ctobpl_const_796: int;

const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_795: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 499} unique __ctobpl_const_790: int;

const {:extern} {:model_const "i"} {:sourceFile ".\source\replace.c"} {:sourceLine 500} unique __ctobpl_const_797: int;

procedure {:extern} __iob_func() returns (__dummy_ret__iob_func: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} abort() returns (__dummy_retabort: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} fgets(__dummy_formal_fgets_0.__1: int, 
    __dummy_formal_fgets_1.__1: int, 
    __dummy_formal_fgets_2.__1: int)
   returns (__dummy_retfgets: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} fputc(__dummy_formal_fputc_0.__1: int, __dummy_formal_fputc_1.__1: int)
   returns (__dummy_retfputc: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} isalnum(__dummy_formal_isalnum_0.__1: int) returns (__dummy_retisalnum: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} Caseerror(n.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} Caseerror(n.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $fprintf.arg.1$3$: int;
  var {:extern} n: int;
  var {:extern} result.__iob_func$2: int;
  var {:extern} result.fprintf$1: int;
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
    $fprintf.arg.1$3$ := 0;
    n := 0;
    result.__iob_func$2 := 0;
    result.fprintf$1 := 0;
    n := n.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 561} true;
    call result.__iob_func$2 := __iob_func();
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 561} true;
    assert result.__iob_func$2 != 0;
    $fprintf.arg.1$3$ := PLUS(result.__iob_func$2, 32, 1);
    assume value_is(__ctobpl_const_1, $fprintf.arg.1$3$);
    assume value_is(__ctobpl_const_2, result.__iob_func$2);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 561} true;
    call result.fprintf$1 := det_choice();
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 562} true;
    return;
}



procedure {:extern} addstr(c.__1: int, outset.__1: int, j.__1: int, maxset.__1: int)
   returns (result.addstr$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} addstr(c.__1: int, outset.__1: int, j.__1: int, maxset.__1: int)
   returns (result.addstr$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} c: int;
  var {:extern} j: int;
  var {:extern} maxset: int;
  var {:extern} outset: int;
  var {:extern} result: int;
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
    assume INT_LT(outset.__1, alloc);
    assume INT_LT(j.__1, alloc);
    c := 0;
    j := 0;
    maxset := 0;
    outset := 0;
    result := 0;
    result.addstr$1 := 0;
    c := c.__1;
    outset := outset.__1;
    j := j.__1;
    maxset := maxset.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 54} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 55} true;
    assert j != 0;
    goto label_4_true, label_4_false;

  label_4_false:
    assume !INT_LEQ(maxset, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_3, maxset);
    assume value_is(__ctobpl_const_4, j);
    assume value_is(__ctobpl_const_5, Mem_T.INT4[j]);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 58} true;
    assert j != 0;
    assert outset != 0;
    Mem_T.CHAR := Mem_T.CHAR[PLUS(outset, 1, Mem_T.INT4[j]) := c];
    assume value_is(__ctobpl_const_6, outset);
    assume value_is(__ctobpl_const_7, j);
    assume value_is(__ctobpl_const_8, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_9, Mem_T.CHAR[PLUS(outset, 1, Mem_T.INT4[j])]);
    assume value_is(__ctobpl_const_10, c);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 59} true;
    assert j != 0;
    assert j != 0;
    Mem_T.INT4 := Mem_T.INT4[j := PLUS(Mem_T.INT4[j], 1, 1)];
    assume value_is(__ctobpl_const_11, j);
    assume value_is(__ctobpl_const_12, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_13, j);
    assume value_is(__ctobpl_const_14, Mem_T.INT4[j]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 60} true;
    result := 1;
    assume value_is(__ctobpl_const_15, result);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 62} true;
    result.addstr$1 := result;
    assume value_is(__ctobpl_const_17, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 63} true;
    return;

  label_4_true:
    assume INT_LEQ(maxset, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_3, maxset);
    assume value_is(__ctobpl_const_4, j);
    assume value_is(__ctobpl_const_5, Mem_T.INT4[j]);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 56} true;
    result := 0;
    assume value_is(__ctobpl_const_16, result);
    goto label_7;
}



procedure {:extern} amatch(lin.__1: int, offset.__1: int, pat.__1: int, j.__1: int)
   returns (result.amatch$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} amatch(lin.__1: int, offset.__1: int, pat.__1: int, j.__1: int)
   returns (result.amatch$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $amatch.arg.4$6$: int;
  var {:extern} done: int;
  var {:extern} i: int;
  var {:extern} j: int;
  var {:extern} k: int;
  var {:extern} lin: int;
  var {:extern} offset: int;
  var {:extern} pat: int;
  var {:extern} result: int;
  var {:extern} result.amatch$4: int;
  var {:extern} result.omatch$3: int;
  var {:extern} result.omatch$7: int;
  var {:extern} result.patsize$2: int;
  var {:extern} result.patsize$5: int;
  var {:extern} result.patsize$8: int;
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
    assume INT_LT(lin.__1, alloc);
    assume INT_LT(pat.__1, alloc);
    $amatch.arg.4$6$ := 0;
    done := 0;
    call i := __HAVOC_det_malloc(4);
    j := 0;
    k := 0;
    lin := 0;
    call offset := __HAVOC_det_malloc(4);
    pat := 0;
    result := 0;
    result.amatch$1 := 0;
    result.amatch$4 := 0;
    result.omatch$3 := 0;
    result.omatch$7 := 0;
    result.patsize$2 := 0;
    result.patsize$5 := 0;
    result.patsize$8 := 0;
    lin := lin.__1;
    Mem_T.INT4 := Mem_T.INT4[offset := offset.__1];
    pat := pat.__1;
    j := j.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 423} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 423} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 424} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 424} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 426} true;
    done := 0;
    assume value_is(__ctobpl_const_18, done);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 427} true;
    goto label_8_head;

  label_8_head:
    call $amatch.arg.4$6$, done, j, k, result, result.amatch$4, result.omatch$3, result.omatch$7, result.patsize$2, result.patsize$5, result.patsize$8 := amatch_loop_label_8_head($amatch.arg.4$6$, done, i, j, k, lin, offset, pat, result, result.amatch$4, result.omatch$3, result.omatch$7, result.patsize$2, result.patsize$5, result.patsize$8);
    goto label_8_head_last;

  label_8_false:
    assume done == 0;
    assume value_is(__ctobpl_const_19, done);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 427} true;
    assert pat != 0;
    goto label_9_true, label_9_false;

  label_9_false:
    assume Mem_T.CHAR[PLUS(pat, 1, j)] == 0;
    assume value_is(__ctobpl_const_20, pat);
    assume value_is(__ctobpl_const_21, j);
    assume value_is(__ctobpl_const_22, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 454} true;
    result.amatch$1 := Mem_T.INT4[offset];
    assume value_is(__ctobpl_const_99, Mem_T.INT4[offset]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 455} true;
    call __HAVOC_free(i);
    call __HAVOC_free(offset);
    return;

  label_9_true:
    assume Mem_T.CHAR[PLUS(pat, 1, j)] != 0;
    assume value_is(__ctobpl_const_20, pat);
    assume value_is(__ctobpl_const_21, j);
    assume value_is(__ctobpl_const_22, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 428} true;
    assert pat != 0;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 42);
    assume value_is(__ctobpl_const_23, pat);
    assume value_is(__ctobpl_const_24, j);
    assume value_is(__ctobpl_const_25, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 447} true;
    call result.omatch$7 := omatch(lin, offset, pat, j);
    assume value_is(__ctobpl_const_26, lin);
    assume value_is(__ctobpl_const_27, Mem_T.INT4[offset]);
    assume value_is(__ctobpl_const_28, pat);
    assume value_is(__ctobpl_const_29, j);
    assume value_is(__ctobpl_const_30, lin);
    assume value_is(__ctobpl_const_31, Mem_T.INT4[offset]);
    assume value_is(__ctobpl_const_32, pat);
    assume value_is(__ctobpl_const_33, j);
    goto label_44;

  label_44:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 447} true;
    result := result.omatch$7;
    assume value_is(__ctobpl_const_34, result);
    assume value_is(__ctobpl_const_35, result.omatch$7);
    goto label_45;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 448} true;
    goto label_45_true, label_45_false;

  label_45_false:
    assume result == 0;
    assume value_is(__ctobpl_const_36, result);
    goto label_46;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 449} true;
    Mem_T.INT4 := Mem_T.INT4[offset := -1];
    assume value_is(__ctobpl_const_37, Mem_T.INT4[offset]);
    goto label_51;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 450} true;
    done := 1;
    assume value_is(__ctobpl_const_38, done);
    goto label_51_dummy;

  label_45_true:
    assume result != 0;
    assume value_is(__ctobpl_const_36, result);
    goto label_47;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 452} true;
    call result.patsize$8 := patsize(pat, j);
    assume value_is(__ctobpl_const_39, pat);
    assume value_is(__ctobpl_const_40, j);
    assume value_is(__ctobpl_const_41, pat);
    assume value_is(__ctobpl_const_42, j);
    goto label_50;

  label_50:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 452} true;
    j := PLUS(j, 1, result.patsize$8);
    assume value_is(__ctobpl_const_43, j);
    assume value_is(__ctobpl_const_44, j);
    assume value_is(__ctobpl_const_45, result.patsize$8);
    goto label_50_dummy;

  label_11_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 42);
    assume value_is(__ctobpl_const_23, pat);
    assume value_is(__ctobpl_const_24, j);
    assume value_is(__ctobpl_const_25, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 429} true;
    call result.patsize$2 := patsize(pat, j);
    assume value_is(__ctobpl_const_46, pat);
    assume value_is(__ctobpl_const_47, j);
    assume value_is(__ctobpl_const_48, pat);
    assume value_is(__ctobpl_const_49, j);
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 429} true;
    j := PLUS(j, 1, result.patsize$2);
    assume value_is(__ctobpl_const_50, j);
    assume value_is(__ctobpl_const_51, j);
    assume value_is(__ctobpl_const_52, result.patsize$2);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 430} true;
    Mem_T.INT4 := Mem_T.INT4[i := Mem_T.INT4[offset]];
    assume value_is(__ctobpl_const_53, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_54, Mem_T.INT4[offset]);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 431} true;
    goto label_20_head;

  label_20_head:
    call done, result, result.omatch$3 := amatch_loop_label_20_head(done, i, j, lin, pat, result, result.omatch$3);
    goto label_20_head_last;

  label_20_false:
    assume done == 0;
    assume value_is(__ctobpl_const_55, done);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 431} true;
    assert lin != 0;
    goto label_21_true, label_21_false;

  label_21_false:
    assume Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] == 0;
    assume value_is(__ctobpl_const_56, lin);
    assume value_is(__ctobpl_const_57, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 436} true;
    done := 0;
    assume value_is(__ctobpl_const_71, done);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 437} true;
    goto label_23_head;

  label_23_head:
    call $amatch.arg.4$6$, done, k, result.amatch$4, result.patsize$5 := amatch_loop_label_23_head($amatch.arg.4$6$, done, i, j, k, lin, offset, pat, result.amatch$4, result.patsize$5);
    goto label_23_head_last;

  label_23_false:
    assume done == 0;
    assume value_is(__ctobpl_const_72, done);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 437} true;
    goto label_24_true, label_24_false;

  label_24_false:
    assume !INT_LEQ(Mem_T.INT4[offset], Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_73, Mem_T.INT4[offset]);
    assume value_is(__ctobpl_const_74, Mem_T.INT4[i]);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 444} true;
    Mem_T.INT4 := Mem_T.INT4[offset := k];
    assume value_is(__ctobpl_const_96, Mem_T.INT4[offset]);
    assume value_is(__ctobpl_const_97, k);
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 445} true;
    done := 1;
    assume value_is(__ctobpl_const_98, done);
    goto label_26_dummy;

  label_24_true:
    assume INT_LEQ(Mem_T.INT4[offset], Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_73, Mem_T.INT4[offset]);
    assume value_is(__ctobpl_const_74, Mem_T.INT4[i]);
    goto label_27;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    call result.patsize$5 := patsize(pat, j);
    assume value_is(__ctobpl_const_75, pat);
    assume value_is(__ctobpl_const_76, j);
    assume value_is(__ctobpl_const_77, pat);
    assume value_is(__ctobpl_const_78, j);
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    $amatch.arg.4$6$ := PLUS(j, 1, result.patsize$5);
    assume value_is(__ctobpl_const_79, $amatch.arg.4$6$);
    assume value_is(__ctobpl_const_80, j);
    assume value_is(__ctobpl_const_81, result.patsize$5);
    goto label_31;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    call result.amatch$4 := amatch(lin, Mem_T.INT4[i], pat, $amatch.arg.4$6$);
    assume value_is(__ctobpl_const_82, lin);
    assume value_is(__ctobpl_const_83, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_84, pat);
    assume value_is(__ctobpl_const_85, $amatch.arg.4$6$);
    assume value_is(__ctobpl_const_86, lin);
    assume value_is(__ctobpl_const_87, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_88, pat);
    assume value_is(__ctobpl_const_89, $amatch.arg.4$6$);
    goto label_34;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    k := result.amatch$4;
    assume value_is(__ctobpl_const_90, k);
    assume value_is(__ctobpl_const_91, result.amatch$4);
    goto label_35;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 439} true;
    goto label_35_true, label_35_false;

  label_35_false:
    assume !INT_LEQ(0, k);
    assume value_is(__ctobpl_const_92, k);
    goto label_36;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 442} true;
    Mem_T.INT4 := Mem_T.INT4[i := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_93, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_94, Mem_T.INT4[i]);
    goto label_36_dummy;

  label_35_true:
    assume INT_LEQ(0, k);
    assume value_is(__ctobpl_const_92, k);
    goto label_37;

  label_37:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 440} true;
    done := 1;
    assume value_is(__ctobpl_const_95, done);
    goto label_37_dummy;

  label_23_true:
    assume done != 0;
    assume value_is(__ctobpl_const_72, done);
    goto label_25;

  label_21_true:
    assume Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] != 0;
    assume value_is(__ctobpl_const_56, lin);
    assume value_is(__ctobpl_const_57, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_38;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 432} true;
    call result.omatch$3 := omatch(lin, i, pat, j);
    assume value_is(__ctobpl_const_59, lin);
    assume value_is(__ctobpl_const_60, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_61, pat);
    assume value_is(__ctobpl_const_62, j);
    assume value_is(__ctobpl_const_63, lin);
    assume value_is(__ctobpl_const_64, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_65, pat);
    assume value_is(__ctobpl_const_66, j);
    goto label_41;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 432} true;
    result := result.omatch$3;
    assume value_is(__ctobpl_const_67, result);
    assume value_is(__ctobpl_const_68, result.omatch$3);
    goto label_42;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 433} true;
    goto label_42_true, label_42_false;

  label_42_false:
    assume result == 0;
    assume value_is(__ctobpl_const_69, result);
    goto label_43;

  label_43:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 434} true;
    done := 1;
    assume value_is(__ctobpl_const_70, done);
    goto label_43_dummy;

  label_42_true:
    assume result != 0;
    assume value_is(__ctobpl_const_69, result);
    goto label_42_true_dummy;

  label_20_true:
    assume done != 0;
    assume value_is(__ctobpl_const_55, done);
    goto label_22;

  label_8_true:
    assume done != 0;
    assume value_is(__ctobpl_const_19, done);
    goto label_10;

  label_36_dummy:
    assume false;
    return;

  label_37_dummy:
    assume false;
    return;

  label_23_head_last:
    goto label_23_true, label_23_false;

  label_43_dummy:
    assume false;
    return;

  label_42_true_dummy:
    assume false;
    return;

  label_20_head_last:
    goto label_20_true, label_20_false;

  label_51_dummy:
    assume false;
    return;

  label_50_dummy:
    assume false;
    return;

  label_26_dummy:
    assume false;
    return;

  label_8_head_last:
    goto label_8_true, label_8_false;
}



procedure {:extern} change(pat.__1: int, sub.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} change(pat.__1: int, sub.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $getline.arg.1$2$: int;
  var {:extern} $getline.arg.1$5$: int;
  var {:extern} line: int;
  var {:extern} pat: int;
  var {:extern} result: int;
  var {:extern} result.getline$1: int;
  var {:extern} result.getline$4: int;
  var {:extern} sub: int;
  var {:extern} $subline.arg.1$3$: int;
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
    assume INT_LT(pat.__1, alloc);
    assume INT_LT(sub.__1, alloc);
    $getline.arg.1$2$ := 0;
    $getline.arg.1$5$ := 0;
    line := 0;
    pat := 0;
    result := 0;
    result.getline$1 := 0;
    result.getline$4 := 0;
    sub := 0;
    $subline.arg.1$3$ := 0;
    pat := pat.__1;
    sub := sub.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 510} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 511} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 513} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 513} true;
    call result.getline$1 := getline($getline.arg.1$2$, 100);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 513} true;
    result := result.getline$1;
    assume value_is(__ctobpl_const_100, result);
    assume value_is(__ctobpl_const_101, result.getline$1);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 514} true;
    goto label_10_head;

  label_10_head:
    call result, result.getline$4 := change_loop_label_10_head($getline.arg.1$5$, pat, result, result.getline$4, sub, $subline.arg.1$3$);
    goto label_10_head_last;

  label_10_false:
    assume result == 0;
    assume value_is(__ctobpl_const_102, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 518} true;
    return;

  label_10_true:
    assume result != 0;
    assume value_is(__ctobpl_const_102, result);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 515} true;
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 515} true;
    call subline($subline.arg.1$3$, pat, sub);
    assume value_is(__ctobpl_const_103, pat);
    assume value_is(__ctobpl_const_104, sub);
    assume value_is(__ctobpl_const_105, pat);
    assume value_is(__ctobpl_const_106, sub);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 516} true;
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 516} true;
    call result.getline$4 := getline($getline.arg.1$5$, 100);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 516} true;
    result := result.getline$4;
    assume value_is(__ctobpl_const_107, result);
    assume value_is(__ctobpl_const_108, result.getline$4);
    goto label_19_dummy;

  label_19_dummy:
    assume false;
    return;

  label_10_head_last:
    goto label_10_true, label_10_false;
}



procedure {:extern} dodash(delim.__1: int, 
    src.__1: int, 
    i.__1: int, 
    dest.__1: int, 
    j.__1: int, 
    maxset.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} dodash(delim.__1: int, 
    src.__1: int, 
    i.__1: int, 
    dest.__1: int, 
    j.__1: int, 
    maxset.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $addstr.arg.1$4$: int;
  var {:extern} delim: int;
  var {:extern} dest: int;
  var {:extern} escjunk: int;
  var {:extern} i: int;
  var {:extern} $isalnum.arg.1$7$: int;
  var {:extern} $isalnum.arg.1$9$: int;
  var {:extern} j: int;
  var {:extern} junk: int;
  var {:extern} k: int;
  var {:extern} maxset: int;
  var {:extern} result.addstr$2: int;
  var {:extern} result.addstr$3: int;
  var {:extern} result.addstr$5: int;
  var {:extern} result.addstr$10: int;
  var {:extern} result.addstr$11: int;
  var {:extern} result.esc$1: int;
  var {:extern} result.isalnum$6: int;
  var {:extern} result.isalnum$8: int;
  var {:extern} src: int;
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
    assume INT_LT(src.__1, alloc);
    assume INT_LT(i.__1, alloc);
    assume INT_LT(dest.__1, alloc);
    assume INT_LT(j.__1, alloc);
    $addstr.arg.1$4$ := 0;
    delim := 0;
    dest := 0;
    escjunk := 0;
    i := 0;
    $isalnum.arg.1$7$ := 0;
    $isalnum.arg.1$9$ := 0;
    j := 0;
    junk := 0;
    k := 0;
    maxset := 0;
    result.addstr$2 := 0;
    result.addstr$3 := 0;
    result.addstr$5 := 0;
    result.addstr$10 := 0;
    result.addstr$11 := 0;
    result.esc$1 := 0;
    result.isalnum$6 := 0;
    result.isalnum$8 := 0;
    src := 0;
    delim := delim.__1;
    src := src.__1;
    i := i.__1;
    dest := dest.__1;
    j := j.__1;
    maxset := maxset.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 101} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 102} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 103} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 105} true;
    goto label_6_head;

  label_6_head:
    call $addstr.arg.1$4$, escjunk, $isalnum.arg.1$7$, $isalnum.arg.1$9$, junk, k, result.addstr$2, result.addstr$3, result.addstr$5, result.addstr$10, result.addstr$11, result.esc$1, result.isalnum$6, result.isalnum$8 := dodash_loop_label_6_head($addstr.arg.1$4$, delim, dest, escjunk, i, $isalnum.arg.1$7$, $isalnum.arg.1$9$, j, junk, k, maxset, result.addstr$2, result.addstr$3, result.addstr$5, result.addstr$10, result.addstr$11, result.esc$1, result.isalnum$6, result.isalnum$8, src);
    goto label_6_head_last;

  label_6_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_109, src);
    assume value_is(__ctobpl_const_110, i);
    assume value_is(__ctobpl_const_111, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_112, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_113, delim);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 128} true;
    return;

  label_6_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_109, src);
    assume value_is(__ctobpl_const_110, i);
    assume value_is(__ctobpl_const_111, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_112, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_113, delim);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 105} true;
    assert i != 0;
    assert src != 0;
    goto label_7_true, label_7_false;

  label_7_false:
    assume Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])] == 0;
    assume value_is(__ctobpl_const_114, src);
    assume value_is(__ctobpl_const_115, i);
    assume value_is(__ctobpl_const_116, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_117, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    goto label_1;

  label_7_true:
    assume Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])] != 0;
    assume value_is(__ctobpl_const_114, src);
    assume value_is(__ctobpl_const_115, i);
    assume value_is(__ctobpl_const_116, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_117, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 107} true;
    assert i != 0;
    assert src != 0;
    goto label_8_true, label_8_false;

  label_8_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))], 64);
    assume value_is(__ctobpl_const_118, src);
    assume value_is(__ctobpl_const_119, i);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_121, 
  Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 111} true;
    assert i != 0;
    assert src != 0;
    goto label_9_true, label_9_false;

  label_9_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], 45);
    assume value_is(__ctobpl_const_122, src);
    assume value_is(__ctobpl_const_123, i);
    assume value_is(__ctobpl_const_124, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_125, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 113} true;
    assert j != 0;
    goto label_19_true, label_19_false;

  label_19_false:
    assume !INT_LEQ(Mem_T.INT4[j], 1);
    assume value_is(__ctobpl_const_126, j);
    assume value_is(__ctobpl_const_127, Mem_T.INT4[j]);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 113} true;
    assert i != 0;
    assert src != 0;
    goto label_25_true, label_25_false;

  label_25_false:
    assume Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))] == 0;
    assume value_is(__ctobpl_const_128, src);
    assume value_is(__ctobpl_const_129, i);
    assume value_is(__ctobpl_const_130, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_131, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 114} true;
    call result.addstr$5 := addstr(45, dest, j, maxset);
    assume value_is(__ctobpl_const_189, dest);
    assume value_is(__ctobpl_const_190, j);
    assume value_is(__ctobpl_const_191, maxset);
    assume value_is(__ctobpl_const_192, dest);
    assume value_is(__ctobpl_const_193, j);
    assume value_is(__ctobpl_const_194, maxset);
    goto label_29;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 114} true;
    junk := result.addstr$5;
    assume value_is(__ctobpl_const_195, junk);
    assume value_is(__ctobpl_const_196, result.addstr$5);
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 126} true;
    assert i != 0;
    assert i != 0;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_228, i);
    assume value_is(__ctobpl_const_229, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_230, i);
    assume value_is(__ctobpl_const_231, Mem_T.INT4[i]);
    goto label_18_dummy;

  label_25_true:
    assume Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))] != 0;
    assume value_is(__ctobpl_const_128, src);
    assume value_is(__ctobpl_const_129, i);
    assume value_is(__ctobpl_const_130, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_131, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    assert i != 0;
    assert src != 0;
    $isalnum.arg.1$7$ := Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))];
    assume value_is(__ctobpl_const_132, $isalnum.arg.1$7$);
    assume value_is(__ctobpl_const_133, src);
    assume value_is(__ctobpl_const_134, i);
    assume value_is(__ctobpl_const_135, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_136, 
  Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))]);
    goto label_31;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    call result.isalnum$6 := isalnum($isalnum.arg.1$7$);
    assume value_is(__ctobpl_const_137, $isalnum.arg.1$7$);
    assume value_is(__ctobpl_const_138, $isalnum.arg.1$7$);
    goto label_34;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    goto label_34_true, label_34_false;

  label_34_false:
    assume result.isalnum$6 == 0;
    assume value_is(__ctobpl_const_139, result.isalnum$6);
    goto label_35;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 125} true;
    call result.addstr$11 := addstr(45, dest, j, maxset);
    assume value_is(__ctobpl_const_156, dest);
    assume value_is(__ctobpl_const_157, j);
    assume value_is(__ctobpl_const_158, maxset);
    assume value_is(__ctobpl_const_159, dest);
    assume value_is(__ctobpl_const_160, j);
    assume value_is(__ctobpl_const_161, maxset);
    goto label_52;

  label_52:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 125} true;
    junk := result.addstr$11;
    assume value_is(__ctobpl_const_162, junk);
    assume value_is(__ctobpl_const_163, result.addstr$11);
    goto label_18;

  label_34_true:
    assume result.isalnum$6 != 0;
    assume value_is(__ctobpl_const_139, result.isalnum$6);
    goto label_38;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    assert i != 0;
    assert src != 0;
    $isalnum.arg.1$9$ := Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))];
    assume value_is(__ctobpl_const_140, $isalnum.arg.1$9$);
    assume value_is(__ctobpl_const_141, src);
    assume value_is(__ctobpl_const_142, i);
    assume value_is(__ctobpl_const_143, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_144, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_39;

  label_39:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    call result.isalnum$8 := isalnum($isalnum.arg.1$9$);
    assume value_is(__ctobpl_const_145, $isalnum.arg.1$9$);
    assume value_is(__ctobpl_const_146, $isalnum.arg.1$9$);
    goto label_42;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    goto label_42_true, label_42_false;

  label_42_false:
    assume result.isalnum$8 == 0;
    assume value_is(__ctobpl_const_147, result.isalnum$8);
    goto label_35;

  label_42_true:
    assume result.isalnum$8 != 0;
    assume value_is(__ctobpl_const_147, result.isalnum$8);
    goto label_43;

  label_43:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 116} true;
    assert i != 0;
    assert src != 0;
    assert i != 0;
    assert src != 0;
    goto label_43_true, label_43_false;

  label_43_false:
    assume !INT_LEQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))], 
  Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_148, src);
    assume value_is(__ctobpl_const_149, i);
    assume value_is(__ctobpl_const_150, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_151, 
  Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_152, src);
    assume value_is(__ctobpl_const_153, i);
    assume value_is(__ctobpl_const_154, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_155, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_35;

  label_43_true:
    assume INT_LEQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))], 
  Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_148, src);
    assume value_is(__ctobpl_const_149, i);
    assume value_is(__ctobpl_const_150, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_151, 
  Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_152, src);
    assume value_is(__ctobpl_const_153, i);
    assume value_is(__ctobpl_const_154, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_155, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_44;

  label_44:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    assert i != 0;
    assert src != 0;
    k := PLUS(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))], 1, 1);
    assume value_is(__ctobpl_const_164, k);
    assume value_is(__ctobpl_const_165, src);
    assume value_is(__ctobpl_const_166, i);
    assume value_is(__ctobpl_const_167, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_168, 
  Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))]);
    goto label_45;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    goto label_45_head;

  label_45_head:
    call junk, k, result.addstr$10 := dodash_loop_label_45_head(dest, i, j, junk, k, maxset, result.addstr$10, src);
    goto label_45_head_last;

  label_45_false:
    assume !INT_LEQ(k, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_169, k);
    assume value_is(__ctobpl_const_170, src);
    assume value_is(__ctobpl_const_171, i);
    assume value_is(__ctobpl_const_172, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_173, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_46;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 122} true;
    assert i != 0;
    assert i != 0;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_174, i);
    assume value_is(__ctobpl_const_175, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_176, i);
    assume value_is(__ctobpl_const_177, Mem_T.INT4[i]);
    goto label_18;

  label_45_true:
    assume INT_LEQ(k, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_169, k);
    assume value_is(__ctobpl_const_170, src);
    assume value_is(__ctobpl_const_171, i);
    assume value_is(__ctobpl_const_172, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_173, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_47;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 120} true;
    call result.addstr$10 := addstr(k, dest, j, maxset);
    assume value_is(__ctobpl_const_178, k);
    assume value_is(__ctobpl_const_179, dest);
    assume value_is(__ctobpl_const_180, j);
    assume value_is(__ctobpl_const_181, maxset);
    assume value_is(__ctobpl_const_182, k);
    assume value_is(__ctobpl_const_183, dest);
    assume value_is(__ctobpl_const_184, j);
    assume value_is(__ctobpl_const_185, maxset);
    goto label_50;

  label_50:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 120} true;
    junk := result.addstr$10;
    assume value_is(__ctobpl_const_186, junk);
    assume value_is(__ctobpl_const_187, result.addstr$10);
    goto label_51;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    assume value_is(__ctobpl_const_188, k);
    k := PLUS(k, 1, 1);
    goto label_51_dummy;

  label_19_true:
    assume INT_LEQ(Mem_T.INT4[j], 1);
    assume value_is(__ctobpl_const_126, j);
    assume value_is(__ctobpl_const_127, Mem_T.INT4[j]);
    goto label_26;

  label_9_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], 45);
    assume value_is(__ctobpl_const_122, src);
    assume value_is(__ctobpl_const_123, i);
    assume value_is(__ctobpl_const_124, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_125, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 112} true;
    assert i != 0;
    assert src != 0;
    $addstr.arg.1$4$ := Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])];
    assume value_is(__ctobpl_const_197, $addstr.arg.1$4$);
    assume value_is(__ctobpl_const_198, src);
    assume value_is(__ctobpl_const_199, i);
    assume value_is(__ctobpl_const_200, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_201, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 112} true;
    call result.addstr$3 := addstr($addstr.arg.1$4$, dest, j, maxset);
    assume value_is(__ctobpl_const_202, $addstr.arg.1$4$);
    assume value_is(__ctobpl_const_203, dest);
    assume value_is(__ctobpl_const_204, j);
    assume value_is(__ctobpl_const_205, maxset);
    assume value_is(__ctobpl_const_206, $addstr.arg.1$4$);
    assume value_is(__ctobpl_const_207, dest);
    assume value_is(__ctobpl_const_208, j);
    assume value_is(__ctobpl_const_209, maxset);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 112} true;
    junk := result.addstr$3;
    assume value_is(__ctobpl_const_210, junk);
    assume value_is(__ctobpl_const_211, result.addstr$3);
    goto label_18;

  label_8_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))], 64);
    assume value_is(__ctobpl_const_118, src);
    assume value_is(__ctobpl_const_119, i);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_121, 
  Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[i], 1, 1))]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 108} true;
    call result.esc$1 := esc(src, i);
    assume value_is(__ctobpl_const_212, src);
    assume value_is(__ctobpl_const_213, i);
    assume value_is(__ctobpl_const_214, src);
    assume value_is(__ctobpl_const_215, i);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 108} true;
    escjunk := result.esc$1;
    assume value_is(__ctobpl_const_216, escjunk);
    assume value_is(__ctobpl_const_217, result.esc$1);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 109} true;
    call result.addstr$2 := addstr(escjunk, dest, j, maxset);
    assume value_is(__ctobpl_const_218, escjunk);
    assume value_is(__ctobpl_const_219, dest);
    assume value_is(__ctobpl_const_220, j);
    assume value_is(__ctobpl_const_221, maxset);
    assume value_is(__ctobpl_const_222, escjunk);
    assume value_is(__ctobpl_const_223, dest);
    assume value_is(__ctobpl_const_224, j);
    assume value_is(__ctobpl_const_225, maxset);
    goto label_17;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 109} true;
    junk := result.addstr$2;
    assume value_is(__ctobpl_const_226, junk);
    assume value_is(__ctobpl_const_227, result.addstr$2);
    goto label_18;

  label_51_dummy:
    assume false;
    return;

  label_45_head_last:
    assert i != 0;
    assert src != 0;
    goto label_45_true, label_45_false;

  label_18_dummy:
    assume false;
    return;

  label_6_head_last:
    assert i != 0;
    assert src != 0;
    goto label_6_true, label_6_false;
}



procedure {:extern} esc(s.__1: int, i.__1: int) returns (result.esc$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} esc(s.__1: int, i.__1: int) returns (result.esc$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} i: int;
  var {:extern} result: int;
  var {:extern} s: int;
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
    assume INT_LT(s.__1, alloc);
    assume INT_LT(i.__1, alloc);
    i := 0;
    result := 0;
    result.esc$1 := 0;
    s := 0;
    s := s.__1;
    i := i.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 70} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 71} true;
    assert i != 0;
    assert s != 0;
    goto label_4_true, label_4_false;

  label_4_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 64);
    assume value_is(__ctobpl_const_232, s);
    assume value_is(__ctobpl_const_233, i);
    assume value_is(__ctobpl_const_234, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_235, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 74} true;
    assert i != 0;
    assert s != 0;
    goto label_5_true, label_5_false;

  label_5_false:
    assume Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))] == 0;
    assume value_is(__ctobpl_const_236, s);
    assume value_is(__ctobpl_const_237, i);
    assume value_is(__ctobpl_const_238, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_239, Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 75} true;
    result := 64;
    assume value_is(__ctobpl_const_240, result);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 87} true;
    result.esc$1 := result;
    assume value_is(__ctobpl_const_265, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 88} true;
    return;

  label_5_true:
    assume Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))] != 0;
    assume value_is(__ctobpl_const_236, s);
    assume value_is(__ctobpl_const_237, i);
    assume value_is(__ctobpl_const_238, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_239, Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 78} true;
    assert i != 0;
    assert i != 0;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_241, i);
    assume value_is(__ctobpl_const_242, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_243, i);
    assume value_is(__ctobpl_const_244, Mem_T.INT4[i]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 79} true;
    assert i != 0;
    assert s != 0;
    goto label_10_true, label_10_false;

  label_10_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 110);
    assume value_is(__ctobpl_const_245, s);
    assume value_is(__ctobpl_const_246, i);
    assume value_is(__ctobpl_const_247, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_248, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 82} true;
    assert i != 0;
    assert s != 0;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 116);
    assume value_is(__ctobpl_const_249, s);
    assume value_is(__ctobpl_const_250, i);
    assume value_is(__ctobpl_const_251, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_252, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 85} true;
    assert i != 0;
    assert s != 0;
    result := Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])];
    assume value_is(__ctobpl_const_253, result);
    assume value_is(__ctobpl_const_254, s);
    assume value_is(__ctobpl_const_255, i);
    assume value_is(__ctobpl_const_256, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_257, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_7;

  label_11_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 116);
    assume value_is(__ctobpl_const_249, s);
    assume value_is(__ctobpl_const_250, i);
    assume value_is(__ctobpl_const_251, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_252, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 83} true;
    result := 9;
    assume value_is(__ctobpl_const_258, result);
    goto label_7;

  label_10_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 110);
    assume value_is(__ctobpl_const_245, s);
    assume value_is(__ctobpl_const_246, i);
    assume value_is(__ctobpl_const_247, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_248, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 80} true;
    result := 10;
    assume value_is(__ctobpl_const_259, result);
    goto label_7;

  label_4_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 64);
    assume value_is(__ctobpl_const_232, s);
    assume value_is(__ctobpl_const_233, i);
    assume value_is(__ctobpl_const_234, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_235, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 72} true;
    assert i != 0;
    assert s != 0;
    result := Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])];
    assume value_is(__ctobpl_const_260, result);
    assume value_is(__ctobpl_const_261, s);
    assume value_is(__ctobpl_const_262, i);
    assume value_is(__ctobpl_const_263, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_264, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
    goto label_7;
}



procedure {:extern} getccl(arg.__1: int, i.__1: int, pat.__1: int, j.__1: int)
   returns (result.getccl$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} getccl(arg.__1: int, i.__1: int, pat.__1: int, j.__1: int)
   returns (result.getccl$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} arg: int;
  var {:extern} i: int;
  var {:extern} j: int;
  var {:extern} jstart: int;
  var {:extern} junk: int;
  var {:extern} pat: int;
  var {:extern} result.addstr$2: int;
  var {:extern} result.addstr$3: int;
  var {:extern} result.addstr$4: int;
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
    assume INT_LT(arg.__1, alloc);
    assume INT_LT(i.__1, alloc);
    assume INT_LT(pat.__1, alloc);
    assume INT_LT(j.__1, alloc);
    arg := 0;
    i := 0;
    j := 0;
    jstart := 0;
    junk := 0;
    pat := 0;
    result.addstr$2 := 0;
    result.addstr$3 := 0;
    result.addstr$4 := 0;
    result.getccl$1 := 0;
    arg := arg.__1;
    i := i.__1;
    pat := pat.__1;
    j := j.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 137} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 138} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 140} true;
    assert i != 0;
    assert i != 0;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_266, i);
    assume value_is(__ctobpl_const_267, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_268, i);
    assume value_is(__ctobpl_const_269, Mem_T.INT4[i]);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 141} true;
    assert i != 0;
    assert arg != 0;
    goto label_6_true, label_6_false;

  label_6_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 94);
    assume value_is(__ctobpl_const_270, arg);
    assume value_is(__ctobpl_const_271, i);
    assume value_is(__ctobpl_const_272, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_273, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 145} true;
    call result.addstr$3 := addstr(91, pat, j, 100);
    assume value_is(__ctobpl_const_274, pat);
    assume value_is(__ctobpl_const_275, j);
    assume value_is(__ctobpl_const_276, pat);
    assume value_is(__ctobpl_const_277, j);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 145} true;
    junk := result.addstr$3;
    assume value_is(__ctobpl_const_278, junk);
    assume value_is(__ctobpl_const_279, result.addstr$3);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 146} true;
    assert j != 0;
    jstart := Mem_T.INT4[j];
    assume value_is(__ctobpl_const_290, jstart);
    assume value_is(__ctobpl_const_291, j);
    assume value_is(__ctobpl_const_292, Mem_T.INT4[j]);
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 147} true;
    call result.addstr$4 := addstr(0, pat, j, 100);
    assume value_is(__ctobpl_const_293, pat);
    assume value_is(__ctobpl_const_294, j);
    assume value_is(__ctobpl_const_295, pat);
    assume value_is(__ctobpl_const_296, j);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 147} true;
    junk := result.addstr$4;
    assume value_is(__ctobpl_const_297, junk);
    assume value_is(__ctobpl_const_298, result.addstr$4);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 148} true;
    call dodash(93, arg, i, pat, j, 100);
    assume value_is(__ctobpl_const_299, arg);
    assume value_is(__ctobpl_const_300, i);
    assume value_is(__ctobpl_const_301, pat);
    assume value_is(__ctobpl_const_302, j);
    assume value_is(__ctobpl_const_303, arg);
    assume value_is(__ctobpl_const_304, i);
    assume value_is(__ctobpl_const_305, pat);
    assume value_is(__ctobpl_const_306, j);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 149} true;
    assert pat != 0;
    assert j != 0;
    Mem_T.CHAR := Mem_T.CHAR[PLUS(pat, 1, jstart) := MINUS_BOTH_PTR_OR_BOTH_INT(MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[j], jstart, 1), 1, 1)];
    assume value_is(__ctobpl_const_307, pat);
    assume value_is(__ctobpl_const_308, jstart);
    assume value_is(__ctobpl_const_309, Mem_T.CHAR[PLUS(pat, 1, jstart)]);
    assume value_is(__ctobpl_const_310, j);
    assume value_is(__ctobpl_const_311, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_312, jstart);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 150} true;
    assert i != 0;
    assert arg != 0;
    result.getccl$1 := LIFT(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 93));
    assume value_is(__ctobpl_const_313, arg);
    assume value_is(__ctobpl_const_314, i);
    assume value_is(__ctobpl_const_315, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_316, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 151} true;
    return;

  label_6_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 94);
    assume value_is(__ctobpl_const_270, arg);
    assume value_is(__ctobpl_const_271, i);
    assume value_is(__ctobpl_const_272, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_273, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 142} true;
    call result.addstr$2 := addstr(33, pat, j, 100);
    assume value_is(__ctobpl_const_280, pat);
    assume value_is(__ctobpl_const_281, j);
    assume value_is(__ctobpl_const_282, pat);
    assume value_is(__ctobpl_const_283, j);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 142} true;
    junk := result.addstr$2;
    assume value_is(__ctobpl_const_284, junk);
    assume value_is(__ctobpl_const_285, result.addstr$2);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 143} true;
    assert i != 0;
    assert i != 0;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_286, i);
    assume value_is(__ctobpl_const_287, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_288, i);
    assume value_is(__ctobpl_const_289, Mem_T.INT4[i]);
    goto label_15;
}



procedure {:extern} getline(s.__1: int, maxsize.__1: int) returns (result.getline$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} getline(s.__1: int, maxsize.__1: int) returns (result.getline$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $fgets.arg.3$4$: int;
  var {:extern} maxsize: int;
  var {:extern} result: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.fgets$2: int;
  var {:extern} s: int;
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
    assume INT_LT(s.__1, alloc);
    $fgets.arg.3$4$ := 0;
    maxsize := 0;
    result := 0;
    result.__iob_func$3 := 0;
    result.fgets$2 := 0;
    result.getline$1 := 0;
    s := 0;
    s := s.__1;
    maxsize := maxsize.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 43} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 44} true;
    call result.__iob_func$3 := __iob_func();
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 44} true;
    assert result.__iob_func$3 != 0;
    $fgets.arg.3$4$ := PLUS(result.__iob_func$3, 32, 0);
    assume value_is(__ctobpl_const_317, $fgets.arg.3$4$);
    assume value_is(__ctobpl_const_318, result.__iob_func$3);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 44} true;
    call result.fgets$2 := fgets(s, maxsize, $fgets.arg.3$4$);
    assume value_is(__ctobpl_const_319, s);
    assume value_is(__ctobpl_const_320, maxsize);
    assume value_is(__ctobpl_const_321, $fgets.arg.3$4$);
    assume value_is(__ctobpl_const_322, s);
    assume value_is(__ctobpl_const_323, maxsize);
    assume value_is(__ctobpl_const_324, $fgets.arg.3$4$);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 44} true;
    result := result.fgets$2;
    assume value_is(__ctobpl_const_325, result);
    assume value_is(__ctobpl_const_326, result.fgets$2);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 45} true;
    result.getline$1 := LIFT(INT_NEQ(result, 0));
    assume value_is(__ctobpl_const_327, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 46} true;
    return;
}



procedure {:extern} getpat(arg.__1: int, pat.__1: int) returns (result.getpat$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} getpat(arg.__1: int, pat.__1: int) returns (result.getpat$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} arg: int;
  var {:extern} makeres: int;
  var {:extern} pat: int;
  var {:extern} result.makepat$2: int;
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
    assume INT_LT(arg.__1, alloc);
    assume INT_LT(pat.__1, alloc);
    arg := 0;
    makeres := 0;
    pat := 0;
    result.getpat$1 := 0;
    result.makepat$2 := 0;
    arg := arg.__1;
    pat := pat.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 250} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 252} true;
    call result.makepat$2 := makepat(arg, 0, 0, pat);
    assume value_is(__ctobpl_const_328, arg);
    assume value_is(__ctobpl_const_329, pat);
    assume value_is(__ctobpl_const_330, arg);
    assume value_is(__ctobpl_const_331, pat);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 252} true;
    makeres := result.makepat$2;
    assume value_is(__ctobpl_const_332, makeres);
    assume value_is(__ctobpl_const_333, result.makepat$2);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 253} true;
    result.getpat$1 := LIFT(INT_LT(0, makeres));
    assume value_is(__ctobpl_const_334, makeres);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 254} true;
    return;
}



procedure {:extern} getsub(arg.__1: int, sub.__1: int) returns (result.getsub$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} getsub(arg.__1: int, sub.__1: int) returns (result.getsub$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} arg: int;
  var {:extern} makeres: int;
  var {:extern} result.makesub$2: int;
  var {:extern} sub: int;
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
    assume INT_LT(arg.__1, alloc);
    assume INT_LT(sub.__1, alloc);
    arg := 0;
    makeres := 0;
    result.getsub$1 := 0;
    result.makesub$2 := 0;
    sub := 0;
    arg := arg.__1;
    sub := sub.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 296} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 298} true;
    call result.makesub$2 := makesub(arg, 0, 0, sub);
    assume value_is(__ctobpl_const_335, arg);
    assume value_is(__ctobpl_const_336, sub);
    assume value_is(__ctobpl_const_337, arg);
    assume value_is(__ctobpl_const_338, sub);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 298} true;
    makeres := result.makesub$2;
    assume value_is(__ctobpl_const_339, makeres);
    assume value_is(__ctobpl_const_340, result.makesub$2);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 299} true;
    result.getsub$1 := LIFT(INT_LT(0, makeres));
    assume value_is(__ctobpl_const_341, makeres);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 300} true;
    return;
}



procedure {:extern} in_pat_set(c.__1: int) returns (result.in_pat_set$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} in_pat_set(c.__1: int) returns (result.in_pat_set$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.2$: int;
  var {:extern} c: int;
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
    c := 0;
    result.in_pat_set$1 := 0;
    c := c.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 182} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume !INT_EQ(c, 99);
    assume value_is(__ctobpl_const_342, c);
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 182} true;
    goto label_4_true, label_4_false;

  label_4_false:
    assume !INT_EQ(c, 37);
    assume value_is(__ctobpl_const_343, c);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 182} true;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_EQ(c, 36);
    assume value_is(__ctobpl_const_344, c);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 182} true;
    goto label_8_true, label_8_false;

  label_8_false:
    assume !INT_EQ(c, 63);
    assume value_is(__ctobpl_const_345, c);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 183} true;
    goto label_9_true, label_9_false;

  label_9_false:
    assume !INT_EQ(c, 91);
    assume value_is(__ctobpl_const_346, c);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 183} true;
    goto label_10_true, label_10_false;

  label_10_false:
    assume !INT_EQ(c, 33);
    assume value_is(__ctobpl_const_347, c);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 183} true;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_EQ(c, 42);
    assume value_is(__ctobpl_const_348, c);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 183} true;
    $Pred.2$ := 0;
    assume value_is(__ctobpl_const_349, $Pred.2$);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 182} true;
    result.in_pat_set$1 := $Pred.2$;
    assume value_is(__ctobpl_const_351, $Pred.2$);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 184} true;
    return;

  label_11_true:
    assume INT_EQ(c, 42);
    assume value_is(__ctobpl_const_348, c);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 183} true;
    $Pred.2$ := 1;
    assume value_is(__ctobpl_const_350, $Pred.2$);
    goto label_6;

  label_10_true:
    assume INT_EQ(c, 33);
    assume value_is(__ctobpl_const_347, c);
    goto label_5;

  label_9_true:
    assume INT_EQ(c, 91);
    assume value_is(__ctobpl_const_346, c);
    goto label_5;

  label_8_true:
    assume INT_EQ(c, 63);
    assume value_is(__ctobpl_const_345, c);
    goto label_5;

  label_7_true:
    assume INT_EQ(c, 36);
    assume value_is(__ctobpl_const_344, c);
    goto label_5;

  label_4_true:
    assume INT_EQ(c, 37);
    assume value_is(__ctobpl_const_343, c);
    goto label_5;

  label_3_true:
    assume INT_EQ(c, 99);
    assume value_is(__ctobpl_const_342, c);
    goto label_5;
}



procedure {:extern} in_set_2(c.__1: int) returns (result.in_set_2$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} in_set_2(c.__1: int) returns (result.in_set_2$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.2$: int;
  var {:extern} c: int;
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
    c := 0;
    result.in_set_2$1 := 0;
    c := c.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 176} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume !INT_EQ(c, 37);
    assume value_is(__ctobpl_const_352, c);
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 176} true;
    goto label_4_true, label_4_false;

  label_4_false:
    assume !INT_EQ(c, 36);
    assume value_is(__ctobpl_const_353, c);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 176} true;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_EQ(c, 42);
    assume value_is(__ctobpl_const_354, c);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 176} true;
    $Pred.2$ := 0;
    assume value_is(__ctobpl_const_355, $Pred.2$);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 176} true;
    result.in_set_2$1 := $Pred.2$;
    assume value_is(__ctobpl_const_357, $Pred.2$);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 177} true;
    return;

  label_7_true:
    assume INT_EQ(c, 42);
    assume value_is(__ctobpl_const_354, c);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 176} true;
    $Pred.2$ := 1;
    assume value_is(__ctobpl_const_356, $Pred.2$);
    goto label_6;

  label_4_true:
    assume INT_EQ(c, 36);
    assume value_is(__ctobpl_const_353, c);
    goto label_5;

  label_3_true:
    assume INT_EQ(c, 37);
    assume value_is(__ctobpl_const_352, c);
    goto label_5;
}



procedure {:extern} locate(c.__1: int, pat.__1: int, offset.__1: int) returns (result.locate$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} locate(c.__1: int, pat.__1: int, offset.__1: int) returns (result.locate$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} c: int;
  var {:extern} flag: int;
  var {:extern} i: int;
  var {:extern} offset: int;
  var {:extern} pat: int;
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
    assume INT_LT(pat.__1, alloc);
    c := 0;
    flag := 0;
    i := 0;
    offset := 0;
    pat := 0;
    result.locate$1 := 0;
    c := c.__1;
    pat := pat.__1;
    offset := offset.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 310} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 311} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 313} true;
    flag := 0;
    assume value_is(__ctobpl_const_358, flag);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 314} true;
    assert pat != 0;
    i := PLUS(offset, 1, Mem_T.CHAR[PLUS(pat, 1, offset)]);
    assume value_is(__ctobpl_const_359, i);
    assume value_is(__ctobpl_const_360, offset);
    assume value_is(__ctobpl_const_361, pat);
    assume value_is(__ctobpl_const_362, offset);
    assume value_is(__ctobpl_const_363, Mem_T.CHAR[PLUS(pat, 1, offset)]);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 315} true;
    goto label_7_head;

  label_7_head:
    call flag, i := locate_loop_label_7_head(c, flag, i, offset, pat);
    goto label_7_head_last;

  label_7_false:
    assume !INT_LT(offset, i);
    assume value_is(__ctobpl_const_364, offset);
    assume value_is(__ctobpl_const_365, i);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 323} true;
    result.locate$1 := flag;
    assume value_is(__ctobpl_const_366, flag);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 324} true;
    return;

  label_7_true:
    assume INT_LT(offset, i);
    assume value_is(__ctobpl_const_364, offset);
    assume value_is(__ctobpl_const_365, i);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 317} true;
    assert pat != 0;
    goto label_9_true, label_9_false;

  label_9_false:
    assume !INT_EQ(c, Mem_T.CHAR[PLUS(pat, 1, i)]);
    assume value_is(__ctobpl_const_367, c);
    assume value_is(__ctobpl_const_368, pat);
    assume value_is(__ctobpl_const_369, i);
    assume value_is(__ctobpl_const_370, Mem_T.CHAR[PLUS(pat, 1, i)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 321} true;
    i := MINUS_BOTH_PTR_OR_BOTH_INT(i, 1, 1);
    assume value_is(__ctobpl_const_371, i);
    assume value_is(__ctobpl_const_372, i);
    goto label_10_dummy;

  label_9_true:
    assume INT_EQ(c, Mem_T.CHAR[PLUS(pat, 1, i)]);
    assume value_is(__ctobpl_const_367, c);
    assume value_is(__ctobpl_const_368, pat);
    assume value_is(__ctobpl_const_369, i);
    assume value_is(__ctobpl_const_370, Mem_T.CHAR[PLUS(pat, 1, i)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 318} true;
    flag := 1;
    assume value_is(__ctobpl_const_373, flag);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 319} true;
    i := offset;
    assume value_is(__ctobpl_const_374, i);
    assume value_is(__ctobpl_const_375, offset);
    goto label_12_dummy;

  label_10_dummy:
    assume false;
    return;

  label_12_dummy:
    assume false;
    return;

  label_7_head_last:
    goto label_7_true, label_7_false;
}



procedure {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} argc: int;
  var {:extern} argv: int;
  var {:extern} $change.arg.1$18$: int;
  var {:extern} $change.arg.2$17$: int;
  var {:extern} $fprintf.arg.1$10$: int;
  var {:extern} $fprintf.arg.1$16$: int;
  var {:extern} $fprintf.arg.1$4$: int;
  var {:extern} $getpat.arg.1$7$: int;
  var {:extern} $getpat.arg.2$6$: int;
  var {:extern} $getsub.arg.1$13$: int;
  var {:extern} $getsub.arg.2$12$: int;
  var {:extern} pat: int;
  var {:extern} result: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.__iob_func$9: int;
  var {:extern} result.__iob_func$15: int;
  var {:extern} result.fprintf$2: int;
  var {:extern} result.fprintf$8: int;
  var {:extern} result.fprintf$14: int;
  var {:extern} result.getpat$5: int;
  var {:extern} result.getsub$11: int;
  var {:extern} sub: int;
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
    $change.arg.1$18$ := 0;
    $change.arg.2$17$ := 0;
    $fprintf.arg.1$10$ := 0;
    $fprintf.arg.1$16$ := 0;
    $fprintf.arg.1$4$ := 0;
    $getpat.arg.1$7$ := 0;
    $getpat.arg.2$6$ := 0;
    $getsub.arg.1$13$ := 0;
    $getsub.arg.2$12$ := 0;
    pat := 0;
    result := 0;
    result.__iob_func$3 := 0;
    result.__iob_func$9 := 0;
    result.__iob_func$15 := 0;
    result.fprintf$2 := 0;
    result.fprintf$8 := 0;
    result.fprintf$14 := 0;
    result.getpat$5 := 0;
    result.getsub$11 := 0;
    result.main$1 := 0;
    call sub := __HAVOC_det_malloc(100);
    argc := argc.__1;
    argv := argv.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 524} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 524} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 525} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 527} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume !INT_LT(argc, 2);
    assume value_is(__ctobpl_const_376, argc);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 533} true;
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 533} true;
    assert argv != 0;
    $getpat.arg.1$7$ := Mem_T.PCHAR[PLUS(argv, 4, 1)];
    assume value_is(__ctobpl_const_377, $getpat.arg.1$7$);
    assume value_is(__ctobpl_const_378, argv);
    assume value_is(__ctobpl_const_379, Mem_T.PCHAR[PLUS(argv, 4, 1)]);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 533} true;
    call result.getpat$5 := getpat($getpat.arg.1$7$, $getpat.arg.2$6$);
    assume value_is(__ctobpl_const_380, $getpat.arg.1$7$);
    assume value_is(__ctobpl_const_381, $getpat.arg.1$7$);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 533} true;
    result := result.getpat$5;
    assume value_is(__ctobpl_const_382, result);
    assume value_is(__ctobpl_const_383, result.getpat$5);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 534} true;
    goto label_23_true, label_23_false;

  label_23_false:
    assume result == 0;
    assume value_is(__ctobpl_const_384, result);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 536} true;
    call result.__iob_func$9 := __iob_func();
    goto label_52;

  label_52:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 536} true;
    assert result.__iob_func$9 != 0;
    $fprintf.arg.1$10$ := PLUS(result.__iob_func$9, 32, 1);
    assume value_is(__ctobpl_const_385, $fprintf.arg.1$10$);
    assume value_is(__ctobpl_const_386, result.__iob_func$9);
    goto label_53;

  label_53:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 536} true;
    call result.fprintf$8 := det_choice();
    goto label_56;

  label_56:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 537} true;
    return;

  label_23_true:
    assume result != 0;
    assume value_is(__ctobpl_const_384, result);
    goto label_27;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 540} true;
    goto label_27_true, label_27_false;

  label_27_false:
    assume !INT_LEQ(3, argc);
    assume value_is(__ctobpl_const_387, argc);
    goto label_28;

  label_28:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 550} true;
    assert sub != 0;
    Mem_T.CHAR := Mem_T.CHAR[PLUS(sub, 1, 0) := 0];
    assume value_is(__ctobpl_const_388, Mem_T.CHAR[PLUS(sub, 1, 0)]);
    goto label_39;

  label_39:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 553} true;
    goto label_40;

  label_40:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 553} true;
    goto label_41;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 553} true;
    call change($change.arg.1$18$, $change.arg.2$17$);
    goto label_44;

  label_44:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 554} true;
    result.main$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 555} true;
    call __HAVOC_free(sub);
    return;

  label_27_true:
    assume INT_LEQ(3, argc);
    assume value_is(__ctobpl_const_387, argc);
    goto label_29;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 542} true;
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 542} true;
    assert argv != 0;
    $getsub.arg.1$13$ := Mem_T.PCHAR[PLUS(argv, 4, 2)];
    assume value_is(__ctobpl_const_389, $getsub.arg.1$13$);
    assume value_is(__ctobpl_const_390, argv);
    assume value_is(__ctobpl_const_391, Mem_T.PCHAR[PLUS(argv, 4, 2)]);
    goto label_31;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 542} true;
    call result.getsub$11 := getsub($getsub.arg.1$13$, $getsub.arg.2$12$);
    assume value_is(__ctobpl_const_392, $getsub.arg.1$13$);
    assume value_is(__ctobpl_const_393, $getsub.arg.1$13$);
    goto label_34;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 542} true;
    result := result.getsub$11;
    assume value_is(__ctobpl_const_394, result);
    assume value_is(__ctobpl_const_395, result.getsub$11);
    goto label_35;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 543} true;
    goto label_35_true, label_35_false;

  label_35_false:
    assume result == 0;
    assume value_is(__ctobpl_const_396, result);
    goto label_36;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 545} true;
    call result.__iob_func$15 := __iob_func();
    goto label_45;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 545} true;
    assert result.__iob_func$15 != 0;
    $fprintf.arg.1$16$ := PLUS(result.__iob_func$15, 32, 1);
    assume value_is(__ctobpl_const_397, $fprintf.arg.1$16$);
    assume value_is(__ctobpl_const_398, result.__iob_func$15);
    goto label_46;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 545} true;
    call result.fprintf$14 := det_choice();
    goto label_49;

  label_49:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 546} true;
    return;

  label_35_true:
    assume result != 0;
    assume value_is(__ctobpl_const_396, result);
    goto label_39;

  label_6_true:
    assume INT_LT(argc, 2);
    assume value_is(__ctobpl_const_376, argc);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 529} true;
    call result.__iob_func$3 := __iob_func();
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 529} true;
    assert result.__iob_func$3 != 0;
    $fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1);
    assume value_is(__ctobpl_const_399, $fprintf.arg.1$4$);
    assume value_is(__ctobpl_const_400, result.__iob_func$3);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 529} true;
    call result.fprintf$2 := det_choice();
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 530} true;
    return;
}



procedure {:extern} makepat(arg.__1: int, start.__1: int, delim.__1: int, pat.__1: int)
   returns (result.makepat$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} makepat(arg.__1: int, start.__1: int, delim.__1: int, pat.__1: int)
   returns (result.makepat$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} arg: int;
  var {:extern} delim: int;
  var {:extern} done: int;
  var {:extern} escjunk: int;
  var {:extern} getres: int;
  var {:extern} i: int;
  var {:extern} $in_set_2.arg.1$7$: int;
  var {:extern} j: int;
  var {:extern} junk: int;
  var {:extern} lastj: int;
  var {:extern} lj: int;
  var {:extern} pat: int;
  var {:extern} result: int;
  var {:extern} result.addstr$2: int;
  var {:extern} result.addstr$3: int;
  var {:extern} result.addstr$4: int;
  var {:extern} result.addstr$8: int;
  var {:extern} result.addstr$10: int;
  var {:extern} result.addstr$11: int;
  var {:extern} result.esc$9: int;
  var {:extern} result.getccl$5: int;
  var {:extern} result.in_set_2$6: int;
  var {:extern} start: int;
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
    assume INT_LT(arg.__1, alloc);
    assume INT_LT(pat.__1, alloc);
    arg := 0;
    delim := 0;
    done := 0;
    escjunk := 0;
    getres := 0;
    call i := __HAVOC_det_malloc(4);
    $in_set_2.arg.1$7$ := 0;
    call j := __HAVOC_det_malloc(4);
    junk := 0;
    lastj := 0;
    lj := 0;
    pat := 0;
    result := 0;
    result.addstr$2 := 0;
    result.addstr$3 := 0;
    result.addstr$4 := 0;
    result.addstr$8 := 0;
    result.addstr$10 := 0;
    result.addstr$11 := 0;
    result.esc$9 := 0;
    result.getccl$5 := 0;
    result.in_set_2$6 := 0;
    result.makepat$1 := 0;
    start := 0;
    arg := arg.__1;
    start := start.__1;
    delim := delim.__1;
    pat := pat.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 193} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 194} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 194} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 194} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 194} true;
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 195} true;
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 195} true;
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 196} true;
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 197} true;
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 199} true;
    Mem_T.INT4 := Mem_T.INT4[j := 0];
    assume value_is(__ctobpl_const_401, Mem_T.INT4[j]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 200} true;
    Mem_T.INT4 := Mem_T.INT4[i := start];
    assume value_is(__ctobpl_const_402, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_403, start);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 201} true;
    lastj := 0;
    assume value_is(__ctobpl_const_404, lastj);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 202} true;
    done := 0;
    assume value_is(__ctobpl_const_405, done);
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 203} true;
    goto label_16_head;

  label_16_head:
    call done, escjunk, getres, $in_set_2.arg.1$7$, junk, lastj, lj, result.addstr$2, result.addstr$3, result.addstr$4, result.addstr$8, result.addstr$10, result.esc$9, result.getccl$5, result.in_set_2$6 := makepat_loop_label_16_head(arg, delim, done, escjunk, getres, i, $in_set_2.arg.1$7$, j, junk, lastj, lj, pat, result.addstr$2, result.addstr$3, result.addstr$4, result.addstr$8, result.addstr$10, result.esc$9, result.getccl$5, result.in_set_2$6, start);
    goto label_16_head_last;

  label_16_false:
    assume done == 0;
    assume value_is(__ctobpl_const_406, done);
    goto label_17;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 203} true;
    assert arg != 0;
    goto label_17_true, label_17_false;

  label_17_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_407, arg);
    assume value_is(__ctobpl_const_408, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_409, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_410, delim);
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 234} true;
    call result.addstr$11 := addstr(0, pat, j, 100);
    assume value_is(__ctobpl_const_510, pat);
    assume value_is(__ctobpl_const_511, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_512, pat);
    assume value_is(__ctobpl_const_513, Mem_T.INT4[j]);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 234} true;
    junk := result.addstr$11;
    assume value_is(__ctobpl_const_514, junk);
    assume value_is(__ctobpl_const_515, result.addstr$11);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 235} true;
    goto label_22_true, label_22_false;

  label_22_false:
    assume done == 0;
    assume value_is(__ctobpl_const_516, done);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 235} true;
    assert arg != 0;
    goto label_23_true, label_23_false;

  label_23_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_517, arg);
    assume value_is(__ctobpl_const_518, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_519, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_520, delim);
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 238} true;
    goto label_26_true, label_26_false;

  label_26_false:
    assume junk == 0;
    assume value_is(__ctobpl_const_521, junk);
    goto label_27;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 239} true;
    result := 0;
    assume value_is(__ctobpl_const_522, result);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 242} true;
    result.makepat$1 := result;
    assume value_is(__ctobpl_const_526, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 243} true;
    call __HAVOC_free(i);
    call __HAVOC_free(j);
    return;

  label_26_true:
    assume junk != 0;
    assume value_is(__ctobpl_const_521, junk);
    goto label_28;

  label_28:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 241} true;
    result := Mem_T.INT4[i];
    assume value_is(__ctobpl_const_523, result);
    assume value_is(__ctobpl_const_524, Mem_T.INT4[i]);
    goto label_25;

  label_23_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_517, arg);
    assume value_is(__ctobpl_const_518, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_519, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_520, delim);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 236} true;
    result := 0;
    assume value_is(__ctobpl_const_525, result);
    goto label_25;

  label_22_true:
    assume done != 0;
    assume value_is(__ctobpl_const_516, done);
    goto label_24;

  label_17_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_407, arg);
    assume value_is(__ctobpl_const_408, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_409, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_410, delim);
    goto label_29;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 203} true;
    assert arg != 0;
    goto label_29_true, label_29_false;

  label_29_false:
    assume Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] == 0;
    assume value_is(__ctobpl_const_411, arg);
    assume value_is(__ctobpl_const_412, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_413, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_18;

  label_29_true:
    assume Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] != 0;
    assume value_is(__ctobpl_const_411, arg);
    assume value_is(__ctobpl_const_412, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_413, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 204} true;
    lj := Mem_T.INT4[j];
    assume value_is(__ctobpl_const_414, lj);
    assume value_is(__ctobpl_const_415, Mem_T.INT4[j]);
    goto label_31;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 205} true;
    assert arg != 0;
    goto label_31_true, label_31_false;

  label_31_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 63);
    assume value_is(__ctobpl_const_416, arg);
    assume value_is(__ctobpl_const_417, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_418, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_32;

  label_32:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 207} true;
    assert arg != 0;
    goto label_32_true, label_32_false;

  label_32_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 37);
    assume value_is(__ctobpl_const_419, arg);
    assume value_is(__ctobpl_const_420, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_421, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_40;

  label_40:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 209} true;
    assert arg != 0;
    goto label_40_true, label_40_false;

  label_40_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 36);
    assume value_is(__ctobpl_const_424, arg);
    assume value_is(__ctobpl_const_425, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_426, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_46;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 211} true;
    assert arg != 0;
    goto label_46_true, label_46_false;

  label_46_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 91);
    assume value_is(__ctobpl_const_431, arg);
    assume value_is(__ctobpl_const_432, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_433, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_52;

  label_52:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 216} true;
    assert arg != 0;
    goto label_52_true, label_52_false;

  label_52_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 42);
    assume value_is(__ctobpl_const_434, arg);
    assume value_is(__ctobpl_const_435, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_436, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_58;

  label_58:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 226} true;
    call result.addstr$8 := addstr(99, pat, j, 100);
    assume value_is(__ctobpl_const_439, pat);
    assume value_is(__ctobpl_const_440, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_441, pat);
    assume value_is(__ctobpl_const_442, Mem_T.INT4[j]);
    goto label_72;

  label_72:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 226} true;
    junk := result.addstr$8;
    assume value_is(__ctobpl_const_443, junk);
    assume value_is(__ctobpl_const_444, result.addstr$8);
    goto label_73;

  label_73:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 227} true;
    call result.esc$9 := esc(arg, i);
    assume value_is(__ctobpl_const_445, arg);
    assume value_is(__ctobpl_const_446, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_447, arg);
    assume value_is(__ctobpl_const_448, Mem_T.INT4[i]);
    goto label_76;

  label_76:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 227} true;
    escjunk := result.esc$9;
    assume value_is(__ctobpl_const_449, escjunk);
    assume value_is(__ctobpl_const_450, result.esc$9);
    goto label_77;

  label_77:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 228} true;
    call result.addstr$10 := addstr(escjunk, pat, j, 100);
    assume value_is(__ctobpl_const_451, escjunk);
    assume value_is(__ctobpl_const_452, pat);
    assume value_is(__ctobpl_const_453, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_454, escjunk);
    assume value_is(__ctobpl_const_455, pat);
    assume value_is(__ctobpl_const_456, Mem_T.INT4[j]);
    goto label_80;

  label_80:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 228} true;
    junk := result.addstr$10;
    assume value_is(__ctobpl_const_457, junk);
    assume value_is(__ctobpl_const_458, result.addstr$10);
    goto label_37;

  label_37:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 230} true;
    lastj := lj;
    assume value_is(__ctobpl_const_505, lastj);
    assume value_is(__ctobpl_const_506, lj);
    goto label_38;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 231} true;
    goto label_38_true, label_38_false;

  label_38_false:
    assume done == 0;
    assume value_is(__ctobpl_const_507, done);
    goto label_39;

  label_39:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 232} true;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_508, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_509, Mem_T.INT4[i]);
    goto label_39_dummy;

  label_38_true:
    assume done != 0;
    assume value_is(__ctobpl_const_507, done);
    goto label_38_true_dummy;

  label_52_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 42);
    assume value_is(__ctobpl_const_434, arg);
    assume value_is(__ctobpl_const_435, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_436, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_61;

  label_61:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 216} true;
    goto label_61_true, label_61_false;

  label_61_false:
    assume !INT_LT(start, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_437, start);
    assume value_is(__ctobpl_const_438, Mem_T.INT4[i]);
    goto label_58;

  label_61_true:
    assume INT_LT(start, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_437, start);
    assume value_is(__ctobpl_const_438, Mem_T.INT4[i]);
    goto label_62;

  label_62:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 218} true;
    lj := lastj;
    assume value_is(__ctobpl_const_459, lj);
    assume value_is(__ctobpl_const_460, lastj);
    goto label_63;

  label_63:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 219} true;
    assert pat != 0;
    $in_set_2.arg.1$7$ := Mem_T.CHAR[PLUS(pat, 1, lj)];
    assume value_is(__ctobpl_const_461, $in_set_2.arg.1$7$);
    assume value_is(__ctobpl_const_462, pat);
    assume value_is(__ctobpl_const_463, lj);
    assume value_is(__ctobpl_const_464, Mem_T.CHAR[PLUS(pat, 1, lj)]);
    goto label_64;

  label_64:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 219} true;
    call result.in_set_2$6 := in_set_2($in_set_2.arg.1$7$);
    assume value_is(__ctobpl_const_465, $in_set_2.arg.1$7$);
    assume value_is(__ctobpl_const_466, $in_set_2.arg.1$7$);
    goto label_67;

  label_67:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 219} true;
    goto label_67_true, label_67_false;

  label_67_false:
    assume result.in_set_2$6 == 0;
    assume value_is(__ctobpl_const_467, result.in_set_2$6);
    goto label_68;

  label_68:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 222} true;
    call stclose(pat, j, lastj);
    assume value_is(__ctobpl_const_468, pat);
    assume value_is(__ctobpl_const_469, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_470, lastj);
    assume value_is(__ctobpl_const_471, pat);
    assume value_is(__ctobpl_const_472, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_473, lastj);
    goto label_37;

  label_67_true:
    assume result.in_set_2$6 != 0;
    assume value_is(__ctobpl_const_467, result.in_set_2$6);
    goto label_71;

  label_71:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 220} true;
    done := 1;
    assume value_is(__ctobpl_const_474, done);
    goto label_37;

  label_46_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 91);
    assume value_is(__ctobpl_const_431, arg);
    assume value_is(__ctobpl_const_432, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_433, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_53;

  label_53:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 213} true;
    call result.getccl$5 := getccl(arg, i, pat, j);
    assume value_is(__ctobpl_const_475, arg);
    assume value_is(__ctobpl_const_476, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_477, pat);
    assume value_is(__ctobpl_const_478, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_479, arg);
    assume value_is(__ctobpl_const_480, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_481, pat);
    assume value_is(__ctobpl_const_482, Mem_T.INT4[j]);
    goto label_56;

  label_56:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 213} true;
    getres := result.getccl$5;
    assume value_is(__ctobpl_const_483, getres);
    assume value_is(__ctobpl_const_484, result.getccl$5);
    goto label_57;

  label_57:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 214} true;
    done := LIFT(INT_EQ(getres, 0));
    assume value_is(__ctobpl_const_485, done);
    assume value_is(__ctobpl_const_486, getres);
    goto label_37;

  label_40_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 36);
    assume value_is(__ctobpl_const_424, arg);
    assume value_is(__ctobpl_const_425, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_426, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_47;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 209} true;
    assert arg != 0;
    goto label_47_true, label_47_false;

  label_47_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))], delim);
    assume value_is(__ctobpl_const_427, arg);
    assume value_is(__ctobpl_const_428, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_429, Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_430, delim);
    goto label_46;

  label_47_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))], delim);
    assume value_is(__ctobpl_const_427, arg);
    assume value_is(__ctobpl_const_428, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_429, Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
    assume value_is(__ctobpl_const_430, delim);
    goto label_48;

  label_48:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 210} true;
    call result.addstr$4 := addstr(36, pat, j, 100);
    assume value_is(__ctobpl_const_487, pat);
    assume value_is(__ctobpl_const_488, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_489, pat);
    assume value_is(__ctobpl_const_490, Mem_T.INT4[j]);
    goto label_51;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 210} true;
    junk := result.addstr$4;
    assume value_is(__ctobpl_const_491, junk);
    assume value_is(__ctobpl_const_492, result.addstr$4);
    goto label_37;

  label_32_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 37);
    assume value_is(__ctobpl_const_419, arg);
    assume value_is(__ctobpl_const_420, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_421, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_41;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 207} true;
    goto label_41_true, label_41_false;

  label_41_false:
    assume !INT_EQ(Mem_T.INT4[i], start);
    assume value_is(__ctobpl_const_422, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_423, start);
    goto label_40;

  label_41_true:
    assume INT_EQ(Mem_T.INT4[i], start);
    assume value_is(__ctobpl_const_422, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_423, start);
    goto label_42;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 208} true;
    call result.addstr$3 := addstr(37, pat, j, 100);
    assume value_is(__ctobpl_const_493, pat);
    assume value_is(__ctobpl_const_494, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_495, pat);
    assume value_is(__ctobpl_const_496, Mem_T.INT4[j]);
    goto label_45;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 208} true;
    junk := result.addstr$3;
    assume value_is(__ctobpl_const_497, junk);
    assume value_is(__ctobpl_const_498, result.addstr$3);
    goto label_37;

  label_31_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 63);
    assume value_is(__ctobpl_const_416, arg);
    assume value_is(__ctobpl_const_417, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_418, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_33;

  label_33:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 206} true;
    call result.addstr$2 := addstr(63, pat, j, 100);
    assume value_is(__ctobpl_const_499, pat);
    assume value_is(__ctobpl_const_500, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_501, pat);
    assume value_is(__ctobpl_const_502, Mem_T.INT4[j]);
    goto label_36;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 206} true;
    junk := result.addstr$2;
    assume value_is(__ctobpl_const_503, junk);
    assume value_is(__ctobpl_const_504, result.addstr$2);
    goto label_37;

  label_16_true:
    assume done != 0;
    assume value_is(__ctobpl_const_406, done);
    goto label_18;

  label_39_dummy:
    assume false;
    return;

  label_38_true_dummy:
    assume false;
    return;

  label_16_head_last:
    goto label_16_true, label_16_false;
}



procedure {:extern} makesub(arg.__1: int, from.__1: int, delim.__1: int, sub.__1: int)
   returns (result.makesub$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} makesub(arg.__1: int, from.__1: int, delim.__1: int, sub.__1: int)
   returns (result.makesub$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} arg: int;
  var {:extern} delim: int;
  var {:extern} escjunk: int;
  var {:extern} from: int;
  var {:extern} i: int;
  var {:extern} j: int;
  var {:extern} junk: int;
  var {:extern} result: int;
  var {:extern} result.addstr$2: int;
  var {:extern} result.addstr$4: int;
  var {:extern} result.addstr$5: int;
  var {:extern} result.esc$3: int;
  var {:extern} sub: int;
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
    assume INT_LT(arg.__1, alloc);
    assume INT_LT(sub.__1, alloc);
    arg := 0;
    delim := 0;
    escjunk := 0;
    from := 0;
    call i := __HAVOC_det_malloc(4);
    call j := __HAVOC_det_malloc(4);
    junk := 0;
    result := 0;
    result.addstr$2 := 0;
    result.addstr$4 := 0;
    result.addstr$5 := 0;
    result.esc$3 := 0;
    result.makesub$1 := 0;
    sub := 0;
    arg := arg.__1;
    from := from.__1;
    delim := delim.__1;
    sub := sub.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 263} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 264} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 264} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 265} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 266} true;
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 268} true;
    Mem_T.INT4 := Mem_T.INT4[j := 0];
    assume value_is(__ctobpl_const_527, Mem_T.INT4[j]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 269} true;
    Mem_T.INT4 := Mem_T.INT4[i := from];
    assume value_is(__ctobpl_const_528, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_529, from);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 270} true;
    goto label_10_head;

  label_10_head:
    call escjunk, junk, result.addstr$2, result.addstr$4, result.esc$3 := makesub_loop_label_10_head(arg, delim, escjunk, i, j, junk, result.addstr$2, result.addstr$4, result.esc$3, sub);
    goto label_10_head_last;

  label_10_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_530, arg);
    assume value_is(__ctobpl_const_531, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_532, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_533, delim);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 279} true;
    assert arg != 0;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_537, arg);
    assume value_is(__ctobpl_const_538, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_539, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_540, delim);
    goto label_27;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 282} true;
    assert sub != 0;
    assert sub != 0;
    call result.addstr$5 := addstr(0, sub, j, 100);
    assume value_is(__ctobpl_const_541, sub);
    assume value_is(__ctobpl_const_542, Mem_T.CHAR[sub]);
    assume value_is(__ctobpl_const_543, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_544, sub);
    assume value_is(__ctobpl_const_545, Mem_T.CHAR[sub]);
    assume value_is(__ctobpl_const_546, Mem_T.INT4[j]);
    goto label_32;

  label_32:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 282} true;
    junk := result.addstr$5;
    assume value_is(__ctobpl_const_547, junk);
    assume value_is(__ctobpl_const_548, result.addstr$5);
    goto label_33;

  label_33:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 283} true;
    goto label_33_true, label_33_false;

  label_33_false:
    assume junk == 0;
    assume value_is(__ctobpl_const_549, junk);
    goto label_34;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 284} true;
    result := 0;
    assume value_is(__ctobpl_const_550, result);
    goto label_31;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 288} true;
    result.makesub$1 := result;
    assume value_is(__ctobpl_const_554, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 289} true;
    call __HAVOC_free(i);
    call __HAVOC_free(j);
    return;

  label_33_true:
    assume junk != 0;
    assume value_is(__ctobpl_const_549, junk);
    goto label_35;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 286} true;
    result := Mem_T.INT4[i];
    assume value_is(__ctobpl_const_551, result);
    assume value_is(__ctobpl_const_552, Mem_T.INT4[i]);
    goto label_31;

  label_11_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_537, arg);
    assume value_is(__ctobpl_const_538, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_539, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_540, delim);
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 280} true;
    result := 0;
    assume value_is(__ctobpl_const_553, result);
    goto label_31;

  label_10_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim);
    assume value_is(__ctobpl_const_530, arg);
    assume value_is(__ctobpl_const_531, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_532, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_533, delim);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 270} true;
    assert arg != 0;
    goto label_12_true, label_12_false;

  label_12_false:
    assume Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] == 0;
    assume value_is(__ctobpl_const_534, arg);
    assume value_is(__ctobpl_const_535, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_536, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_11;

  label_12_true:
    assume Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] != 0;
    assume value_is(__ctobpl_const_534, arg);
    assume value_is(__ctobpl_const_535, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_536, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 271} true;
    assert arg != 0;
    goto label_13_true, label_13_false;

  label_13_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 38);
    assume value_is(__ctobpl_const_555, arg);
    assume value_is(__ctobpl_const_556, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_557, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 274} true;
    call result.esc$3 := esc(arg, i);
    assume value_is(__ctobpl_const_558, arg);
    assume value_is(__ctobpl_const_559, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_560, arg);
    assume value_is(__ctobpl_const_561, Mem_T.INT4[i]);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 274} true;
    escjunk := result.esc$3;
    assume value_is(__ctobpl_const_562, escjunk);
    assume value_is(__ctobpl_const_563, result.esc$3);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 275} true;
    call result.addstr$4 := addstr(escjunk, sub, j, 100);
    assume value_is(__ctobpl_const_564, escjunk);
    assume value_is(__ctobpl_const_565, sub);
    assume value_is(__ctobpl_const_566, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_567, escjunk);
    assume value_is(__ctobpl_const_568, sub);
    assume value_is(__ctobpl_const_569, Mem_T.INT4[j]);
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 275} true;
    junk := result.addstr$4;
    assume value_is(__ctobpl_const_570, junk);
    assume value_is(__ctobpl_const_571, result.addstr$4);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 277} true;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
    assume value_is(__ctobpl_const_578, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_579, Mem_T.INT4[i]);
    goto label_21_dummy;

  label_13_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 38);
    assume value_is(__ctobpl_const_555, arg);
    assume value_is(__ctobpl_const_556, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_557, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
    goto label_17;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 272} true;
    call result.addstr$2 := addstr(-1, sub, j, 100);
    assume value_is(__ctobpl_const_572, sub);
    assume value_is(__ctobpl_const_573, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_574, sub);
    assume value_is(__ctobpl_const_575, Mem_T.INT4[j]);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 272} true;
    junk := result.addstr$2;
    assume value_is(__ctobpl_const_576, junk);
    assume value_is(__ctobpl_const_577, result.addstr$2);
    goto label_21;

  label_21_dummy:
    assume false;
    return;

  label_10_head_last:
    assert arg != 0;
    goto label_10_true, label_10_false;
}



procedure {:extern} omatch(lin.__1: int, i.__1: int, pat.__1: int, j.__1: int)
   returns (result.omatch$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} omatch(lin.__1: int, i.__1: int, pat.__1: int, j.__1: int)
   returns (result.omatch$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Caseerror.arg.1$14$: int;
  var {:extern} advance: int;
  var {:extern} $fprintf.arg.1$6$: int;
  var {:extern} i: int;
  var {:extern} $in_pat_set.arg.1$3$: int;
  var {:extern} j: int;
  var {:extern} lin: int;
  var {:extern} $locate.arg.1$10$: int;
  var {:extern} $locate.arg.1$13$: int;
  var {:extern} $locate.arg.3$12$: int;
  var {:extern} $locate.arg.3$9$: int;
  var {:extern} pat: int;
  var {:extern} result: int;
  var {:extern} result.__iob_func$5: int;
  var {:extern} result.abort$7: int;
  var {:extern} result.fprintf$4: int;
  var {:extern} result.in_pat_set$2: int;
  var {:extern} result.locate$8: int;
  var {:extern} result.locate$11: int;
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
    assume INT_LT(lin.__1, alloc);
    assume INT_LT(i.__1, alloc);
    assume INT_LT(pat.__1, alloc);
    $Caseerror.arg.1$14$ := 0;
    advance := 0;
    $fprintf.arg.1$6$ := 0;
    i := 0;
    $in_pat_set.arg.1$3$ := 0;
    j := 0;
    lin := 0;
    $locate.arg.1$10$ := 0;
    $locate.arg.1$13$ := 0;
    $locate.arg.3$12$ := 0;
    $locate.arg.3$9$ := 0;
    pat := 0;
    result := 0;
    result.__iob_func$5 := 0;
    result.abort$7 := 0;
    result.fprintf$4 := 0;
    result.in_pat_set$2 := 0;
    result.locate$8 := 0;
    result.locate$11 := 0;
    result.omatch$1 := 0;
    lin := lin.__1;
    i := i.__1;
    pat := pat.__1;
    j := j.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 333} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 334} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 336} true;
    advance := -1;
    assume value_is(__ctobpl_const_580, advance);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 337} true;
    assert i != 0;
    assert lin != 0;
    goto label_6_true, label_6_false;

  label_6_false:
    assume Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] == 0;
    assume value_is(__ctobpl_const_581, lin);
    assume value_is(__ctobpl_const_582, i);
    assume value_is(__ctobpl_const_583, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_584, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 338} true;
    result := 0;
    assume value_is(__ctobpl_const_585, result);
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 378} true;
    goto label_26_true, label_26_false;

  label_26_false:
    assume !INT_LEQ(0, advance);
    assume value_is(__ctobpl_const_659, advance);
    goto label_27;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 383} true;
    result := 0;
    assume value_is(__ctobpl_const_660, result);
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 384} true;
    result.omatch$1 := result;
    assume value_is(__ctobpl_const_667, result);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 385} true;
    return;

  label_26_true:
    assume INT_LEQ(0, advance);
    assume value_is(__ctobpl_const_659, advance);
    goto label_28;

  label_28:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 380} true;
    assert i != 0;
    assert i != 0;
    Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, advance)];
    assume value_is(__ctobpl_const_661, i);
    assume value_is(__ctobpl_const_662, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_663, i);
    assume value_is(__ctobpl_const_664, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_665, advance);
    goto label_29;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 381} true;
    result := 1;
    assume value_is(__ctobpl_const_666, result);
    goto label_30;

  label_6_true:
    assume Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] != 0;
    assume value_is(__ctobpl_const_581, lin);
    assume value_is(__ctobpl_const_582, i);
    assume value_is(__ctobpl_const_583, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_584, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 341} true;
    assert pat != 0;
    $in_pat_set.arg.1$3$ := Mem_T.CHAR[PLUS(pat, 1, j)];
    assume value_is(__ctobpl_const_586, $in_pat_set.arg.1$3$);
    assume value_is(__ctobpl_const_587, pat);
    assume value_is(__ctobpl_const_588, j);
    assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 341} true;
    call result.in_pat_set$2 := in_pat_set($in_pat_set.arg.1$3$);
    assume value_is(__ctobpl_const_590, $in_pat_set.arg.1$3$);
    assume value_is(__ctobpl_const_591, $in_pat_set.arg.1$3$);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 341} true;
    goto label_12_true, label_12_false;

  label_12_false:
    assume result.in_pat_set$2 == 0;
    assume value_is(__ctobpl_const_592, result.in_pat_set$2);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 343} true;
    call result.__iob_func$5 := __iob_func();
    goto label_55;

  label_55:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 343} true;
    assert result.__iob_func$5 != 0;
    $fprintf.arg.1$6$ := PLUS(result.__iob_func$5, 32, 1);
    assume value_is(__ctobpl_const_593, $fprintf.arg.1$6$);
    assume value_is(__ctobpl_const_594, result.__iob_func$5);
    goto label_56;

  label_56:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 343} true;
    call result.fprintf$4 := det_choice();
    goto label_59;

  label_59:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 344} true;
    call result.abort$7 := abort();
    return;

  label_12_true:
    assume result.in_pat_set$2 != 0;
    assume value_is(__ctobpl_const_592, result.in_pat_set$2);
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 347} true;
    assert pat != 0;
    goto label_16_case_0, label_16_case_1, label_16_case_2, label_16_case_3, label_16_case_4, label_16_case_5, label_16_case_6;

  label_16_case_6:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 99);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 350} true;
    assert i != 0;
    assert lin != 0;
    assert pat != 0;
    goto label_23_true, label_23_false;

  label_23_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]);
    assume value_is(__ctobpl_const_651, lin);
    assume value_is(__ctobpl_const_652, i);
    assume value_is(__ctobpl_const_653, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_654, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_655, pat);
    assume value_is(__ctobpl_const_656, j);
    assume value_is(__ctobpl_const_657, Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 352} true;
    goto label_26;

  label_23_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]);
    assume value_is(__ctobpl_const_651, lin);
    assume value_is(__ctobpl_const_652, i);
    assume value_is(__ctobpl_const_653, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_654, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    assume value_is(__ctobpl_const_655, pat);
    assume value_is(__ctobpl_const_656, j);
    assume value_is(__ctobpl_const_657, Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 351} true;
    advance := 1;
    assume value_is(__ctobpl_const_658, advance);
    goto label_24;

  label_16_case_5:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 91);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 366} true;
    $locate.arg.3$9$ := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_636, $locate.arg.3$9$);
    assume value_is(__ctobpl_const_637, j);
    goto label_31;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 366} true;
    assert i != 0;
    assert lin != 0;
    $locate.arg.1$10$ := Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])];
    assume value_is(__ctobpl_const_638, $locate.arg.1$10$);
    assume value_is(__ctobpl_const_639, lin);
    assume value_is(__ctobpl_const_640, i);
    assume value_is(__ctobpl_const_641, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_642, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_32;

  label_32:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 366} true;
    call result.locate$8 := locate($locate.arg.1$10$, pat, $locate.arg.3$9$);
    assume value_is(__ctobpl_const_643, $locate.arg.1$10$);
    assume value_is(__ctobpl_const_644, pat);
    assume value_is(__ctobpl_const_645, $locate.arg.3$9$);
    assume value_is(__ctobpl_const_646, $locate.arg.1$10$);
    assume value_is(__ctobpl_const_647, pat);
    assume value_is(__ctobpl_const_648, $locate.arg.3$9$);
    goto label_35;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 366} true;
    goto label_35_true, label_35_false;

  label_35_false:
    assume result.locate$8 == 0;
    assume value_is(__ctobpl_const_649, result.locate$8);
    goto label_36;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 368} true;
    goto label_26;

  label_35_true:
    assume result.locate$8 != 0;
    assume value_is(__ctobpl_const_649, result.locate$8);
    goto label_37;

  label_37:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 367} true;
    advance := 1;
    assume value_is(__ctobpl_const_650, advance);
    goto label_36;

  label_16_case_4:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 63);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 358} true;
    assert i != 0;
    assert lin != 0;
    goto label_21_true, label_21_false;

  label_21_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10);
    assume value_is(__ctobpl_const_631, lin);
    assume value_is(__ctobpl_const_632, i);
    assume value_is(__ctobpl_const_633, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_634, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_38;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 360} true;
    goto label_26;

  label_21_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10);
    assume value_is(__ctobpl_const_631, lin);
    assume value_is(__ctobpl_const_632, i);
    assume value_is(__ctobpl_const_633, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_634, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_39;

  label_39:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 359} true;
    advance := 1;
    assume value_is(__ctobpl_const_635, advance);
    goto label_38;

  label_16_case_3:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 37);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 354} true;
    assert i != 0;
    goto label_20_true, label_20_false;

  label_20_false:
    assume Mem_T.INT4[i] == 0;
    assume value_is(__ctobpl_const_628, i);
    assume value_is(__ctobpl_const_629, Mem_T.INT4[i]);
    goto label_40;

  label_40:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 355} true;
    advance := 0;
    assume value_is(__ctobpl_const_630, advance);
    goto label_41;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 356} true;
    goto label_26;

  label_20_true:
    assume Mem_T.INT4[i] != 0;
    assume value_is(__ctobpl_const_628, i);
    assume value_is(__ctobpl_const_629, Mem_T.INT4[i]);
    goto label_41;

  label_16_case_2:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 36);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 362} true;
    assert i != 0;
    assert lin != 0;
    goto label_19_true, label_19_false;

  label_19_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10);
    assume value_is(__ctobpl_const_623, lin);
    assume value_is(__ctobpl_const_624, i);
    assume value_is(__ctobpl_const_625, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_626, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_42;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 364} true;
    goto label_26;

  label_19_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10);
    assume value_is(__ctobpl_const_623, lin);
    assume value_is(__ctobpl_const_624, i);
    assume value_is(__ctobpl_const_625, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_626, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_43;

  label_43:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 363} true;
    advance := 0;
    assume value_is(__ctobpl_const_627, advance);
    goto label_42;

  label_16_case_1:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 33);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 370} true;
    assert i != 0;
    assert lin != 0;
    goto label_18_true, label_18_false;

  label_18_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10);
    assume value_is(__ctobpl_const_604, lin);
    assume value_is(__ctobpl_const_605, i);
    assume value_is(__ctobpl_const_606, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_607, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_44;

  label_44:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 372} true;
    goto label_26;

  label_18_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10);
    assume value_is(__ctobpl_const_604, lin);
    assume value_is(__ctobpl_const_605, i);
    assume value_is(__ctobpl_const_606, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_607, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_45;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 370} true;
    $locate.arg.3$12$ := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_608, $locate.arg.3$12$);
    assume value_is(__ctobpl_const_609, j);
    goto label_46;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 370} true;
    assert i != 0;
    assert lin != 0;
    $locate.arg.1$13$ := Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])];
    assume value_is(__ctobpl_const_610, $locate.arg.1$13$);
    assume value_is(__ctobpl_const_611, lin);
    assume value_is(__ctobpl_const_612, i);
    assume value_is(__ctobpl_const_613, Mem_T.INT4[i]);
    assume value_is(__ctobpl_const_614, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
    goto label_47;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 370} true;
    call result.locate$11 := locate($locate.arg.1$13$, pat, $locate.arg.3$12$);
    assume value_is(__ctobpl_const_615, $locate.arg.1$13$);
    assume value_is(__ctobpl_const_616, pat);
    assume value_is(__ctobpl_const_617, $locate.arg.3$12$);
    assume value_is(__ctobpl_const_618, $locate.arg.1$13$);
    assume value_is(__ctobpl_const_619, pat);
    assume value_is(__ctobpl_const_620, $locate.arg.3$12$);
    goto label_50;

  label_50:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 370} true;
    goto label_50_true, label_50_false;

  label_50_false:
    assume result.locate$11 == 0;
    assume value_is(__ctobpl_const_621, result.locate$11);
    goto label_51;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 371} true;
    advance := 1;
    assume value_is(__ctobpl_const_622, advance);
    goto label_44;

  label_50_true:
    assume result.locate$11 != 0;
    assume value_is(__ctobpl_const_621, result.locate$11);
    goto label_44;

  label_16_case_0:
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 33);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 36);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 37);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 63);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 91);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 99);
    assume value_is(__ctobpl_const_595, pat);
    assume value_is(__ctobpl_const_596, j);
    assume value_is(__ctobpl_const_597, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_17;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 374} true;
    assert pat != 0;
    $Caseerror.arg.1$14$ := Mem_T.CHAR[PLUS(pat, 1, j)];
    assume value_is(__ctobpl_const_598, $Caseerror.arg.1$14$);
    assume value_is(__ctobpl_const_599, pat);
    assume value_is(__ctobpl_const_600, j);
    assume value_is(__ctobpl_const_601, Mem_T.CHAR[PLUS(pat, 1, j)]);
    goto label_52;

  label_52:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 374} true;
    call Caseerror($Caseerror.arg.1$14$);
    assume value_is(__ctobpl_const_602, $Caseerror.arg.1$14$);
    assume value_is(__ctobpl_const_603, $Caseerror.arg.1$14$);
    goto label_26;
}



procedure {:extern} patsize(pat.__1: int, n.__1: int) returns (result.patsize$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} patsize(pat.__1: int, n.__1: int) returns (result.patsize$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Caseerror.arg.1$8$: int;
  var {:extern} $fprintf.arg.1$6$: int;
  var {:extern} $in_pat_set.arg.1$3$: int;
  var {:extern} n: int;
  var {:extern} pat: int;
  var {:extern} result.__iob_func$5: int;
  var {:extern} result.abort$7: int;
  var {:extern} result.fprintf$4: int;
  var {:extern} result.in_pat_set$2: int;
  var {:extern} size: int;
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
    assume INT_LT(pat.__1, alloc);
    $Caseerror.arg.1$8$ := 0;
    $fprintf.arg.1$6$ := 0;
    $in_pat_set.arg.1$3$ := 0;
    n := 0;
    pat := 0;
    result.__iob_func$5 := 0;
    result.abort$7 := 0;
    result.fprintf$4 := 0;
    result.in_pat_set$2 := 0;
    result.patsize$1 := 0;
    size := 0;
    pat := pat.__1;
    n := n.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 392} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 393} true;
    assert pat != 0;
    $in_pat_set.arg.1$3$ := Mem_T.CHAR[PLUS(pat, 1, n)];
    assume value_is(__ctobpl_const_668, $in_pat_set.arg.1$3$);
    assume value_is(__ctobpl_const_669, pat);
    assume value_is(__ctobpl_const_670, n);
    assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 393} true;
    call result.in_pat_set$2 := in_pat_set($in_pat_set.arg.1$3$);
    assume value_is(__ctobpl_const_672, $in_pat_set.arg.1$3$);
    assume value_is(__ctobpl_const_673, $in_pat_set.arg.1$3$);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 393} true;
    goto label_8_true, label_8_false;

  label_8_false:
    assume result.in_pat_set$2 == 0;
    assume value_is(__ctobpl_const_674, result.in_pat_set$2);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 394} true;
    call result.__iob_func$5 := __iob_func();
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 394} true;
    assert result.__iob_func$5 != 0;
    $fprintf.arg.1$6$ := PLUS(result.__iob_func$5, 32, 1);
    assume value_is(__ctobpl_const_675, $fprintf.arg.1$6$);
    assume value_is(__ctobpl_const_676, result.__iob_func$5);
    goto label_27;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 394} true;
    call result.fprintf$4 := det_choice();
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 395} true;
    call result.abort$7 := abort();
    return;

  label_8_true:
    assume result.in_pat_set$2 != 0;
    assume value_is(__ctobpl_const_674, result.in_pat_set$2);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 397} true;
    assert pat != 0;
    goto label_12_case_0, label_12_case_1, label_12_case_2, label_12_case_3, label_12_case_4, label_12_case_5, label_12_case_6, label_12_case_7;

  label_12_case_7:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 99);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_17;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 399} true;
    size := 2;
    assume value_is(__ctobpl_const_692, size);
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 399} true;
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 413} true;
    result.patsize$1 := size;
    assume value_is(__ctobpl_const_693, size);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 414} true;
    return;

  label_12_case_6:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 91);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 405} true;
    assert pat != 0;
    size := PLUS(Mem_T.CHAR[PLUS(pat, 1, PLUS(n, 1, 1))], 1, 2);
    assume value_is(__ctobpl_const_688, size);
    assume value_is(__ctobpl_const_689, pat);
    assume value_is(__ctobpl_const_690, n);
    assume value_is(__ctobpl_const_691, Mem_T.CHAR[PLUS(pat, 1, PLUS(n, 1, 1))]);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 406} true;
    goto label_19;

  label_12_case_5:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 63);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 402} true;
    size := 1;
    assume value_is(__ctobpl_const_687, size);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 403} true;
    goto label_19;

  label_12_case_4:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 42);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 408} true;
    size := 1;
    assume value_is(__ctobpl_const_686, size);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 409} true;
    goto label_19;

  label_12_case_3:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 37);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_15;

  label_12_case_2:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 36);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_15;

  label_12_case_1:
    assume INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 33);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_14;

  label_12_case_0:
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 33);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 36);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 37);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 42);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 63);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 91);
    assume INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 99);
    assume value_is(__ctobpl_const_677, pat);
    assume value_is(__ctobpl_const_678, n);
    assume value_is(__ctobpl_const_679, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 411} true;
    assert pat != 0;
    $Caseerror.arg.1$8$ := Mem_T.CHAR[PLUS(pat, 1, n)];
    assume value_is(__ctobpl_const_680, $Caseerror.arg.1$8$);
    assume value_is(__ctobpl_const_681, pat);
    assume value_is(__ctobpl_const_682, n);
    assume value_is(__ctobpl_const_683, Mem_T.CHAR[PLUS(pat, 1, n)]);
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 411} true;
    call Caseerror($Caseerror.arg.1$8$);
    assume value_is(__ctobpl_const_684, $Caseerror.arg.1$8$);
    assume value_is(__ctobpl_const_685, $Caseerror.arg.1$8$);
    goto label_19;
}



procedure {:extern} putsub(lin.__1: int, s1.__1: int, s2.__1: int, sub.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} putsub(lin.__1: int, s1.__1: int, s2.__1: int, sub.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $fputc.arg.1$4$: int;
  var {:extern} $fputc.arg.1$8$: int;
  var {:extern} $fputc.arg.2$3$: int;
  var {:extern} $fputc.arg.2$7$: int;
  var {:extern} i: int;
  var {:extern} j: int;
  var {:extern} lin: int;
  var {:extern} result.__iob_func$2: int;
  var {:extern} result.__iob_func$6: int;
  var {:extern} result.fputc$1: int;
  var {:extern} result.fputc$5: int;
  var {:extern} s1: int;
  var {:extern} s2: int;
  var {:extern} sub: int;
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
    assume INT_LT(lin.__1, alloc);
    assume INT_LT(sub.__1, alloc);
    $fputc.arg.1$4$ := 0;
    $fputc.arg.1$8$ := 0;
    $fputc.arg.2$3$ := 0;
    $fputc.arg.2$7$ := 0;
    i := 0;
    j := 0;
    lin := 0;
    result.__iob_func$2 := 0;
    result.__iob_func$6 := 0;
    result.fputc$1 := 0;
    result.fputc$5 := 0;
    s1 := 0;
    s2 := 0;
    sub := 0;
    lin := lin.__1;
    s1 := s1.__1;
    s2 := s2.__1;
    sub := sub.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 463} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 464} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 466} true;
    i := 0;
    assume value_is(__ctobpl_const_694, i);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 467} true;
    goto label_6_head;

  label_6_head:
    call $fputc.arg.1$4$, $fputc.arg.1$8$, $fputc.arg.2$3$, $fputc.arg.2$7$, i, j, result.__iob_func$2, result.__iob_func$6, result.fputc$1, result.fputc$5 := putsub_loop_label_6_head($fputc.arg.1$4$, $fputc.arg.1$8$, $fputc.arg.2$3$, $fputc.arg.2$7$, i, j, lin, result.__iob_func$2, result.__iob_func$6, result.fputc$1, result.fputc$5, s1, s2, sub);
    goto label_6_head_last;

  label_6_false:
    assume Mem_T.CHAR[PLUS(sub, 1, i)] == 0;
    assume value_is(__ctobpl_const_695, sub);
    assume value_is(__ctobpl_const_696, i);
    assume value_is(__ctobpl_const_697, Mem_T.CHAR[PLUS(sub, 1, i)]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 479} true;
    return;

  label_6_true:
    assume Mem_T.CHAR[PLUS(sub, 1, i)] != 0;
    assume value_is(__ctobpl_const_695, sub);
    assume value_is(__ctobpl_const_696, i);
    assume value_is(__ctobpl_const_697, Mem_T.CHAR[PLUS(sub, 1, i)]);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 468} true;
    assert sub != 0;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(sub, 1, i)], -1);
    assume value_is(__ctobpl_const_698, sub);
    assume value_is(__ctobpl_const_699, i);
    assume value_is(__ctobpl_const_700, Mem_T.CHAR[PLUS(sub, 1, i)]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    call result.__iob_func$6 := __iob_func();
    goto label_23;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    assert result.__iob_func$6 != 0;
    $fputc.arg.2$7$ := PLUS(result.__iob_func$6, 32, 1);
    assume value_is(__ctobpl_const_701, $fputc.arg.2$7$);
    assume value_is(__ctobpl_const_702, result.__iob_func$6);
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    assert sub != 0;
    $fputc.arg.1$8$ := Mem_T.CHAR[PLUS(sub, 1, i)];
    assume value_is(__ctobpl_const_703, $fputc.arg.1$8$);
    assume value_is(__ctobpl_const_704, sub);
    assume value_is(__ctobpl_const_705, i);
    assume value_is(__ctobpl_const_706, Mem_T.CHAR[PLUS(sub, 1, i)]);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    call result.fputc$5 := fputc($fputc.arg.1$8$, $fputc.arg.2$7$);
    assume value_is(__ctobpl_const_707, $fputc.arg.1$8$);
    assume value_is(__ctobpl_const_708, $fputc.arg.2$7$);
    assume value_is(__ctobpl_const_709, $fputc.arg.1$8$);
    assume value_is(__ctobpl_const_710, $fputc.arg.2$7$);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 477} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_715, i);
    assume value_is(__ctobpl_const_716, i);
    goto label_13_dummy;

  label_7_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(sub, 1, i)], -1);
    assume value_is(__ctobpl_const_698, sub);
    assume value_is(__ctobpl_const_699, i);
    assume value_is(__ctobpl_const_700, Mem_T.CHAR[PLUS(sub, 1, i)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    j := s1;
    assume value_is(__ctobpl_const_711, j);
    assume value_is(__ctobpl_const_712, s1);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    goto label_12_head;

  label_12_head:
    call $fputc.arg.1$4$, $fputc.arg.2$3$, j, result.__iob_func$2, result.fputc$1 := putsub_loop_label_12_head($fputc.arg.1$4$, $fputc.arg.2$3$, j, lin, result.__iob_func$2, result.fputc$1, s2);
    goto label_12_head_last;

  label_12_false:
    assume !INT_LT(j, s2);
    assume value_is(__ctobpl_const_713, j);
    assume value_is(__ctobpl_const_714, s2);
    goto label_13;

  label_12_true:
    assume INT_LT(j, s2);
    assume value_is(__ctobpl_const_713, j);
    assume value_is(__ctobpl_const_714, s2);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    call result.__iob_func$2 := __iob_func();
    goto label_17;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    assert result.__iob_func$2 != 0;
    $fputc.arg.2$3$ := PLUS(result.__iob_func$2, 32, 1);
    assume value_is(__ctobpl_const_717, $fputc.arg.2$3$);
    assume value_is(__ctobpl_const_718, result.__iob_func$2);
    goto label_18;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    assert lin != 0;
    $fputc.arg.1$4$ := Mem_T.CHAR[PLUS(lin, 1, j)];
    assume value_is(__ctobpl_const_719, $fputc.arg.1$4$);
    assume value_is(__ctobpl_const_720, lin);
    assume value_is(__ctobpl_const_721, j);
    assume value_is(__ctobpl_const_722, Mem_T.CHAR[PLUS(lin, 1, j)]);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    call result.fputc$1 := fputc($fputc.arg.1$4$, $fputc.arg.2$3$);
    assume value_is(__ctobpl_const_723, $fputc.arg.1$4$);
    assume value_is(__ctobpl_const_724, $fputc.arg.2$3$);
    assume value_is(__ctobpl_const_725, $fputc.arg.1$4$);
    assume value_is(__ctobpl_const_726, $fputc.arg.2$3$);
    goto label_22;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    assume value_is(__ctobpl_const_727, j);
    j := PLUS(j, 1, 1);
    goto label_22_dummy;

  label_22_dummy:
    assume false;
    return;

  label_12_head_last:
    goto label_12_true, label_12_false;

  label_13_dummy:
    assume false;
    return;

  label_6_head_last:
    assert sub != 0;
    goto label_6_true, label_6_false;
}



procedure {:extern} stclose(pat.__1: int, j.__1: int, lastj.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} stclose(pat.__1: int, j.__1: int, lastj.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $addstr.arg.1$2$: int;
  var {:extern} j: int;
  var {:extern} jp: int;
  var {:extern} jt: int;
  var {:extern} junk: int;
  var {:extern} lastj: int;
  var {:extern} pat: int;
  var {:extern} result.addstr$1: int;
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
    assume INT_LT(pat.__1, alloc);
    assume INT_LT(j.__1, alloc);
    $addstr.arg.1$2$ := 0;
    j := 0;
    jp := 0;
    call jt := __HAVOC_det_malloc(4);
    junk := 0;
    lastj := 0;
    pat := 0;
    result.addstr$1 := 0;
    pat := pat.__1;
    j := j.__1;
    lastj := lastj.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 159} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 160} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 161} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 164} true;
    assert j != 0;
    jp := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[j], 1, 1);
    assume value_is(__ctobpl_const_728, jp);
    assume value_is(__ctobpl_const_729, j);
    assume value_is(__ctobpl_const_730, Mem_T.INT4[j]);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 164} true;
    goto label_7_head;

  label_7_head:
    call $addstr.arg.1$2$, jp, junk, result.addstr$1 := stclose_loop_label_7_head($addstr.arg.1$2$, jp, jt, junk, lastj, pat, result.addstr$1);
    goto label_7_head_last;

  label_7_false:
    assume !INT_LEQ(lastj, jp);
    assume value_is(__ctobpl_const_731, lastj);
    assume value_is(__ctobpl_const_732, jp);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 169} true;
    assert j != 0;
    assert j != 0;
    Mem_T.INT4 := Mem_T.INT4[j := PLUS(Mem_T.INT4[j], 1, 1)];
    assume value_is(__ctobpl_const_733, j);
    assume value_is(__ctobpl_const_734, Mem_T.INT4[j]);
    assume value_is(__ctobpl_const_735, j);
    assume value_is(__ctobpl_const_736, Mem_T.INT4[j]);
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 170} true;
    assert pat != 0;
    Mem_T.CHAR := Mem_T.CHAR[PLUS(pat, 1, lastj) := 42];
    assume value_is(__ctobpl_const_737, pat);
    assume value_is(__ctobpl_const_738, lastj);
    assume value_is(__ctobpl_const_739, Mem_T.CHAR[PLUS(pat, 1, lastj)]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 171} true;
    call __HAVOC_free(jt);
    return;

  label_7_true:
    assume INT_LEQ(lastj, jp);
    assume value_is(__ctobpl_const_731, lastj);
    assume value_is(__ctobpl_const_732, jp);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 166} true;
    Mem_T.INT4 := Mem_T.INT4[jt := PLUS(jp, 1, 1)];
    assume value_is(__ctobpl_const_740, Mem_T.INT4[jt]);
    assume value_is(__ctobpl_const_741, jp);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 167} true;
    assert pat != 0;
    $addstr.arg.1$2$ := Mem_T.CHAR[PLUS(pat, 1, jp)];
    assume value_is(__ctobpl_const_742, $addstr.arg.1$2$);
    assume value_is(__ctobpl_const_743, pat);
    assume value_is(__ctobpl_const_744, jp);
    assume value_is(__ctobpl_const_745, Mem_T.CHAR[PLUS(pat, 1, jp)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 167} true;
    call result.addstr$1 := addstr($addstr.arg.1$2$, pat, jt, 100);
    assume value_is(__ctobpl_const_746, $addstr.arg.1$2$);
    assume value_is(__ctobpl_const_747, pat);
    assume value_is(__ctobpl_const_748, Mem_T.INT4[jt]);
    assume value_is(__ctobpl_const_749, $addstr.arg.1$2$);
    assume value_is(__ctobpl_const_750, pat);
    assume value_is(__ctobpl_const_751, Mem_T.INT4[jt]);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 167} true;
    junk := result.addstr$1;
    assume value_is(__ctobpl_const_752, junk);
    assume value_is(__ctobpl_const_753, result.addstr$1);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 164} true;
    assume value_is(__ctobpl_const_754, jp);
    jp := MINUS_BOTH_PTR_OR_BOTH_INT(jp, 1, 1);
    goto label_15_dummy;

  label_15_dummy:
    assume false;
    return;

  label_7_head_last:
    goto label_7_true, label_7_false;
}



procedure {:extern} subline(lin.__1: int, pat.__1: int, sub.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} subline(lin.__1: int, pat.__1: int, sub.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $fputc.arg.1$5$: int;
  var {:extern} $fputc.arg.2$4$: int;
  var {:extern} i: int;
  var {:extern} lastm: int;
  var {:extern} lin: int;
  var {:extern} m: int;
  var {:extern} pat: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.amatch$1: int;
  var {:extern} result.fputc$2: int;
  var {:extern} sub: int;
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
    assume INT_LT(lin.__1, alloc);
    assume INT_LT(pat.__1, alloc);
    assume INT_LT(sub.__1, alloc);
    $fputc.arg.1$5$ := 0;
    $fputc.arg.2$4$ := 0;
    i := 0;
    lastm := 0;
    lin := 0;
    m := 0;
    pat := 0;
    result.__iob_func$3 := 0;
    result.amatch$1 := 0;
    result.fputc$2 := 0;
    sub := 0;
    lin := lin.__1;
    pat := pat.__1;
    sub := sub.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 487} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 487} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 487} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 489} true;
    lastm := -1;
    assume value_is(__ctobpl_const_755, lastm);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 490} true;
    i := 0;
    assume value_is(__ctobpl_const_756, i);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 491} true;
    goto label_8_head;

  label_8_head:
    call $fputc.arg.1$5$, $fputc.arg.2$4$, i, lastm, m, result.__iob_func$3, result.amatch$1, result.fputc$2 := subline_loop_label_8_head($fputc.arg.1$5$, $fputc.arg.2$4$, i, lastm, lin, m, pat, result.__iob_func$3, result.amatch$1, result.fputc$2, sub);
    goto label_8_head_last;

  label_8_false:
    assume Mem_T.CHAR[PLUS(lin, 1, i)] == 0;
    assume value_is(__ctobpl_const_757, lin);
    assume value_is(__ctobpl_const_758, i);
    assume value_is(__ctobpl_const_759, Mem_T.CHAR[PLUS(lin, 1, i)]);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 504} true;
    return;

  label_8_true:
    assume Mem_T.CHAR[PLUS(lin, 1, i)] != 0;
    assume value_is(__ctobpl_const_757, lin);
    assume value_is(__ctobpl_const_758, i);
    assume value_is(__ctobpl_const_759, Mem_T.CHAR[PLUS(lin, 1, i)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 493} true;
    call result.amatch$1 := amatch(lin, i, pat, 0);
    assume value_is(__ctobpl_const_760, lin);
    assume value_is(__ctobpl_const_761, i);
    assume value_is(__ctobpl_const_762, pat);
    assume value_is(__ctobpl_const_763, lin);
    assume value_is(__ctobpl_const_764, i);
    assume value_is(__ctobpl_const_765, pat);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 493} true;
    m := result.amatch$1;
    assume value_is(__ctobpl_const_766, m);
    assume value_is(__ctobpl_const_767, result.amatch$1);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 494} true;
    goto label_13_true, label_13_false;

  label_13_false:
    assume !INT_LEQ(0, m);
    assume value_is(__ctobpl_const_768, m);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 498} true;
    goto label_14_true, label_14_false;

  label_14_false:
    assume !INT_EQ(m, -1);
    assume value_is(__ctobpl_const_781, m);
    goto label_20;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 498} true;
    goto label_20_true, label_20_false;

  label_20_false:
    assume !INT_EQ(m, i);
    assume value_is(__ctobpl_const_782, m);
    assume value_is(__ctobpl_const_783, i);
    goto label_30;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 502} true;
    i := m;
    assume value_is(__ctobpl_const_784, i);
    assume value_is(__ctobpl_const_785, m);
    goto label_30_dummy;

  label_20_true:
    assume INT_EQ(m, i);
    assume value_is(__ctobpl_const_782, m);
    assume value_is(__ctobpl_const_783, i);
    goto label_21;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    call result.__iob_func$3 := __iob_func();
    goto label_24;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    assert result.__iob_func$3 != 0;
    $fputc.arg.2$4$ := PLUS(result.__iob_func$3, 32, 1);
    assume value_is(__ctobpl_const_786, $fputc.arg.2$4$);
    assume value_is(__ctobpl_const_787, result.__iob_func$3);
    goto label_25;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    assert lin != 0;
    $fputc.arg.1$5$ := Mem_T.CHAR[PLUS(lin, 1, i)];
    assume value_is(__ctobpl_const_788, $fputc.arg.1$5$);
    assume value_is(__ctobpl_const_789, lin);
    assume value_is(__ctobpl_const_790, i);
    assume value_is(__ctobpl_const_791, Mem_T.CHAR[PLUS(lin, 1, i)]);
    goto label_26;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    call result.fputc$2 := fputc($fputc.arg.1$5$, $fputc.arg.2$4$);
    assume value_is(__ctobpl_const_792, $fputc.arg.1$5$);
    assume value_is(__ctobpl_const_793, $fputc.arg.2$4$);
    assume value_is(__ctobpl_const_794, $fputc.arg.1$5$);
    assume value_is(__ctobpl_const_795, $fputc.arg.2$4$);
    goto label_29;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 500} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_796, i);
    assume value_is(__ctobpl_const_797, i);
    goto label_29_dummy;

  label_14_true:
    assume INT_EQ(m, -1);
    assume value_is(__ctobpl_const_781, m);
    goto label_21;

  label_13_true:
    assume INT_LEQ(0, m);
    assume value_is(__ctobpl_const_768, m);
    goto label_15;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 494} true;
    goto label_15_true, label_15_false;

  label_15_false:
    assume !INT_NEQ(lastm, m);
    assume value_is(__ctobpl_const_769, lastm);
    assume value_is(__ctobpl_const_770, m);
    goto label_14;

  label_15_true:
    assume INT_NEQ(lastm, m);
    assume value_is(__ctobpl_const_769, lastm);
    assume value_is(__ctobpl_const_770, m);
    goto label_16;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 495} true;
    call putsub(lin, i, m, sub);
    assume value_is(__ctobpl_const_771, lin);
    assume value_is(__ctobpl_const_772, i);
    assume value_is(__ctobpl_const_773, m);
    assume value_is(__ctobpl_const_774, sub);
    assume value_is(__ctobpl_const_775, lin);
    assume value_is(__ctobpl_const_776, i);
    assume value_is(__ctobpl_const_777, m);
    assume value_is(__ctobpl_const_778, sub);
    goto label_19;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 496} true;
    lastm := m;
    assume value_is(__ctobpl_const_779, lastm);
    assume value_is(__ctobpl_const_780, m);
    goto label_14;

  label_30_dummy:
    assume false;
    return;

  label_29_dummy:
    assume false;
    return;

  label_8_head_last:
    assert lin != 0;
    goto label_8_true, label_8_false;
}



implementation amatch_loop_label_23_head(in_$amatch.arg.4$6$: int, 
    in_done: int, 
    in_i: int, 
    in_j: int, 
    in_k: int, 
    in_lin: int, 
    in_offset: int, 
    in_pat: int, 
    in_result.amatch$4: int, 
    in_result.patsize$5: int)
   returns (out_$amatch.arg.4$6$: int, 
    out_done: int, 
    out_k: int, 
    out_result.amatch$4: int, 
    out_result.patsize$5: int)
{

  entry:
    out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := in_$amatch.arg.4$6$, in_done, in_k, in_result.amatch$4, in_result.patsize$5;
    goto label_23_head;

  label_23_head:
    goto label_23_true, label_23_false;

  label_23_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_72, out_done);
    out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := in_$amatch.arg.4$6$, in_done, in_k, in_result.amatch$4, in_result.patsize$5;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 442} true;
    Mem_T.INT4 := Mem_T.INT4[in_i := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1)];
    assume value_is(__ctobpl_const_93, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_94, Mem_T.INT4[in_i]);
    goto label_36_dummy;

  label_35_false:
    assume !INT_LEQ(0, out_k);
    assume value_is(__ctobpl_const_92, out_k);
    goto label_36;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 439} true;
    goto label_35_true, label_35_false;

  label_35_true:
    assume INT_LEQ(0, out_k);
    assume value_is(__ctobpl_const_92, out_k);
    out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := in_$amatch.arg.4$6$, in_done, in_k, in_result.amatch$4, in_result.patsize$5;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_37;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    out_k := out_result.amatch$4;
    assume value_is(__ctobpl_const_90, out_k);
    assume value_is(__ctobpl_const_91, out_result.amatch$4);
    goto label_35;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    call out_result.amatch$4 := amatch(in_lin, Mem_T.INT4[in_i], in_pat, out_$amatch.arg.4$6$);
    assume value_is(__ctobpl_const_82, in_lin);
    assume value_is(__ctobpl_const_83, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_84, in_pat);
    assume value_is(__ctobpl_const_85, out_$amatch.arg.4$6$);
    assume value_is(__ctobpl_const_86, in_lin);
    assume value_is(__ctobpl_const_87, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_88, in_pat);
    assume value_is(__ctobpl_const_89, out_$amatch.arg.4$6$);
    goto label_34;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    out_$amatch.arg.4$6$ := PLUS(in_j, 1, out_result.patsize$5);
    assume value_is(__ctobpl_const_79, out_$amatch.arg.4$6$);
    assume value_is(__ctobpl_const_80, in_j);
    assume value_is(__ctobpl_const_81, out_result.patsize$5);
    goto label_31;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    call out_result.patsize$5 := patsize(in_pat, in_j);
    assume value_is(__ctobpl_const_75, in_pat);
    assume value_is(__ctobpl_const_76, in_j);
    assume value_is(__ctobpl_const_77, in_pat);
    assume value_is(__ctobpl_const_78, in_j);
    goto label_30;

  label_24_true:
    assume INT_LEQ(Mem_T.INT4[in_offset], Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_73, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_74, Mem_T.INT4[in_i]);
    goto label_27;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 437} true;
    goto label_24_true, label_24_false;

  label_24_false:
    assume !INT_LEQ(Mem_T.INT4[in_offset], Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_73, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_74, Mem_T.INT4[in_i]);
    out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := in_$amatch.arg.4$6$, in_done, in_k, in_result.amatch$4, in_result.patsize$5;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_23_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_72, out_done);
    goto label_24;

  label_36_dummy:
    call {:si_unique_call 1} out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := amatch_loop_label_23_head(out_$amatch.arg.4$6$, out_done, in_i, in_j, out_k, in_lin, in_offset, in_pat, out_result.amatch$4, out_result.patsize$5);
    return;

  label_37:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 440} true;
    out_done := 1;
    assume value_is(__ctobpl_const_95, out_done);
    goto label_37_dummy;

  label_37_dummy:
    call {:si_unique_call 2} out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := amatch_loop_label_23_head(out_$amatch.arg.4$6$, out_done, in_i, in_j, out_k, in_lin, in_offset, in_pat, out_result.amatch$4, out_result.patsize$5);
    return;

  exit:
    return;
}



procedure amatch_loop_label_23_head(in_$amatch.arg.4$6$: int, 
    in_done: int, 
    in_i: int, 
    in_j: int, 
    in_k: int, 
    in_lin: int, 
    in_offset: int, 
    in_pat: int, 
    in_result.amatch$4: int, 
    in_result.patsize$5: int)
   returns (out_$amatch.arg.4$6$: int, 
    out_done: int, 
    out_k: int, 
    out_result.amatch$4: int, 
    out_result.patsize$5: int);
  modifies Mem_T.INT4;



implementation amatch_loop_label_20_head(in_done: int, 
    in_i: int, 
    in_j: int, 
    in_lin: int, 
    in_pat: int, 
    in_result: int, 
    in_result.omatch$3: int)
   returns (out_done: int, out_result: int, out_result.omatch$3: int)
{

  entry:
    out_done, out_result, out_result.omatch$3 := in_done, in_result, in_result.omatch$3;
    goto label_20_head;

  label_20_head:
    goto label_20_true, label_20_false;

  label_20_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_55, out_done);
    out_done, out_result, out_result.omatch$3 := in_done, in_result, in_result.omatch$3;
    return;

  label_43:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 434} true;
    out_done := 1;
    assume value_is(__ctobpl_const_70, out_done);
    goto label_43_dummy;

  label_42_false:
    assume out_result == 0;
    assume value_is(__ctobpl_const_69, out_result);
    goto label_43;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 433} true;
    goto label_42_true, label_42_false;

  label_42_true:
    assume out_result != 0;
    assume value_is(__ctobpl_const_69, out_result);
    out_done, out_result, out_result.omatch$3 := in_done, in_result, in_result.omatch$3;
    goto label_42_true_dummy;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 432} true;
    out_result := out_result.omatch$3;
    assume value_is(__ctobpl_const_67, out_result);
    assume value_is(__ctobpl_const_68, out_result.omatch$3);
    goto label_42;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 432} true;
    call out_result.omatch$3 := omatch(in_lin, in_i, in_pat, in_j);
    assume value_is(__ctobpl_const_59, in_lin);
    assume value_is(__ctobpl_const_60, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_61, in_pat);
    assume value_is(__ctobpl_const_62, in_j);
    assume value_is(__ctobpl_const_63, in_lin);
    assume value_is(__ctobpl_const_64, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_65, in_pat);
    assume value_is(__ctobpl_const_66, in_j);
    goto label_41;

  label_21_true:
    assume Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])] != 0;
    assume value_is(__ctobpl_const_56, in_lin);
    assume value_is(__ctobpl_const_57, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])]);
    goto label_38;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 431} true;
    assert in_lin != 0;
    goto label_21_true, label_21_false;

  label_21_false:
    assume Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])] == 0;
    assume value_is(__ctobpl_const_56, in_lin);
    assume value_is(__ctobpl_const_57, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])]);
    out_done, out_result, out_result.omatch$3 := in_done, in_result, in_result.omatch$3;
    return;

  label_20_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_55, out_done);
    goto label_21;

  label_43_dummy:
    call {:si_unique_call 1} out_done, out_result, out_result.omatch$3 := amatch_loop_label_20_head(out_done, in_i, in_j, in_lin, in_pat, out_result, out_result.omatch$3);
    return;

  label_42_true_dummy:
    call {:si_unique_call 2} out_done, out_result, out_result.omatch$3 := amatch_loop_label_20_head(out_done, in_i, in_j, in_lin, in_pat, out_result, out_result.omatch$3);
    return;

  exit:
    return;
}



procedure amatch_loop_label_20_head(in_done: int, 
    in_i: int, 
    in_j: int, 
    in_lin: int, 
    in_pat: int, 
    in_result: int, 
    in_result.omatch$3: int)
   returns (out_done: int, out_result: int, out_result.omatch$3: int);



implementation amatch_loop_label_8_head(in_$amatch.arg.4$6$: int, 
    in_done: int, 
    in_i: int, 
    in_j: int, 
    in_k: int, 
    in_lin: int, 
    in_offset: int, 
    in_pat: int, 
    in_result: int, 
    in_result.amatch$4: int, 
    in_result.omatch$3: int, 
    in_result.omatch$7: int, 
    in_result.patsize$2: int, 
    in_result.patsize$5: int, 
    in_result.patsize$8: int)
   returns (out_$amatch.arg.4$6$: int, 
    out_done: int, 
    out_j: int, 
    out_k: int, 
    out_result: int, 
    out_result.amatch$4: int, 
    out_result.omatch$3: int, 
    out_result.omatch$7: int, 
    out_result.patsize$2: int, 
    out_result.patsize$5: int, 
    out_result.patsize$8: int)
{

  entry:
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    goto label_8_head;

  label_8_head:
    goto label_8_true, label_8_false;

  label_8_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_19, out_done);
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 450} true;
    out_done := 1;
    assume value_is(__ctobpl_const_38, out_done);
    goto label_51_dummy;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 449} true;
    Mem_T.INT4 := Mem_T.INT4[in_offset := -1];
    assume value_is(__ctobpl_const_37, Mem_T.INT4[in_offset]);
    goto label_51;

  label_45_false:
    assume out_result == 0;
    assume value_is(__ctobpl_const_36, out_result);
    goto label_46;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 448} true;
    goto label_45_true, label_45_false;

  label_45_true:
    assume out_result != 0;
    assume value_is(__ctobpl_const_36, out_result);
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_47;

  label_44:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 447} true;
    out_result := out_result.omatch$7;
    assume value_is(__ctobpl_const_34, out_result);
    assume value_is(__ctobpl_const_35, out_result.omatch$7);
    goto label_45;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 447} true;
    call out_result.omatch$7 := omatch(in_lin, in_offset, in_pat, out_j);
    assume value_is(__ctobpl_const_26, in_lin);
    assume value_is(__ctobpl_const_27, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_28, in_pat);
    assume value_is(__ctobpl_const_29, out_j);
    assume value_is(__ctobpl_const_30, in_lin);
    assume value_is(__ctobpl_const_31, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_32, in_pat);
    assume value_is(__ctobpl_const_33, out_j);
    goto label_44;

  label_11_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_pat, 1, out_j)], 42);
    assume value_is(__ctobpl_const_23, in_pat);
    assume value_is(__ctobpl_const_24, out_j);
    assume value_is(__ctobpl_const_25, Mem_T.CHAR[PLUS(in_pat, 1, out_j)]);
    goto label_12;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 428} true;
    assert in_pat != 0;
    goto label_11_true, label_11_false;

  label_11_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_pat, 1, out_j)], 42);
    assume value_is(__ctobpl_const_23, in_pat);
    assume value_is(__ctobpl_const_24, out_j);
    assume value_is(__ctobpl_const_25, Mem_T.CHAR[PLUS(in_pat, 1, out_j)]);
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_15;

  label_9_true:
    assume Mem_T.CHAR[PLUS(in_pat, 1, out_j)] != 0;
    assume value_is(__ctobpl_const_20, in_pat);
    assume value_is(__ctobpl_const_21, out_j);
    assume value_is(__ctobpl_const_22, Mem_T.CHAR[PLUS(in_pat, 1, out_j)]);
    goto label_11;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 427} true;
    assert in_pat != 0;
    goto label_9_true, label_9_false;

  label_9_false:
    assume Mem_T.CHAR[PLUS(in_pat, 1, out_j)] == 0;
    assume value_is(__ctobpl_const_20, in_pat);
    assume value_is(__ctobpl_const_21, out_j);
    assume value_is(__ctobpl_const_22, Mem_T.CHAR[PLUS(in_pat, 1, out_j)]);
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_8_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_19, out_done);
    goto label_9;

  label_51_dummy:
    call {:si_unique_call 1} out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := amatch_loop_label_8_head(out_$amatch.arg.4$6$, out_done, in_i, out_j, out_k, in_lin, in_offset, in_pat, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8);
    return;

  label_50:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 452} true;
    out_j := PLUS(out_j, 1, out_result.patsize$8);
    assume value_is(__ctobpl_const_43, out_j);
    assume value_is(__ctobpl_const_44, out_j);
    assume value_is(__ctobpl_const_45, out_result.patsize$8);
    goto label_50_dummy;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 452} true;
    call out_result.patsize$8 := patsize(in_pat, out_j);
    assume value_is(__ctobpl_const_39, in_pat);
    assume value_is(__ctobpl_const_40, out_j);
    assume value_is(__ctobpl_const_41, in_pat);
    assume value_is(__ctobpl_const_42, out_j);
    goto label_50;

  label_50_dummy:
    call {:si_unique_call 2} out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := amatch_loop_label_8_head(out_$amatch.arg.4$6$, out_done, in_i, out_j, out_k, in_lin, in_offset, in_pat, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8);
    return;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 445} true;
    out_done := 1;
    assume value_is(__ctobpl_const_98, out_done);
    goto label_26_dummy;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 444} true;
    Mem_T.INT4 := Mem_T.INT4[in_offset := out_k];
    assume value_is(__ctobpl_const_96, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_97, out_k);
    goto label_26;

  label_24_false:
    assume !INT_LEQ(Mem_T.INT4[in_offset], Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_73, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_74, Mem_T.INT4[in_i]);
    goto label_25;

  label_23_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_72, out_done);
    goto label_25;

  label_23_head:
    call out_$amatch.arg.4$6$, out_done, out_k, out_result.amatch$4, out_result.patsize$5 := amatch_loop_label_23_head(out_$amatch.arg.4$6$, out_done, in_i, out_j, out_k, in_lin, in_offset, in_pat, out_result.amatch$4, out_result.patsize$5);
    goto label_23_head_last;

  label_23_head_last:
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_23_true, label_23_false;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 437} true;
    goto label_23_head;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 442} true;
    Mem_T.INT4 := Mem_T.INT4[in_i := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1)];
    assume value_is(__ctobpl_const_93, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_94, Mem_T.INT4[in_i]);
    goto label_36_dummy;

  label_36_dummy:
    assume false;
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_37:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 440} true;
    out_done := 1;
    assume value_is(__ctobpl_const_95, out_done);
    goto label_37_dummy;

  label_37_dummy:
    assume false;
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_35_true:
    assume INT_LEQ(0, out_k);
    assume value_is(__ctobpl_const_92, out_k);
    goto label_37;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 439} true;
    goto label_35_true, label_35_false;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    out_k := out_result.amatch$4;
    assume value_is(__ctobpl_const_90, out_k);
    assume value_is(__ctobpl_const_91, out_result.amatch$4);
    goto label_35;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    call out_result.amatch$4 := amatch(in_lin, Mem_T.INT4[in_i], in_pat, out_$amatch.arg.4$6$);
    assume value_is(__ctobpl_const_82, in_lin);
    assume value_is(__ctobpl_const_83, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_84, in_pat);
    assume value_is(__ctobpl_const_85, out_$amatch.arg.4$6$);
    assume value_is(__ctobpl_const_86, in_lin);
    assume value_is(__ctobpl_const_87, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_88, in_pat);
    assume value_is(__ctobpl_const_89, out_$amatch.arg.4$6$);
    goto label_34;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    out_$amatch.arg.4$6$ := PLUS(out_j, 1, out_result.patsize$5);
    assume value_is(__ctobpl_const_79, out_$amatch.arg.4$6$);
    assume value_is(__ctobpl_const_80, out_j);
    assume value_is(__ctobpl_const_81, out_result.patsize$5);
    goto label_31;

  label_27:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 438} true;
    call out_result.patsize$5 := patsize(in_pat, out_j);
    assume value_is(__ctobpl_const_75, in_pat);
    assume value_is(__ctobpl_const_76, out_j);
    assume value_is(__ctobpl_const_77, in_pat);
    assume value_is(__ctobpl_const_78, out_j);
    goto label_30;

  label_24_true:
    assume INT_LEQ(Mem_T.INT4[in_offset], Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_73, Mem_T.INT4[in_offset]);
    assume value_is(__ctobpl_const_74, Mem_T.INT4[in_i]);
    goto label_27;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 437} true;
    goto label_24_true, label_24_false;

  label_23_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_72, out_done);
    goto label_24;

  label_35_false:
    assume !INT_LEQ(0, out_k);
    assume value_is(__ctobpl_const_92, out_k);
    goto label_36;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 436} true;
    out_done := 0;
    assume value_is(__ctobpl_const_71, out_done);
    goto label_23;

  label_21_false:
    assume Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])] == 0;
    assume value_is(__ctobpl_const_56, in_lin);
    assume value_is(__ctobpl_const_57, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])]);
    goto label_22;

  label_20_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_55, out_done);
    goto label_22;

  label_20_head:
    call out_done, out_result, out_result.omatch$3 := amatch_loop_label_20_head(out_done, in_i, out_j, in_lin, in_pat, out_result, out_result.omatch$3);
    goto label_20_head_last;

  label_20_head_last:
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_20_true, label_20_false;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 431} true;
    goto label_20_head;

  label_43:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 434} true;
    out_done := 1;
    assume value_is(__ctobpl_const_70, out_done);
    goto label_43_dummy;

  label_43_dummy:
    assume false;
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_42_true:
    assume out_result != 0;
    assume value_is(__ctobpl_const_69, out_result);
    goto label_42_true_dummy;

  label_42_true_dummy:
    assume false;
    out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := in_$amatch.arg.4$6$, in_done, in_j, in_k, in_result, in_result.amatch$4, in_result.omatch$3, in_result.omatch$7, in_result.patsize$2, in_result.patsize$5, in_result.patsize$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 433} true;
    goto label_42_true, label_42_false;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 432} true;
    out_result := out_result.omatch$3;
    assume value_is(__ctobpl_const_67, out_result);
    assume value_is(__ctobpl_const_68, out_result.omatch$3);
    goto label_42;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 432} true;
    call out_result.omatch$3 := omatch(in_lin, in_i, in_pat, out_j);
    assume value_is(__ctobpl_const_59, in_lin);
    assume value_is(__ctobpl_const_60, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_61, in_pat);
    assume value_is(__ctobpl_const_62, out_j);
    assume value_is(__ctobpl_const_63, in_lin);
    assume value_is(__ctobpl_const_64, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_65, in_pat);
    assume value_is(__ctobpl_const_66, out_j);
    goto label_41;

  label_21_true:
    assume Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])] != 0;
    assume value_is(__ctobpl_const_56, in_lin);
    assume value_is(__ctobpl_const_57, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(in_lin, 1, Mem_T.INT4[in_i])]);
    goto label_38;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 431} true;
    assert in_lin != 0;
    goto label_21_true, label_21_false;

  label_20_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_55, out_done);
    goto label_21;

  label_42_false:
    assume out_result == 0;
    assume value_is(__ctobpl_const_69, out_result);
    goto label_43;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 430} true;
    Mem_T.INT4 := Mem_T.INT4[in_i := Mem_T.INT4[in_offset]];
    assume value_is(__ctobpl_const_53, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_54, Mem_T.INT4[in_offset]);
    goto label_20;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 429} true;
    out_j := PLUS(out_j, 1, out_result.patsize$2);
    assume value_is(__ctobpl_const_50, out_j);
    assume value_is(__ctobpl_const_51, out_j);
    assume value_is(__ctobpl_const_52, out_result.patsize$2);
    goto label_19;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 429} true;
    call out_result.patsize$2 := patsize(in_pat, out_j);
    assume value_is(__ctobpl_const_46, in_pat);
    assume value_is(__ctobpl_const_47, out_j);
    assume value_is(__ctobpl_const_48, in_pat);
    assume value_is(__ctobpl_const_49, out_j);
    goto label_18;

  label_26_dummy:
    call {:si_unique_call 3} out_$amatch.arg.4$6$, out_done, out_j, out_k, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8 := amatch_loop_label_8_head(out_$amatch.arg.4$6$, out_done, in_i, out_j, out_k, in_lin, in_offset, in_pat, out_result, out_result.amatch$4, out_result.omatch$3, out_result.omatch$7, out_result.patsize$2, out_result.patsize$5, out_result.patsize$8);
    return;

  exit:
    return;
}



procedure amatch_loop_label_8_head(in_$amatch.arg.4$6$: int, 
    in_done: int, 
    in_i: int, 
    in_j: int, 
    in_k: int, 
    in_lin: int, 
    in_offset: int, 
    in_pat: int, 
    in_result: int, 
    in_result.amatch$4: int, 
    in_result.omatch$3: int, 
    in_result.omatch$7: int, 
    in_result.patsize$2: int, 
    in_result.patsize$5: int, 
    in_result.patsize$8: int)
   returns (out_$amatch.arg.4$6$: int, 
    out_done: int, 
    out_j: int, 
    out_k: int, 
    out_result: int, 
    out_result.amatch$4: int, 
    out_result.omatch$3: int, 
    out_result.omatch$7: int, 
    out_result.patsize$2: int, 
    out_result.patsize$5: int, 
    out_result.patsize$8: int);
  modifies Mem_T.INT4;



implementation change_loop_label_10_head(in_$getline.arg.1$5$: int, 
    in_pat: int, 
    in_result: int, 
    in_result.getline$4: int, 
    in_sub: int, 
    in_$subline.arg.1$3$: int)
   returns (out_result: int, out_result.getline$4: int)
{

  entry:
    out_result, out_result.getline$4 := in_result, in_result.getline$4;
    goto label_10_head;

  label_10_head:
    goto label_10_true, label_10_false;

  label_10_false:
    assume out_result == 0;
    assume value_is(__ctobpl_const_102, out_result);
    out_result, out_result.getline$4 := in_result, in_result.getline$4;
    return;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 516} true;
    out_result := out_result.getline$4;
    assume value_is(__ctobpl_const_107, out_result);
    assume value_is(__ctobpl_const_108, out_result.getline$4);
    goto label_19_dummy;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 516} true;
    call out_result.getline$4 := getline(in_$getline.arg.1$5$, 100);
    goto label_19;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 516} true;
    goto label_16;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 515} true;
    call subline(in_$subline.arg.1$3$, in_pat, in_sub);
    assume value_is(__ctobpl_const_103, in_pat);
    assume value_is(__ctobpl_const_104, in_sub);
    assume value_is(__ctobpl_const_105, in_pat);
    assume value_is(__ctobpl_const_106, in_sub);
    goto label_15;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 515} true;
    goto label_12;

  label_10_true:
    assume out_result != 0;
    assume value_is(__ctobpl_const_102, out_result);
    goto label_11;

  label_19_dummy:
    call {:si_unique_call 1} out_result, out_result.getline$4 := change_loop_label_10_head(in_$getline.arg.1$5$, in_pat, out_result, out_result.getline$4, in_sub, in_$subline.arg.1$3$);
    return;

  exit:
    return;
}



procedure change_loop_label_10_head(in_$getline.arg.1$5$: int, 
    in_pat: int, 
    in_result: int, 
    in_result.getline$4: int, 
    in_sub: int, 
    in_$subline.arg.1$3$: int)
   returns (out_result: int, out_result.getline$4: int);



implementation dodash_loop_label_45_head(in_dest: int, 
    in_i: int, 
    in_j: int, 
    in_junk: int, 
    in_k: int, 
    in_maxset: int, 
    in_result.addstr$10: int, 
    in_src: int)
   returns (out_junk: int, out_k: int, out_result.addstr$10: int)
{

  entry:
    out_junk, out_k, out_result.addstr$10 := in_junk, in_k, in_result.addstr$10;
    goto label_45_head;

  label_45_head:
    assert in_i != 0;
    assert in_src != 0;
    goto label_45_true, label_45_false;

  label_45_false:
    assume !INT_LEQ(out_k, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_169, out_k);
    assume value_is(__ctobpl_const_170, in_src);
    assume value_is(__ctobpl_const_171, in_i);
    assume value_is(__ctobpl_const_172, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_173, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    out_junk, out_k, out_result.addstr$10 := in_junk, in_k, in_result.addstr$10;
    return;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    assume value_is(__ctobpl_const_188, out_k);
    out_k := PLUS(out_k, 1, 1);
    goto label_51_dummy;

  label_50:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 120} true;
    out_junk := out_result.addstr$10;
    assume value_is(__ctobpl_const_186, out_junk);
    assume value_is(__ctobpl_const_187, out_result.addstr$10);
    goto label_51;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 120} true;
    call out_result.addstr$10 := addstr(out_k, in_dest, in_j, in_maxset);
    assume value_is(__ctobpl_const_178, out_k);
    assume value_is(__ctobpl_const_179, in_dest);
    assume value_is(__ctobpl_const_180, in_j);
    assume value_is(__ctobpl_const_181, in_maxset);
    assume value_is(__ctobpl_const_182, out_k);
    assume value_is(__ctobpl_const_183, in_dest);
    assume value_is(__ctobpl_const_184, in_j);
    assume value_is(__ctobpl_const_185, in_maxset);
    goto label_50;

  label_45_true:
    assume INT_LEQ(out_k, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_169, out_k);
    assume value_is(__ctobpl_const_170, in_src);
    assume value_is(__ctobpl_const_171, in_i);
    assume value_is(__ctobpl_const_172, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_173, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_47;

  label_51_dummy:
    call {:si_unique_call 1} out_junk, out_k, out_result.addstr$10 := dodash_loop_label_45_head(in_dest, in_i, in_j, out_junk, out_k, in_maxset, out_result.addstr$10, in_src);
    return;

  exit:
    return;
}



procedure dodash_loop_label_45_head(in_dest: int, 
    in_i: int, 
    in_j: int, 
    in_junk: int, 
    in_k: int, 
    in_maxset: int, 
    in_result.addstr$10: int, 
    in_src: int)
   returns (out_junk: int, out_k: int, out_result.addstr$10: int);



implementation dodash_loop_label_6_head(in_$addstr.arg.1$4$: int, 
    in_delim: int, 
    in_dest: int, 
    in_escjunk: int, 
    in_i: int, 
    in_$isalnum.arg.1$7$: int, 
    in_$isalnum.arg.1$9$: int, 
    in_j: int, 
    in_junk: int, 
    in_k: int, 
    in_maxset: int, 
    in_result.addstr$2: int, 
    in_result.addstr$3: int, 
    in_result.addstr$5: int, 
    in_result.addstr$10: int, 
    in_result.addstr$11: int, 
    in_result.esc$1: int, 
    in_result.isalnum$6: int, 
    in_result.isalnum$8: int, 
    in_src: int)
   returns (out_$addstr.arg.1$4$: int, 
    out_escjunk: int, 
    out_$isalnum.arg.1$7$: int, 
    out_$isalnum.arg.1$9$: int, 
    out_junk: int, 
    out_k: int, 
    out_result.addstr$2: int, 
    out_result.addstr$3: int, 
    out_result.addstr$5: int, 
    out_result.addstr$10: int, 
    out_result.addstr$11: int, 
    out_result.esc$1: int, 
    out_result.isalnum$6: int, 
    out_result.isalnum$8: int)
{

  entry:
    out_$addstr.arg.1$4$, out_escjunk, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, out_junk, out_k, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8 := in_$addstr.arg.1$4$, in_escjunk, in_$isalnum.arg.1$7$, in_$isalnum.arg.1$9$, in_junk, in_k, in_result.addstr$2, in_result.addstr$3, in_result.addstr$5, in_result.addstr$10, in_result.addstr$11, in_result.esc$1, in_result.isalnum$6, in_result.isalnum$8;
    goto label_6_head;

  label_6_head:
    assert in_i != 0;
    assert in_src != 0;
    goto label_6_true, label_6_false;

  label_6_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])], in_delim);
    assume value_is(__ctobpl_const_109, in_src);
    assume value_is(__ctobpl_const_110, in_i);
    assume value_is(__ctobpl_const_111, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_112, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    assume value_is(__ctobpl_const_113, in_delim);
    out_$addstr.arg.1$4$, out_escjunk, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, out_junk, out_k, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8 := in_$addstr.arg.1$4$, in_escjunk, in_$isalnum.arg.1$7$, in_$isalnum.arg.1$9$, in_junk, in_k, in_result.addstr$2, in_result.addstr$3, in_result.addstr$5, in_result.addstr$10, in_result.addstr$11, in_result.esc$1, in_result.isalnum$6, in_result.isalnum$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 126} true;
    assert in_i != 0;
    assert in_i != 0;
    Mem_T.INT4 := Mem_T.INT4[in_i := PLUS(Mem_T.INT4[in_i], 1, 1)];
    assume value_is(__ctobpl_const_228, in_i);
    assume value_is(__ctobpl_const_229, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_230, in_i);
    assume value_is(__ctobpl_const_231, Mem_T.INT4[in_i]);
    goto label_18_dummy;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 114} true;
    out_junk := out_result.addstr$5;
    assume value_is(__ctobpl_const_195, out_junk);
    assume value_is(__ctobpl_const_196, out_result.addstr$5);
    goto label_18;

  label_52:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 125} true;
    out_junk := out_result.addstr$11;
    assume value_is(__ctobpl_const_162, out_junk);
    assume value_is(__ctobpl_const_163, out_result.addstr$11);
    goto label_18;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 122} true;
    assert in_i != 0;
    assert in_i != 0;
    Mem_T.INT4 := Mem_T.INT4[in_i := PLUS(Mem_T.INT4[in_i], 1, 1)];
    assume value_is(__ctobpl_const_174, in_i);
    assume value_is(__ctobpl_const_175, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_176, in_i);
    assume value_is(__ctobpl_const_177, Mem_T.INT4[in_i]);
    goto label_18;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 112} true;
    out_junk := out_result.addstr$3;
    assume value_is(__ctobpl_const_210, out_junk);
    assume value_is(__ctobpl_const_211, out_result.addstr$3);
    goto label_18;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 109} true;
    out_junk := out_result.addstr$2;
    assume value_is(__ctobpl_const_226, out_junk);
    assume value_is(__ctobpl_const_227, out_result.addstr$2);
    goto label_18;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 109} true;
    call out_result.addstr$2 := addstr(out_escjunk, in_dest, in_j, in_maxset);
    assume value_is(__ctobpl_const_218, out_escjunk);
    assume value_is(__ctobpl_const_219, in_dest);
    assume value_is(__ctobpl_const_220, in_j);
    assume value_is(__ctobpl_const_221, in_maxset);
    assume value_is(__ctobpl_const_222, out_escjunk);
    assume value_is(__ctobpl_const_223, in_dest);
    assume value_is(__ctobpl_const_224, in_j);
    assume value_is(__ctobpl_const_225, in_maxset);
    goto label_17;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 108} true;
    out_escjunk := out_result.esc$1;
    assume value_is(__ctobpl_const_216, out_escjunk);
    assume value_is(__ctobpl_const_217, out_result.esc$1);
    goto label_14;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 108} true;
    call out_result.esc$1 := esc(in_src, in_i);
    assume value_is(__ctobpl_const_212, in_src);
    assume value_is(__ctobpl_const_213, in_i);
    assume value_is(__ctobpl_const_214, in_src);
    assume value_is(__ctobpl_const_215, in_i);
    goto label_13;

  label_8_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))], 
  64);
    assume value_is(__ctobpl_const_118, in_src);
    assume value_is(__ctobpl_const_119, in_i);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_121, 
  Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))]);
    goto label_10;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 107} true;
    assert in_i != 0;
    assert in_src != 0;
    goto label_8_true, label_8_false;

  label_7_true:
    assume Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])] != 0;
    assume value_is(__ctobpl_const_114, in_src);
    assume value_is(__ctobpl_const_115, in_i);
    assume value_is(__ctobpl_const_116, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_117, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    goto label_8;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 105} true;
    assert in_i != 0;
    assert in_src != 0;
    goto label_7_true, label_7_false;

  label_7_false:
    assume Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])] == 0;
    assume value_is(__ctobpl_const_114, in_src);
    assume value_is(__ctobpl_const_115, in_i);
    assume value_is(__ctobpl_const_116, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_117, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    out_$addstr.arg.1$4$, out_escjunk, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, out_junk, out_k, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8 := in_$addstr.arg.1$4$, in_escjunk, in_$isalnum.arg.1$7$, in_$isalnum.arg.1$9$, in_junk, in_k, in_result.addstr$2, in_result.addstr$3, in_result.addstr$5, in_result.addstr$10, in_result.addstr$11, in_result.esc$1, in_result.isalnum$6, in_result.isalnum$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_6_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])], in_delim);
    assume value_is(__ctobpl_const_109, in_src);
    assume value_is(__ctobpl_const_110, in_i);
    assume value_is(__ctobpl_const_111, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_112, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    assume value_is(__ctobpl_const_113, in_delim);
    goto label_7;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 112} true;
    call out_result.addstr$3 := addstr(out_$addstr.arg.1$4$, in_dest, in_j, in_maxset);
    assume value_is(__ctobpl_const_202, out_$addstr.arg.1$4$);
    assume value_is(__ctobpl_const_203, in_dest);
    assume value_is(__ctobpl_const_204, in_j);
    assume value_is(__ctobpl_const_205, in_maxset);
    assume value_is(__ctobpl_const_206, out_$addstr.arg.1$4$);
    assume value_is(__ctobpl_const_207, in_dest);
    assume value_is(__ctobpl_const_208, in_j);
    assume value_is(__ctobpl_const_209, in_maxset);
    goto label_24;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 112} true;
    assert in_i != 0;
    assert in_src != 0;
    out_$addstr.arg.1$4$ := Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])];
    assume value_is(__ctobpl_const_197, out_$addstr.arg.1$4$);
    assume value_is(__ctobpl_const_198, in_src);
    assume value_is(__ctobpl_const_199, in_i);
    assume value_is(__ctobpl_const_200, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_201, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    goto label_21;

  label_9_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])], 45);
    assume value_is(__ctobpl_const_122, in_src);
    assume value_is(__ctobpl_const_123, in_i);
    assume value_is(__ctobpl_const_124, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_125, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    goto label_20;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 111} true;
    assert in_i != 0;
    assert in_src != 0;
    goto label_9_true, label_9_false;

  label_8_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))], 
  64);
    assume value_is(__ctobpl_const_118, in_src);
    assume value_is(__ctobpl_const_119, in_i);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_121, 
  Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))]);
    goto label_9;

  label_45_false:
    assume !INT_LEQ(out_k, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_169, out_k);
    assume value_is(__ctobpl_const_170, in_src);
    assume value_is(__ctobpl_const_171, in_i);
    assume value_is(__ctobpl_const_172, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_173, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_46;

  label_45_head:
    call out_junk, out_k, out_result.addstr$10 := dodash_loop_label_45_head(in_dest, in_i, in_j, out_junk, out_k, in_maxset, out_result.addstr$10, in_src);
    goto label_45_head_last;

  label_45_head_last:
    assert in_i != 0;
    assert in_src != 0;
    out_$addstr.arg.1$4$, out_escjunk, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, out_junk, out_k, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8 := in_$addstr.arg.1$4$, in_escjunk, in_$isalnum.arg.1$7$, in_$isalnum.arg.1$9$, in_junk, in_k, in_result.addstr$2, in_result.addstr$3, in_result.addstr$5, in_result.addstr$10, in_result.addstr$11, in_result.esc$1, in_result.isalnum$6, in_result.isalnum$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_45_true, label_45_false;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    goto label_45_head;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    assume value_is(__ctobpl_const_188, out_k);
    out_k := PLUS(out_k, 1, 1);
    goto label_51_dummy;

  label_51_dummy:
    assume false;
    out_$addstr.arg.1$4$, out_escjunk, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, out_junk, out_k, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8 := in_$addstr.arg.1$4$, in_escjunk, in_$isalnum.arg.1$7$, in_$isalnum.arg.1$9$, in_junk, in_k, in_result.addstr$2, in_result.addstr$3, in_result.addstr$5, in_result.addstr$10, in_result.addstr$11, in_result.esc$1, in_result.isalnum$6, in_result.isalnum$8;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_50:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 120} true;
    out_junk := out_result.addstr$10;
    assume value_is(__ctobpl_const_186, out_junk);
    assume value_is(__ctobpl_const_187, out_result.addstr$10);
    goto label_51;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 120} true;
    call out_result.addstr$10 := addstr(out_k, in_dest, in_j, in_maxset);
    assume value_is(__ctobpl_const_178, out_k);
    assume value_is(__ctobpl_const_179, in_dest);
    assume value_is(__ctobpl_const_180, in_j);
    assume value_is(__ctobpl_const_181, in_maxset);
    assume value_is(__ctobpl_const_182, out_k);
    assume value_is(__ctobpl_const_183, in_dest);
    assume value_is(__ctobpl_const_184, in_j);
    assume value_is(__ctobpl_const_185, in_maxset);
    goto label_50;

  label_45_true:
    assume INT_LEQ(out_k, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_169, out_k);
    assume value_is(__ctobpl_const_170, in_src);
    assume value_is(__ctobpl_const_171, in_i);
    assume value_is(__ctobpl_const_172, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_173, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_47;

  label_44:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 118} true;
    assert in_i != 0;
    assert in_src != 0;
    out_k := PLUS(Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))], 
  1, 
  1);
    assume value_is(__ctobpl_const_164, out_k);
    assume value_is(__ctobpl_const_165, in_src);
    assume value_is(__ctobpl_const_166, in_i);
    assume value_is(__ctobpl_const_167, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_168, 
  Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))]);
    goto label_45;

  label_43_true:
    assume INT_LEQ(Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))], 
  Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_148, in_src);
    assume value_is(__ctobpl_const_149, in_i);
    assume value_is(__ctobpl_const_150, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_151, 
  Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_152, in_src);
    assume value_is(__ctobpl_const_153, in_i);
    assume value_is(__ctobpl_const_154, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_155, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_44;

  label_43:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 116} true;
    assert in_i != 0;
    assert in_src != 0;
    assert in_i != 0;
    assert in_src != 0;
    goto label_43_true, label_43_false;

  label_42_true:
    assume out_result.isalnum$8 != 0;
    assume value_is(__ctobpl_const_147, out_result.isalnum$8);
    goto label_43;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    goto label_42_true, label_42_false;

  label_39:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    call out_result.isalnum$8 := isalnum(out_$isalnum.arg.1$9$);
    assume value_is(__ctobpl_const_145, out_$isalnum.arg.1$9$);
    assume value_is(__ctobpl_const_146, out_$isalnum.arg.1$9$);
    goto label_42;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    assert in_i != 0;
    assert in_src != 0;
    out_$isalnum.arg.1$9$ := Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))];
    assume value_is(__ctobpl_const_140, out_$isalnum.arg.1$9$);
    assume value_is(__ctobpl_const_141, in_src);
    assume value_is(__ctobpl_const_142, in_i);
    assume value_is(__ctobpl_const_143, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_144, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_39;

  label_34_true:
    assume out_result.isalnum$6 != 0;
    assume value_is(__ctobpl_const_139, out_result.isalnum$6);
    goto label_38;

  label_34:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    goto label_34_true, label_34_false;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    call out_result.isalnum$6 := isalnum(out_$isalnum.arg.1$7$);
    assume value_is(__ctobpl_const_137, out_$isalnum.arg.1$7$);
    assume value_is(__ctobpl_const_138, out_$isalnum.arg.1$7$);
    goto label_34;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 115} true;
    assert in_i != 0;
    assert in_src != 0;
    out_$isalnum.arg.1$7$ := Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))];
    assume value_is(__ctobpl_const_132, out_$isalnum.arg.1$7$);
    assume value_is(__ctobpl_const_133, in_src);
    assume value_is(__ctobpl_const_134, in_i);
    assume value_is(__ctobpl_const_135, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_136, 
  Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))]);
    goto label_31;

  label_25_true:
    assume Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))] != 0;
    assume value_is(__ctobpl_const_128, in_src);
    assume value_is(__ctobpl_const_129, in_i);
    assume value_is(__ctobpl_const_130, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_131, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_30;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 113} true;
    assert in_i != 0;
    assert in_src != 0;
    goto label_25_true, label_25_false;

  label_19_false:
    assume !INT_LEQ(Mem_T.INT4[in_j], 1);
    assume value_is(__ctobpl_const_126, in_j);
    assume value_is(__ctobpl_const_127, Mem_T.INT4[in_j]);
    goto label_25;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 113} true;
    assert in_j != 0;
    goto label_19_true, label_19_false;

  label_9_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])], 45);
    assume value_is(__ctobpl_const_122, in_src);
    assume value_is(__ctobpl_const_123, in_i);
    assume value_is(__ctobpl_const_124, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_125, Mem_T.CHAR[PLUS(in_src, 1, Mem_T.INT4[in_i])]);
    goto label_19;

  label_35:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 125} true;
    call out_result.addstr$11 := addstr(45, in_dest, in_j, in_maxset);
    assume value_is(__ctobpl_const_156, in_dest);
    assume value_is(__ctobpl_const_157, in_j);
    assume value_is(__ctobpl_const_158, in_maxset);
    assume value_is(__ctobpl_const_159, in_dest);
    assume value_is(__ctobpl_const_160, in_j);
    assume value_is(__ctobpl_const_161, in_maxset);
    goto label_52;

  label_34_false:
    assume out_result.isalnum$6 == 0;
    assume value_is(__ctobpl_const_139, out_result.isalnum$6);
    goto label_35;

  label_42_false:
    assume out_result.isalnum$8 == 0;
    assume value_is(__ctobpl_const_147, out_result.isalnum$8);
    goto label_35;

  label_43_false:
    assume !INT_LEQ(Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))], 
  Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_148, in_src);
    assume value_is(__ctobpl_const_149, in_i);
    assume value_is(__ctobpl_const_150, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_151, 
  Mem_T.CHAR[PLUS(in_src, 1, MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_152, in_src);
    assume value_is(__ctobpl_const_153, in_i);
    assume value_is(__ctobpl_const_154, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_155, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_35;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 114} true;
    call out_result.addstr$5 := addstr(45, in_dest, in_j, in_maxset);
    assume value_is(__ctobpl_const_189, in_dest);
    assume value_is(__ctobpl_const_190, in_j);
    assume value_is(__ctobpl_const_191, in_maxset);
    assume value_is(__ctobpl_const_192, in_dest);
    assume value_is(__ctobpl_const_193, in_j);
    assume value_is(__ctobpl_const_194, in_maxset);
    goto label_29;

  label_25_false:
    assume Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))] == 0;
    assume value_is(__ctobpl_const_128, in_src);
    assume value_is(__ctobpl_const_129, in_i);
    assume value_is(__ctobpl_const_130, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_131, Mem_T.CHAR[PLUS(in_src, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    goto label_26;

  label_19_true:
    assume INT_LEQ(Mem_T.INT4[in_j], 1);
    assume value_is(__ctobpl_const_126, in_j);
    assume value_is(__ctobpl_const_127, Mem_T.INT4[in_j]);
    goto label_26;

  label_18_dummy:
    call {:si_unique_call 1} out_$addstr.arg.1$4$, out_escjunk, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, out_junk, out_k, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8 := dodash_loop_label_6_head(out_$addstr.arg.1$4$, in_delim, in_dest, out_escjunk, in_i, out_$isalnum.arg.1$7$, out_$isalnum.arg.1$9$, in_j, out_junk, out_k, in_maxset, out_result.addstr$2, out_result.addstr$3, out_result.addstr$5, out_result.addstr$10, out_result.addstr$11, out_result.esc$1, out_result.isalnum$6, out_result.isalnum$8, in_src);
    return;

  exit:
    return;
}



procedure dodash_loop_label_6_head(in_$addstr.arg.1$4$: int, 
    in_delim: int, 
    in_dest: int, 
    in_escjunk: int, 
    in_i: int, 
    in_$isalnum.arg.1$7$: int, 
    in_$isalnum.arg.1$9$: int, 
    in_j: int, 
    in_junk: int, 
    in_k: int, 
    in_maxset: int, 
    in_result.addstr$2: int, 
    in_result.addstr$3: int, 
    in_result.addstr$5: int, 
    in_result.addstr$10: int, 
    in_result.addstr$11: int, 
    in_result.esc$1: int, 
    in_result.isalnum$6: int, 
    in_result.isalnum$8: int, 
    in_src: int)
   returns (out_$addstr.arg.1$4$: int, 
    out_escjunk: int, 
    out_$isalnum.arg.1$7$: int, 
    out_$isalnum.arg.1$9$: int, 
    out_junk: int, 
    out_k: int, 
    out_result.addstr$2: int, 
    out_result.addstr$3: int, 
    out_result.addstr$5: int, 
    out_result.addstr$10: int, 
    out_result.addstr$11: int, 
    out_result.esc$1: int, 
    out_result.isalnum$6: int, 
    out_result.isalnum$8: int);
  modifies Mem_T.INT4;



implementation locate_loop_label_7_head(in_c: int, in_flag: int, in_i: int, in_offset: int, in_pat: int)
   returns (out_flag: int, out_i: int)
{

  entry:
    out_flag, out_i := in_flag, in_i;
    goto label_7_head;

  label_7_head:
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_LT(in_offset, out_i);
    assume value_is(__ctobpl_const_364, in_offset);
    assume value_is(__ctobpl_const_365, out_i);
    out_flag, out_i := in_flag, in_i;
    return;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 321} true;
    out_i := MINUS_BOTH_PTR_OR_BOTH_INT(out_i, 1, 1);
    assume value_is(__ctobpl_const_371, out_i);
    assume value_is(__ctobpl_const_372, out_i);
    goto label_10_dummy;

  label_9_false:
    assume !INT_EQ(in_c, Mem_T.CHAR[PLUS(in_pat, 1, out_i)]);
    assume value_is(__ctobpl_const_367, in_c);
    assume value_is(__ctobpl_const_368, in_pat);
    assume value_is(__ctobpl_const_369, out_i);
    assume value_is(__ctobpl_const_370, Mem_T.CHAR[PLUS(in_pat, 1, out_i)]);
    goto label_10;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 317} true;
    assert in_pat != 0;
    goto label_9_true, label_9_false;

  label_9_true:
    assume INT_EQ(in_c, Mem_T.CHAR[PLUS(in_pat, 1, out_i)]);
    assume value_is(__ctobpl_const_367, in_c);
    assume value_is(__ctobpl_const_368, in_pat);
    assume value_is(__ctobpl_const_369, out_i);
    assume value_is(__ctobpl_const_370, Mem_T.CHAR[PLUS(in_pat, 1, out_i)]);
    out_flag, out_i := in_flag, in_i;
    goto label_11;

  label_7_true:
    assume INT_LT(in_offset, out_i);
    assume value_is(__ctobpl_const_364, in_offset);
    assume value_is(__ctobpl_const_365, out_i);
    goto label_9;

  label_10_dummy:
    call {:si_unique_call 1} out_flag, out_i := locate_loop_label_7_head(in_c, out_flag, out_i, in_offset, in_pat);
    return;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 319} true;
    out_i := in_offset;
    assume value_is(__ctobpl_const_374, out_i);
    assume value_is(__ctobpl_const_375, in_offset);
    goto label_12_dummy;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 318} true;
    out_flag := 1;
    assume value_is(__ctobpl_const_373, out_flag);
    goto label_12;

  label_12_dummy:
    call {:si_unique_call 2} out_flag, out_i := locate_loop_label_7_head(in_c, out_flag, out_i, in_offset, in_pat);
    return;

  exit:
    return;
}



procedure locate_loop_label_7_head(in_c: int, in_flag: int, in_i: int, in_offset: int, in_pat: int)
   returns (out_flag: int, out_i: int);



implementation makepat_loop_label_16_head(in_arg: int, 
    in_delim: int, 
    in_done: int, 
    in_escjunk: int, 
    in_getres: int, 
    in_i: int, 
    in_$in_set_2.arg.1$7$: int, 
    in_j: int, 
    in_junk: int, 
    in_lastj: int, 
    in_lj: int, 
    in_pat: int, 
    in_result.addstr$2: int, 
    in_result.addstr$3: int, 
    in_result.addstr$4: int, 
    in_result.addstr$8: int, 
    in_result.addstr$10: int, 
    in_result.esc$9: int, 
    in_result.getccl$5: int, 
    in_result.in_set_2$6: int, 
    in_start: int)
   returns (out_done: int, 
    out_escjunk: int, 
    out_getres: int, 
    out_$in_set_2.arg.1$7$: int, 
    out_junk: int, 
    out_lastj: int, 
    out_lj: int, 
    out_result.addstr$2: int, 
    out_result.addstr$3: int, 
    out_result.addstr$4: int, 
    out_result.addstr$8: int, 
    out_result.addstr$10: int, 
    out_result.esc$9: int, 
    out_result.getccl$5: int, 
    out_result.in_set_2$6: int)
{

  entry:
    out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := in_done, in_escjunk, in_getres, in_$in_set_2.arg.1$7$, in_junk, in_lastj, in_lj, in_result.addstr$2, in_result.addstr$3, in_result.addstr$4, in_result.addstr$8, in_result.addstr$10, in_result.esc$9, in_result.getccl$5, in_result.in_set_2$6;
    goto label_16_head;

  label_16_head:
    goto label_16_true, label_16_false;

  label_16_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_406, out_done);
    out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := in_done, in_escjunk, in_getres, in_$in_set_2.arg.1$7$, in_junk, in_lastj, in_lj, in_result.addstr$2, in_result.addstr$3, in_result.addstr$4, in_result.addstr$8, in_result.addstr$10, in_result.esc$9, in_result.getccl$5, in_result.in_set_2$6;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_39:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 232} true;
    Mem_T.INT4 := Mem_T.INT4[in_i := PLUS(Mem_T.INT4[in_i], 1, 1)];
    assume value_is(__ctobpl_const_508, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_509, Mem_T.INT4[in_i]);
    goto label_39_dummy;

  label_38_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_507, out_done);
    goto label_39;

  label_38:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 231} true;
    goto label_38_true, label_38_false;

  label_38_true:
    assume out_done != 0;
    assume value_is(__ctobpl_const_507, out_done);
    out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := in_done, in_escjunk, in_getres, in_$in_set_2.arg.1$7$, in_junk, in_lastj, in_lj, in_result.addstr$2, in_result.addstr$3, in_result.addstr$4, in_result.addstr$8, in_result.addstr$10, in_result.esc$9, in_result.getccl$5, in_result.in_set_2$6;
    Mem_T.INT4 := old(Mem_T.INT4);
    goto label_38_true_dummy;

  label_37:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 230} true;
    out_lastj := out_lj;
    assume value_is(__ctobpl_const_505, out_lastj);
    assume value_is(__ctobpl_const_506, out_lj);
    goto label_38;

  label_80:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 228} true;
    out_junk := out_result.addstr$10;
    assume value_is(__ctobpl_const_457, out_junk);
    assume value_is(__ctobpl_const_458, out_result.addstr$10);
    goto label_37;

  label_68:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 222} true;
    call stclose(in_pat, in_j, out_lastj);
    assume value_is(__ctobpl_const_468, in_pat);
    assume value_is(__ctobpl_const_469, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_470, out_lastj);
    assume value_is(__ctobpl_const_471, in_pat);
    assume value_is(__ctobpl_const_472, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_473, out_lastj);
    goto label_37;

  label_71:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 220} true;
    out_done := 1;
    assume value_is(__ctobpl_const_474, out_done);
    goto label_37;

  label_57:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 214} true;
    out_done := LIFT(INT_EQ(out_getres, 0));
    assume value_is(__ctobpl_const_485, out_done);
    assume value_is(__ctobpl_const_486, out_getres);
    goto label_37;

  label_51:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 210} true;
    out_junk := out_result.addstr$4;
    assume value_is(__ctobpl_const_491, out_junk);
    assume value_is(__ctobpl_const_492, out_result.addstr$4);
    goto label_37;

  label_45:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 208} true;
    out_junk := out_result.addstr$3;
    assume value_is(__ctobpl_const_497, out_junk);
    assume value_is(__ctobpl_const_498, out_result.addstr$3);
    goto label_37;

  label_36:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 206} true;
    out_junk := out_result.addstr$2;
    assume value_is(__ctobpl_const_503, out_junk);
    assume value_is(__ctobpl_const_504, out_result.addstr$2);
    goto label_37;

  label_33:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 206} true;
    call out_result.addstr$2 := addstr(63, in_pat, in_j, 100);
    assume value_is(__ctobpl_const_499, in_pat);
    assume value_is(__ctobpl_const_500, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_501, in_pat);
    assume value_is(__ctobpl_const_502, Mem_T.INT4[in_j]);
    goto label_36;

  label_31_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 63);
    assume value_is(__ctobpl_const_416, in_arg);
    assume value_is(__ctobpl_const_417, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_418, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_33;

  label_31:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 205} true;
    assert in_arg != 0;
    goto label_31_true, label_31_false;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 204} true;
    out_lj := Mem_T.INT4[in_j];
    assume value_is(__ctobpl_const_414, out_lj);
    assume value_is(__ctobpl_const_415, Mem_T.INT4[in_j]);
    goto label_31;

  label_29_true:
    assume Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])] != 0;
    assume value_is(__ctobpl_const_411, in_arg);
    assume value_is(__ctobpl_const_412, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_413, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_30;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 203} true;
    assert in_arg != 0;
    goto label_29_true, label_29_false;

  label_29_false:
    assume Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])] == 0;
    assume value_is(__ctobpl_const_411, in_arg);
    assume value_is(__ctobpl_const_412, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_413, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := in_done, in_escjunk, in_getres, in_$in_set_2.arg.1$7$, in_junk, in_lastj, in_lj, in_result.addstr$2, in_result.addstr$3, in_result.addstr$4, in_result.addstr$8, in_result.addstr$10, in_result.esc$9, in_result.getccl$5, in_result.in_set_2$6;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_17_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], in_delim);
    assume value_is(__ctobpl_const_407, in_arg);
    assume value_is(__ctobpl_const_408, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_409, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    assume value_is(__ctobpl_const_410, in_delim);
    goto label_29;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 203} true;
    assert in_arg != 0;
    goto label_17_true, label_17_false;

  label_17_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], in_delim);
    assume value_is(__ctobpl_const_407, in_arg);
    assume value_is(__ctobpl_const_408, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_409, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    assume value_is(__ctobpl_const_410, in_delim);
    out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := in_done, in_escjunk, in_getres, in_$in_set_2.arg.1$7$, in_junk, in_lastj, in_lj, in_result.addstr$2, in_result.addstr$3, in_result.addstr$4, in_result.addstr$8, in_result.addstr$10, in_result.esc$9, in_result.getccl$5, in_result.in_set_2$6;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_16_false:
    assume out_done == 0;
    assume value_is(__ctobpl_const_406, out_done);
    goto label_17;

  label_42:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 208} true;
    call out_result.addstr$3 := addstr(37, in_pat, in_j, 100);
    assume value_is(__ctobpl_const_493, in_pat);
    assume value_is(__ctobpl_const_494, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_495, in_pat);
    assume value_is(__ctobpl_const_496, Mem_T.INT4[in_j]);
    goto label_45;

  label_41_true:
    assume INT_EQ(Mem_T.INT4[in_i], in_start);
    assume value_is(__ctobpl_const_422, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_423, in_start);
    goto label_42;

  label_41:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 207} true;
    goto label_41_true, label_41_false;

  label_32_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 37);
    assume value_is(__ctobpl_const_419, in_arg);
    assume value_is(__ctobpl_const_420, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_421, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_41;

  label_32:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 207} true;
    assert in_arg != 0;
    goto label_32_true, label_32_false;

  label_31_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 63);
    assume value_is(__ctobpl_const_416, in_arg);
    assume value_is(__ctobpl_const_417, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_418, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_32;

  label_48:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 210} true;
    call out_result.addstr$4 := addstr(36, in_pat, in_j, 100);
    assume value_is(__ctobpl_const_487, in_pat);
    assume value_is(__ctobpl_const_488, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_489, in_pat);
    assume value_is(__ctobpl_const_490, Mem_T.INT4[in_j]);
    goto label_51;

  label_47_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, PLUS(Mem_T.INT4[in_i], 1, 1))], in_delim);
    assume value_is(__ctobpl_const_427, in_arg);
    assume value_is(__ctobpl_const_428, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_429, Mem_T.CHAR[PLUS(in_arg, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_430, in_delim);
    goto label_48;

  label_47:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 209} true;
    assert in_arg != 0;
    goto label_47_true, label_47_false;

  label_40_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 36);
    assume value_is(__ctobpl_const_424, in_arg);
    assume value_is(__ctobpl_const_425, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_426, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_47;

  label_40:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 209} true;
    assert in_arg != 0;
    goto label_40_true, label_40_false;

  label_32_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 37);
    assume value_is(__ctobpl_const_419, in_arg);
    assume value_is(__ctobpl_const_420, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_421, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_40;

  label_41_false:
    assume !INT_EQ(Mem_T.INT4[in_i], in_start);
    assume value_is(__ctobpl_const_422, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_423, in_start);
    goto label_40;

  label_56:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 213} true;
    out_getres := out_result.getccl$5;
    assume value_is(__ctobpl_const_483, out_getres);
    assume value_is(__ctobpl_const_484, out_result.getccl$5);
    goto label_57;

  label_53:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 213} true;
    call out_result.getccl$5 := getccl(in_arg, in_i, in_pat, in_j);
    assume value_is(__ctobpl_const_475, in_arg);
    assume value_is(__ctobpl_const_476, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_477, in_pat);
    assume value_is(__ctobpl_const_478, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_479, in_arg);
    assume value_is(__ctobpl_const_480, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_481, in_pat);
    assume value_is(__ctobpl_const_482, Mem_T.INT4[in_j]);
    goto label_56;

  label_46_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 91);
    assume value_is(__ctobpl_const_431, in_arg);
    assume value_is(__ctobpl_const_432, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_433, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_53;

  label_46:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 211} true;
    assert in_arg != 0;
    goto label_46_true, label_46_false;

  label_40_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 36);
    assume value_is(__ctobpl_const_424, in_arg);
    assume value_is(__ctobpl_const_425, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_426, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_46;

  label_47_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, PLUS(Mem_T.INT4[in_i], 1, 1))], in_delim);
    assume value_is(__ctobpl_const_427, in_arg);
    assume value_is(__ctobpl_const_428, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_429, Mem_T.CHAR[PLUS(in_arg, 1, PLUS(Mem_T.INT4[in_i], 1, 1))]);
    assume value_is(__ctobpl_const_430, in_delim);
    goto label_46;

  label_67_true:
    assume out_result.in_set_2$6 != 0;
    assume value_is(__ctobpl_const_467, out_result.in_set_2$6);
    goto label_71;

  label_67:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 219} true;
    goto label_67_true, label_67_false;

  label_64:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 219} true;
    call out_result.in_set_2$6 := in_set_2(out_$in_set_2.arg.1$7$);
    assume value_is(__ctobpl_const_465, out_$in_set_2.arg.1$7$);
    assume value_is(__ctobpl_const_466, out_$in_set_2.arg.1$7$);
    goto label_67;

  label_63:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 219} true;
    assert in_pat != 0;
    out_$in_set_2.arg.1$7$ := Mem_T.CHAR[PLUS(in_pat, 1, out_lj)];
    assume value_is(__ctobpl_const_461, out_$in_set_2.arg.1$7$);
    assume value_is(__ctobpl_const_462, in_pat);
    assume value_is(__ctobpl_const_463, out_lj);
    assume value_is(__ctobpl_const_464, Mem_T.CHAR[PLUS(in_pat, 1, out_lj)]);
    goto label_64;

  label_62:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 218} true;
    out_lj := out_lastj;
    assume value_is(__ctobpl_const_459, out_lj);
    assume value_is(__ctobpl_const_460, out_lastj);
    goto label_63;

  label_61_true:
    assume INT_LT(in_start, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_437, in_start);
    assume value_is(__ctobpl_const_438, Mem_T.INT4[in_i]);
    goto label_62;

  label_61:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 216} true;
    goto label_61_true, label_61_false;

  label_52_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 42);
    assume value_is(__ctobpl_const_434, in_arg);
    assume value_is(__ctobpl_const_435, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_436, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_61;

  label_52:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 216} true;
    assert in_arg != 0;
    goto label_52_true, label_52_false;

  label_46_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 91);
    assume value_is(__ctobpl_const_431, in_arg);
    assume value_is(__ctobpl_const_432, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_433, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_52;

  label_67_false:
    assume out_result.in_set_2$6 == 0;
    assume value_is(__ctobpl_const_467, out_result.in_set_2$6);
    goto label_68;

  label_77:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 228} true;
    call out_result.addstr$10 := addstr(out_escjunk, in_pat, in_j, 100);
    assume value_is(__ctobpl_const_451, out_escjunk);
    assume value_is(__ctobpl_const_452, in_pat);
    assume value_is(__ctobpl_const_453, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_454, out_escjunk);
    assume value_is(__ctobpl_const_455, in_pat);
    assume value_is(__ctobpl_const_456, Mem_T.INT4[in_j]);
    goto label_80;

  label_76:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 227} true;
    out_escjunk := out_result.esc$9;
    assume value_is(__ctobpl_const_449, out_escjunk);
    assume value_is(__ctobpl_const_450, out_result.esc$9);
    goto label_77;

  label_73:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 227} true;
    call out_result.esc$9 := esc(in_arg, in_i);
    assume value_is(__ctobpl_const_445, in_arg);
    assume value_is(__ctobpl_const_446, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_447, in_arg);
    assume value_is(__ctobpl_const_448, Mem_T.INT4[in_i]);
    goto label_76;

  label_72:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 226} true;
    out_junk := out_result.addstr$8;
    assume value_is(__ctobpl_const_443, out_junk);
    assume value_is(__ctobpl_const_444, out_result.addstr$8);
    goto label_73;

  label_58:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 226} true;
    call out_result.addstr$8 := addstr(99, in_pat, in_j, 100);
    assume value_is(__ctobpl_const_439, in_pat);
    assume value_is(__ctobpl_const_440, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_441, in_pat);
    assume value_is(__ctobpl_const_442, Mem_T.INT4[in_j]);
    goto label_72;

  label_52_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 42);
    assume value_is(__ctobpl_const_434, in_arg);
    assume value_is(__ctobpl_const_435, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_436, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_58;

  label_61_false:
    assume !INT_LT(in_start, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_437, in_start);
    assume value_is(__ctobpl_const_438, Mem_T.INT4[in_i]);
    goto label_58;

  label_39_dummy:
    call {:si_unique_call 1} out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := makepat_loop_label_16_head(in_arg, in_delim, out_done, out_escjunk, out_getres, in_i, out_$in_set_2.arg.1$7$, in_j, out_junk, out_lastj, out_lj, in_pat, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6, in_start);
    return;

  label_38_true_dummy:
    call {:si_unique_call 2} out_done, out_escjunk, out_getres, out_$in_set_2.arg.1$7$, out_junk, out_lastj, out_lj, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6 := makepat_loop_label_16_head(in_arg, in_delim, out_done, out_escjunk, out_getres, in_i, out_$in_set_2.arg.1$7$, in_j, out_junk, out_lastj, out_lj, in_pat, out_result.addstr$2, out_result.addstr$3, out_result.addstr$4, out_result.addstr$8, out_result.addstr$10, out_result.esc$9, out_result.getccl$5, out_result.in_set_2$6, in_start);
    return;

  exit:
    return;
}



procedure makepat_loop_label_16_head(in_arg: int, 
    in_delim: int, 
    in_done: int, 
    in_escjunk: int, 
    in_getres: int, 
    in_i: int, 
    in_$in_set_2.arg.1$7$: int, 
    in_j: int, 
    in_junk: int, 
    in_lastj: int, 
    in_lj: int, 
    in_pat: int, 
    in_result.addstr$2: int, 
    in_result.addstr$3: int, 
    in_result.addstr$4: int, 
    in_result.addstr$8: int, 
    in_result.addstr$10: int, 
    in_result.esc$9: int, 
    in_result.getccl$5: int, 
    in_result.in_set_2$6: int, 
    in_start: int)
   returns (out_done: int, 
    out_escjunk: int, 
    out_getres: int, 
    out_$in_set_2.arg.1$7$: int, 
    out_junk: int, 
    out_lastj: int, 
    out_lj: int, 
    out_result.addstr$2: int, 
    out_result.addstr$3: int, 
    out_result.addstr$4: int, 
    out_result.addstr$8: int, 
    out_result.addstr$10: int, 
    out_result.esc$9: int, 
    out_result.getccl$5: int, 
    out_result.in_set_2$6: int);
  modifies Mem_T.INT4;



implementation makesub_loop_label_10_head(in_arg: int, 
    in_delim: int, 
    in_escjunk: int, 
    in_i: int, 
    in_j: int, 
    in_junk: int, 
    in_result.addstr$2: int, 
    in_result.addstr$4: int, 
    in_result.esc$3: int, 
    in_sub: int)
   returns (out_escjunk: int, 
    out_junk: int, 
    out_result.addstr$2: int, 
    out_result.addstr$4: int, 
    out_result.esc$3: int)
{

  entry:
    out_escjunk, out_junk, out_result.addstr$2, out_result.addstr$4, out_result.esc$3 := in_escjunk, in_junk, in_result.addstr$2, in_result.addstr$4, in_result.esc$3;
    goto label_10_head;

  label_10_head:
    assert in_arg != 0;
    goto label_10_true, label_10_false;

  label_10_false:
    assume !INT_NEQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], in_delim);
    assume value_is(__ctobpl_const_530, in_arg);
    assume value_is(__ctobpl_const_531, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_532, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    assume value_is(__ctobpl_const_533, in_delim);
    out_escjunk, out_junk, out_result.addstr$2, out_result.addstr$4, out_result.esc$3 := in_escjunk, in_junk, in_result.addstr$2, in_result.addstr$4, in_result.esc$3;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 277} true;
    Mem_T.INT4 := Mem_T.INT4[in_i := PLUS(Mem_T.INT4[in_i], 1, 1)];
    assume value_is(__ctobpl_const_578, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_579, Mem_T.INT4[in_i]);
    goto label_21_dummy;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 275} true;
    out_junk := out_result.addstr$4;
    assume value_is(__ctobpl_const_570, out_junk);
    assume value_is(__ctobpl_const_571, out_result.addstr$4);
    goto label_21;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 272} true;
    out_junk := out_result.addstr$2;
    assume value_is(__ctobpl_const_576, out_junk);
    assume value_is(__ctobpl_const_577, out_result.addstr$2);
    goto label_21;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 272} true;
    call out_result.addstr$2 := addstr(-1, in_sub, in_j, 100);
    assume value_is(__ctobpl_const_572, in_sub);
    assume value_is(__ctobpl_const_573, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_574, in_sub);
    assume value_is(__ctobpl_const_575, Mem_T.INT4[in_j]);
    goto label_20;

  label_13_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 38);
    assume value_is(__ctobpl_const_555, in_arg);
    assume value_is(__ctobpl_const_556, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_557, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_17;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 271} true;
    assert in_arg != 0;
    goto label_13_true, label_13_false;

  label_12_true:
    assume Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])] != 0;
    assume value_is(__ctobpl_const_534, in_arg);
    assume value_is(__ctobpl_const_535, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_536, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_13;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 270} true;
    assert in_arg != 0;
    goto label_12_true, label_12_false;

  label_12_false:
    assume Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])] == 0;
    assume value_is(__ctobpl_const_534, in_arg);
    assume value_is(__ctobpl_const_535, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_536, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    out_escjunk, out_junk, out_result.addstr$2, out_result.addstr$4, out_result.esc$3 := in_escjunk, in_junk, in_result.addstr$2, in_result.addstr$4, in_result.esc$3;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_10_true:
    assume INT_NEQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], in_delim);
    assume value_is(__ctobpl_const_530, in_arg);
    assume value_is(__ctobpl_const_531, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_532, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    assume value_is(__ctobpl_const_533, in_delim);
    goto label_12;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 275} true;
    call out_result.addstr$4 := addstr(out_escjunk, in_sub, in_j, 100);
    assume value_is(__ctobpl_const_564, out_escjunk);
    assume value_is(__ctobpl_const_565, in_sub);
    assume value_is(__ctobpl_const_566, Mem_T.INT4[in_j]);
    assume value_is(__ctobpl_const_567, out_escjunk);
    assume value_is(__ctobpl_const_568, in_sub);
    assume value_is(__ctobpl_const_569, Mem_T.INT4[in_j]);
    goto label_26;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 274} true;
    out_escjunk := out_result.esc$3;
    assume value_is(__ctobpl_const_562, out_escjunk);
    assume value_is(__ctobpl_const_563, out_result.esc$3);
    goto label_23;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 274} true;
    call out_result.esc$3 := esc(in_arg, in_i);
    assume value_is(__ctobpl_const_558, in_arg);
    assume value_is(__ctobpl_const_559, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_560, in_arg);
    assume value_is(__ctobpl_const_561, Mem_T.INT4[in_i]);
    goto label_22;

  label_13_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])], 38);
    assume value_is(__ctobpl_const_555, in_arg);
    assume value_is(__ctobpl_const_556, Mem_T.INT4[in_i]);
    assume value_is(__ctobpl_const_557, Mem_T.CHAR[PLUS(in_arg, 1, Mem_T.INT4[in_i])]);
    goto label_14;

  label_21_dummy:
    call {:si_unique_call 1} out_escjunk, out_junk, out_result.addstr$2, out_result.addstr$4, out_result.esc$3 := makesub_loop_label_10_head(in_arg, in_delim, out_escjunk, in_i, in_j, out_junk, out_result.addstr$2, out_result.addstr$4, out_result.esc$3, in_sub);
    return;

  exit:
    return;
}



procedure makesub_loop_label_10_head(in_arg: int, 
    in_delim: int, 
    in_escjunk: int, 
    in_i: int, 
    in_j: int, 
    in_junk: int, 
    in_result.addstr$2: int, 
    in_result.addstr$4: int, 
    in_result.esc$3: int, 
    in_sub: int)
   returns (out_escjunk: int, 
    out_junk: int, 
    out_result.addstr$2: int, 
    out_result.addstr$4: int, 
    out_result.esc$3: int);
  modifies Mem_T.INT4;



implementation putsub_loop_label_12_head(in_$fputc.arg.1$4$: int, 
    in_$fputc.arg.2$3$: int, 
    in_j: int, 
    in_lin: int, 
    in_result.__iob_func$2: int, 
    in_result.fputc$1: int, 
    in_s2: int)
   returns (out_$fputc.arg.1$4$: int, 
    out_$fputc.arg.2$3$: int, 
    out_j: int, 
    out_result.__iob_func$2: int, 
    out_result.fputc$1: int)
{

  entry:
    out_$fputc.arg.1$4$, out_$fputc.arg.2$3$, out_j, out_result.__iob_func$2, out_result.fputc$1 := in_$fputc.arg.1$4$, in_$fputc.arg.2$3$, in_j, in_result.__iob_func$2, in_result.fputc$1;
    goto label_12_head;

  label_12_head:
    goto label_12_true, label_12_false;

  label_12_false:
    assume !INT_LT(out_j, in_s2);
    assume value_is(__ctobpl_const_713, out_j);
    assume value_is(__ctobpl_const_714, in_s2);
    out_$fputc.arg.1$4$, out_$fputc.arg.2$3$, out_j, out_result.__iob_func$2, out_result.fputc$1 := in_$fputc.arg.1$4$, in_$fputc.arg.2$3$, in_j, in_result.__iob_func$2, in_result.fputc$1;
    return;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    assume value_is(__ctobpl_const_727, out_j);
    out_j := PLUS(out_j, 1, 1);
    goto label_22_dummy;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    call out_result.fputc$1 := fputc(out_$fputc.arg.1$4$, out_$fputc.arg.2$3$);
    assume value_is(__ctobpl_const_723, out_$fputc.arg.1$4$);
    assume value_is(__ctobpl_const_724, out_$fputc.arg.2$3$);
    assume value_is(__ctobpl_const_725, out_$fputc.arg.1$4$);
    assume value_is(__ctobpl_const_726, out_$fputc.arg.2$3$);
    goto label_22;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    assert in_lin != 0;
    out_$fputc.arg.1$4$ := Mem_T.CHAR[PLUS(in_lin, 1, out_j)];
    assume value_is(__ctobpl_const_719, out_$fputc.arg.1$4$);
    assume value_is(__ctobpl_const_720, in_lin);
    assume value_is(__ctobpl_const_721, out_j);
    assume value_is(__ctobpl_const_722, Mem_T.CHAR[PLUS(in_lin, 1, out_j)]);
    goto label_19;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    assert out_result.__iob_func$2 != 0;
    out_$fputc.arg.2$3$ := PLUS(out_result.__iob_func$2, 32, 1);
    assume value_is(__ctobpl_const_717, out_$fputc.arg.2$3$);
    assume value_is(__ctobpl_const_718, out_result.__iob_func$2);
    goto label_18;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    call out_result.__iob_func$2 := __iob_func();
    goto label_17;

  label_12_true:
    assume INT_LT(out_j, in_s2);
    assume value_is(__ctobpl_const_713, out_j);
    assume value_is(__ctobpl_const_714, in_s2);
    goto label_14;

  label_22_dummy:
    call {:si_unique_call 1} out_$fputc.arg.1$4$, out_$fputc.arg.2$3$, out_j, out_result.__iob_func$2, out_result.fputc$1 := putsub_loop_label_12_head(out_$fputc.arg.1$4$, out_$fputc.arg.2$3$, out_j, in_lin, out_result.__iob_func$2, out_result.fputc$1, in_s2);
    return;

  exit:
    return;
}



procedure putsub_loop_label_12_head(in_$fputc.arg.1$4$: int, 
    in_$fputc.arg.2$3$: int, 
    in_j: int, 
    in_lin: int, 
    in_result.__iob_func$2: int, 
    in_result.fputc$1: int, 
    in_s2: int)
   returns (out_$fputc.arg.1$4$: int, 
    out_$fputc.arg.2$3$: int, 
    out_j: int, 
    out_result.__iob_func$2: int, 
    out_result.fputc$1: int);



implementation putsub_loop_label_6_head(in_$fputc.arg.1$4$: int, 
    in_$fputc.arg.1$8$: int, 
    in_$fputc.arg.2$3$: int, 
    in_$fputc.arg.2$7$: int, 
    in_i: int, 
    in_j: int, 
    in_lin: int, 
    in_result.__iob_func$2: int, 
    in_result.__iob_func$6: int, 
    in_result.fputc$1: int, 
    in_result.fputc$5: int, 
    in_s1: int, 
    in_s2: int, 
    in_sub: int)
   returns (out_$fputc.arg.1$4$: int, 
    out_$fputc.arg.1$8$: int, 
    out_$fputc.arg.2$3$: int, 
    out_$fputc.arg.2$7$: int, 
    out_i: int, 
    out_j: int, 
    out_result.__iob_func$2: int, 
    out_result.__iob_func$6: int, 
    out_result.fputc$1: int, 
    out_result.fputc$5: int)
{

  entry:
    out_$fputc.arg.1$4$, out_$fputc.arg.1$8$, out_$fputc.arg.2$3$, out_$fputc.arg.2$7$, out_i, out_j, out_result.__iob_func$2, out_result.__iob_func$6, out_result.fputc$1, out_result.fputc$5 := in_$fputc.arg.1$4$, in_$fputc.arg.1$8$, in_$fputc.arg.2$3$, in_$fputc.arg.2$7$, in_i, in_j, in_result.__iob_func$2, in_result.__iob_func$6, in_result.fputc$1, in_result.fputc$5;
    goto label_6_head;

  label_6_head:
    assert in_sub != 0;
    goto label_6_true, label_6_false;

  label_6_false:
    assume Mem_T.CHAR[PLUS(in_sub, 1, out_i)] == 0;
    assume value_is(__ctobpl_const_695, in_sub);
    assume value_is(__ctobpl_const_696, out_i);
    assume value_is(__ctobpl_const_697, Mem_T.CHAR[PLUS(in_sub, 1, out_i)]);
    out_$fputc.arg.1$4$, out_$fputc.arg.1$8$, out_$fputc.arg.2$3$, out_$fputc.arg.2$7$, out_i, out_j, out_result.__iob_func$2, out_result.__iob_func$6, out_result.fputc$1, out_result.fputc$5 := in_$fputc.arg.1$4$, in_$fputc.arg.1$8$, in_$fputc.arg.2$3$, in_$fputc.arg.2$7$, in_i, in_j, in_result.__iob_func$2, in_result.__iob_func$6, in_result.fputc$1, in_result.fputc$5;
    return;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 477} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_715, out_i);
    assume value_is(__ctobpl_const_716, out_i);
    goto label_13_dummy;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    call out_result.fputc$5 := fputc(out_$fputc.arg.1$8$, out_$fputc.arg.2$7$);
    assume value_is(__ctobpl_const_707, out_$fputc.arg.1$8$);
    assume value_is(__ctobpl_const_708, out_$fputc.arg.2$7$);
    assume value_is(__ctobpl_const_709, out_$fputc.arg.1$8$);
    assume value_is(__ctobpl_const_710, out_$fputc.arg.2$7$);
    goto label_13;

  label_12_false:
    assume !INT_LT(out_j, in_s2);
    assume value_is(__ctobpl_const_713, out_j);
    assume value_is(__ctobpl_const_714, in_s2);
    goto label_13;

  label_12_head:
    call out_$fputc.arg.1$4$, out_$fputc.arg.2$3$, out_j, out_result.__iob_func$2, out_result.fputc$1 := putsub_loop_label_12_head(out_$fputc.arg.1$4$, out_$fputc.arg.2$3$, out_j, in_lin, out_result.__iob_func$2, out_result.fputc$1, in_s2);
    goto label_12_head_last;

  label_12_head_last:
    out_$fputc.arg.1$4$, out_$fputc.arg.1$8$, out_$fputc.arg.2$3$, out_$fputc.arg.2$7$, out_i, out_j, out_result.__iob_func$2, out_result.__iob_func$6, out_result.fputc$1, out_result.fputc$5 := in_$fputc.arg.1$4$, in_$fputc.arg.1$8$, in_$fputc.arg.2$3$, in_$fputc.arg.2$7$, in_i, in_j, in_result.__iob_func$2, in_result.__iob_func$6, in_result.fputc$1, in_result.fputc$5;
    goto label_12_true, label_12_false;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    goto label_12_head;

  label_22:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    assume value_is(__ctobpl_const_727, out_j);
    out_j := PLUS(out_j, 1, 1);
    goto label_22_dummy;

  label_22_dummy:
    assume false;
    out_$fputc.arg.1$4$, out_$fputc.arg.1$8$, out_$fputc.arg.2$3$, out_$fputc.arg.2$7$, out_i, out_j, out_result.__iob_func$2, out_result.__iob_func$6, out_result.fputc$1, out_result.fputc$5 := in_$fputc.arg.1$4$, in_$fputc.arg.1$8$, in_$fputc.arg.2$3$, in_$fputc.arg.2$7$, in_i, in_j, in_result.__iob_func$2, in_result.__iob_func$6, in_result.fputc$1, in_result.fputc$5;
    return;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    call out_result.fputc$1 := fputc(out_$fputc.arg.1$4$, out_$fputc.arg.2$3$);
    assume value_is(__ctobpl_const_723, out_$fputc.arg.1$4$);
    assume value_is(__ctobpl_const_724, out_$fputc.arg.2$3$);
    assume value_is(__ctobpl_const_725, out_$fputc.arg.1$4$);
    assume value_is(__ctobpl_const_726, out_$fputc.arg.2$3$);
    goto label_22;

  label_18:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    assert in_lin != 0;
    out_$fputc.arg.1$4$ := Mem_T.CHAR[PLUS(in_lin, 1, out_j)];
    assume value_is(__ctobpl_const_719, out_$fputc.arg.1$4$);
    assume value_is(__ctobpl_const_720, in_lin);
    assume value_is(__ctobpl_const_721, out_j);
    assume value_is(__ctobpl_const_722, Mem_T.CHAR[PLUS(in_lin, 1, out_j)]);
    goto label_19;

  label_17:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    assert out_result.__iob_func$2 != 0;
    out_$fputc.arg.2$3$ := PLUS(out_result.__iob_func$2, 32, 1);
    assume value_is(__ctobpl_const_717, out_$fputc.arg.2$3$);
    assume value_is(__ctobpl_const_718, out_result.__iob_func$2);
    goto label_18;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 471} true;
    call out_result.__iob_func$2 := __iob_func();
    goto label_17;

  label_12_true:
    assume INT_LT(out_j, in_s2);
    assume value_is(__ctobpl_const_713, out_j);
    assume value_is(__ctobpl_const_714, in_s2);
    goto label_14;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 469} true;
    out_j := in_s1;
    assume value_is(__ctobpl_const_711, out_j);
    assume value_is(__ctobpl_const_712, in_s1);
    goto label_12;

  label_7_true:
    assume INT_EQ(Mem_T.CHAR[PLUS(in_sub, 1, out_i)], -1);
    assume value_is(__ctobpl_const_698, in_sub);
    assume value_is(__ctobpl_const_699, out_i);
    assume value_is(__ctobpl_const_700, Mem_T.CHAR[PLUS(in_sub, 1, out_i)]);
    goto label_11;

  label_7:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 468} true;
    assert in_sub != 0;
    goto label_7_true, label_7_false;

  label_6_true:
    assume Mem_T.CHAR[PLUS(in_sub, 1, out_i)] != 0;
    assume value_is(__ctobpl_const_695, in_sub);
    assume value_is(__ctobpl_const_696, out_i);
    assume value_is(__ctobpl_const_697, Mem_T.CHAR[PLUS(in_sub, 1, out_i)]);
    goto label_7;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    assert in_sub != 0;
    out_$fputc.arg.1$8$ := Mem_T.CHAR[PLUS(in_sub, 1, out_i)];
    assume value_is(__ctobpl_const_703, out_$fputc.arg.1$8$);
    assume value_is(__ctobpl_const_704, in_sub);
    assume value_is(__ctobpl_const_705, out_i);
    assume value_is(__ctobpl_const_706, Mem_T.CHAR[PLUS(in_sub, 1, out_i)]);
    goto label_25;

  label_23:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    assert out_result.__iob_func$6 != 0;
    out_$fputc.arg.2$7$ := PLUS(out_result.__iob_func$6, 32, 1);
    assume value_is(__ctobpl_const_701, out_$fputc.arg.2$7$);
    assume value_is(__ctobpl_const_702, out_result.__iob_func$6);
    goto label_24;

  label_8:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 475} true;
    call out_result.__iob_func$6 := __iob_func();
    goto label_23;

  label_7_false:
    assume !INT_EQ(Mem_T.CHAR[PLUS(in_sub, 1, out_i)], -1);
    assume value_is(__ctobpl_const_698, in_sub);
    assume value_is(__ctobpl_const_699, out_i);
    assume value_is(__ctobpl_const_700, Mem_T.CHAR[PLUS(in_sub, 1, out_i)]);
    goto label_8;

  label_13_dummy:
    call {:si_unique_call 1} out_$fputc.arg.1$4$, out_$fputc.arg.1$8$, out_$fputc.arg.2$3$, out_$fputc.arg.2$7$, out_i, out_j, out_result.__iob_func$2, out_result.__iob_func$6, out_result.fputc$1, out_result.fputc$5 := putsub_loop_label_6_head(out_$fputc.arg.1$4$, out_$fputc.arg.1$8$, out_$fputc.arg.2$3$, out_$fputc.arg.2$7$, out_i, out_j, in_lin, out_result.__iob_func$2, out_result.__iob_func$6, out_result.fputc$1, out_result.fputc$5, in_s1, in_s2, in_sub);
    return;

  exit:
    return;
}



procedure putsub_loop_label_6_head(in_$fputc.arg.1$4$: int, 
    in_$fputc.arg.1$8$: int, 
    in_$fputc.arg.2$3$: int, 
    in_$fputc.arg.2$7$: int, 
    in_i: int, 
    in_j: int, 
    in_lin: int, 
    in_result.__iob_func$2: int, 
    in_result.__iob_func$6: int, 
    in_result.fputc$1: int, 
    in_result.fputc$5: int, 
    in_s1: int, 
    in_s2: int, 
    in_sub: int)
   returns (out_$fputc.arg.1$4$: int, 
    out_$fputc.arg.1$8$: int, 
    out_$fputc.arg.2$3$: int, 
    out_$fputc.arg.2$7$: int, 
    out_i: int, 
    out_j: int, 
    out_result.__iob_func$2: int, 
    out_result.__iob_func$6: int, 
    out_result.fputc$1: int, 
    out_result.fputc$5: int);



implementation stclose_loop_label_7_head(in_$addstr.arg.1$2$: int, 
    in_jp: int, 
    in_jt: int, 
    in_junk: int, 
    in_lastj: int, 
    in_pat: int, 
    in_result.addstr$1: int)
   returns (out_$addstr.arg.1$2$: int, out_jp: int, out_junk: int, out_result.addstr$1: int)
{

  entry:
    out_$addstr.arg.1$2$, out_jp, out_junk, out_result.addstr$1 := in_$addstr.arg.1$2$, in_jp, in_junk, in_result.addstr$1;
    goto label_7_head;

  label_7_head:
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_LEQ(in_lastj, out_jp);
    assume value_is(__ctobpl_const_731, in_lastj);
    assume value_is(__ctobpl_const_732, out_jp);
    out_$addstr.arg.1$2$, out_jp, out_junk, out_result.addstr$1 := in_$addstr.arg.1$2$, in_jp, in_junk, in_result.addstr$1;
    Mem_T.INT4 := old(Mem_T.INT4);
    return;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 164} true;
    assume value_is(__ctobpl_const_754, out_jp);
    out_jp := MINUS_BOTH_PTR_OR_BOTH_INT(out_jp, 1, 1);
    goto label_15_dummy;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 167} true;
    out_junk := out_result.addstr$1;
    assume value_is(__ctobpl_const_752, out_junk);
    assume value_is(__ctobpl_const_753, out_result.addstr$1);
    goto label_15;

  label_11:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 167} true;
    call out_result.addstr$1 := addstr(out_$addstr.arg.1$2$, in_pat, in_jt, 100);
    assume value_is(__ctobpl_const_746, out_$addstr.arg.1$2$);
    assume value_is(__ctobpl_const_747, in_pat);
    assume value_is(__ctobpl_const_748, Mem_T.INT4[in_jt]);
    assume value_is(__ctobpl_const_749, out_$addstr.arg.1$2$);
    assume value_is(__ctobpl_const_750, in_pat);
    assume value_is(__ctobpl_const_751, Mem_T.INT4[in_jt]);
    goto label_14;

  label_10:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 167} true;
    assert in_pat != 0;
    out_$addstr.arg.1$2$ := Mem_T.CHAR[PLUS(in_pat, 1, out_jp)];
    assume value_is(__ctobpl_const_742, out_$addstr.arg.1$2$);
    assume value_is(__ctobpl_const_743, in_pat);
    assume value_is(__ctobpl_const_744, out_jp);
    assume value_is(__ctobpl_const_745, Mem_T.CHAR[PLUS(in_pat, 1, out_jp)]);
    goto label_11;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 166} true;
    Mem_T.INT4 := Mem_T.INT4[in_jt := PLUS(out_jp, 1, 1)];
    assume value_is(__ctobpl_const_740, Mem_T.INT4[in_jt]);
    assume value_is(__ctobpl_const_741, out_jp);
    goto label_10;

  label_7_true:
    assume INT_LEQ(in_lastj, out_jp);
    assume value_is(__ctobpl_const_731, in_lastj);
    assume value_is(__ctobpl_const_732, out_jp);
    goto label_9;

  label_15_dummy:
    call {:si_unique_call 1} out_$addstr.arg.1$2$, out_jp, out_junk, out_result.addstr$1 := stclose_loop_label_7_head(out_$addstr.arg.1$2$, out_jp, in_jt, out_junk, in_lastj, in_pat, out_result.addstr$1);
    return;

  exit:
    return;
}



procedure stclose_loop_label_7_head(in_$addstr.arg.1$2$: int, 
    in_jp: int, 
    in_jt: int, 
    in_junk: int, 
    in_lastj: int, 
    in_pat: int, 
    in_result.addstr$1: int)
   returns (out_$addstr.arg.1$2$: int, out_jp: int, out_junk: int, out_result.addstr$1: int);
  modifies Mem_T.INT4;



implementation subline_loop_label_8_head(in_$fputc.arg.1$5$: int, 
    in_$fputc.arg.2$4$: int, 
    in_i: int, 
    in_lastm: int, 
    in_lin: int, 
    in_m: int, 
    in_pat: int, 
    in_result.__iob_func$3: int, 
    in_result.amatch$1: int, 
    in_result.fputc$2: int, 
    in_sub: int)
   returns (out_$fputc.arg.1$5$: int, 
    out_$fputc.arg.2$4$: int, 
    out_i: int, 
    out_lastm: int, 
    out_m: int, 
    out_result.__iob_func$3: int, 
    out_result.amatch$1: int, 
    out_result.fputc$2: int)
{

  entry:
    out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, out_m, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2 := in_$fputc.arg.1$5$, in_$fputc.arg.2$4$, in_i, in_lastm, in_m, in_result.__iob_func$3, in_result.amatch$1, in_result.fputc$2;
    goto label_8_head;

  label_8_head:
    assert in_lin != 0;
    goto label_8_true, label_8_false;

  label_8_false:
    assume Mem_T.CHAR[PLUS(in_lin, 1, out_i)] == 0;
    assume value_is(__ctobpl_const_757, in_lin);
    assume value_is(__ctobpl_const_758, out_i);
    assume value_is(__ctobpl_const_759, Mem_T.CHAR[PLUS(in_lin, 1, out_i)]);
    out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, out_m, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2 := in_$fputc.arg.1$5$, in_$fputc.arg.2$4$, in_i, in_lastm, in_m, in_result.__iob_func$3, in_result.amatch$1, in_result.fputc$2;
    return;

  label_30:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 502} true;
    out_i := out_m;
    assume value_is(__ctobpl_const_784, out_i);
    assume value_is(__ctobpl_const_785, out_m);
    goto label_30_dummy;

  label_20_false:
    assume !INT_EQ(out_m, out_i);
    assume value_is(__ctobpl_const_782, out_m);
    assume value_is(__ctobpl_const_783, out_i);
    goto label_30;

  label_20:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 498} true;
    goto label_20_true, label_20_false;

  label_20_true:
    assume INT_EQ(out_m, out_i);
    assume value_is(__ctobpl_const_782, out_m);
    assume value_is(__ctobpl_const_783, out_i);
    out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, out_m, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2 := in_$fputc.arg.1$5$, in_$fputc.arg.2$4$, in_i, in_lastm, in_m, in_result.__iob_func$3, in_result.amatch$1, in_result.fputc$2;
    goto label_21;

  label_14_false:
    assume !INT_EQ(out_m, -1);
    assume value_is(__ctobpl_const_781, out_m);
    goto label_20;

  label_14:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 498} true;
    goto label_14_true, label_14_false;

  label_14_true:
    assume INT_EQ(out_m, -1);
    assume value_is(__ctobpl_const_781, out_m);
    out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, out_m, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2 := in_$fputc.arg.1$5$, in_$fputc.arg.2$4$, in_i, in_lastm, in_m, in_result.__iob_func$3, in_result.amatch$1, in_result.fputc$2;
    goto label_21;

  label_13_false:
    assume !INT_LEQ(0, out_m);
    assume value_is(__ctobpl_const_768, out_m);
    goto label_14;

  label_15_false:
    assume !INT_NEQ(out_lastm, out_m);
    assume value_is(__ctobpl_const_769, out_lastm);
    assume value_is(__ctobpl_const_770, out_m);
    goto label_14;

  label_19:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 496} true;
    out_lastm := out_m;
    assume value_is(__ctobpl_const_779, out_lastm);
    assume value_is(__ctobpl_const_780, out_m);
    goto label_14;

  label_16:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 495} true;
    call putsub(in_lin, out_i, out_m, in_sub);
    assume value_is(__ctobpl_const_771, in_lin);
    assume value_is(__ctobpl_const_772, out_i);
    assume value_is(__ctobpl_const_773, out_m);
    assume value_is(__ctobpl_const_774, in_sub);
    assume value_is(__ctobpl_const_775, in_lin);
    assume value_is(__ctobpl_const_776, out_i);
    assume value_is(__ctobpl_const_777, out_m);
    assume value_is(__ctobpl_const_778, in_sub);
    goto label_19;

  label_15_true:
    assume INT_NEQ(out_lastm, out_m);
    assume value_is(__ctobpl_const_769, out_lastm);
    assume value_is(__ctobpl_const_770, out_m);
    goto label_16;

  label_15:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 494} true;
    goto label_15_true, label_15_false;

  label_13_true:
    assume INT_LEQ(0, out_m);
    assume value_is(__ctobpl_const_768, out_m);
    goto label_15;

  label_13:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 494} true;
    goto label_13_true, label_13_false;

  label_12:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 493} true;
    out_m := out_result.amatch$1;
    assume value_is(__ctobpl_const_766, out_m);
    assume value_is(__ctobpl_const_767, out_result.amatch$1);
    goto label_13;

  label_9:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 493} true;
    call out_result.amatch$1 := amatch(in_lin, out_i, in_pat, 0);
    assume value_is(__ctobpl_const_760, in_lin);
    assume value_is(__ctobpl_const_761, out_i);
    assume value_is(__ctobpl_const_762, in_pat);
    assume value_is(__ctobpl_const_763, in_lin);
    assume value_is(__ctobpl_const_764, out_i);
    assume value_is(__ctobpl_const_765, in_pat);
    goto label_12;

  label_8_true:
    assume Mem_T.CHAR[PLUS(in_lin, 1, out_i)] != 0;
    assume value_is(__ctobpl_const_757, in_lin);
    assume value_is(__ctobpl_const_758, out_i);
    assume value_is(__ctobpl_const_759, Mem_T.CHAR[PLUS(in_lin, 1, out_i)]);
    goto label_9;

  label_30_dummy:
    call {:si_unique_call 1} out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, out_m, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2 := subline_loop_label_8_head(out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, in_lin, out_m, in_pat, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2, in_sub);
    return;

  label_29:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 500} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_796, out_i);
    assume value_is(__ctobpl_const_797, out_i);
    goto label_29_dummy;

  label_26:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    call out_result.fputc$2 := fputc(out_$fputc.arg.1$5$, out_$fputc.arg.2$4$);
    assume value_is(__ctobpl_const_792, out_$fputc.arg.1$5$);
    assume value_is(__ctobpl_const_793, out_$fputc.arg.2$4$);
    assume value_is(__ctobpl_const_794, out_$fputc.arg.1$5$);
    assume value_is(__ctobpl_const_795, out_$fputc.arg.2$4$);
    goto label_29;

  label_25:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    assert in_lin != 0;
    out_$fputc.arg.1$5$ := Mem_T.CHAR[PLUS(in_lin, 1, out_i)];
    assume value_is(__ctobpl_const_788, out_$fputc.arg.1$5$);
    assume value_is(__ctobpl_const_789, in_lin);
    assume value_is(__ctobpl_const_790, out_i);
    assume value_is(__ctobpl_const_791, Mem_T.CHAR[PLUS(in_lin, 1, out_i)]);
    goto label_26;

  label_24:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    assert out_result.__iob_func$3 != 0;
    out_$fputc.arg.2$4$ := PLUS(out_result.__iob_func$3, 32, 1);
    assume value_is(__ctobpl_const_786, out_$fputc.arg.2$4$);
    assume value_is(__ctobpl_const_787, out_result.__iob_func$3);
    goto label_25;

  label_21:
    assert {:sourcefile ".\source\replace.c"} {:sourceline 499} true;
    call out_result.__iob_func$3 := __iob_func();
    goto label_24;

  label_29_dummy:
    call {:si_unique_call 2} out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, out_m, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2 := subline_loop_label_8_head(out_$fputc.arg.1$5$, out_$fputc.arg.2$4$, out_i, out_lastm, in_lin, out_m, in_pat, out_result.__iob_func$3, out_result.amatch$1, out_result.fputc$2, in_sub);
    return;

  exit:
    return;
}



procedure subline_loop_label_8_head(in_$fputc.arg.1$5$: int, 
    in_$fputc.arg.2$4$: int, 
    in_i: int, 
    in_lastm: int, 
    in_lin: int, 
    in_m: int, 
    in_pat: int, 
    in_result.__iob_func$3: int, 
    in_result.amatch$1: int, 
    in_result.fputc$2: int, 
    in_sub: int)
   returns (out_$fputc.arg.1$5$: int, 
    out_$fputc.arg.2$4$: int, 
    out_i: int, 
    out_lastm: int, 
    out_m: int, 
    out_result.__iob_func$3: int, 
    out_result.amatch$1: int, 
    out_result.fputc$2: int);


