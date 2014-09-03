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

var {:extern} Mem_T.PINT4: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.INT4: name;

const {:extern} unique T.PINT4: name;

const {:extern} unique T.PPINT4: name;

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

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 35} unique __ctobpl_const_2: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 41} unique __ctobpl_const_4: int;

const {:extern} {:model_const "res"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 21} unique __ctobpl_const_11: int;

const {:extern} {:model_const "i"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 19} unique __ctobpl_const_10: int;

const {:extern} {:model_const "q"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 42} unique __ctobpl_const_5: int;

const {:extern} {:model_const "* q"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 42} unique __ctobpl_const_6: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 43} unique __ctobpl_const_7: int;

const {:extern} {:model_const "i"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 19} unique __ctobpl_const_9: int;

const {:extern} {:model_const "res"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 18} unique __ctobpl_const_8: int;

const {:extern} {:model_const "q"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 41} unique __ctobpl_const_3: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 34} unique __ctobpl_const_1: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 20} unique __ctobpl_const_12: int;

const {:extern} {:model_const "result.leaf"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 20} unique __ctobpl_const_15: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 14} unique __ctobpl_const_19: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 26} unique __ctobpl_const_39: int;

const {:extern} {:model_const "result.tainted"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 4} unique __ctobpl_const_27: int;

const {:extern} {:model_const "d"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 8} unique __ctobpl_const_35: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 29} unique __ctobpl_const_42: int;

const {:extern} {:model_const "p"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 26} unique __ctobpl_const_38: int;

const {:extern} {:model_const "d"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 8} unique __ctobpl_const_34: int;

const {:extern} {:model_const "i"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_16: int;

const {:extern} {:model_const "result.alias"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 8} unique __ctobpl_const_37: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 13} unique __ctobpl_const_17: int;

const {:extern} {:model_const "a"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 3} unique __ctobpl_const_22: int;

const {:extern} {:model_const "result.before"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 3} unique __ctobpl_const_23: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 4} unique __ctobpl_const_24: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 4} unique __ctobpl_const_26: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 7} unique __ctobpl_const_31: int;

const {:extern} {:model_const "a"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 3} unique __ctobpl_const_20: int;

const {:extern} {:model_const "a"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 3} unique __ctobpl_const_21: int;

const {:extern} {:model_const "res"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 20} unique __ctobpl_const_14: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 13} unique __ctobpl_const_18: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 6} unique __ctobpl_const_29: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 4} unique __ctobpl_const_25: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 7} unique __ctobpl_const_30: int;

const {:extern} {:model_const "b"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 5} unique __ctobpl_const_28: int;

const {:extern} {:model_const "c"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 7} unique __ctobpl_const_32: int;

const {:extern} {:model_const "result.after"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 7} unique __ctobpl_const_33: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 20} unique __ctobpl_const_13: int;

const {:extern} {:model_const "d"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 8} unique __ctobpl_const_36: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 27} unique __ctobpl_const_40: int;

const {:extern} {:model_const "p"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 28} unique __ctobpl_const_41: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 30} unique __ctobpl_const_44: int;

const {:extern} {:model_const "y"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceLine 29} unique __ctobpl_const_43: int;

procedure {:extern} after(x.__1: int) returns (result.after$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} after(x.__1: int) returns (result.after$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
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

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.after$1 := 0;
    x := 0;
    x := x.__1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 34} true;
    goto label_3_true#2, label_3_false#2;

  label_3_false#2:
    assume !INT_LT(x, 0);
    assume value_is(__ctobpl_const_1, x);
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 36} true;
    result.after$1 := 0;
    goto label_1#2;

  label_3_true#2:
    assume INT_LT(x, 0);
    assume value_is(__ctobpl_const_1, x);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 35} true;
    result.after$1 := x;
    assume value_is(__ctobpl_const_2, x);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 37} true;
    return;
}



procedure {:extern} alias(x.__1: int) returns (result.alias$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} alias(x.__1: int) returns (result.alias$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} q: int;
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

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    q := 0;
    result.alias$1 := 0;
    x := 0;
    call y := __HAVOC_det_malloc(4);
    x := x.__1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 40} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 41} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 41} true;
    q := y;
    assume value_is(__ctobpl_const_3, q);
    assume value_is(__ctobpl_const_4, Mem_T.INT4[y]);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 42} true;
    assert q != 0;
    Mem_T.INT4 := Mem_T.INT4[q := 2];
    assume value_is(__ctobpl_const_5, q);
    assume value_is(__ctobpl_const_6, Mem_T.INT4[q]);
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 43} true;
    result.alias$1 := Mem_T.INT4[y];
    assume value_is(__ctobpl_const_7, Mem_T.INT4[y]);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 44} true;
    call __HAVOC_free(y);
    return;
}



procedure {:extern} before(x.__1: int) returns (result.before$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} before(x.__1: int) returns (result.before$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} i: int;
  var {:extern} res: int;
  var {:extern} result.leaf$2: int;
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

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    i := 0;
    res := 0;
    result.before$1 := 0;
    result.leaf$2 := 0;
    x := 0;
    x := x.__1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 18} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 18} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 18} true;
    res := 0;
    assume value_is(__ctobpl_const_8, res);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 19} true;
    i := 0;
    assume value_is(__ctobpl_const_9, i);
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 19} true;
    goto label_7_head#2;

  label_7_head#2:
    goto label_7_true#2, label_7_false#2;

  label_7_true#2:
    assume INT_LT(i, 80);
    assume value_is(__ctobpl_const_10, i);
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 20} true;
    call result.leaf$2 := leaf(x);
    assume value_is(__ctobpl_const_12, x);
    assume value_is(__ctobpl_const_13, x);
    goto label_12#2;

  label_12#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 20} true;
    tempBoogie0 := PLUS(res, 1, result.leaf$2);
    res := tempBoogie0;
    assume value_is(__ctobpl_const_14, res);
    assume value_is(__ctobpl_const_15, result.leaf$2);
    goto label_13#2;

  label_13#2:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_16, i);
    goto label_7_head#1;

  label_7_head#1:
    goto label_7_true#1, label_7_false#2;

  label_7_false#2:
    assume !INT_LT(i, 80);
    assume value_is(__ctobpl_const_10, i);
    goto label_8#2;

  label_8#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 21} true;
    result.before$1 := res;
    assume value_is(__ctobpl_const_11, res);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 22} true;
    return;

  label_7_true#1:
    assume INT_LT(i, 80);
    assume value_is(__ctobpl_const_10, i);
    goto label_9#1;

  label_9#1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 20} true;
    call result.leaf$2 := leaf(x);
    assume value_is(__ctobpl_const_12, x);
    assume value_is(__ctobpl_const_13, x);
    goto label_12#1;

  label_12#1:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 20} true;
    tempBoogie0 := PLUS(res, 1, result.leaf$2);
    res := tempBoogie0;
    assume value_is(__ctobpl_const_14, res);
    assume value_is(__ctobpl_const_15, result.leaf$2);
    goto label_13#1;

  label_13#1:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_16, i);
    goto label_7_head#0;

  label_7_head#0:
    assume false;
    return;
}



procedure {:extern} leaf(x.__1: int) returns (result.leaf$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} leaf(x.__1: int) returns (result.leaf$1: int)
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

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.leaf$1 := 0;
    x := 0;
    y := 0;
    x := x.__1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 13} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 13} true;
    y := PLUS(x, 1, 1);
    assume value_is(__ctobpl_const_17, y);
    assume value_is(__ctobpl_const_18, x);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 14} true;
    result.leaf$1 := y;
    assume value_is(__ctobpl_const_19, y);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 15} true;
    return;
}



procedure {:extern} main() returns (result.main$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} main() returns (result.main$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} a: int;
  var {:extern} b: int;
  var {:extern} c: int;
  var {:extern} d: int;
  var {:extern} result.after$4: int;
  var {:extern} result.alias$5: int;
  var {:extern} result.before$2: int;
  var {:extern} result.tainted$3: int;
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

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    a := 0;
    b := 0;
    c := 0;
    d := 0;
    result.after$4 := 0;
    result.alias$5 := 0;
    result.before$2 := 0;
    result.main$1 := 0;
    result.tainted$3 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 2} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 2} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 2} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 2} true;
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 3} true;
    call result.before$2 := before(a);
    assume value_is(__ctobpl_const_20, a);
    assume value_is(__ctobpl_const_21, a);
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 3} true;
    a := result.before$2;
    assume value_is(__ctobpl_const_22, a);
    assume value_is(__ctobpl_const_23, result.before$2);
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 4} true;
    call result.tainted$3 := tainted(b);
    assume value_is(__ctobpl_const_24, b);
    assume value_is(__ctobpl_const_25, b);
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 4} true;
    b := result.tainted$3;
    assume value_is(__ctobpl_const_26, b);
    assume value_is(__ctobpl_const_27, result.tainted$3);
    goto label_15#2;

  label_15#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 5} true;
    goto label_15_true#2, label_15_false#2;

  label_15_false#2:
    assume !INT_LT(b, 0);
    assume value_is(__ctobpl_const_28, b);
    goto label_16#2;

  label_15_true#2:
    assume INT_LT(b, 0);
    assume value_is(__ctobpl_const_28, b);
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 6} true;
    b := 0;
    assume value_is(__ctobpl_const_29, b);
    goto label_16#2;

  label_16#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 7} true;
    call result.after$4 := after(b);
    assume value_is(__ctobpl_const_30, b);
    assume value_is(__ctobpl_const_31, b);
    goto label_20#2;

  label_20#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 7} true;
    c := result.after$4;
    assume value_is(__ctobpl_const_32, c);
    assume value_is(__ctobpl_const_33, result.after$4);
    goto label_21#2;

  label_21#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 8} true;
    call result.alias$5 := alias(d);
    assume value_is(__ctobpl_const_34, d);
    assume value_is(__ctobpl_const_35, d);
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 8} true;
    d := result.alias$5;
    assume value_is(__ctobpl_const_36, d);
    assume value_is(__ctobpl_const_37, result.alias$5);
    goto label_25#2;

  label_25#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 9} true;
    result.main$1 := 0;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 10} true;
    return;
}



procedure {:extern} tainted(x.__1: int) returns (result.tainted$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} tainted(x.__1: int) returns (result.tainted$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} p: int;
  var {:extern} result.leaf$2: int;
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

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    p := 0;
    result.leaf$2 := 0;
    result.tainted$1 := 0;
    x := 0;
    call y := __HAVOC_det_malloc(4);
    x := x.__1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 25} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 26} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 26} true;
    p := y;
    assume value_is(__ctobpl_const_38, p);
    assume value_is(__ctobpl_const_39, Mem_T.INT4[y]);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 27} true;
    assume value_is(__ctobpl_const_40, Mem_T.INT4[y]);
    tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[y], 1, 1);
    Mem_T.INT4 := Mem_T.INT4[y := tempBoogie0];
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 28} true;
    assume value_is(__ctobpl_const_41, p);
    p := PLUS(p, 4, 1);
    goto label_8#2;

  label_8#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 29} true;
    call result.leaf$2 := leaf(Mem_T.INT4[y]);
    assume value_is(__ctobpl_const_42, Mem_T.INT4[y]);
    assume value_is(__ctobpl_const_43, Mem_T.INT4[y]);
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 30} true;
    result.tainted$1 := Mem_T.INT4[y];
    assume value_is(__ctobpl_const_44, Mem_T.INT4[y]);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.src\dependency\test\regression\testdemo\v1\demo.c"} {:sourceline 31} true;
    call __HAVOC_free(y);
    return;
}


