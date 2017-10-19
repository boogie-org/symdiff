type {:extern} name;

type {:extern} byte;

function {:extern} OneByteToInt(byte) : int;

function {:extern} TwoBytesToInt(byte, byte) : int;

function {:extern} FourBytesToInt(byte, byte, byte, byte) : int;

axiom (forall b0: byte, c0: byte :: { OneByteToInt(b0), OneByteToInt(c0) } OneByteToInt(b0) == OneByteToInt(c0) ==> b0 == c0);

axiom (forall b0: byte, b1: byte, c0: byte, c1: byte :: { TwoBytesToInt(b0, b1), TwoBytesToInt(c0, c1) } TwoBytesToInt(b0, b1) == TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);

axiom (forall b0: byte, b1: byte, b2: byte, b3: byte, c0: byte, c1: byte, c2: byte, c3: byte :: { FourBytesToInt(b0, b1, b2, b3), FourBytesToInt(c0, c1, c2, c3) } FourBytesToInt(b0, b1, b2, b3) == FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

var {:extern} Mem: [name][int]int;

var {:extern} alloc: int;

function {:extern} Field(int) : name;

function {:extern} Base(int) : int;

axiom (forall x: int :: { Base(x) } INT_LEQ(Base(x), x));

function {:extern} DT(int) : name;

var {:extern} Mem_T.CHAR: [int]int;

var {:extern} Mem_T.FLOAT: [int]int;

var {:extern} Mem_T.INT4: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.CHAR: name;

const {:extern} unique T.FLOAT: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PCHAR: name;

const {:extern} unique T.PFLOAT: name;

const {:extern} unique T.PINT4: name;

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

axiom (forall a: int, b: int, size: int :: { MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } INT_LEQ(INT_MULT(size, MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size)), INT_SUB(a, b)) && INT_LT(INT_SUB(a, b), INT_MULT(size, INT_ADD(MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size), 1))));

axiom (forall a: int, b: int, size: int :: { MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } MINUS_BOTH_PTR_OR_BOTH_INT(a, b, 1) == INT_SUB(a, b));

function {:extern} MINUS_LEFT_PTR(a: int, a_size: int, b: int) : int;

axiom (forall a: int, a_size: int, b: int :: { MINUS_LEFT_PTR(a, a_size, b) } MINUS_LEFT_PTR(a, a_size, b) == INT_SUB(a, INT_MULT(a_size, b)));

function {:extern} PLUS(a: int, a_size: int, b: int) : int;

axiom (forall a: int, a_size: int, b: int :: { PLUS(a, a_size, b) } PLUS(a, a_size, b) == INT_ADD(a, INT_MULT(a_size, b)));

function {:extern} MULT(a: int, b: int) : int;

axiom (forall a: int, b: int :: { MULT(a, b) } MULT(a, b) == INT_MULT(a, b));

function {:extern} DIV(a: int, b: int) : int;

function {:extern} BINARY_UNKNOWN(a: int, b: int) : int;

axiom (forall a: int, b: int :: { DIV(a, b) } a >= 0 && b > 0 ==> b * DIV(a, b) <= a && a < b * (DIV(a, b) + 1));

axiom (forall a: int, b: int :: { DIV(a, b) } a >= 0 && b < 0 ==> b * DIV(a, b) <= a && a < b * (DIV(a, b) - 1));

axiom (forall a: int, b: int :: { DIV(a, b) } a < 0 && b > 0 ==> b * DIV(a, b) >= a && a > b * (DIV(a, b) - 1));

axiom (forall a: int, b: int :: { DIV(a, b) } a < 0 && b < 0 ==> b * DIV(a, b) >= a && a > b * (DIV(a, b) + 1));

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

axiom (forall a: int, b: int :: { BIT_BAND(a, b) } POW2(a) && POW2(b) && a != b ==> BIT_BAND(a, b) == 0);

axiom (forall a: int, b: int :: { BIT_BAND(a, b) } a == 0 || b == 0 ==> BIT_BAND(a, b) == 0);

function {:extern} BIT_BOR(a: int, b: int) : int;

function {:extern} BIT_BXOR(a: int, b: int) : int;

function {:extern} BIT_BNOT(a: int) : int;

function {:extern} choose(a: bool, b: int, c: int) : int;

axiom (forall a: bool, b: int, c: int :: { choose(a, b, c) } a ==> choose(a, b, c) == b);

axiom (forall a: bool, b: int, c: int :: { choose(a, b, c) } !a ==> choose(a, b, c) == c);

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
  ensures Subset(Empty(), Array(p, 1, n)) && (forall i: int :: { ret[i] } Array(p, 1, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 1, n)) && (forall i: int :: { ret[i] } Array(p, 1, n)[i] ==> ret[i] == c);



procedure {:extern} __HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 2, n)) && (forall i: int :: { ret[i] } Array(p, 2, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 2, n)) && (forall i: int :: { ret[i] } Array(p, 2, n)[i] ==> ret[i] == c);



procedure {:extern} __HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 4, n)) && (forall i: int :: { ret[i] } Array(p, 4, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 4, n)) && (forall i: int :: { ret[i] } Array(p, 4, n)[i] ==> ret[i] == c);



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

axiom (forall n: int, x: int, y: int :: { AtLeast(n, x)[y] } AtLeast(n, x)[y] ==> INT_LEQ(x, y) && Rep(n, x) == Rep(n, y));

axiom (forall n: int, x: int, y: int :: { AtLeast(n, x), Rep(n, x), Rep(n, y) } INT_LEQ(x, y) && Rep(n, x) == Rep(n, y) ==> AtLeast(n, x)[y]);

axiom (forall n: int, x: int :: { AtLeast(n, x) } AtLeast(n, x)[x]);

axiom (forall n: int, x: int, z: int :: { PLUS(x, n, z) } Rep(n, x) == Rep(n, PLUS(x, n, z)));

axiom (forall n: int, x: int :: { Rep(n, x) } (exists k: int :: INT_SUB(Rep(n, x), x) == INT_MULT(n, k)));

function {:extern} Array(int, int, int) : [int]bool;

axiom (forall x: int, n: int, z: int :: { Array(x, n, z) } INT_LEQ(z, 0) ==> Equal(Array(x, n, z), Empty()));

axiom (forall x: int, n: int, z: int :: { Array(x, n, z) } INT_GT(z, 0) ==> Equal(Array(x, n, z), Difference(AtLeast(n, x), AtLeast(n, PLUS(x, n, z)))));

axiom (forall x: int :: !Empty()[x]);

axiom (forall x: int :: SetTrue()[x]);

axiom (forall x: int, y: int :: { Singleton(y)[x] } Singleton(y)[x] <==> x == y);

axiom (forall y: int :: { Singleton(y) } Singleton(y)[y]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { Union(S, T)[x] } { Union(S, T), S[x] } { Union(S, T), T[x] } Union(S, T)[x] <==> S[x] || T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { Intersection(S, T)[x] } { Intersection(S, T), S[x] } { Intersection(S, T), T[x] } Intersection(S, T)[x] <==> S[x] && T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { Difference(S, T)[x] } { Difference(S, T), S[x] } { Difference(S, T), T[x] } Difference(S, T)[x] <==> S[x] && !T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { Equal(S, T) } Equal(S, T) <==> Subset(S, T) && Subset(T, S));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], Subset(S, T) } { T[x], Subset(S, T) } S[x] && Subset(S, T) ==> T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { Subset(S, T) } Subset(S, T) || (exists x: int :: S[x] && !T[x]));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], Disjoint(S, T) } { T[x], Disjoint(S, T) } !(S[x] && Disjoint(S, T) && T[x]));

axiom (forall S: [int]bool, T: [int]bool :: { Disjoint(S, T) } Disjoint(S, T) || (exists x: int :: S[x] && T[x]));

axiom (forall f: [int]int, x: int :: { Inverse(f, f[x]) } Inverse(f, f[x])[x]);

axiom (forall f: [int]int, x: int, y: int :: { Inverse(f, y), f[x] } Inverse(f, y)[x] ==> f[x] == y);

axiom (forall f: [int]int, x: int, y: int :: { Inverse(f[x := y], y) } Equal(Inverse(f[x := y], y), Union(Inverse(f, y), Singleton(x))));

axiom (forall f: [int]int, x: int, y: int, z: int :: { Inverse(f[x := y], z) } y == z || Equal(Inverse(f[x := y], z), Difference(Inverse(f, z), Singleton(x))));

axiom (forall x: int, S: [int]bool, M: [int]int :: { Dereference(S, M)[x] } Dereference(S, M)[x] ==> (exists y: int :: x == M[y] && S[y]));

axiom (forall x: int, S: [int]bool, M: [int]int :: { M[x], S[x], Dereference(S, M) } S[x] ==> Dereference(S, M)[M[x]]);

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { Dereference(S, M[x := y]) } !S[x] ==> Equal(Dereference(S, M[x := y]), Dereference(S, M)));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { Dereference(S, M[x := y]) } S[x] && Equal(Intersection(Inverse(M, M[x]), S), Singleton(x)) ==> Equal(Dereference(S, M[x := y]), Union(Difference(Dereference(S, M), Singleton(M[x])), Singleton(y))));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { Dereference(S, M[x := y]) } S[x] && !Equal(Intersection(Inverse(M, M[x]), S), Singleton(x)) ==> Equal(Dereference(S, M[x := y]), Union(Dereference(S, M), Singleton(y))));

function {:extern} Unified([name][int]int) : [int]int;

axiom (forall M: [name][int]int, x: int :: { Unified(M)[x] } Unified(M)[x] == M[Field(x)][x]);

axiom (forall M: [name][int]int, x: int, y: int :: { Unified(M[Field(x) := M[Field(x)][x := y]]) } Unified(M[Field(x) := M[Field(x)][x := y]]) == Unified(M)[x := y]);

var {:extern} global1: int;

var {:extern} global2: int;

var {:extern} global3: int;

var {:extern} global4: int;

var {:extern} global5: int;

const {:extern} unique BOOGIE_FLOAT_CONST_0: int;

function {:extern} value_is(c: int, e: int) : bool;

const {:extern} {:model_const "global1"} {:sourceFile ".\source\test0.c"} {:sourceLine 10} unique __ctobpl_const_1: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 59} unique __ctobpl_const_19: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 35} unique __ctobpl_const_30: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 57} unique __ctobpl_const_17: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 92} unique __ctobpl_const_8: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 44} unique __ctobpl_const_9: int;

const {:extern} {:model_const "z"} {:sourceFile ".\source\test0.c"} {:sourceLine 71} unique __ctobpl_const_21: int;

const {:extern} {:model_const "w"} {:sourceFile ".\source\test0.c"} {:sourceLine 20} unique __ctobpl_const_3: int;

const {:extern} {:model_const "result.TestGlobalRecursion"} {:sourceFile ".\source\test0.c"} {:sourceLine 52} unique __ctobpl_const_16: int;

const {:extern} {:model_const "global4"} {:sourceFile ".\source\test0.c"} {:sourceLine 72} unique __ctobpl_const_22: int;

const {:extern} {:model_const "w"} {:sourceFile ".\source\test0.c"} {:sourceLine 29} unique __ctobpl_const_7: int;

const {:extern} {:model_const "global2"} {:sourceFile ".\source\test0.c"} {:sourceLine 51} unique __ctobpl_const_12: int;

const {:extern} {:model_const "result.TestEmptyRecursion"} {:sourceFile ".\source\test0.c"} {:sourceLine 44} unique __ctobpl_const_11: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 51} unique __ctobpl_const_13: int;

const {:extern} {:model_const "w"} {:sourceFile ".\source\test0.c"} {:sourceLine 74} unique __ctobpl_const_25: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 36} unique __ctobpl_const_31: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 52} unique __ctobpl_const_15: int;

const {:extern} {:model_const "y"} {:sourceFile ".\source\test0.c"} {:sourceLine 26} unique __ctobpl_const_4: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 44} unique __ctobpl_const_10: int;

const {:extern} {:model_const "global3"} {:sourceFile ".\source\test0.c"} {:sourceLine 80} unique __ctobpl_const_27: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 59} unique __ctobpl_const_18: int;

const {:extern} {:model_const "result.TestRecursion"} {:sourceFile ".\source\test0.c"} {:sourceLine 59} unique __ctobpl_const_20: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 73} unique __ctobpl_const_23: int;

const {:extern} {:model_const "global5"} {:sourceFile ".\source\test0.c"} {:sourceLine 78} unique __ctobpl_const_24: int;

const {:extern} {:model_const "y"} {:sourceFile ".\source\test0.c"} {:sourceLine 79} unique __ctobpl_const_26: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 52} unique __ctobpl_const_14: int;

const {:extern} {:model_const "x"} {:sourceFile ".\source\test0.c"} {:sourceLine 34} unique __ctobpl_const_28: int;

const {:extern} {:model_const "y"} {:sourceFile ".\source\test0.c"} {:sourceLine 34} unique __ctobpl_const_29: int;

const {:extern} {:model_const "w"} {:sourceFile ".\source\test0.c"} {:sourceLine 27} unique __ctobpl_const_5: int;

const {:extern} {:model_const "y"} {:sourceFile ".\source\test0.c"} {:sourceLine 17} unique __ctobpl_const_2: int;

const {:extern} {:model_const "result.TestCallDominationDependancyCalleeConst"} {:sourceFile ".\source\test0.c"} {:sourceLine 27} unique __ctobpl_const_6: int;

const {:extern} {:model_const "w"} {:sourceFile ".\source\test0.c"} {:sourceLine 39} unique __ctobpl_const_34: int;

const {:extern} {:model_const "w"} {:sourceFile ".\source\test0.c"} {:sourceLine 37} unique __ctobpl_const_33: int;

const {:extern} {:model_const "z"} {:sourceFile ".\source\test0.c"} {:sourceLine 36} unique __ctobpl_const_32: int;

procedure {:extern} TestCallDominationDependancyCalleeConst() returns (result.TestCallDominationDependancyCalleeConst$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestCallDominationDependancyCalleeConst() returns (result.TestCallDominationDependancyCalleeConst$1: int)
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
    result.TestCallDominationDependancyCalleeConst$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 3} true;
    result.TestCallDominationDependancyCalleeConst$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 4} true;
    return;
}



procedure {:extern} TestCallDominationDependancyCalleeGlobals();
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestCallDominationDependancyCalleeGlobals()
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
    assert {:sourcefile ".\source\test0.c"} {:sourceline 10} true;
    assume value_is(__ctobpl_const_1, global1);
    global1 := PLUS(global1, 1, 1);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 11} true;
    return;
}



procedure {:extern} TestCallDominationDependancyGlobals(y.__1: int, z.__1: int) returns (result.TestCallDominationDependancyGlobals$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestCallDominationDependancyGlobals(y.__1: int, z.__1: int) returns (result.TestCallDominationDependancyGlobals$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} w: int;
  var {:extern} y: int;
  var {:extern} z: int;
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
    result.TestCallDominationDependancyGlobals$1 := 0;
    w := 0;
    y := 0;
    z := 0;
    y := y.__1;
    z := z.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 16} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 17} true;
    goto label_4_true, label_4_false;

  label_4_false:
    assume y == 0;
    assume value_is(__ctobpl_const_2, y);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 20} true;
    result.TestCallDominationDependancyGlobals$1 := w;
    assume value_is(__ctobpl_const_3, w);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 21} true;
    return;

  label_4_true:
    assume y != 0;
    assume value_is(__ctobpl_const_2, y);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 18} true;
    call TestCallDominationDependancyCalleeGlobals();
    goto label_5;
}



procedure {:extern} TestCallDominationDependancyReturns(y.__1: int, z.__1: int) returns (result.TestCallDominationDependancyReturns$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestCallDominationDependancyReturns(y.__1: int, z.__1: int) returns (result.TestCallDominationDependancyReturns$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.TestCallDominationDependancyCalleeConst$2: int;
  var {:extern} w: int;
  var {:extern} y: int;
  var {:extern} z: int;
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
    result.TestCallDominationDependancyCalleeConst$2 := 0;
    result.TestCallDominationDependancyReturns$1 := 0;
    w := 0;
    y := 0;
    z := 0;
    y := y.__1;
    z := z.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 25} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 26} true;
    goto label_4_true, label_4_false;

  label_4_false:
    assume y == 0;
    assume value_is(__ctobpl_const_4, y);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 29} true;
    result.TestCallDominationDependancyReturns$1 := w;
    assume value_is(__ctobpl_const_7, w);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 30} true;
    return;

  label_4_true:
    assume y != 0;
    assume value_is(__ctobpl_const_4, y);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 27} true;
    call result.TestCallDominationDependancyCalleeConst$2 := TestCallDominationDependancyCalleeConst();
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 27} true;
    w := result.TestCallDominationDependancyCalleeConst$2;
    assume value_is(__ctobpl_const_5, w);
    assume value_is(__ctobpl_const_6, result.TestCallDominationDependancyCalleeConst$2);
    goto label_5;
}



procedure {:extern} TestCondExit(x.__1: int) returns (result.TestCondExit$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestCondExit(x.__1: int) returns (result.TestCondExit$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.exit$2: int;
  var {:extern} x: int;
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
    result.TestCondExit$1 := 0;
    result.exit$2 := 0;
    x := 0;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 92} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume !INT_LT(0, x);
    assume value_is(__ctobpl_const_8, x);
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 94} true;
    call result.exit$2 := det_choice();
    return;

  label_3_true:
    assume INT_LT(0, x);
    assume value_is(__ctobpl_const_8, x);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 93} true;
    result.TestCondExit$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 96} true;
    return;
}



procedure {:extern} TestEmptyRecursion(x.__1: int) returns (result.TestEmptyRecursion$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestEmptyRecursion(x.__1: int) returns (result.TestEmptyRecursion$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.TestEmptyRecursion$2: int;
  var {:extern} x: int;
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
    result.TestEmptyRecursion$1 := 0;
    result.TestEmptyRecursion$2 := 0;
    x := 0;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 44} true;
    call result.TestEmptyRecursion$2 := TestEmptyRecursion(x);
    assume value_is(__ctobpl_const_9, x);
    assume value_is(__ctobpl_const_10, x);
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 44} true;
    result.TestEmptyRecursion$1 := result.TestEmptyRecursion$2;
    assume value_is(__ctobpl_const_11, result.TestEmptyRecursion$2);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 45} true;
    return;
}



procedure {:extern} TestGlobalRecursion(x.__1: int) returns (result.TestGlobalRecursion$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestGlobalRecursion(x.__1: int) returns (result.TestGlobalRecursion$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.TestGlobalRecursion$2: int;
  var {:extern} x: int;
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
    result.TestGlobalRecursion$1 := 0;
    result.TestGlobalRecursion$2 := 0;
    x := 0;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 51} true;
    tempBoogie0 := PLUS(global2, 1, x);
    global2 := tempBoogie0;
    assume value_is(__ctobpl_const_12, global2);
    assume value_is(__ctobpl_const_13, x);
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 52} true;
    call result.TestGlobalRecursion$2 := TestGlobalRecursion(x);
    assume value_is(__ctobpl_const_14, x);
    assume value_is(__ctobpl_const_15, x);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 52} true;
    result.TestGlobalRecursion$1 := result.TestGlobalRecursion$2;
    assume value_is(__ctobpl_const_16, result.TestGlobalRecursion$2);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 53} true;
    return;
}



procedure {:extern} TestRecursion(x.__1: int) returns (result.TestRecursion$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestRecursion(x.__1: int) returns (result.TestRecursion$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.TestRecursion$2: int;
  var {:extern} x: int;
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
    result.TestRecursion$1 := 0;
    result.TestRecursion$2 := 0;
    x := 0;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 57} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume !INT_LT(x, 0);
    assume value_is(__ctobpl_const_17, x);
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 59} true;
    call result.TestRecursion$2 := TestRecursion(x);
    assume value_is(__ctobpl_const_18, x);
    assume value_is(__ctobpl_const_19, x);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 59} true;
    result.TestRecursion$1 := result.TestRecursion$2;
    assume value_is(__ctobpl_const_20, result.TestRecursion$2);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 60} true;
    return;

  label_3_true:
    assume INT_LT(x, 0);
    assume value_is(__ctobpl_const_17, x);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 58} true;
    result.TestRecursion$1 := 0;
    goto label_1;
}



procedure {:extern} TestReturnDomination(x.__1: int, w.__1: int) returns (result.TestReturnDomination$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestReturnDomination(x.__1: int, w.__1: int) returns (result.TestReturnDomination$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} p: int;
  var {:extern} w: int;
  var {:extern} x: int;
  var {:extern} y: int;
  var {:extern} z: int;
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
    p := 0;
    result.TestReturnDomination$1 := 0;
    w := 0;
    x := 0;
    y := 0;
    z := 0;
    x := x.__1;
    w := w.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 70} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 70} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 70} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 71} true;
    assume value_is(__ctobpl_const_21, z);
    z := PLUS(z, 1, 1);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 72} true;
    assume value_is(__ctobpl_const_22, global4);
    global4 := PLUS(global4, 1, 1);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 73} true;
    goto label_8_true, label_8_false;

  label_8_false:
    assume !INT_LT(0, x);
    assume value_is(__ctobpl_const_23, x);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 78} true;
    assume value_is(__ctobpl_const_24, global5);
    global5 := PLUS(global5, 1, 1);
    goto label_11;

  label_11:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 79} true;
    assume value_is(__ctobpl_const_26, y);
    y := PLUS(y, 1, 1);
    goto label_13;

  label_13:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 80} true;
    global3 := 0;
    assume value_is(__ctobpl_const_27, global3);
    goto label_14;

  label_14:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 81} true;
    result.TestReturnDomination$1 := 2;
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 82} true;
    return;

  label_8_true:
    assume INT_LT(0, x);
    assume value_is(__ctobpl_const_23, x);
    goto label_10;

  label_10:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 74} true;
    goto label_10_true, label_10_false;

  label_10_false:
    assume !INT_LT(0, w);
    assume value_is(__ctobpl_const_25, w);
    goto label_11;

  label_10_true:
    assume INT_LT(0, w);
    assume value_is(__ctobpl_const_25, w);
    goto label_12;

  label_12:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 75} true;
    result.TestReturnDomination$1 := 0;
    goto label_1;
}



procedure {:extern} TestSimpleDominationDependancy(y.__1: int, z.__1: int) returns (result.TestSimpleDominationDependancy$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestSimpleDominationDependancy(y.__1: int, z.__1: int) returns (result.TestSimpleDominationDependancy$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} w: int;
  var {:extern} x: int;
  var {:extern} y: int;
  var {:extern} z: int;
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
    result.TestSimpleDominationDependancy$1 := 0;
    w := 0;
    x := 0;
    y := 0;
    z := 0;
    y := y.__1;
    z := z.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 34} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 34} true;
    x := PLUS(y, 1, 1);
    assume value_is(__ctobpl_const_28, x);
    assume value_is(__ctobpl_const_29, y);
    goto label_5;

  label_5:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 34} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 35} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume x == 0;
    assume value_is(__ctobpl_const_30, x);
    goto label_7;

  label_7:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 39} true;
    result.TestSimpleDominationDependancy$1 := w;
    assume value_is(__ctobpl_const_34, w);
    goto label_1;

  label_1:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 40} true;
    return;

  label_6_true:
    assume x != 0;
    assume value_is(__ctobpl_const_30, x);
    goto label_8;

  label_8:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 36} true;
    x := z;
    assume value_is(__ctobpl_const_31, x);
    assume value_is(__ctobpl_const_32, z);
    goto label_9;

  label_9:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 37} true;
    w := 2;
    assume value_is(__ctobpl_const_33, w);
    goto label_7;
}



procedure {:extern} TestSimpleExit(x.__1: int) returns (result.TestSimpleExit$1: int);
  free requires INT_LT(0, alloc);
  modifies global1, global2, global3, global4, global5;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} TestSimpleExit(x.__1: int) returns (result.TestSimpleExit$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.exit$2: int;
  var {:extern} x: int;
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
    result.TestSimpleExit$1 := 0;
    result.exit$2 := 0;
    x := 0;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\source\test0.c"} {:sourceline 86} true;
    call result.exit$2 := det_choice();
    return;
}


