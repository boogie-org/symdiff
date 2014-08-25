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

var {:extern} Mem_T.INT4: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.INT4: name;

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

function {:extern} value_is(c: int, e: int) : bool;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 20} unique __ctobpl_const_4: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 20} unique __ctobpl_const_5: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 23} unique __ctobpl_const_3: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 29} unique __ctobpl_const_9: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 29} unique __ctobpl_const_10: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 28} unique __ctobpl_const_6: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 19} unique __ctobpl_const_1: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 32} unique __ctobpl_const_8: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 32} unique __ctobpl_const_7: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 23} unique __ctobpl_const_2: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 51} unique __ctobpl_const_17: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 48} unique __ctobpl_const_19: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 38} unique __ctobpl_const_15: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 51} unique __ctobpl_const_18: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 56} unique __ctobpl_const_21: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 60} unique __ctobpl_const_22: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 60} unique __ctobpl_const_23: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 48} unique __ctobpl_const_20: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 57} unique __ctobpl_const_24: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 37} unique __ctobpl_const_11: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 38} unique __ctobpl_const_14: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 41} unique __ctobpl_const_13: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 41} unique __ctobpl_const_12: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 47} unique __ctobpl_const_16: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 84} unique __ctobpl_const_39: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 96} unique __ctobpl_const_42: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 93} unique __ctobpl_const_45: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 83} unique __ctobpl_const_36: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 75} unique __ctobpl_const_34: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 75} unique __ctobpl_const_35: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 69} unique __ctobpl_const_27: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 57} unique __ctobpl_const_25: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 96} unique __ctobpl_const_43: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 84} unique __ctobpl_const_40: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 93} unique __ctobpl_const_44: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 66} unique __ctobpl_const_29: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 92} unique __ctobpl_const_41: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 65} unique __ctobpl_const_26: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 69} unique __ctobpl_const_28: int;

const {:extern} {:model_const "result.nd"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 74} unique __ctobpl_const_31: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 66} unique __ctobpl_const_30: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 78} unique __ctobpl_const_33: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 87} unique __ctobpl_const_37: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 87} unique __ctobpl_const_38: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceLine 78} unique __ctobpl_const_32: int;

procedure {:extern} nd() returns (__dummy_retnd: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} f0() returns (result.f0$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f0() returns (result.f0$1: int)
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
    result.f0$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 14} true;
    call f1(1, 2);
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 15} true;
    result.f0$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 16} true;
    return;
}



procedure {:extern} f1(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f1(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 19} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 19} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_1, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 23} true;
    call f2(0, y);
    assume value_is(__ctobpl_const_2, y);
    assume value_is(__ctobpl_const_3, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 25} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_1, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 20} true;
    call f2(x, 0);
    assume value_is(__ctobpl_const_4, x);
    assume value_is(__ctobpl_const_5, x);
    goto label_1;
}



procedure {:extern} f10(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f10(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 102} true;
    return;
}



procedure {:extern} f2(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f2(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 28} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 28} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_6, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 32} true;
    call f3(0, y);
    assume value_is(__ctobpl_const_7, y);
    assume value_is(__ctobpl_const_8, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 34} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_6, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 29} true;
    call f3(x, 0);
    assume value_is(__ctobpl_const_9, x);
    assume value_is(__ctobpl_const_10, x);
    goto label_1;
}



procedure {:extern} f3(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f3(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 37} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 37} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_11, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 41} true;
    call f4(0, y);
    assume value_is(__ctobpl_const_12, y);
    assume value_is(__ctobpl_const_13, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 43} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_11, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 38} true;
    call f4(x, 0);
    assume value_is(__ctobpl_const_14, x);
    assume value_is(__ctobpl_const_15, x);
    goto label_1;
}



procedure {:extern} f4(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f4(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 47} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 47} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_16, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 51} true;
    call f5(0, y);
    assume value_is(__ctobpl_const_17, y);
    assume value_is(__ctobpl_const_18, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 53} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_16, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 48} true;
    call f5(x, 0);
    assume value_is(__ctobpl_const_19, x);
    assume value_is(__ctobpl_const_20, x);
    goto label_1;
}



procedure {:extern} f5(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f5(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 56} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 56} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_21, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 60} true;
    call f6(0, y);
    assume value_is(__ctobpl_const_22, y);
    assume value_is(__ctobpl_const_23, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 62} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_21, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 57} true;
    call f6(x, 0);
    assume value_is(__ctobpl_const_24, x);
    assume value_is(__ctobpl_const_25, x);
    goto label_1;
}



procedure {:extern} f6(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f6(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 65} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 65} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_26, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 69} true;
    call f7(0, y);
    assume value_is(__ctobpl_const_27, y);
    assume value_is(__ctobpl_const_28, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 71} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_26, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 66} true;
    call f7(x, 0);
    assume value_is(__ctobpl_const_29, x);
    assume value_is(__ctobpl_const_30, x);
    goto label_1;
}



procedure {:extern} f7(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f7(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 74} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 74} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_31, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 78} true;
    call f8(0, y);
    assume value_is(__ctobpl_const_32, y);
    assume value_is(__ctobpl_const_33, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 80} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_31, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 75} true;
    call f8(x, 0);
    assume value_is(__ctobpl_const_34, x);
    assume value_is(__ctobpl_const_35, x);
    goto label_1;
}



procedure {:extern} f8(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f8(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 83} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 83} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_36, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 87} true;
    call f9(0, y);
    assume value_is(__ctobpl_const_37, y);
    assume value_is(__ctobpl_const_38, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 89} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_36, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 84} true;
    call f9(x, 0);
    assume value_is(__ctobpl_const_39, x);
    assume value_is(__ctobpl_const_40, x);
    goto label_1;
}



procedure {:extern} f9(x.__1: int, y.__1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} f9(x.__1: int, y.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.nd$1: int;
  var {:extern} x: int;
  var {:extern} y: int;
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
    result.nd$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    y := y.__1;
    goto label_3;

  label_3:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 92} true;
    call result.nd$1 := nd();
    goto label_6;

  label_6:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 92} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume result.nd$1 == 0;
    assume value_is(__ctobpl_const_41, result.nd$1);
    goto label_7;

  label_7:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 96} true;
    call f10(0, y);
    assume value_is(__ctobpl_const_42, y);
    assume value_is(__ctobpl_const_43, y);
    goto label_1;

  label_1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 98} true;
    return;

  label_6_true:
    assume result.nd$1 != 0;
    assume value_is(__ctobpl_const_41, result.nd$1);
    goto label_10;

  label_10:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testtopdowntaint\source\testtopdowntaint.c"} {:sourceline 93} true;
    call f10(x, 0);
    assume value_is(__ctobpl_const_44, x);
    assume value_is(__ctobpl_const_45, x);
    goto label_1;
}


