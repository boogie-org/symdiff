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

var {:extern} Mem_T.A1000INT4: [int]int;

var {:extern} Mem_T.A15CHAR: [int]int;

var {:extern} Mem_T.A17CHAR: [int]int;

var {:extern} Mem_T.A18CHAR: [int]int;

var {:extern} Mem_T.A21CHAR: [int]int;

var {:extern} Mem_T.A26CHAR: [int]int;

var {:extern} Mem_T.A29CHAR: [int]int;

var {:extern} Mem_T.A34CHAR: [int]int;

var {:extern} Mem_T.A37CHAR: [int]int;

var {:extern} Mem_T.A41CHAR: [int]int;

var {:extern} Mem_T.A5CHAR: [int]int;

var {:extern} Mem_T.A6FLOAT: [int]int;

var {:extern} Mem_T.A7CHAR: [int]int;

var {:extern} Mem_T.CHAR: [int]int;

var {:extern} Mem_T.FLOAT: [int]int;

var {:extern} Mem_T.INT4: [int]int;

var {:extern} Mem_T.PCHAR: [int]int;

var {:extern} Mem_T.PFLOAT: [int]int;

var {:extern} Mem_T.PINT4: [int]int;

var {:extern} Mem_T.P_iobuf: [int]int;

var {:extern} Mem_T.UINT4: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.A1000INT4: name;

const {:extern} unique T.A15CHAR: name;

const {:extern} unique T.A17CHAR: name;

const {:extern} unique T.A18CHAR: name;

const {:extern} unique T.A21CHAR: name;

const {:extern} unique T.A26CHAR: name;

const {:extern} unique T.A29CHAR: name;

const {:extern} unique T.A34CHAR: name;

const {:extern} unique T.A37CHAR: name;

const {:extern} unique T.A41CHAR: name;

const {:extern} unique T.A5CHAR: name;

const {:extern} unique T.A6FLOAT: name;

const {:extern} unique T.A7CHAR: name;

const {:extern} unique T.CHAR: name;

const {:extern} unique T.FLOAT: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PA1000INT4: name;

const {:extern} unique T.PA15CHAR: name;

const {:extern} unique T.PA17CHAR: name;

const {:extern} unique T.PA18CHAR: name;

const {:extern} unique T.PA21CHAR: name;

const {:extern} unique T.PA26CHAR: name;

const {:extern} unique T.PA29CHAR: name;

const {:extern} unique T.PA34CHAR: name;

const {:extern} unique T.PA37CHAR: name;

const {:extern} unique T.PA41CHAR: name;

const {:extern} unique T.PA5CHAR: name;

const {:extern} unique T.PA6FLOAT: name;

const {:extern} unique T.PA7CHAR: name;

const {:extern} unique T.PCHAR: name;

const {:extern} unique T.PFLOAT: name;

const {:extern} unique T.PINT4: name;

const {:extern} unique T.PPCHAR: name;

const {:extern} unique T.PPFLOAT: name;

const {:extern} unique T.PPINT4: name;

const {:extern} unique T.PPPCHAR: name;

const {:extern} unique T.PP_iobuf: name;

const {:extern} unique T.PUINT4: name;

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

const {:extern} unique c: int;

axiom c != 0;

axiom Base(c) == c;

const {:extern} unique cof: int;

axiom cof != 0;

axiom Base(cof) == cof;

const {:extern} unique f: int;

axiom f != 0;

axiom Base(f) == f;

const {:extern} unique line: int;

axiom line != 0;

axiom Base(line) == line;

const {:extern} unique r: int;

axiom r != 0;

axiom Base(r) == r;

const {:extern} unique BOOGIE_FLOAT_CONST___4: int;

const {:extern} unique BOOGIE_FLOAT_CONST___3.5: int;

const {:extern} unique BOOGIE_FLOAT_CONST___3: int;

const {:extern} unique BOOGIE_FLOAT_CONST___2.5: int;

const {:extern} unique BOOGIE_FLOAT_CONST___2: int;

const {:extern} unique BOOGIE_FLOAT_CONST___1.5: int;

const {:extern} unique BOOGIE_FLOAT_CONST___1: int;

const {:extern} unique BOOGIE_FLOAT_CONST_0: int;

const {:extern} unique BOOGIE_FLOAT_CONST_3e__007: int;

const {:extern} unique BOOGIE_FLOAT_CONST_0.5: int;

const {:extern} unique BOOGIE_FLOAT_CONST_1: int;

const {:extern} unique BOOGIE_FLOAT_CONST_2: int;

const {:extern} unique BOOGIE_FLOAT_CONST_2.50663: int;

const {:extern} unique BOOGIE_FLOAT_CONST_3.14159: int;

const {:extern} unique BOOGIE_FLOAT_CONST_5.5: int;

function {:extern} value_is(c: int, e: int) : bool;

const {:extern} {:model_const "cdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 306} unique __ctobpl_const_3: int;

const {:extern} {:model_const "rdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 309} unique __ctobpl_const_6: int;

const {:extern} {:model_const "cdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 309} unique __ctobpl_const_7: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 305} unique __ctobpl_const_2: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_24: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_25: int;

const {:extern} {:model_const "xj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_26: int;

const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_27: int;

const {:extern} {:model_const "xj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_28: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_15: int;

const {:extern} {:model_const "N"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 331} unique __ctobpl_const_30: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 333} unique __ctobpl_const_32: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 333} unique __ctobpl_const_33: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 319} unique __ctobpl_const_20: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_22: int;

const {:extern} {:model_const "N"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 353} unique __ctobpl_const_34: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 325} unique __ctobpl_const_29: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 361} unique __ctobpl_const_35: int;

const {:extern} {:model_const "rdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 315} unique __ctobpl_const_10: int;

const {:extern} {:model_const "pdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 315} unique __ctobpl_const_8: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_14: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_21: int;

const {:extern} {:model_const "* pdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 315} unique __ctobpl_const_9: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 333} unique __ctobpl_const_31: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 361} unique __ctobpl_const_36: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 361} unique __ctobpl_const_37: int;

const {:extern} {:model_const "cdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 315} unique __ctobpl_const_11: int;

const {:extern} {:model_const "N"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 373} unique __ctobpl_const_38: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_13: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_16: int;

const {:extern} {:model_const "xi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_19: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_12: int;

const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_18: int;

const {:extern} {:model_const "xi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 317} unique __ctobpl_const_17: int;

const {:extern} {:model_const "malloc.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 323} unique __ctobpl_const_23: int;

const {:extern} {:model_const "rdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 305} unique __ctobpl_const_1: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 307} unique __ctobpl_const_5: int;

const {:extern} {:model_const "xj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 368} unique __ctobpl_const_92: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 368} unique __ctobpl_const_93: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 365} unique __ctobpl_const_91: int;

const {:extern} {:model_const "xj[j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 368} unique __ctobpl_const_94: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 382} unique __ctobpl_const_72: int;

const {:extern} {:model_const "i"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_74: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 365} unique __ctobpl_const_90: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 368} unique __ctobpl_const_95: int;

const {:extern} {:model_const "j"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_96: int;

const {:extern} {:model_const "f"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 384} unique __ctobpl_const_76: int;

const {:extern} {:model_const "f"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 366} unique __ctobpl_const_98: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 366} unique __ctobpl_const_99: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 366} unique __ctobpl_const_100: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 366} unique __ctobpl_const_101: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 366} unique __ctobpl_const_97: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 384} unique __ctobpl_const_78: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 380} unique __ctobpl_const_70: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 382} unique __ctobpl_const_71: int;

const {:extern} {:model_const "pij"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 386} unique __ctobpl_const_81: int;

const {:extern} {:model_const "pij"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 384} unique __ctobpl_const_75: int;

const {:extern} {:model_const "f[i * c + j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 384} unique __ctobpl_const_80: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 363} unique __ctobpl_const_88: int;

const {:extern} {:model_const "pij"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 387} unique __ctobpl_const_82: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 387} unique __ctobpl_const_84: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 384} unique __ctobpl_const_79: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 384} unique __ctobpl_const_77: int;

const {:extern} {:model_const "j"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_87: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 387} unique __ctobpl_const_86: int;

const {:extern} {:model_const "pij"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 387} unique __ctobpl_const_83: int;

const {:extern} {:model_const "pij"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 387} unique __ctobpl_const_85: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 382} unique __ctobpl_const_73: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 365} unique __ctobpl_const_89: int;

const {:extern} {:model_const "xi[i]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 377} unique __ctobpl_const_64: int;

const {:extern} {:model_const "pi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 377} unique __ctobpl_const_61: int;

const {:extern} {:model_const "pi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 379} unique __ctobpl_const_65: int;

const {:extern} {:model_const "pj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 396} unique __ctobpl_const_55: int;

const {:extern} {:model_const "pi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 380} unique __ctobpl_const_66: int;

const {:extern} {:model_const "xj[j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 393} unique __ctobpl_const_53: int;

const {:extern} {:model_const "N"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 373} unique __ctobpl_const_41: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 375} unique __ctobpl_const_43: int;

const {:extern} {:model_const "xj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 393} unique __ctobpl_const_51: int;

const {:extern} {:model_const "pj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 393} unique __ctobpl_const_50: int;

const {:extern} {:model_const "pj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 395} unique __ctobpl_const_54: int;

const {:extern} {:model_const "N"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 373} unique __ctobpl_const_39: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 396} unique __ctobpl_const_57: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 396} unique __ctobpl_const_59: int;

const {:extern} {:model_const "xi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 377} unique __ctobpl_const_62: int;

const {:extern} {:model_const "pj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 396} unique __ctobpl_const_58: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 391} unique __ctobpl_const_48: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 399} unique __ctobpl_const_49: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 373} unique __ctobpl_const_42: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 377} unique __ctobpl_const_63: int;

const {:extern} {:model_const "pj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 396} unique __ctobpl_const_56: int;

const {:extern} {:model_const "j"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_60: int;

const {:extern} {:model_const "pi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 380} unique __ctobpl_const_67: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 380} unique __ctobpl_const_68: int;

const {:extern} {:model_const "pi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 380} unique __ctobpl_const_69: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 373} unique __ctobpl_const_40: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 375} unique __ctobpl_const_44: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 391} unique __ctobpl_const_46: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 391} unique __ctobpl_const_47: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 375} unique __ctobpl_const_45: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 393} unique __ctobpl_const_52: int;

const {:extern} {:model_const "a0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 221} unique __ctobpl_const_215: int;

const {:extern} {:model_const "b0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 222} unique __ctobpl_const_220: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 219} unique __ctobpl_const_214: int;

const {:extern} {:model_const "ana"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 221} unique __ctobpl_const_218: int;

const {:extern} {:model_const "b1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 222} unique __ctobpl_const_221: int;

const {:extern} {:model_const "b0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 222} unique __ctobpl_const_222: int;

const {:extern} {:model_const "ana"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 222} unique __ctobpl_const_223: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_200: int;

const {:extern} {:model_const "ana"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 219} unique __ctobpl_const_212: int;

const {:extern} {:model_const "fac"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 222} unique __ctobpl_const_224: int;

const {:extern} {:model_const "fac"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 221} unique __ctobpl_const_219: int;

const {:extern} {:model_const "a0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 221} unique __ctobpl_const_217: int;

const {:extern} {:model_const "anf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 223} unique __ctobpl_const_225: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_198: int;

const {:extern} {:model_const "b0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 213} unique __ctobpl_const_204: int;

const {:extern} {:model_const "result.gser"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_199: int;

const {:extern} {:model_const "gser.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_195: int;

const {:extern} {:model_const "a1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 213} unique __ctobpl_const_206: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 215} unique __ctobpl_const_208: int;

const {:extern} {:model_const "b1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 212} unique __ctobpl_const_203: int;

const {:extern} {:model_const "a0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 213} unique __ctobpl_const_205: int;

const {:extern} {:model_const "gser.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_194: int;

const {:extern} {:model_const "an"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 218} unique __ctobpl_const_210: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 212} unique __ctobpl_const_201: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 213} unique __ctobpl_const_207: int;

const {:extern} {:model_const "fac"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 212} unique __ctobpl_const_202: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 215} unique __ctobpl_const_209: int;

const {:extern} {:model_const "an"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 219} unique __ctobpl_const_213: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 218} unique __ctobpl_const_211: int;

const {:extern} {:model_const "a1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 221} unique __ctobpl_const_216: int;

const {:extern} {:model_const "gser.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_196: int;

const {:extern} {:model_const "gser.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_197: int;

const {:extern} {:model_const "QGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_171: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_178: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_165: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_188: int;

const {:extern} {:model_const "result.gcf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_189: int;

const {:extern} {:model_const "QGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_173: int;

const {:extern} {:model_const "QGamma.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_176: int;

const {:extern} {:model_const "gcf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_180: int;

const {:extern} {:model_const "gcf.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_184: int;

const {:extern} {:model_const "gser.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_190: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_191: int;

const {:extern} {:model_const "gser.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_192: int;

const {:extern} {:model_const "chisq"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_170: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_193: int;

const {:extern} {:model_const "gcf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_185: int;

const {:extern} {:model_const "result.LGamma"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_168: int;

const {:extern} {:model_const "gcf.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_186: int;

const {:extern} {:model_const "QGamma.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_174: int;

const {:extern} {:model_const "QGamma.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_169: int;

const {:extern} {:model_const "ap"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 198} unique __ctobpl_const_289: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_167: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_164: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_183: int;

const {:extern} {:model_const "df"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_172: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_166: int;

const {:extern} {:model_const "result.QGamma"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_177: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_179: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_181: int;

const {:extern} {:model_const "gcf.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_182: int;

const {:extern} {:model_const "gcf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 248} unique __ctobpl_const_187: int;

const {:extern} {:model_const "QGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 256} unique __ctobpl_const_175: int;

const {:extern} {:model_const "k"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 341} unique __ctobpl_const_121: int;

const {:extern} {:model_const "i"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_114: int;

const {:extern} {:model_const "j"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_124: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 339} unique __ctobpl_const_117: int;

const {:extern} {:model_const "xj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 402} unique __ctobpl_const_127: int;

const {:extern} {:model_const "k"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 339} unique __ctobpl_const_115: int;

const {:extern} {:model_const "xi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 404} unique __ctobpl_const_128: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 311} unique __ctobpl_const_130: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 406} unique __ctobpl_const_131: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 350} unique __ctobpl_const_113: int;

const {:extern} {:model_const "an"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 223} unique __ctobpl_const_226: int;

const {:extern} {:model_const "xi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 350} unique __ctobpl_const_110: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 337} unique __ctobpl_const_108: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 339} unique __ctobpl_const_119: int;

const {:extern} {:model_const "k"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 347} unique __ctobpl_const_123: int;

const {:extern} {:model_const "xj"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 402} unique __ctobpl_const_126: int;

const {:extern} {:model_const "f[i * c + j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 339} unique __ctobpl_const_120: int;

const {:extern} {:model_const "i"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_103: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 347} unique __ctobpl_const_122: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_163: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 337} unique __ctobpl_const_106: int;

const {:extern} {:model_const "f"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 339} unique __ctobpl_const_116: int;

const {:extern} {:model_const "xi[i]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 350} unique __ctobpl_const_112: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 355} unique __ctobpl_const_104: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 343} unique __ctobpl_const_125: int;

const {:extern} {:model_const "f[i * c + j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 366} unique __ctobpl_const_102: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 339} unique __ctobpl_const_118: int;

const {:extern} {:model_const "xi"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 404} unique __ctobpl_const_129: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 350} unique __ctobpl_const_111: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 337} unique __ctobpl_const_107: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 335} unique __ctobpl_const_105: int;

const {:extern} {:model_const "N"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 350} unique __ctobpl_const_109: int;

const {:extern} {:model_const "log.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_158: int;

const {:extern} {:model_const "pix"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_159: int;

const {:extern} {:model_const "result.sin"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_160: int;

const {:extern} {:model_const "log.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_161: int;

const {:extern} {:model_const "log.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_162: int;

const {:extern} {:model_const "pix"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 164} unique __ctobpl_const_154: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 170} unique __ctobpl_const_138: int;

const {:extern} {:model_const "ser"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 177} unique __ctobpl_const_144: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 177} unique __ctobpl_const_148: int;

const {:extern} {:model_const "j"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_153: int;

const {:extern} {:model_const "pix"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_156: int;

const {:extern} {:model_const "pix"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 166} unique __ctobpl_const_157: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 162} unique __ctobpl_const_132: int;

const {:extern} {:model_const "tmp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 169} unique __ctobpl_const_133: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 169} unique __ctobpl_const_134: int;

const {:extern} {:model_const "tmp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 170} unique __ctobpl_const_135: int;

const {:extern} {:model_const "ser"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 172} unique __ctobpl_const_140: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 170} unique __ctobpl_const_139: int;

const {:extern} {:model_const "tmp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 170} unique __ctobpl_const_136: int;

const {:extern} {:model_const "log.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 177} unique __ctobpl_const_143: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 174} unique __ctobpl_const_142: int;

const {:extern} {:model_const "log.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 177} unique __ctobpl_const_146: int;

const {:extern} {:model_const "tmp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 177} unique __ctobpl_const_147: int;

const {:extern} {:model_const "ser"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 175} unique __ctobpl_const_149: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 175} unique __ctobpl_const_150: int;

const {:extern} {:model_const "tmp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 170} unique __ctobpl_const_137: int;

const {:extern} {:model_const "cof[j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 175} unique __ctobpl_const_151: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 175} unique __ctobpl_const_152: int;

const {:extern} {:model_const "log.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 177} unique __ctobpl_const_145: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 174} unique __ctobpl_const_141: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 164} unique __ctobpl_const_155: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 306} unique __ctobpl_const_4: int;

const {:extern} {:model_const "b0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 224} unique __ctobpl_const_230: int;

const {:extern} {:model_const "a1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 229} unique __ctobpl_const_240: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_250: int;

const {:extern} {:model_const "a0"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 225} unique __ctobpl_const_235: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_255: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_256: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_257: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_258: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 225} unique __ctobpl_const_234: int;

const {:extern} {:model_const "anf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 225} unique __ctobpl_const_236: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_249: int;

const {:extern} {:model_const "b1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 224} unique __ctobpl_const_232: int;

const {:extern} {:model_const "fac"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 229} unique __ctobpl_const_239: int;

const {:extern} {:model_const "a1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 225} unique __ctobpl_const_237: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 231} unique __ctobpl_const_246: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_248: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 224} unique __ctobpl_const_229: int;

const {:extern} {:model_const "anf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 224} unique __ctobpl_const_231: int;

const {:extern} {:model_const "b1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 224} unique __ctobpl_const_228: int;

const {:extern} {:model_const "a1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 227} unique __ctobpl_const_238: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 229} unique __ctobpl_const_241: int;

const {:extern} {:model_const "b1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 229} unique __ctobpl_const_242: int;

const {:extern} {:model_const "fac"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 229} unique __ctobpl_const_243: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 231} unique __ctobpl_const_244: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 231} unique __ctobpl_const_245: int;

const {:extern} {:model_const "a1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 225} unique __ctobpl_const_233: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_247: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_251: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_252: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_253: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 233} unique __ctobpl_const_254: int;

const {:extern} {:model_const "fac"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 223} unique __ctobpl_const_227: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_271: int;

const {:extern} {:model_const "result.exp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_275: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 194} unique __ctobpl_const_283: int;

const {:extern} {:model_const "* p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 63} unique __ctobpl_const_352: int;

const {:extern} {:model_const "n"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_261: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 198} unique __ctobpl_const_286: int;

const {:extern} {:model_const "del"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 198} unique __ctobpl_const_287: int;

const {:extern} {:model_const "exp.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_268: int;

const {:extern} {:model_const "gold"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 236} unique __ctobpl_const_259: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_265: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_270: int;

const {:extern} {:model_const "exp.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_273: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 198} unique __ctobpl_const_288: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 194} unique __ctobpl_const_280: int;

const {:extern} {:model_const "del"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 194} unique __ctobpl_const_282: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_262: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_263: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 236} unique __ctobpl_const_260: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_266: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 191} unique __ctobpl_const_277: int;

const {:extern} {:model_const "ap"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 194} unique __ctobpl_const_278: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 194} unique __ctobpl_const_279: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_267: int;

const {:extern} {:model_const "ap"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 194} unique __ctobpl_const_281: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_264: int;

const {:extern} {:model_const "result.LGamma"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_272: int;

const {:extern} {:model_const "exp.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_274: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 196} unique __ctobpl_const_284: int;

const {:extern} {:model_const "g"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_276: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 196} unique __ctobpl_const_285: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 234} unique __ctobpl_const_269: int;

const {:extern} {:model_const "exp.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_314: int;

const {:extern} {:model_const "exp.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_309: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_299: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_308: int;

const {:extern} {:model_const "totinfo"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 50} unique __ctobpl_const_318: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_295: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_300: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_298: int;

const {:extern} {:model_const "result.exp"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_317: int;

const {:extern} {:model_const "totdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 53} unique __ctobpl_const_319: int;

const {:extern} {:model_const "del"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_290: int;

const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 55} unique __ctobpl_const_320: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_301: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_303: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_296: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_304: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_305: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_293: int;

const {:extern} {:model_const "del"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_292: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_297: int;

const {:extern} {:model_const "n"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_302: int;

const {:extern} {:model_const "result.log"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_312: int;

const {:extern} {:model_const "result.LGamma"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_313: int;

const {:extern} {:model_const "exp.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_315: int;

const {:extern} {:model_const "del"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_294: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_311: int;

const {:extern} {:model_const "sum"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_316: int;

const {:extern} {:model_const "a"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_306: int;

const {:extern} {:model_const "LGamma.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_307: int;

const {:extern} {:model_const "x"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 201} unique __ctobpl_const_310: int;

const {:extern} {:model_const "result.question.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 200} unique __ctobpl_const_291: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 119} unique __ctobpl_const_339: int;

const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_343: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 55} unique __ctobpl_const_321: int;

const {:extern} {:model_const "totdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_331: int;

const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 55} unique __ctobpl_const_323: int;

const {:extern} {:model_const "result.QChiSq"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_333: int;

const {:extern} {:model_const "printf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 124} unique __ctobpl_const_334: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 119} unique __ctobpl_const_338: int;

const {:extern} {:model_const "totinfo"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_327: int;

const {:extern} {:model_const "p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_340: int;

const {:extern} {:model_const "p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_341: int;

const {:extern} {:model_const "totinfo"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 124} unique __ctobpl_const_335: int;

const {:extern} {:model_const "QChiSq.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_330: int;

const {:extern} {:model_const "printf.arg.4"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_332: int;

const {:extern} {:model_const "* p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_342: int;

const {:extern} {:model_const "p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_344: int;

const {:extern} {:model_const "* p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_345: int;

const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_346: int;

const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_347: int;

const {:extern} {:model_const "result.isspace"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 57} unique __ctobpl_const_348: int;

const {:extern} {:model_const "p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 60} unique __ctobpl_const_349: int;

const {:extern} {:model_const "* p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 60} unique __ctobpl_const_350: int;

const {:extern} {:model_const "p"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 63} unique __ctobpl_const_351: int;

const {:extern} {:model_const "result.fgets"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 55} unique __ctobpl_const_324: int;

const {:extern} {:model_const "QChiSq.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_328: int;

const {:extern} {:model_const "totdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 117} unique __ctobpl_const_325: int;

const {:extern} {:model_const "QChiSq.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_326: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 119} unique __ctobpl_const_337: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 119} unique __ctobpl_const_336: int;

const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 55} unique __ctobpl_const_322: int;

const {:extern} {:model_const "totdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 125} unique __ctobpl_const_329: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 87} unique __ctobpl_const_416: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 71} unique __ctobpl_const_423: int;

const {:extern} {:model_const "p"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_429: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 77} unique __ctobpl_const_418: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 65} unique __ctobpl_const_425: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 65} unique __ctobpl_const_426: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 71} unique __ctobpl_const_424: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 65} unique __ctobpl_const_427: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 77} unique __ctobpl_const_420: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 71} unique __ctobpl_const_422: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 65} unique __ctobpl_const_428: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 77} unique __ctobpl_const_419: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 77} unique __ctobpl_const_417: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 71} unique __ctobpl_const_421: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_361: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 83} unique __ctobpl_const_360: int;

const {:extern} {:model_const "infodf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_366: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 113} unique __ctobpl_const_370: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 110} unique __ctobpl_const_373: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 75} unique __ctobpl_const_356: int;

const {:extern} {:model_const "result.sscanf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 69} unique __ctobpl_const_355: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 83} unique __ctobpl_const_358: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_365: int;

const {:extern} {:model_const "result.question.34"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 111} unique __ctobpl_const_376: int;

const {:extern} {:model_const "result.question.33"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 110} unique __ctobpl_const_377: int;

const {:extern} {:model_const "result.question.32"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_380: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 69} unique __ctobpl_const_354: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 69} unique __ctobpl_const_353: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 83} unique __ctobpl_const_359: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_362: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 99} unique __ctobpl_const_369: int;

const {:extern} {:model_const "result.question.34"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 111} unique __ctobpl_const_375: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_367: int;

const {:extern} {:model_const "result.question.34"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 110} unique __ctobpl_const_378: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_372: int;

const {:extern} {:model_const "infodf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_363: int;

const {:extern} {:model_const "r"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_364: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 111} unique __ctobpl_const_374: int;

const {:extern} {:model_const "result.question.33"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 110} unique __ctobpl_const_379: int;

const {:extern} {:model_const "result.question.33"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_381: int;

const {:extern} {:model_const "result.question.32"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_382: int;

const {:extern} {:model_const "result.question.32"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_383: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_384: int;

const {:extern} {:model_const "result.InfoTbl"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 95} unique __ctobpl_const_368: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 75} unique __ctobpl_const_357: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 113} unique __ctobpl_const_371: int;

const {:extern} {:model_const "scanf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_410: int;

const {:extern} {:model_const "result.scanf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_411: int;

const {:extern} {:model_const "QChiSq.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_391: int;

const {:extern} {:model_const "printf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 102} unique __ctobpl_const_395: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 102} unique __ctobpl_const_396: int;

const {:extern} {:model_const "infodf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 106} unique __ctobpl_const_400: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_388: int;

const {:extern} {:model_const "info"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 105} unique __ctobpl_const_398: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 84} unique __ctobpl_const_402: int;

const {:extern} {:model_const "totdf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 106} unique __ctobpl_const_399: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_406: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 84} unique __ctobpl_const_403: int;

const {:extern} {:model_const "QChiSq.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_387: int;

const {:extern} {:model_const "QChiSq.arg.1"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_389: int;

const {:extern} {:model_const "i"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_404: int;

const {:extern} {:model_const "infodf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_390: int;

const {:extern} {:model_const "c"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_407: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_408: int;

const {:extern} {:model_const "printf.arg.4"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_393: int;

const {:extern} {:model_const "result.question.32"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_385: int;

const {:extern} {:model_const "result.QChiSq"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_394: int;

const {:extern} {:model_const "scanf.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_405: int;

const {:extern} {:model_const "j"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_412: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 88} unique __ctobpl_const_413: int;

const {:extern} {:model_const "totinfo"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 105} unique __ctobpl_const_397: int;

const {:extern} {:model_const "j"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 84} unique __ctobpl_const_401: int;

const {:extern} {:model_const "infodf"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 103} unique __ctobpl_const_392: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 88} unique __ctobpl_const_414: int;

const {:extern} {:model_const "f[i * c + j]"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 85} unique __ctobpl_const_409: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 87} unique __ctobpl_const_415: int;

const {:extern} {:model_const "fputs.arg.2"} {:sourceFile ".\v19\tot_info.c"} {:sourceLine 109} unique __ctobpl_const_386: int;

procedure {:extern} __iob_func() returns (__dummy_ret__iob_func: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} exp(__dummy_formal_exp_0.__1: int) returns (__dummy_retexp: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} fgets(__dummy_formal_fgets_0.__1: int, __dummy_formal_fgets_1.__1: int, __dummy_formal_fgets_2.__1: int) returns (__dummy_retfgets: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} fputs(__dummy_formal_fputs_0.__1: int, __dummy_formal_fputs_1.__1: int) returns (__dummy_retfputs: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} isspace(__dummy_formal_isspace_0.__1: int) returns (__dummy_retisspace: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} log(__dummy_formal_log_0.__1: int) returns (__dummy_retlog: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} sin(__dummy_formal_sin_0.__1: int) returns (__dummy_retsin: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} InfoTbl(r.__1: int, c.__1: int, f.__1: int, pdf.__1: int) returns (result.InfoTbl$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} InfoTbl(r.__1: int, c.__1: int, f.__1: int, pdf.__1: int) returns (result.InfoTbl$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} N: int;
  var {:extern} c: int;
  var {:extern} cdf: int;
  var {:extern} f: int;
  var {:extern} i: int;
  var {:extern} info: int;
  var {:extern} j: int;
  var {:extern} k: int;
  var {:extern} $malloc.arg.1$3$: int;
  var {:extern} $malloc.arg.1$5$: int;
  var {:extern} pdf: int;
  var {:extern} pi: int;
  var {:extern} pij: int;
  var {:extern} pj: int;
  var {:extern} r: int;
  var {:extern} rdf: int;
  var {:extern} result.log$6: int;
  var {:extern} result.log$7: int;
  var {:extern} result.log$8: int;
  var {:extern} result.log$9: int;
  var {:extern} result.malloc$2: int;
  var {:extern} result.malloc$4: int;
  var {:extern} sum: int;
  var {:extern} xi: int;
  var {:extern} xj: int;
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
    assume INT_LT(f.__1, alloc);
    assume INT_LT(pdf.__1, alloc);
    N := 0;
    c := 0;
    cdf := 0;
    f := 0;
    i := 0;
    info := 0;
    j := 0;
    k := 0;
    $malloc.arg.1$3$ := 0;
    $malloc.arg.1$5$ := 0;
    pdf := 0;
    pi := 0;
    pij := 0;
    pj := 0;
    r := 0;
    rdf := 0;
    result.InfoTbl$1 := 0;
    result.log$6 := 0;
    result.log$7 := 0;
    result.log$8 := 0;
    result.log$9 := 0;
    result.malloc$2 := 0;
    result.malloc$4 := 0;
    sum := 0;
    xi := 0;
    xj := 0;
    r := r.__1;
    c := c.__1;
    f := f.__1;
    pdf := pdf.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 299} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 300} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 301} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 302} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 303} true;
    goto label_8;

  label_8:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 304} true;
    goto label_9;

  label_9:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 305} true;
    goto label_10;

  label_10:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 305} true;
    rdf := MINUS_BOTH_PTR_OR_BOTH_INT(r, 1, 1);
    assume value_is(__ctobpl_const_1, rdf);
    assume value_is(__ctobpl_const_2, r);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 306} true;
    goto label_12;

  label_12:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 306} true;
    cdf := MINUS_BOTH_PTR_OR_BOTH_INT(c, 1, 1);
    assume value_is(__ctobpl_const_3, cdf);
    assume value_is(__ctobpl_const_4, c);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 307} true;
    goto label_14;

  label_14:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 307} true;
    sum := 0;
    assume value_is(__ctobpl_const_5, sum);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 309} true;
    goto label_15_true, label_15_false;

  label_15_false:
    assume !INT_LEQ(rdf, 0);
    assume value_is(__ctobpl_const_6, rdf);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 309} true;
    goto label_16_true, label_16_false;

  label_16_false:
    assume !INT_LEQ(cdf, 0);
    assume value_is(__ctobpl_const_7, cdf);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 315} true;
    assert pdf != 0;
    Mem_T.INT4 := Mem_T.INT4[pdf := MULT(rdf, cdf)];
    assume value_is(__ctobpl_const_8, pdf);
    assume value_is(__ctobpl_const_9, Mem_T.INT4[pdf]);
    assume value_is(__ctobpl_const_10, rdf);
    assume value_is(__ctobpl_const_11, cdf);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 317} true;
    $malloc.arg.1$3$ := MULT(r, 8);
    assume value_is(__ctobpl_const_12, $malloc.arg.1$3$);
    assume value_is(__ctobpl_const_13, r);
    goto label_22;

  label_22:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 317} true;
    call result.malloc$2 := __HAVOC_det_malloc($malloc.arg.1$3$);
    assume value_is(__ctobpl_const_14, $malloc.arg.1$3$);
    assume value_is(__ctobpl_const_15, $malloc.arg.1$3$);
    assume value_is(__ctobpl_const_16, $malloc.arg.1$3$);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 317} true;
    xi := result.malloc$2;
    assume value_is(__ctobpl_const_17, xi);
    assume value_is(__ctobpl_const_18, result.malloc$2);
    goto label_26;

  label_26:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 317} true;
    goto label_26_true, label_26_false;

  label_26_false:
    assume xi == 0;
    assume value_is(__ctobpl_const_19, xi);
    goto label_27;

  label_27:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 319} true;
    info := -4;
    assume value_is(__ctobpl_const_20, info);
    goto label_104;

  label_104:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 320} true;
    goto label_19;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 406} true;
    result.InfoTbl$1 := info;
    assume value_is(__ctobpl_const_131, info);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 407} true;
    return;

  label_26_true:
    assume xi != 0;
    assume value_is(__ctobpl_const_19, xi);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 323} true;
    $malloc.arg.1$5$ := MULT(c, 8);
    assume value_is(__ctobpl_const_21, $malloc.arg.1$5$);
    assume value_is(__ctobpl_const_22, c);
    goto label_29;

  label_29:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 323} true;
    call result.malloc$4 := __HAVOC_det_malloc($malloc.arg.1$5$);
    assume value_is(__ctobpl_const_23, $malloc.arg.1$5$);
    assume value_is(__ctobpl_const_24, $malloc.arg.1$5$);
    assume value_is(__ctobpl_const_25, $malloc.arg.1$5$);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 323} true;
    xj := result.malloc$4;
    assume value_is(__ctobpl_const_26, xj);
    assume value_is(__ctobpl_const_27, result.malloc$4);
    goto label_33;

  label_33:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 323} true;
    goto label_33_true, label_33_false;

  label_33_false:
    assume xj == 0;
    assume value_is(__ctobpl_const_28, xj);
    goto label_34;

  label_34:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 325} true;
    info := -4;
    assume value_is(__ctobpl_const_29, info);
    goto label_103;

  label_103:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 326} true;
    goto label_52;

  label_52:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 404} true;
    call __HAVOC_free(xi);
    assume value_is(__ctobpl_const_128, xi);
    assume value_is(__ctobpl_const_129, xi);
    goto label_19;

  label_33_true:
    assume xj != 0;
    assume value_is(__ctobpl_const_28, xj);
    goto label_35;

  label_35:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 331} true;
    N := 0;
    assume value_is(__ctobpl_const_30, N);
    goto label_36;

  label_36:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 333} true;
    i := 0;
    assume value_is(__ctobpl_const_31, i);
    goto label_37;

  label_37:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 333} true;
    goto label_37_head;

  label_37_head:
    call N, i, j, k, sum, tempBoogie0 := InfoTbl_loop_label_37_head(N, c, f, i, j, k, r, sum, xi, tempBoogie0);
    goto label_37_head_last;

  label_37_false:
    assume !INT_LT(i, r);
    assume value_is(__ctobpl_const_32, i);
    assume value_is(__ctobpl_const_33, r);
    goto label_38;

  label_38:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 353} true;
    goto label_38_true, label_38_false;

  label_38_false:
    assume !INT_LEQ(N, 0);
    assume value_is(__ctobpl_const_34, N);
    goto label_57;

  label_57:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 361} true;
    j := 0;
    assume value_is(__ctobpl_const_35, j);
    goto label_60;

  label_60:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 361} true;
    goto label_60_head;

  label_60_head:
    call i, j, sum, tempBoogie0 := InfoTbl_loop_label_60_head(c, f, i, j, r, sum, xj, tempBoogie0);
    goto label_60_head_last;

  label_60_false:
    assume !INT_LT(j, c);
    assume value_is(__ctobpl_const_36, j);
    assume value_is(__ctobpl_const_37, c);
    goto label_61;

  label_61:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 373} true;
    call result.log$6 := log(N);
    assume value_is(__ctobpl_const_38, N);
    assume value_is(__ctobpl_const_39, N);
    goto label_71;

  label_71:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 373} true;
    info := MULT(N, result.log$6);
    assume value_is(__ctobpl_const_40, info);
    assume value_is(__ctobpl_const_41, N);
    assume value_is(__ctobpl_const_42, result.log$6);
    goto label_72;

  label_72:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 375} true;
    i := 0;
    assume value_is(__ctobpl_const_43, i);
    goto label_73;

  label_73:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 375} true;
    goto label_73_head;

  label_73_head:
    call i, info, j, pi, pij, result.log$7, result.log$8, tempBoogie0 := InfoTbl_loop_label_73_head(c, f, i, info, j, pi, pij, r, result.log$7, result.log$8, xi, tempBoogie0);
    goto label_73_head_last;

  label_73_false:
    assume !INT_LT(i, r);
    assume value_is(__ctobpl_const_44, i);
    assume value_is(__ctobpl_const_45, r);
    goto label_74;

  label_74:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 391} true;
    j := 0;
    assume value_is(__ctobpl_const_46, j);
    goto label_93;

  label_93:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 391} true;
    goto label_93_head;

  label_93_head:
    call info, j, pj, result.log$9, tempBoogie0 := InfoTbl_loop_label_93_head(c, info, j, pj, result.log$9, xj, tempBoogie0);
    goto label_93_head_last;

  label_93_false:
    assume !INT_LT(j, c);
    assume value_is(__ctobpl_const_47, j);
    assume value_is(__ctobpl_const_48, c);
    goto label_94;

  label_94:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 399} true;
    tempBoogie0 := INT_MULT(info, 2);
    info := tempBoogie0;
    assume value_is(__ctobpl_const_49, info);
    goto label_49;

  label_49:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 402} true;
    call __HAVOC_free(xj);
    assume value_is(__ctobpl_const_126, xj);
    assume value_is(__ctobpl_const_127, xj);
    goto label_52;

  label_93_true:
    assume INT_LT(j, c);
    assume value_is(__ctobpl_const_47, j);
    assume value_is(__ctobpl_const_48, c);
    goto label_95;

  label_95:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 393} true;
    goto label_96;

  label_96:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 393} true;
    assert xj != 0;
    pj := Mem_T.FLOAT[PLUS(xj, 8, j)];
    assume value_is(__ctobpl_const_50, pj);
    assume value_is(__ctobpl_const_51, xj);
    assume value_is(__ctobpl_const_52, j);
    assume value_is(__ctobpl_const_53, Mem_T.FLOAT[PLUS(xj, 8, j)]);
    goto label_97;

  label_97:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 395} true;
    goto label_97_true, label_97_false;

  label_97_false:
    assume !INT_LT(0, pj);
    assume value_is(__ctobpl_const_54, pj);
    goto label_98;

  label_98:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    j := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_60, j);
    goto label_98_dummy;

  label_97_true:
    assume INT_LT(0, pj);
    assume value_is(__ctobpl_const_54, pj);
    goto label_99;

  label_99:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 396} true;
    call result.log$9 := log(pj);
    assume value_is(__ctobpl_const_55, pj);
    assume value_is(__ctobpl_const_56, pj);
    goto label_102;

  label_102:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 396} true;
    tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(info, MULT(pj, result.log$9), 1);
    info := tempBoogie0;
    assume value_is(__ctobpl_const_57, info);
    assume value_is(__ctobpl_const_58, pj);
    assume value_is(__ctobpl_const_59, result.log$9);
    goto label_98;

  label_73_true:
    assume INT_LT(i, r);
    assume value_is(__ctobpl_const_44, i);
    assume value_is(__ctobpl_const_45, r);
    goto label_75;

  label_75:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 377} true;
    goto label_76;

  label_76:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 377} true;
    assert xi != 0;
    pi := Mem_T.FLOAT[PLUS(xi, 8, i)];
    assume value_is(__ctobpl_const_61, pi);
    assume value_is(__ctobpl_const_62, xi);
    assume value_is(__ctobpl_const_63, i);
    assume value_is(__ctobpl_const_64, Mem_T.FLOAT[PLUS(xi, 8, i)]);
    goto label_77;

  label_77:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 379} true;
    goto label_77_true, label_77_false;

  label_77_false:
    assume !INT_LT(0, pi);
    assume value_is(__ctobpl_const_65, pi);
    goto label_78;

  label_78:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 382} true;
    j := 0;
    assume value_is(__ctobpl_const_71, j);
    goto label_83;

  label_83:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 382} true;
    goto label_83_head;

  label_83_head:
    call info, j, pij, result.log$8, tempBoogie0 := InfoTbl_loop_label_83_head(c, f, i, info, j, pij, result.log$8, tempBoogie0);
    goto label_83_head_last;

  label_83_false:
    assume !INT_LT(j, c);
    assume value_is(__ctobpl_const_72, j);
    assume value_is(__ctobpl_const_73, c);
    goto label_84;

  label_84:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_74, i);
    goto label_84_dummy;

  label_83_true:
    assume INT_LT(j, c);
    assume value_is(__ctobpl_const_72, j);
    assume value_is(__ctobpl_const_73, c);
    goto label_85;

  label_85:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 384} true;
    goto label_86;

  label_86:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 384} true;
    assert f != 0;
    pij := Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, c), 1, j))];
    assume value_is(__ctobpl_const_75, pij);
    assume value_is(__ctobpl_const_76, f);
    assume value_is(__ctobpl_const_77, i);
    assume value_is(__ctobpl_const_78, c);
    assume value_is(__ctobpl_const_79, j);
    assume value_is(__ctobpl_const_80, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, c), 1, j))]);
    goto label_87;

  label_87:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 386} true;
    goto label_87_true, label_87_false;

  label_87_false:
    assume !INT_LT(0, pij);
    assume value_is(__ctobpl_const_81, pij);
    goto label_88;

  label_88:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    j := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_87, j);
    goto label_88_dummy;

  label_87_true:
    assume INT_LT(0, pij);
    assume value_is(__ctobpl_const_81, pij);
    goto label_89;

  label_89:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 387} true;
    call result.log$8 := log(pij);
    assume value_is(__ctobpl_const_82, pij);
    assume value_is(__ctobpl_const_83, pij);
    goto label_92;

  label_92:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 387} true;
    tempBoogie0 := PLUS(info, 1, MULT(pij, result.log$8));
    info := tempBoogie0;
    assume value_is(__ctobpl_const_84, info);
    assume value_is(__ctobpl_const_85, pij);
    assume value_is(__ctobpl_const_86, result.log$8);
    goto label_88;

  label_77_true:
    assume INT_LT(0, pi);
    assume value_is(__ctobpl_const_65, pi);
    goto label_79;

  label_79:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 380} true;
    call result.log$7 := log(pi);
    assume value_is(__ctobpl_const_66, pi);
    assume value_is(__ctobpl_const_67, pi);
    goto label_82;

  label_82:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 380} true;
    tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(info, MULT(pi, result.log$7), 1);
    info := tempBoogie0;
    assume value_is(__ctobpl_const_68, info);
    assume value_is(__ctobpl_const_69, pi);
    assume value_is(__ctobpl_const_70, result.log$7);
    goto label_78;

  label_60_true:
    assume INT_LT(j, c);
    assume value_is(__ctobpl_const_36, j);
    assume value_is(__ctobpl_const_37, c);
    goto label_64;

  label_64:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 363} true;
    sum := 0;
    assume value_is(__ctobpl_const_88, sum);
    goto label_65;

  label_65:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 365} true;
    i := 0;
    assume value_is(__ctobpl_const_89, i);
    goto label_66;

  label_66:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 365} true;
    goto label_66_head;

  label_66_head:
    call i, sum, tempBoogie0 := InfoTbl_loop_label_66_head(c, f, i, j, r, sum, tempBoogie0);
    goto label_66_head_last;

  label_66_false:
    assume !INT_LT(i, r);
    assume value_is(__ctobpl_const_90, i);
    assume value_is(__ctobpl_const_91, r);
    goto label_67;

  label_67:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 368} true;
    assert xj != 0;
    Mem_T.FLOAT := Mem_T.FLOAT[PLUS(xj, 8, j) := sum];
    assume value_is(__ctobpl_const_92, xj);
    assume value_is(__ctobpl_const_93, j);
    assume value_is(__ctobpl_const_94, Mem_T.FLOAT[PLUS(xj, 8, j)]);
    assume value_is(__ctobpl_const_95, sum);
    goto label_70;

  label_70:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    j := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_96, j);
    goto label_70_dummy;

  label_66_true:
    assume INT_LT(i, r);
    assume value_is(__ctobpl_const_90, i);
    assume value_is(__ctobpl_const_91, r);
    goto label_68;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 366} true;
    assert f != 0;
    tempBoogie0 := PLUS(sum, 1, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, c), 1, j))]);
    sum := tempBoogie0;
    assume value_is(__ctobpl_const_97, sum);
    assume value_is(__ctobpl_const_98, f);
    assume value_is(__ctobpl_const_99, i);
    assume value_is(__ctobpl_const_100, c);
    assume value_is(__ctobpl_const_101, j);
    assume value_is(__ctobpl_const_102, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, c), 1, j))]);
    goto label_69;

  label_69:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_103, i);
    goto label_69_dummy;

  label_38_true:
    assume INT_LEQ(N, 0);
    assume value_is(__ctobpl_const_34, N);
    goto label_58;

  label_58:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 355} true;
    info := -1;
    assume value_is(__ctobpl_const_104, info);
    goto label_59;

  label_59:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 356} true;
    goto label_49;

  label_37_true:
    assume INT_LT(i, r);
    assume value_is(__ctobpl_const_32, i);
    assume value_is(__ctobpl_const_33, r);
    goto label_39;

  label_39:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 335} true;
    sum := 0;
    assume value_is(__ctobpl_const_105, sum);
    goto label_40;

  label_40:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 337} true;
    j := 0;
    assume value_is(__ctobpl_const_106, j);
    goto label_41;

  label_41:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 337} true;
    goto label_41_head;

  label_41_head:
    call j, k, sum, tempBoogie0 := InfoTbl_loop_label_41_head(c, f, i, j, k, sum, tempBoogie0);
    goto label_41_head_last;

  label_41_false:
    assume !INT_LT(j, c);
    assume value_is(__ctobpl_const_107, j);
    assume value_is(__ctobpl_const_108, c);
    goto label_42;

  label_42:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 350} true;
    assert xi != 0;
    Mem_T.FLOAT := Mem_T.FLOAT[PLUS(xi, 8, i) := sum];
    tempBoogie0 := PLUS(N, 1, Mem_T.FLOAT[PLUS(xi, 8, i)]);
    N := tempBoogie0;
    assume value_is(__ctobpl_const_109, N);
    assume value_is(__ctobpl_const_110, xi);
    assume value_is(__ctobpl_const_111, i);
    assume value_is(__ctobpl_const_112, Mem_T.FLOAT[PLUS(xi, 8, i)]);
    assume value_is(__ctobpl_const_113, sum);
    goto label_56;

  label_56:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_114, i);
    goto label_56_dummy;

  label_41_true:
    assume INT_LT(j, c);
    assume value_is(__ctobpl_const_107, j);
    assume value_is(__ctobpl_const_108, c);
    goto label_43;

  label_43:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 339} true;
    goto label_44;

  label_44:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 339} true;
    assert f != 0;
    k := Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, c), 1, j))];
    assume value_is(__ctobpl_const_115, k);
    assume value_is(__ctobpl_const_116, f);
    assume value_is(__ctobpl_const_117, i);
    assume value_is(__ctobpl_const_118, c);
    assume value_is(__ctobpl_const_119, j);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, c), 1, j))]);
    goto label_45;

  label_45:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 341} true;
    goto label_45_true, label_45_false;

  label_45_false:
    assume !INT_LT(k, 0);
    assume value_is(__ctobpl_const_121, k);
    goto label_46;

  label_46:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 347} true;
    tempBoogie0 := PLUS(sum, 1, k);
    sum := tempBoogie0;
    assume value_is(__ctobpl_const_122, sum);
    assume value_is(__ctobpl_const_123, k);
    goto label_55;

  label_55:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    j := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_124, j);
    goto label_55_dummy;

  label_45_true:
    assume INT_LT(k, 0);
    assume value_is(__ctobpl_const_121, k);
    goto label_47;

  label_47:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 343} true;
    info := -2;
    assume value_is(__ctobpl_const_125, info);
    goto label_48;

  label_48:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 344} true;
    goto label_49;

  label_16_true:
    assume INT_LEQ(cdf, 0);
    assume value_is(__ctobpl_const_7, cdf);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 311} true;
    info := -3;
    assume value_is(__ctobpl_const_130, info);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 312} true;
    goto label_19;

  label_15_true:
    assume INT_LEQ(rdf, 0);
    assume value_is(__ctobpl_const_6, rdf);
    goto label_17;

  label_98_dummy:
    assume false;
    return;

  label_93_head_last:
    goto label_93_true, label_93_false;

  label_88_dummy:
    assume false;
    return;

  label_83_head_last:
    goto label_83_true, label_83_false;

  label_84_dummy:
    assume false;
    return;

  label_73_head_last:
    goto label_73_true, label_73_false;

  label_69_dummy:
    assume false;
    return;

  label_66_head_last:
    goto label_66_true, label_66_false;

  label_70_dummy:
    assume false;
    return;

  label_60_head_last:
    goto label_60_true, label_60_false;

  label_55_dummy:
    assume false;
    return;

  label_41_head_last:
    goto label_41_true, label_41_false;

  label_56_dummy:
    assume false;
    return;

  label_37_head_last:
    goto label_37_true, label_37_false;
}



procedure {:extern} LGamma(x.__1: int) returns (result.LGamma$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} LGamma(x.__1: int) returns (result.LGamma$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $LGamma.arg.1$6$: int;
  var {:extern} j: int;
  var {:extern} $log.arg.1$4$: int;
  var {:extern} $log.arg.1$9$: int;
  var {:extern} pix: int;
  var {:extern} result.LGamma$5: int;
  var {:extern} result.log$2: int;
  var {:extern} result.log$7: int;
  var {:extern} result.log$8: int;
  var {:extern} result.sin$3: int;
  var {:extern} ser: int;
  var {:extern} tmp: int;
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
    $LGamma.arg.1$6$ := 0;
    j := 0;
    $log.arg.1$4$ := 0;
    $log.arg.1$9$ := 0;
    pix := 0;
    result.LGamma$1 := 0;
    result.LGamma$5 := 0;
    result.log$2 := 0;
    result.log$7 := 0;
    result.log$8 := 0;
    result.sin$3 := 0;
    ser := 0;
    tmp := 0;
    x := 0;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 158} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 158} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 159} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 162} true;
    x := MINUS_BOTH_PTR_OR_BOTH_INT(x, 1, 1);
    goto label_6_true, label_6_false;

  label_6_false:
    assume !INT_LT(x, 0);
    assume value_is(__ctobpl_const_132, x);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 169} true;
    tmp := PLUS(x, 1, BOOGIE_FLOAT_CONST_5.5);
    assume value_is(__ctobpl_const_133, tmp);
    assume value_is(__ctobpl_const_134, x);
    goto label_22;

  label_22:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 170} true;
    call result.log$7 := log(tmp);
    assume value_is(__ctobpl_const_135, tmp);
    assume value_is(__ctobpl_const_136, tmp);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 170} true;
    tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(tmp, MULT(PLUS(x, 1, BOOGIE_FLOAT_CONST_0.5), result.log$7), 1);
    tmp := tempBoogie0;
    assume value_is(__ctobpl_const_137, tmp);
    assume value_is(__ctobpl_const_138, x);
    assume value_is(__ctobpl_const_139, result.log$7);
    goto label_26;

  label_26:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 172} true;
    ser := 1;
    assume value_is(__ctobpl_const_140, ser);
    goto label_27;

  label_27:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 174} true;
    j := 0;
    assume value_is(__ctobpl_const_141, j);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 174} true;
    goto label_28_head;

  label_28_head:
    call j, ser, x, tempBoogie0 := LGamma_loop_label_28_head(j, ser, x, tempBoogie0);
    goto label_28_head_last;

  label_28_false:
    assume !INT_LT(j, 6);
    assume value_is(__ctobpl_const_142, j);
    goto label_29;

  label_29:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 177} true;
    $log.arg.1$9$ := MULT(BOOGIE_FLOAT_CONST_2.50663, ser);
    assume value_is(__ctobpl_const_143, $log.arg.1$9$);
    assume value_is(__ctobpl_const_144, ser);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 177} true;
    call result.log$8 := log($log.arg.1$9$);
    assume value_is(__ctobpl_const_145, $log.arg.1$9$);
    assume value_is(__ctobpl_const_146, $log.arg.1$9$);
    goto label_35;

  label_35:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 177} true;
    result.LGamma$1 := PLUS(-tmp, 1, result.log$8);
    assume value_is(__ctobpl_const_147, tmp);
    assume value_is(__ctobpl_const_148, result.log$8);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 178} true;
    return;

  label_28_true:
    assume INT_LT(j, 6);
    assume value_is(__ctobpl_const_142, j);
    goto label_30;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 175} true;
    assert cof != 0;
    x := PLUS(x, 1, 1);
    tempBoogie0 := PLUS(ser, 1, BINARY_BOTH_INT(Mem_T.FLOAT[PLUS(cof, 8, j)], x));
    ser := tempBoogie0;
    assume value_is(__ctobpl_const_149, ser);
    assume value_is(__ctobpl_const_150, j);
    assume value_is(__ctobpl_const_151, Mem_T.FLOAT[PLUS(cof, 8, j)]);
    assume value_is(__ctobpl_const_152, x);
    goto label_31;

  label_31:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    j := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_153, j);
    goto label_31_dummy;

  label_6_true:
    assume INT_LT(x, 0);
    assume value_is(__ctobpl_const_132, x);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 164} true;
    goto label_9;

  label_9:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 164} true;
    pix := MULT(BOOGIE_FLOAT_CONST_3.14159, x);
    assume value_is(__ctobpl_const_154, pix);
    assume value_is(__ctobpl_const_155, x);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 166} true;
    call result.sin$3 := sin(pix);
    assume value_is(__ctobpl_const_156, pix);
    assume value_is(__ctobpl_const_157, pix);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 166} true;
    $log.arg.1$4$ := BINARY_BOTH_INT(pix, result.sin$3);
    assume value_is(__ctobpl_const_158, $log.arg.1$4$);
    assume value_is(__ctobpl_const_159, pix);
    assume value_is(__ctobpl_const_160, result.sin$3);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 166} true;
    call result.log$2 := log($log.arg.1$4$);
    assume value_is(__ctobpl_const_161, $log.arg.1$4$);
    assume value_is(__ctobpl_const_162, $log.arg.1$4$);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 166} true;
    $LGamma.arg.1$6$ := MINUS_BOTH_PTR_OR_BOTH_INT(1, x, 1);
    assume value_is(__ctobpl_const_163, $LGamma.arg.1$6$);
    assume value_is(__ctobpl_const_164, x);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 166} true;
    call result.LGamma$5 := LGamma($LGamma.arg.1$6$);
    assume value_is(__ctobpl_const_165, $LGamma.arg.1$6$);
    assume value_is(__ctobpl_const_166, $LGamma.arg.1$6$);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 166} true;
    result.LGamma$1 := MINUS_BOTH_PTR_OR_BOTH_INT(result.log$2, result.LGamma$5, 1);
    assume value_is(__ctobpl_const_167, result.log$2);
    assume value_is(__ctobpl_const_168, result.LGamma$5);
    goto label_1;

  label_31_dummy:
    assume false;
    return;

  label_28_head_last:
    goto label_28_true, label_28_false;
}



procedure {:extern} QChiSq(chisq.__1: int, df.__1: int) returns (result.QChiSq$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} QChiSq(chisq.__1: int, df.__1: int) returns (result.QChiSq$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $QGamma.arg.1$4$: int;
  var {:extern} $QGamma.arg.2$3$: int;
  var {:extern} chisq: int;
  var {:extern} df: int;
  var {:extern} result.QGamma$2: int;
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
    $QGamma.arg.1$4$ := 0;
    $QGamma.arg.2$3$ := 0;
    chisq := 0;
    df := 0;
    result.QChiSq$1 := 0;
    result.QGamma$2 := 0;
    chisq := chisq.__1;
    df := df.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 256} true;
    $QGamma.arg.2$3$ := BINARY_BOTH_INT(chisq, 2);
    assume value_is(__ctobpl_const_169, $QGamma.arg.2$3$);
    assume value_is(__ctobpl_const_170, chisq);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 256} true;
    $QGamma.arg.1$4$ := BINARY_BOTH_INT(df, 2);
    assume value_is(__ctobpl_const_171, $QGamma.arg.1$4$);
    assume value_is(__ctobpl_const_172, df);
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 256} true;
    call result.QGamma$2 := QGamma($QGamma.arg.1$4$, $QGamma.arg.2$3$);
    assume value_is(__ctobpl_const_173, $QGamma.arg.1$4$);
    assume value_is(__ctobpl_const_174, $QGamma.arg.2$3$);
    assume value_is(__ctobpl_const_175, $QGamma.arg.1$4$);
    assume value_is(__ctobpl_const_176, $QGamma.arg.2$3$);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 256} true;
    result.QChiSq$1 := result.QGamma$2;
    assume value_is(__ctobpl_const_177, result.QGamma$2);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 257} true;
    return;
}



procedure {:extern} QGamma(a.__1: int, x.__1: int) returns (result.QGamma$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} QGamma(a.__1: int, x.__1: int) returns (result.QGamma$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} a: int;
  var {:extern} $gcf.arg.1$8$: int;
  var {:extern} $gcf.arg.2$7$: int;
  var {:extern} $gser.arg.1$5$: int;
  var {:extern} $gser.arg.2$4$: int;
  var {:extern} result.gcf$6: int;
  var {:extern} result.gser$3: int;
  var {:extern} $result.question.2$: int;
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
    a := 0;
    $gcf.arg.1$8$ := 0;
    $gcf.arg.2$7$ := 0;
    $gser.arg.1$5$ := 0;
    $gser.arg.2$4$ := 0;
    result.QGamma$1 := 0;
    result.gcf$6 := 0;
    result.gser$3 := 0;
    $result.question.2$ := 0;
    x := 0;
    a := a.__1;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume !INT_LT(x, PLUS(a, 1, 1));
    assume value_is(__ctobpl_const_178, x);
    assume value_is(__ctobpl_const_179, a);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    $gcf.arg.2$7$ := x;
    assume value_is(__ctobpl_const_180, $gcf.arg.2$7$);
    assume value_is(__ctobpl_const_181, x);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    $gcf.arg.1$8$ := a;
    assume value_is(__ctobpl_const_182, $gcf.arg.1$8$);
    assume value_is(__ctobpl_const_183, a);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    call result.gcf$6 := gcf($gcf.arg.1$8$, $gcf.arg.2$7$);
    assume value_is(__ctobpl_const_184, $gcf.arg.1$8$);
    assume value_is(__ctobpl_const_185, $gcf.arg.2$7$);
    assume value_is(__ctobpl_const_186, $gcf.arg.1$8$);
    assume value_is(__ctobpl_const_187, $gcf.arg.2$7$);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    $result.question.2$ := result.gcf$6;
    assume value_is(__ctobpl_const_188, $result.question.2$);
    assume value_is(__ctobpl_const_189, result.gcf$6);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    result.QGamma$1 := $result.question.2$;
    assume value_is(__ctobpl_const_200, $result.question.2$);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 249} true;
    return;

  label_3_true:
    assume INT_LT(x, PLUS(a, 1, 1));
    assume value_is(__ctobpl_const_178, x);
    assume value_is(__ctobpl_const_179, a);
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    $gser.arg.2$4$ := x;
    assume value_is(__ctobpl_const_190, $gser.arg.2$4$);
    assume value_is(__ctobpl_const_191, x);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    $gser.arg.1$5$ := a;
    assume value_is(__ctobpl_const_192, $gser.arg.1$5$);
    assume value_is(__ctobpl_const_193, a);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    call result.gser$3 := gser($gser.arg.1$5$, $gser.arg.2$4$);
    assume value_is(__ctobpl_const_194, $gser.arg.1$5$);
    assume value_is(__ctobpl_const_195, $gser.arg.2$4$);
    assume value_is(__ctobpl_const_196, $gser.arg.1$5$);
    assume value_is(__ctobpl_const_197, $gser.arg.2$4$);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 248} true;
    $result.question.2$ := MINUS_BOTH_PTR_OR_BOTH_INT(1, result.gser$3, 1);
    assume value_is(__ctobpl_const_198, $result.question.2$);
    assume value_is(__ctobpl_const_199, result.gser$3);
    goto label_11;
}



procedure {:extern} gcf(a.__1: int, x.__1: int) returns (result.gcf$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} gcf(a.__1: int, x.__1: int) returns (result.gcf$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $LGamma.arg.1$7$_123_$static$: int;
  var {:extern} a: int;
  var {:extern} a0: int;
  var {:extern} a1: int;
  var {:extern} an: int;
  var {:extern} ana: int;
  var {:extern} anf: int;
  var {:extern} b0: int;
  var {:extern} b1: int;
  var {:extern} $exp.arg.1$8$_123_$static$: int;
  var {:extern} fac: int;
  var {:extern} g: int;
  var {:extern} gold: int;
  var {:extern} n: int;
  var {:extern} result.LGamma$6: int;
  var {:extern} result.exp$4: int;
  var {:extern} result.log$5: int;
  var {:extern} $result.question.2$_123_$static$: int;
  var {:extern} $result.question.3$_123_$static$: int;
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
    $LGamma.arg.1$7$_123_$static$ := 0;
    a := 0;
    a0 := 0;
    a1 := 0;
    an := 0;
    ana := 0;
    anf := 0;
    b0 := 0;
    b1 := 0;
    $exp.arg.1$8$_123_$static$ := 0;
    fac := 0;
    g := 0;
    gold := 0;
    n := 0;
    result.LGamma$6 := 0;
    result.exp$4 := 0;
    result.gcf$1 := 0;
    result.log$5 := 0;
    $result.question.2$_123_$static$ := 0;
    $result.question.3$_123_$static$ := 0;
    x := 0;
    a := a.__1;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 211} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 212} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 212} true;
    gold := 0;
    assume value_is(__ctobpl_const_201, gold);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 212} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 212} true;
    fac := 1;
    assume value_is(__ctobpl_const_202, fac);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 212} true;
    goto label_9;

  label_9:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 212} true;
    b1 := 1;
    assume value_is(__ctobpl_const_203, b1);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 213} true;
    goto label_11;

  label_11:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 213} true;
    b0 := 0;
    assume value_is(__ctobpl_const_204, b0);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 213} true;
    goto label_13;

  label_13:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 213} true;
    a0 := 1;
    assume value_is(__ctobpl_const_205, a0);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 213} true;
    goto label_15;

  label_15:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 213} true;
    a1 := x;
    assume value_is(__ctobpl_const_206, a1);
    assume value_is(__ctobpl_const_207, x);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 215} true;
    n := 1;
    assume value_is(__ctobpl_const_208, n);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 215} true;
    goto label_17_head;

  label_17_head:
    call a0, a1, an, ana, anf, b0, b1, fac, g, gold, n, $result.question.2$_123_$static$, $result.question.3$_123_$static$ := gcf_loop_label_17_head(a, a0, a1, an, ana, anf, b0, b1, fac, g, gold, n, $result.question.2$_123_$static$, $result.question.3$_123_$static$, x);
    goto label_17_head_last;

  label_17_false:
    assume !INT_LEQ(n, 100);
    assume value_is(__ctobpl_const_209, n);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 241} true;
    return;

  label_17_true:
    assume INT_LEQ(n, 100);
    assume value_is(__ctobpl_const_209, n);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 217} true;
    goto label_19;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 218} true;
    goto label_20;

  label_20:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 218} true;
    an := n;
    assume value_is(__ctobpl_const_210, an);
    assume value_is(__ctobpl_const_211, n);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 219} true;
    goto label_22;

  label_22:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 219} true;
    ana := MINUS_BOTH_PTR_OR_BOTH_INT(an, a, 1);
    assume value_is(__ctobpl_const_212, ana);
    assume value_is(__ctobpl_const_213, an);
    assume value_is(__ctobpl_const_214, a);
    goto label_23;

  label_23:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 221} true;
    a0 := MULT(PLUS(a1, 1, MULT(a0, ana)), fac);
    assume value_is(__ctobpl_const_215, a0);
    assume value_is(__ctobpl_const_216, a1);
    assume value_is(__ctobpl_const_217, a0);
    assume value_is(__ctobpl_const_218, ana);
    assume value_is(__ctobpl_const_219, fac);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 222} true;
    b0 := MULT(PLUS(b1, 1, MULT(b0, ana)), fac);
    assume value_is(__ctobpl_const_220, b0);
    assume value_is(__ctobpl_const_221, b1);
    assume value_is(__ctobpl_const_222, b0);
    assume value_is(__ctobpl_const_223, ana);
    assume value_is(__ctobpl_const_224, fac);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 223} true;
    anf := MULT(an, fac);
    assume value_is(__ctobpl_const_225, anf);
    assume value_is(__ctobpl_const_226, an);
    assume value_is(__ctobpl_const_227, fac);
    goto label_26;

  label_26:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 224} true;
    b1 := PLUS(MULT(x, b0), 1, MULT(anf, b1));
    assume value_is(__ctobpl_const_228, b1);
    assume value_is(__ctobpl_const_229, x);
    assume value_is(__ctobpl_const_230, b0);
    assume value_is(__ctobpl_const_231, anf);
    assume value_is(__ctobpl_const_232, b1);
    goto label_27;

  label_27:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 225} true;
    a1 := PLUS(MULT(x, a0), 1, MULT(anf, a1));
    assume value_is(__ctobpl_const_233, a1);
    assume value_is(__ctobpl_const_234, x);
    assume value_is(__ctobpl_const_235, a0);
    assume value_is(__ctobpl_const_236, anf);
    assume value_is(__ctobpl_const_237, a1);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 227} true;
    goto label_28_true, label_28_false;

  label_28_false:
    assume !INT_NEQ(a1, 0);
    assume value_is(__ctobpl_const_238, a1);
    goto label_29;

  label_29:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    n := PLUS(n, 1, 1);
    assume value_is(__ctobpl_const_261, n);
    goto label_29_dummy;

  label_28_true:
    assume INT_NEQ(a1, 0);
    assume value_is(__ctobpl_const_238, a1);
    goto label_30;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 229} true;
    goto label_31;

  label_31:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 229} true;
    fac := BINARY_BOTH_INT(1, a1);
    assume value_is(__ctobpl_const_239, fac);
    assume value_is(__ctobpl_const_240, a1);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 229} true;
    g := MULT(b1, fac);
    assume value_is(__ctobpl_const_241, g);
    assume value_is(__ctobpl_const_242, b1);
    assume value_is(__ctobpl_const_243, fac);
    goto label_33;

  label_33:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 231} true;
    gold := MINUS_BOTH_PTR_OR_BOTH_INT(g, gold, 1);
    assume value_is(__ctobpl_const_244, gold);
    assume value_is(__ctobpl_const_245, g);
    assume value_is(__ctobpl_const_246, gold);
    goto label_34;

  label_34:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    goto label_34_true, label_34_false;

  label_34_false:
    assume !INT_LT(gold, 0);
    assume value_is(__ctobpl_const_247, gold);
    goto label_35;

  label_35:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    $result.question.2$_123_$static$ := gold;
    assume value_is(__ctobpl_const_248, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_249, gold);
    goto label_37;

  label_37:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    goto label_37_true, label_37_false;

  label_37_false:
    assume !INT_LT(g, 0);
    assume value_is(__ctobpl_const_252, g);
    goto label_38;

  label_38:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    $result.question.3$_123_$static$ := g;
    assume value_is(__ctobpl_const_253, $result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_254, g);
    goto label_40;

  label_40:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    goto label_40_true, label_40_false;

  label_40_false:
    assume !INT_LT($result.question.2$_123_$static$, MULT(BOOGIE_FLOAT_CONST_3e__007, $result.question.3$_123_$static$));
    assume value_is(__ctobpl_const_257, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_258, $result.question.3$_123_$static$);
    goto label_41;

  label_41:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 236} true;
    gold := g;
    assume value_is(__ctobpl_const_259, gold);
    assume value_is(__ctobpl_const_260, g);
    goto label_29;

  label_40_true:
    assume INT_LT($result.question.2$_123_$static$, MULT(BOOGIE_FLOAT_CONST_3e__007, $result.question.3$_123_$static$));
    assume value_is(__ctobpl_const_257, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_258, $result.question.3$_123_$static$);
    goto label_42;

  label_42:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 234} true;
    call result.log$5 := log(x);
    assume value_is(__ctobpl_const_262, x);
    assume value_is(__ctobpl_const_263, x);
    goto label_45;

  label_45:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 234} true;
    $LGamma.arg.1$7$_123_$static$ := a;
    assume value_is(__ctobpl_const_264, $LGamma.arg.1$7$_123_$static$);
    assume value_is(__ctobpl_const_265, a);
    goto label_46;

  label_46:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 234} true;
    call result.LGamma$6 := LGamma($LGamma.arg.1$7$_123_$static$);
    assume value_is(__ctobpl_const_266, $LGamma.arg.1$7$_123_$static$);
    assume value_is(__ctobpl_const_267, $LGamma.arg.1$7$_123_$static$);
    goto label_49;

  label_49:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 234} true;
    $exp.arg.1$8$_123_$static$ := MINUS_BOTH_PTR_OR_BOTH_INT(PLUS(-x, 1, MULT(a, result.log$5)), result.LGamma$6, 1);
    assume value_is(__ctobpl_const_268, $exp.arg.1$8$_123_$static$);
    assume value_is(__ctobpl_const_269, x);
    assume value_is(__ctobpl_const_270, a);
    assume value_is(__ctobpl_const_271, result.log$5);
    assume value_is(__ctobpl_const_272, result.LGamma$6);
    goto label_50;

  label_50:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 234} true;
    call result.exp$4 := exp($exp.arg.1$8$_123_$static$);
    assume value_is(__ctobpl_const_273, $exp.arg.1$8$_123_$static$);
    assume value_is(__ctobpl_const_274, $exp.arg.1$8$_123_$static$);
    goto label_53;

  label_53:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 234} true;
    result.gcf$1 := MULT(result.exp$4, g);
    assume value_is(__ctobpl_const_275, result.exp$4);
    assume value_is(__ctobpl_const_276, g);
    goto label_1;

  label_37_true:
    assume INT_LT(g, 0);
    assume value_is(__ctobpl_const_252, g);
    goto label_39;

  label_39:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    $result.question.3$_123_$static$ := -g;
    assume value_is(__ctobpl_const_255, $result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_256, g);
    goto label_40;

  label_34_true:
    assume INT_LT(gold, 0);
    assume value_is(__ctobpl_const_247, gold);
    goto label_36;

  label_36:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    $result.question.2$_123_$static$ := -gold;
    assume value_is(__ctobpl_const_250, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_251, gold);
    goto label_37;

  label_29_dummy:
    assume false;
    return;

  label_17_head_last:
    goto label_17_true, label_17_false;
}



procedure {:extern} gser(a.__1: int, x.__1: int) returns (result.gser$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} gser(a.__1: int, x.__1: int) returns (result.gser$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $LGamma.arg.1$7$_123_$static$: int;
  var {:extern} a: int;
  var {:extern} ap: int;
  var {:extern} del: int;
  var {:extern} $exp.arg.1$8$_123_$static$: int;
  var {:extern} n: int;
  var {:extern} result.LGamma$6: int;
  var {:extern} result.exp$4: int;
  var {:extern} result.log$5: int;
  var {:extern} $result.question.2$_123_$static$: int;
  var {:extern} $result.question.3$_123_$static$: int;
  var {:extern} sum: int;
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
    $LGamma.arg.1$7$_123_$static$ := 0;
    a := 0;
    ap := 0;
    del := 0;
    $exp.arg.1$8$_123_$static$ := 0;
    n := 0;
    result.LGamma$6 := 0;
    result.exp$4 := 0;
    result.gser$1 := 0;
    result.log$5 := 0;
    $result.question.2$_123_$static$ := 0;
    $result.question.3$_123_$static$ := 0;
    sum := 0;
    x := 0;
    a := a.__1;
    x := x.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 187} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 187} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 187} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 188} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 191} true;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_LEQ(x, 0);
    assume value_is(__ctobpl_const_277, x);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 194} true;
    ap := a;
    assume value_is(__ctobpl_const_278, ap);
    assume value_is(__ctobpl_const_279, a);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 194} true;
    sum := BINARY_BOTH_INT(1, ap);
    assume value_is(__ctobpl_const_280, sum);
    assume value_is(__ctobpl_const_281, ap);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 194} true;
    del := sum;
    assume value_is(__ctobpl_const_282, del);
    assume value_is(__ctobpl_const_283, sum);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 196} true;
    n := 1;
    assume value_is(__ctobpl_const_284, n);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 196} true;
    goto label_13_head;

  label_13_head:
    call ap, del, n, $result.question.2$_123_$static$, $result.question.3$_123_$static$, sum, tempBoogie0, tempBoogie1 := gser_loop_label_13_head(ap, del, n, $result.question.2$_123_$static$, $result.question.3$_123_$static$, sum, x, tempBoogie0, tempBoogie1);
    goto label_13_head_last;

  label_13_false:
    assume !INT_LEQ(n, 100);
    assume value_is(__ctobpl_const_285, n);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 205} true;
    return;

  label_13_true:
    assume INT_LEQ(n, 100);
    assume value_is(__ctobpl_const_285, n);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 198} true;
    ap := PLUS(ap, 1, 1);
    tempBoogie0 := INT_MULT(del, BINARY_BOTH_INT(x, ap));
    del := tempBoogie0;
    tempBoogie1 := PLUS(sum, 1, del);
    sum := tempBoogie1;
    assume value_is(__ctobpl_const_286, sum);
    assume value_is(__ctobpl_const_287, del);
    assume value_is(__ctobpl_const_288, x);
    assume value_is(__ctobpl_const_289, ap);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    goto label_15_true, label_15_false;

  label_15_false:
    assume !INT_LT(del, 0);
    assume value_is(__ctobpl_const_290, del);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    $result.question.2$_123_$static$ := del;
    assume value_is(__ctobpl_const_291, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_292, del);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    goto label_18_true, label_18_false;

  label_18_false:
    assume !INT_LT(sum, 0);
    assume value_is(__ctobpl_const_295, sum);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    $result.question.3$_123_$static$ := sum;
    assume value_is(__ctobpl_const_296, $result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_297, sum);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    goto label_21_true, label_21_false;

  label_21_false:
    assume !INT_LT($result.question.2$_123_$static$, MULT($result.question.3$_123_$static$, BOOGIE_FLOAT_CONST_3e__007));
    assume value_is(__ctobpl_const_300, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_301, $result.question.3$_123_$static$);
    goto label_22;

  label_22:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    n := PLUS(n, 1, 1);
    assume value_is(__ctobpl_const_302, n);
    goto label_22_dummy;

  label_21_true:
    assume INT_LT($result.question.2$_123_$static$, MULT($result.question.3$_123_$static$, BOOGIE_FLOAT_CONST_3e__007));
    assume value_is(__ctobpl_const_300, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_301, $result.question.3$_123_$static$);
    goto label_23;

  label_23:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 201} true;
    call result.log$5 := log(x);
    assume value_is(__ctobpl_const_303, x);
    assume value_is(__ctobpl_const_304, x);
    goto label_26;

  label_26:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 201} true;
    $LGamma.arg.1$7$_123_$static$ := a;
    assume value_is(__ctobpl_const_305, $LGamma.arg.1$7$_123_$static$);
    assume value_is(__ctobpl_const_306, a);
    goto label_27;

  label_27:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 201} true;
    call result.LGamma$6 := LGamma($LGamma.arg.1$7$_123_$static$);
    assume value_is(__ctobpl_const_307, $LGamma.arg.1$7$_123_$static$);
    assume value_is(__ctobpl_const_308, $LGamma.arg.1$7$_123_$static$);
    goto label_30;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 201} true;
    $exp.arg.1$8$_123_$static$ := MINUS_BOTH_PTR_OR_BOTH_INT(PLUS(-x, 1, MULT(a, result.log$5)), result.LGamma$6, 1);
    assume value_is(__ctobpl_const_309, $exp.arg.1$8$_123_$static$);
    assume value_is(__ctobpl_const_310, x);
    assume value_is(__ctobpl_const_311, a);
    assume value_is(__ctobpl_const_312, result.log$5);
    assume value_is(__ctobpl_const_313, result.LGamma$6);
    goto label_31;

  label_31:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 201} true;
    call result.exp$4 := exp($exp.arg.1$8$_123_$static$);
    assume value_is(__ctobpl_const_314, $exp.arg.1$8$_123_$static$);
    assume value_is(__ctobpl_const_315, $exp.arg.1$8$_123_$static$);
    goto label_34;

  label_34:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 201} true;
    result.gser$1 := MULT(sum, result.exp$4);
    assume value_is(__ctobpl_const_316, sum);
    assume value_is(__ctobpl_const_317, result.exp$4);
    goto label_1;

  label_18_true:
    assume INT_LT(sum, 0);
    assume value_is(__ctobpl_const_295, sum);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    $result.question.3$_123_$static$ := -sum;
    assume value_is(__ctobpl_const_298, $result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_299, sum);
    goto label_21;

  label_15_true:
    assume INT_LT(del, 0);
    assume value_is(__ctobpl_const_290, del);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    $result.question.2$_123_$static$ := -del;
    assume value_is(__ctobpl_const_293, $result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_294, del);
    goto label_18;

  label_7_true:
    assume INT_LEQ(x, 0);
    assume value_is(__ctobpl_const_277, x);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 192} true;
    result.gser$1 := 0;
    goto label_1;

  label_22_dummy:
    assume false;
    return;

  label_13_head_last:
    goto label_13_true, label_13_false;
}



procedure {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int);
  free requires INT_LT(0, alloc);
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $InfoTbl.arg.3$23$: int;
  var {:extern} $QChiSq.arg.1$26$: int;
  var {:extern} $QChiSq.arg.1$40$: int;
  var {:extern} argc: int;
  var {:extern} argv: int;
  var {:extern} $fgets.arg.3$4$: int;
  var {:extern} $fputs.arg.2$13$: int;
  var {:extern} $fputs.arg.2$16$: int;
  var {:extern} $fputs.arg.2$21$: int;
  var {:extern} $fputs.arg.2$31$: int;
  var {:extern} $fputs.arg.2$37$: int;
  var {:extern} $fputs.arg.2$9$: int;
  var {:extern} i: int;
  var {:extern} info: int;
  var {:extern} infodf: int;
  var {:extern} $isspace.arg.1$6$: int;
  var {:extern} j: int;
  var {:extern} p: int;
  var {:extern} $printf.arg.2$28$: int;
  var {:extern} $printf.arg.2$42$: int;
  var {:extern} $printf.arg.4$27$: int;
  var {:extern} $printf.arg.4$41$: int;
  var {:extern} result.InfoTbl$22: int;
  var {:extern} result.QChiSq$25: int;
  var {:extern} result.QChiSq$39: int;
  var {:extern} result.__iob_func$30: int;
  var {:extern} result.__iob_func$36: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.__iob_func$8: int;
  var {:extern} result.__iob_func$12: int;
  var {:extern} result.__iob_func$15: int;
  var {:extern} result.__iob_func$20: int;
  var {:extern} result.fgets$2: int;
  var {:extern} result.fputs$29: int;
  var {:extern} result.fputs$35: int;
  var {:extern} result.fputs$7: int;
  var {:extern} result.fputs$11: int;
  var {:extern} result.fputs$14: int;
  var {:extern} result.fputs$19: int;
  var {:extern} result.isspace$5: int;
  var {:extern} result.printf$24: int;
  var {:extern} result.printf$38: int;
  var {:extern} $result.question.32$: int;
  var {:extern} $result.question.33$: int;
  var {:extern} $result.question.34$: int;
  var {:extern} result.scanf$17: int;
  var {:extern} result.sscanf$10: int;
  var {:extern} $scanf.arg.2$18$: int;
  var {:extern} totdf: int;
  var {:extern} totinfo: int;
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
    $InfoTbl.arg.3$23$ := 0;
    $QChiSq.arg.1$26$ := 0;
    $QChiSq.arg.1$40$ := 0;
    argc := 0;
    argv := 0;
    $fgets.arg.3$4$ := 0;
    $fputs.arg.2$13$ := 0;
    $fputs.arg.2$16$ := 0;
    $fputs.arg.2$21$ := 0;
    $fputs.arg.2$31$ := 0;
    $fputs.arg.2$37$ := 0;
    $fputs.arg.2$9$ := 0;
    i := 0;
    info := 0;
    call infodf := __HAVOC_det_malloc(4);
    $isspace.arg.1$6$ := 0;
    j := 0;
    p := 0;
    $printf.arg.2$28$ := 0;
    $printf.arg.2$42$ := 0;
    $printf.arg.4$27$ := 0;
    $printf.arg.4$41$ := 0;
    result.InfoTbl$22 := 0;
    result.QChiSq$25 := 0;
    result.QChiSq$39 := 0;
    result.__iob_func$30 := 0;
    result.__iob_func$36 := 0;
    result.__iob_func$3 := 0;
    result.__iob_func$8 := 0;
    result.__iob_func$12 := 0;
    result.__iob_func$15 := 0;
    result.__iob_func$20 := 0;
    result.fgets$2 := 0;
    result.fputs$29 := 0;
    result.fputs$35 := 0;
    result.fputs$7 := 0;
    result.fputs$11 := 0;
    result.fputs$14 := 0;
    result.fputs$19 := 0;
    result.isspace$5 := 0;
    result.main$1 := 0;
    result.printf$24 := 0;
    result.printf$38 := 0;
    $result.question.32$ := 0;
    $result.question.33$ := 0;
    $result.question.34$ := 0;
    result.scanf$17 := 0;
    result.sscanf$10 := 0;
    $scanf.arg.2$18$ := 0;
    totdf := 0;
    totinfo := 0;
    argc := argc.__1;
    argv := argv.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 45} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 46} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 47} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 48} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 49} true;
    goto label_8;

  label_8:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 50} true;
    goto label_9;

  label_9:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 50} true;
    totinfo := 0;
    assume value_is(__ctobpl_const_318, totinfo);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 51} true;
    goto label_11;

  label_11:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 53} true;
    totdf := 0;
    assume value_is(__ctobpl_const_319, totdf);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    goto label_12_head;

  label_12_head:
    call $QChiSq.arg.1$26$, $fgets.arg.3$4$, $fputs.arg.2$31$, $fputs.arg.2$9$, i, info, $isspace.arg.1$6$, j, p, $printf.arg.2$28$, $printf.arg.4$27$, result.InfoTbl$22, result.QChiSq$25, result.__iob_func$30, result.__iob_func$3, result.__iob_func$8, result.fgets$2, result.fputs$29, result.fputs$7, result.isspace$5, result.printf$24, $result.question.32$, $result.question.33$, $result.question.34$, result.scanf$17, result.sscanf$10, $scanf.arg.2$18$, totdf, totinfo, tempBoogie0, tempBoogie1 := main_loop_label_12_head(havoc_stringTemp, $InfoTbl.arg.3$23$, $QChiSq.arg.1$26$, $fgets.arg.3$4$, $fputs.arg.2$31$, $fputs.arg.2$9$, i, info, infodf, $isspace.arg.1$6$, j, p, $printf.arg.2$28$, $printf.arg.4$27$, result.InfoTbl$22, result.QChiSq$25, result.__iob_func$30, result.__iob_func$3, result.__iob_func$8, result.fgets$2, result.fputs$29, result.fputs$7, result.isspace$5, result.printf$24, $result.question.32$, $result.question.33$, $result.question.34$, result.scanf$17, result.sscanf$10, $scanf.arg.2$18$, totdf, totinfo, tempBoogie0, tempBoogie1);
    goto label_12_head_last;

  label_15:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    assert result.__iob_func$3 != 0;
    $fgets.arg.3$4$ := PLUS(result.__iob_func$3, 32, 0);
    assume value_is(__ctobpl_const_320, $fgets.arg.3$4$);
    assume value_is(__ctobpl_const_321, result.__iob_func$3);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    call result.fgets$2 := fgets(line, 26, $fgets.arg.3$4$);
    assume value_is(__ctobpl_const_322, $fgets.arg.3$4$);
    assume value_is(__ctobpl_const_323, $fgets.arg.3$4$);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    goto label_19_true, label_19_false;

  label_19_false:
    assume result.fgets$2 == 0;
    assume value_is(__ctobpl_const_324, result.fgets$2);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 117} true;
    goto label_20_true, label_20_false;

  label_20_false:
    assume !INT_LEQ(totdf, 0);
    assume value_is(__ctobpl_const_325, totdf);
    goto label_113;

  label_113:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 125} true;
    $QChiSq.arg.1$40$ := totinfo;
    assume value_is(__ctobpl_const_326, $QChiSq.arg.1$40$);
    assume value_is(__ctobpl_const_327, totinfo);
    goto label_122;

  label_122:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 125} true;
    call result.QChiSq$39 := QChiSq($QChiSq.arg.1$40$, totdf);
    assume value_is(__ctobpl_const_328, $QChiSq.arg.1$40$);
    assume value_is(__ctobpl_const_329, totdf);
    assume value_is(__ctobpl_const_330, $QChiSq.arg.1$40$);
    assume value_is(__ctobpl_const_331, totdf);
    goto label_125;

  label_125:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 125} true;
    $printf.arg.4$41$ := result.QChiSq$39;
    assume value_is(__ctobpl_const_332, $printf.arg.4$41$);
    assume value_is(__ctobpl_const_333, result.QChiSq$39);
    goto label_126;

  label_126:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 124} true;
    $printf.arg.2$42$ := totinfo;
    assume value_is(__ctobpl_const_334, $printf.arg.2$42$);
    assume value_is(__ctobpl_const_335, totinfo);
    goto label_127;

  label_127:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 123} true;
    call result.printf$38 := det_choice();
    goto label_130;

  label_130:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 127} true;
    result.main$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 128} true;
    call __HAVOC_free(infodf);
    return;

  label_20_true:
    assume INT_LEQ(totdf, 0);
    assume value_is(__ctobpl_const_325, totdf);
    goto label_114;

  label_114:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 119} true;
    call result.__iob_func$36 := __iob_func();
    goto label_117;

  label_117:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 119} true;
    assert result.__iob_func$36 != 0;
    $fputs.arg.2$37$ := PLUS(result.__iob_func$36, 32, 1);
    assume value_is(__ctobpl_const_336, $fputs.arg.2$37$);
    assume value_is(__ctobpl_const_337, result.__iob_func$36);
    goto label_118;

  label_118:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 119} true;
    call result.fputs$35 := fputs(havoc_stringTemp, $fputs.arg.2$37$);
    assume value_is(__ctobpl_const_338, $fputs.arg.2$37$);
    assume value_is(__ctobpl_const_339, $fputs.arg.2$37$);
    goto label_121;

  label_121:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 120} true;
    result.main$1 := 1;
    goto label_1;

  label_19_true:
    assume result.fgets$2 != 0;
    assume value_is(__ctobpl_const_324, result.fgets$2);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    p := line;
    assume value_is(__ctobpl_const_340, p);
    goto label_22;

  label_22:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    goto label_22_head;

  label_22_head:
    call $isspace.arg.1$6$, p, result.isspace$5 := main_loop_label_22_head($isspace.arg.1$6$, p, result.isspace$5);
    goto label_22_head_last;

  label_22_false:
    assume Mem_T.CHAR[p] == 0;
    assume value_is(__ctobpl_const_341, p);
    assume value_is(__ctobpl_const_342, Mem_T.CHAR[p]);
    goto label_23;

  label_23:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 60} true;
    assert p != 0;
    goto label_23_true, label_23_false;

  label_23_false:
    assume Mem_T.CHAR[p] == 0;
    assume value_is(__ctobpl_const_349, p);
    assume value_is(__ctobpl_const_350, Mem_T.CHAR[p]);
    goto label_30;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 61} true;
    goto label_30_dummy;

  label_23_true:
    assume Mem_T.CHAR[p] != 0;
    assume value_is(__ctobpl_const_349, p);
    assume value_is(__ctobpl_const_350, Mem_T.CHAR[p]);
    goto label_31;

  label_31:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 63} true;
    assert p != 0;
    goto label_31_true, label_31_false;

  label_31_false:
    assume !INT_EQ(Mem_T.CHAR[p], 35);
    assume value_is(__ctobpl_const_351, p);
    assume value_is(__ctobpl_const_352, Mem_T.CHAR[p]);
    goto label_32;

  label_32:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 69} true;
    call result.sscanf$10 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.INT4[r] := tempBoogie0;
    call tempBoogie1 := det_choice();
    Mem_T.INT4[c] := tempBoogie1;
    assume value_is(__ctobpl_const_353, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_354, Mem_T.INT4[c]);
    goto label_43;

  label_43:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 69} true;
    goto label_43_true, label_43_false;

  label_43_false:
    assume !INT_NEQ(result.sscanf$10, 2);
    assume value_is(__ctobpl_const_355, result.sscanf$10);
    goto label_44;

  label_44:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 75} true;
    goto label_44_true, label_44_false;

  label_44_false:
    assume !INT_LT(1000, MULT(Mem_T.INT4[r], Mem_T.INT4[c]));
    assume value_is(__ctobpl_const_356, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_357, Mem_T.INT4[c]);
    goto label_53;

  label_53:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 83} true;
    i := 0;
    assume value_is(__ctobpl_const_358, i);
    goto label_62;

  label_62:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 83} true;
    goto label_62_head;

  label_62_head:
    call i, j, result.scanf$17, $scanf.arg.2$18$, tempBoogie0 := main_loop_label_62_head(i, j, result.scanf$17, $scanf.arg.2$18$, tempBoogie0);
    goto label_62_head_last;

  label_62_false:
    assume !INT_LT(i, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_359, i);
    assume value_is(__ctobpl_const_360, Mem_T.INT4[r]);
    goto label_63;

  label_63:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 95} true;
    goto label_81;

  label_81:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 95} true;
    call result.InfoTbl$22 := InfoTbl(Mem_T.INT4[r], Mem_T.INT4[c], $InfoTbl.arg.3$23$, infodf);
    assume value_is(__ctobpl_const_361, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_362, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_363, Mem_T.INT4[infodf]);
    assume value_is(__ctobpl_const_364, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_365, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_366, Mem_T.INT4[infodf]);
    goto label_84;

  label_84:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 95} true;
    info := result.InfoTbl$22;
    assume value_is(__ctobpl_const_367, info);
    assume value_is(__ctobpl_const_368, result.InfoTbl$22);
    goto label_85;

  label_85:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 99} true;
    goto label_85_true, label_85_false;

  label_85_false:
    assume !INT_LEQ(0, info);
    assume value_is(__ctobpl_const_369, info);
    goto label_86;

  label_86:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 113} true;
    call result.__iob_func$30 := __iob_func();
    goto label_100;

  label_100:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 113} true;
    assert result.__iob_func$30 != 0;
    $fputs.arg.2$31$ := PLUS(result.__iob_func$30, 32, 1);
    assume value_is(__ctobpl_const_370, $fputs.arg.2$31$);
    assume value_is(__ctobpl_const_371, result.__iob_func$30);
    goto label_101;

  label_101:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    goto label_101_true, label_101_false;

  label_101_false:
    assume !INT_LT(info, BOOGIE_FLOAT_CONST___3.5);
    assume value_is(__ctobpl_const_372, info);
    goto label_102;

  label_102:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 110} true;
    goto label_102_true, label_102_false;

  label_102_false:
    assume !INT_LT(info, BOOGIE_FLOAT_CONST___2.5);
    assume value_is(__ctobpl_const_373, info);
    goto label_107;

  label_107:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 111} true;
    goto label_107_true, label_107_false;

  label_107_false:
    assume !INT_LT(info, BOOGIE_FLOAT_CONST___1.5);
    assume value_is(__ctobpl_const_374, info);
    goto label_110;

  label_110:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 111} true;
    $result.question.34$ := havoc_stringTemp;
    assume value_is(__ctobpl_const_375, $result.question.34$);
    goto label_112;

  label_112:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 110} true;
    $result.question.33$ := $result.question.34$;
    assume value_is(__ctobpl_const_377, $result.question.33$);
    assume value_is(__ctobpl_const_378, $result.question.34$);
    goto label_109;

  label_109:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    $result.question.32$ := $result.question.33$;
    assume value_is(__ctobpl_const_380, $result.question.32$);
    assume value_is(__ctobpl_const_381, $result.question.33$);
    goto label_104;

  label_104:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    call result.fputs$29 := fputs($result.question.32$, $fputs.arg.2$31$);
    assume value_is(__ctobpl_const_383, $result.question.32$);
    assume value_is(__ctobpl_const_384, $fputs.arg.2$31$);
    assume value_is(__ctobpl_const_385, $result.question.32$);
    assume value_is(__ctobpl_const_386, $fputs.arg.2$31$);
    goto label_104_dummy;

  label_107_true:
    assume INT_LT(info, BOOGIE_FLOAT_CONST___1.5);
    assume value_is(__ctobpl_const_374, info);
    goto label_111;

  label_111:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 111} true;
    $result.question.34$ := havoc_stringTemp;
    assume value_is(__ctobpl_const_376, $result.question.34$);
    goto label_112;

  label_102_true:
    assume INT_LT(info, BOOGIE_FLOAT_CONST___2.5);
    assume value_is(__ctobpl_const_373, info);
    goto label_108;

  label_108:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 110} true;
    $result.question.33$ := havoc_stringTemp;
    assume value_is(__ctobpl_const_379, $result.question.33$);
    goto label_109;

  label_101_true:
    assume INT_LT(info, BOOGIE_FLOAT_CONST___3.5);
    assume value_is(__ctobpl_const_372, info);
    goto label_103;

  label_103:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    $result.question.32$ := havoc_stringTemp;
    assume value_is(__ctobpl_const_382, $result.question.32$);
    goto label_104;

  label_85_true:
    assume INT_LEQ(0, info);
    assume value_is(__ctobpl_const_369, info);
    goto label_89;

  label_89:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 103} true;
    $QChiSq.arg.1$26$ := info;
    assume value_is(__ctobpl_const_387, $QChiSq.arg.1$26$);
    assume value_is(__ctobpl_const_388, info);
    goto label_90;

  label_90:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 103} true;
    call result.QChiSq$25 := QChiSq($QChiSq.arg.1$26$, Mem_T.INT4[infodf]);
    assume value_is(__ctobpl_const_389, $QChiSq.arg.1$26$);
    assume value_is(__ctobpl_const_390, Mem_T.INT4[infodf]);
    assume value_is(__ctobpl_const_391, $QChiSq.arg.1$26$);
    assume value_is(__ctobpl_const_392, Mem_T.INT4[infodf]);
    goto label_93;

  label_93:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 103} true;
    $printf.arg.4$27$ := result.QChiSq$25;
    assume value_is(__ctobpl_const_393, $printf.arg.4$27$);
    assume value_is(__ctobpl_const_394, result.QChiSq$25);
    goto label_94;

  label_94:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 102} true;
    $printf.arg.2$28$ := info;
    assume value_is(__ctobpl_const_395, $printf.arg.2$28$);
    assume value_is(__ctobpl_const_396, info);
    goto label_95;

  label_95:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 101} true;
    call result.printf$24 := det_choice();
    goto label_98;

  label_98:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 105} true;
    tempBoogie0 := PLUS(totinfo, 1, info);
    totinfo := tempBoogie0;
    assume value_is(__ctobpl_const_397, totinfo);
    assume value_is(__ctobpl_const_398, info);
    goto label_99;

  label_99:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 106} true;
    tempBoogie0 := PLUS(totdf, 1, Mem_T.INT4[infodf]);
    totdf := tempBoogie0;
    assume value_is(__ctobpl_const_399, totdf);
    assume value_is(__ctobpl_const_400, Mem_T.INT4[infodf]);
    goto label_99_dummy;

  label_62_true:
    assume INT_LT(i, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_359, i);
    assume value_is(__ctobpl_const_360, Mem_T.INT4[r]);
    goto label_64;

  label_64:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 84} true;
    j := 0;
    assume value_is(__ctobpl_const_401, j);
    goto label_65;

  label_65:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 84} true;
    goto label_65_head;

  label_65_head:
    call j, result.scanf$17, $scanf.arg.2$18$, tempBoogie0 := main_loop_label_65_head(i, j, result.scanf$17, $scanf.arg.2$18$, tempBoogie0);
    goto label_65_head_last;

  label_65_false:
    assume !INT_LT(j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_66;

  label_66:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    i := PLUS(i, 1, 1);
    assume value_is(__ctobpl_const_404, i);
    goto label_66_dummy;

  label_65_true:
    assume INT_LT(j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_67;

  label_67:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    assert f != 0;
    $scanf.arg.2$18$ := PLUS(f, 4, PLUS(MULT(i, Mem_T.INT4[c]), 1, j));
    assume value_is(__ctobpl_const_405, $scanf.arg.2$18$);
    assume value_is(__ctobpl_const_406, i);
    assume value_is(__ctobpl_const_407, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_408, j);
    assume value_is(__ctobpl_const_409, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(i, Mem_T.INT4[c]), 1, j))]);
    goto label_68;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    call result.scanf$17 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.INT4[$scanf.arg.2$18$] := tempBoogie0;
    assume value_is(__ctobpl_const_410, $scanf.arg.2$18$);
    goto label_71;

  label_71:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    goto label_71_true, label_71_false;

  label_71_false:
    assume !INT_NEQ(result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, result.scanf$17);
    goto label_72;

  label_72:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    j := PLUS(j, 1, 1);
    assume value_is(__ctobpl_const_412, j);
    goto label_72_dummy;

  label_71_true:
    assume INT_NEQ(result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, result.scanf$17);
    goto label_73;

  label_73:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 88} true;
    call result.__iob_func$20 := __iob_func();
    goto label_76;

  label_76:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 88} true;
    assert result.__iob_func$20 != 0;
    $fputs.arg.2$21$ := PLUS(result.__iob_func$20, 32, 1);
    assume value_is(__ctobpl_const_413, $fputs.arg.2$21$);
    assume value_is(__ctobpl_const_414, result.__iob_func$20);
    goto label_77;

  label_77:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 87} true;
    call result.fputs$19 := fputs(havoc_stringTemp, $fputs.arg.2$21$);
    assume value_is(__ctobpl_const_415, $fputs.arg.2$21$);
    assume value_is(__ctobpl_const_416, $fputs.arg.2$21$);
    goto label_80;

  label_80:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 90} true;
    result.main$1 := 1;
    goto label_1;

  label_44_true:
    assume INT_LT(1000, MULT(Mem_T.INT4[r], Mem_T.INT4[c]));
    assume value_is(__ctobpl_const_356, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_357, Mem_T.INT4[c]);
    goto label_54;

  label_54:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 77} true;
    call result.__iob_func$15 := __iob_func();
    goto label_57;

  label_57:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 77} true;
    assert result.__iob_func$15 != 0;
    $fputs.arg.2$16$ := PLUS(result.__iob_func$15, 32, 1);
    assume value_is(__ctobpl_const_417, $fputs.arg.2$16$);
    assume value_is(__ctobpl_const_418, result.__iob_func$15);
    goto label_58;

  label_58:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 77} true;
    call result.fputs$14 := fputs(havoc_stringTemp, $fputs.arg.2$16$);
    assume value_is(__ctobpl_const_419, $fputs.arg.2$16$);
    assume value_is(__ctobpl_const_420, $fputs.arg.2$16$);
    goto label_61;

  label_61:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 78} true;
    result.main$1 := 1;
    goto label_1;

  label_43_true:
    assume INT_NEQ(result.sscanf$10, 2);
    assume value_is(__ctobpl_const_355, result.sscanf$10);
    goto label_45;

  label_45:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 71} true;
    call result.__iob_func$12 := __iob_func();
    goto label_48;

  label_48:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 71} true;
    assert result.__iob_func$12 != 0;
    $fputs.arg.2$13$ := PLUS(result.__iob_func$12, 32, 1);
    assume value_is(__ctobpl_const_421, $fputs.arg.2$13$);
    assume value_is(__ctobpl_const_422, result.__iob_func$12);
    goto label_49;

  label_49:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 71} true;
    call result.fputs$11 := fputs(havoc_stringTemp, $fputs.arg.2$13$);
    assume value_is(__ctobpl_const_423, $fputs.arg.2$13$);
    assume value_is(__ctobpl_const_424, $fputs.arg.2$13$);
    goto label_52;

  label_52:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 72} true;
    result.main$1 := 1;
    goto label_1;

  label_31_true:
    assume INT_EQ(Mem_T.CHAR[p], 35);
    assume value_is(__ctobpl_const_351, p);
    assume value_is(__ctobpl_const_352, Mem_T.CHAR[p]);
    goto label_35;

  label_35:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 65} true;
    call result.__iob_func$8 := __iob_func();
    goto label_38;

  label_38:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 65} true;
    assert result.__iob_func$8 != 0;
    $fputs.arg.2$9$ := PLUS(result.__iob_func$8, 32, 1);
    assume value_is(__ctobpl_const_425, $fputs.arg.2$9$);
    assume value_is(__ctobpl_const_426, result.__iob_func$8);
    goto label_39;

  label_39:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 65} true;
    call result.fputs$7 := fputs(line, $fputs.arg.2$9$);
    assume value_is(__ctobpl_const_427, $fputs.arg.2$9$);
    assume value_is(__ctobpl_const_428, $fputs.arg.2$9$);
    goto label_42;

  label_42:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 66} true;
    goto label_42_dummy;

  label_22_true:
    assume Mem_T.CHAR[p] != 0;
    assume value_is(__ctobpl_const_341, p);
    assume value_is(__ctobpl_const_342, Mem_T.CHAR[p]);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    assert p != 0;
    $isspace.arg.1$6$ := Mem_T.CHAR[p];
    assume value_is(__ctobpl_const_343, $isspace.arg.1$6$);
    assume value_is(__ctobpl_const_344, p);
    assume value_is(__ctobpl_const_345, Mem_T.CHAR[p]);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    call result.isspace$5 := isspace($isspace.arg.1$6$);
    assume value_is(__ctobpl_const_346, $isspace.arg.1$6$);
    assume value_is(__ctobpl_const_347, $isspace.arg.1$6$);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    goto label_28_true, label_28_false;

  label_28_false:
    assume result.isspace$5 == 0;
    assume value_is(__ctobpl_const_348, result.isspace$5);
    goto label_23;

  label_28_true:
    assume result.isspace$5 != 0;
    assume value_is(__ctobpl_const_348, result.isspace$5);
    goto label_29;

  label_29:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    p := PLUS(p, 1, 1);
    assume value_is(__ctobpl_const_429, p);
    goto label_29_dummy;

  label_72_dummy:
    assume false;
    return;

  label_65_head_last:
    goto label_65_true, label_65_false;

  label_66_dummy:
    assume false;
    return;

  label_62_head_last:
    goto label_62_true, label_62_false;

  label_29_dummy:
    assume false;
    return;

  label_22_head_last:
    assert p != 0;
    goto label_22_true, label_22_false;

  label_30_dummy:
    assume false;
    return;

  label_104_dummy:
    assume false;
    return;

  label_99_dummy:
    assume false;
    return;

  label_42_dummy:
    assume false;
    return;

  label_12_head_last:
    call result.__iob_func$3 := __iob_func();
    goto label_15;
}



implementation InfoTbl_loop_label_93_head(in_c: int, in_info: int, in_j: int, in_pj: int, in_result.log$9: int, in_xj: int, in_tempBoogie0: int) returns (out_info: int, out_j: int, out_pj: int, out_result.log$9: int, out_tempBoogie0: int)
{

  entry:
    out_info, out_j, out_pj, out_result.log$9, out_tempBoogie0 := in_info, in_j, in_pj, in_result.log$9, in_tempBoogie0;
    goto label_93_head;

  label_93_head:
    goto label_93_true, label_93_false;

  label_93_false:
    assume !INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_47, out_j);
    assume value_is(__ctobpl_const_48, in_c);
    out_info, out_j, out_pj, out_result.log$9, out_tempBoogie0 := in_info, in_j, in_pj, in_result.log$9, in_tempBoogie0;
    return;

  label_98:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_60, out_j);
    goto label_98_dummy;

  label_97_false:
    assume !INT_LT(0, out_pj);
    assume value_is(__ctobpl_const_54, out_pj);
    goto label_98;

  label_102:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 396} true;
    out_tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(out_info, MULT(out_pj, out_result.log$9), 1);
    out_info := out_tempBoogie0;
    assume value_is(__ctobpl_const_57, out_info);
    assume value_is(__ctobpl_const_58, out_pj);
    assume value_is(__ctobpl_const_59, out_result.log$9);
    goto label_98;

  label_99:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 396} true;
    call out_result.log$9 := log(out_pj);
    assume value_is(__ctobpl_const_55, out_pj);
    assume value_is(__ctobpl_const_56, out_pj);
    goto label_102;

  label_97_true:
    assume INT_LT(0, out_pj);
    assume value_is(__ctobpl_const_54, out_pj);
    goto label_99;

  label_97:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 395} true;
    goto label_97_true, label_97_false;

  label_96:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 393} true;
    assert in_xj != 0;
    out_pj := Mem_T.FLOAT[PLUS(in_xj, 8, out_j)];
    assume value_is(__ctobpl_const_50, out_pj);
    assume value_is(__ctobpl_const_51, in_xj);
    assume value_is(__ctobpl_const_52, out_j);
    assume value_is(__ctobpl_const_53, Mem_T.FLOAT[PLUS(in_xj, 8, out_j)]);
    goto label_97;

  label_95:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 393} true;
    goto label_96;

  label_93_true:
    assume INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_47, out_j);
    assume value_is(__ctobpl_const_48, in_c);
    goto label_95;

  label_98_dummy:
    call {:si_unique_call 1} out_info, out_j, out_pj, out_result.log$9, out_tempBoogie0 := InfoTbl_loop_label_93_head(in_c, out_info, out_j, out_pj, out_result.log$9, in_xj, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_93_head(in_c: int, in_info: int, in_j: int, in_pj: int, in_result.log$9: int, in_xj: int, in_tempBoogie0: int) returns (out_info: int, out_j: int, out_pj: int, out_result.log$9: int, out_tempBoogie0: int);



implementation InfoTbl_loop_label_83_head(in_c: int, in_f: int, in_i: int, in_info: int, in_j: int, in_pij: int, in_result.log$8: int, in_tempBoogie0: int) returns (out_info: int, out_j: int, out_pij: int, out_result.log$8: int, out_tempBoogie0: int)
{

  entry:
    out_info, out_j, out_pij, out_result.log$8, out_tempBoogie0 := in_info, in_j, in_pij, in_result.log$8, in_tempBoogie0;
    goto label_83_head;

  label_83_head:
    goto label_83_true, label_83_false;

  label_83_false:
    assume !INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_72, out_j);
    assume value_is(__ctobpl_const_73, in_c);
    out_info, out_j, out_pij, out_result.log$8, out_tempBoogie0 := in_info, in_j, in_pij, in_result.log$8, in_tempBoogie0;
    return;

  label_88:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_87, out_j);
    goto label_88_dummy;

  label_87_false:
    assume !INT_LT(0, out_pij);
    assume value_is(__ctobpl_const_81, out_pij);
    goto label_88;

  label_92:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 387} true;
    out_tempBoogie0 := PLUS(out_info, 1, MULT(out_pij, out_result.log$8));
    out_info := out_tempBoogie0;
    assume value_is(__ctobpl_const_84, out_info);
    assume value_is(__ctobpl_const_85, out_pij);
    assume value_is(__ctobpl_const_86, out_result.log$8);
    goto label_88;

  label_89:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 387} true;
    call out_result.log$8 := log(out_pij);
    assume value_is(__ctobpl_const_82, out_pij);
    assume value_is(__ctobpl_const_83, out_pij);
    goto label_92;

  label_87_true:
    assume INT_LT(0, out_pij);
    assume value_is(__ctobpl_const_81, out_pij);
    goto label_89;

  label_87:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 386} true;
    goto label_87_true, label_87_false;

  label_86:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 384} true;
    assert in_f != 0;
    out_pij := Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(in_i, in_c), 1, out_j))];
    assume value_is(__ctobpl_const_75, out_pij);
    assume value_is(__ctobpl_const_76, in_f);
    assume value_is(__ctobpl_const_77, in_i);
    assume value_is(__ctobpl_const_78, in_c);
    assume value_is(__ctobpl_const_79, out_j);
    assume value_is(__ctobpl_const_80, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(in_i, in_c), 1, out_j))]);
    goto label_87;

  label_85:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 384} true;
    goto label_86;

  label_83_true:
    assume INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_72, out_j);
    assume value_is(__ctobpl_const_73, in_c);
    goto label_85;

  label_88_dummy:
    call {:si_unique_call 1} out_info, out_j, out_pij, out_result.log$8, out_tempBoogie0 := InfoTbl_loop_label_83_head(in_c, in_f, in_i, out_info, out_j, out_pij, out_result.log$8, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_83_head(in_c: int, in_f: int, in_i: int, in_info: int, in_j: int, in_pij: int, in_result.log$8: int, in_tempBoogie0: int) returns (out_info: int, out_j: int, out_pij: int, out_result.log$8: int, out_tempBoogie0: int);



implementation InfoTbl_loop_label_73_head(in_c: int, in_f: int, in_i: int, in_info: int, in_j: int, in_pi: int, in_pij: int, in_r: int, in_result.log$7: int, in_result.log$8: int, in_xi: int, in_tempBoogie0: int) returns (out_i: int, out_info: int, out_j: int, out_pi: int, out_pij: int, out_result.log$7: int, out_result.log$8: int, out_tempBoogie0: int)
{

  entry:
    out_i, out_info, out_j, out_pi, out_pij, out_result.log$7, out_result.log$8, out_tempBoogie0 := in_i, in_info, in_j, in_pi, in_pij, in_result.log$7, in_result.log$8, in_tempBoogie0;
    goto label_73_head;

  label_73_head:
    goto label_73_true, label_73_false;

  label_73_false:
    assume !INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_44, out_i);
    assume value_is(__ctobpl_const_45, in_r);
    out_i, out_info, out_j, out_pi, out_pij, out_result.log$7, out_result.log$8, out_tempBoogie0 := in_i, in_info, in_j, in_pi, in_pij, in_result.log$7, in_result.log$8, in_tempBoogie0;
    return;

  label_84:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_74, out_i);
    goto label_84_dummy;

  label_83_false:
    assume !INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_72, out_j);
    assume value_is(__ctobpl_const_73, in_c);
    goto label_84;

  label_83_head:
    call out_info, out_j, out_pij, out_result.log$8, out_tempBoogie0 := InfoTbl_loop_label_83_head(in_c, in_f, out_i, out_info, out_j, out_pij, out_result.log$8, out_tempBoogie0);
    goto label_83_head_last;

  label_83_head_last:
    out_i, out_info, out_j, out_pi, out_pij, out_result.log$7, out_result.log$8, out_tempBoogie0 := in_i, in_info, in_j, in_pi, in_pij, in_result.log$7, in_result.log$8, in_tempBoogie0;
    goto label_83_true, label_83_false;

  label_83:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 382} true;
    goto label_83_head;

  label_88:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_87, out_j);
    goto label_88_dummy;

  label_88_dummy:
    assume false;
    out_i, out_info, out_j, out_pi, out_pij, out_result.log$7, out_result.log$8, out_tempBoogie0 := in_i, in_info, in_j, in_pi, in_pij, in_result.log$7, in_result.log$8, in_tempBoogie0;
    return;

  label_87_false:
    assume !INT_LT(0, out_pij);
    assume value_is(__ctobpl_const_81, out_pij);
    goto label_88;

  label_92:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 387} true;
    out_tempBoogie0 := PLUS(out_info, 1, MULT(out_pij, out_result.log$8));
    out_info := out_tempBoogie0;
    assume value_is(__ctobpl_const_84, out_info);
    assume value_is(__ctobpl_const_85, out_pij);
    assume value_is(__ctobpl_const_86, out_result.log$8);
    goto label_88;

  label_89:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 387} true;
    call out_result.log$8 := log(out_pij);
    assume value_is(__ctobpl_const_82, out_pij);
    assume value_is(__ctobpl_const_83, out_pij);
    goto label_92;

  label_87_true:
    assume INT_LT(0, out_pij);
    assume value_is(__ctobpl_const_81, out_pij);
    goto label_89;

  label_87:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 386} true;
    goto label_87_true, label_87_false;

  label_86:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 384} true;
    assert in_f != 0;
    out_pij := Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, out_j))];
    assume value_is(__ctobpl_const_75, out_pij);
    assume value_is(__ctobpl_const_76, in_f);
    assume value_is(__ctobpl_const_77, out_i);
    assume value_is(__ctobpl_const_78, in_c);
    assume value_is(__ctobpl_const_79, out_j);
    assume value_is(__ctobpl_const_80, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, out_j))]);
    goto label_87;

  label_85:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 384} true;
    goto label_86;

  label_83_true:
    assume INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_72, out_j);
    assume value_is(__ctobpl_const_73, in_c);
    goto label_85;

  label_78:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 382} true;
    out_j := 0;
    assume value_is(__ctobpl_const_71, out_j);
    goto label_83;

  label_77_false:
    assume !INT_LT(0, out_pi);
    assume value_is(__ctobpl_const_65, out_pi);
    goto label_78;

  label_82:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 380} true;
    out_tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(out_info, MULT(out_pi, out_result.log$7), 1);
    out_info := out_tempBoogie0;
    assume value_is(__ctobpl_const_68, out_info);
    assume value_is(__ctobpl_const_69, out_pi);
    assume value_is(__ctobpl_const_70, out_result.log$7);
    goto label_78;

  label_79:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 380} true;
    call out_result.log$7 := log(out_pi);
    assume value_is(__ctobpl_const_66, out_pi);
    assume value_is(__ctobpl_const_67, out_pi);
    goto label_82;

  label_77_true:
    assume INT_LT(0, out_pi);
    assume value_is(__ctobpl_const_65, out_pi);
    goto label_79;

  label_77:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 379} true;
    goto label_77_true, label_77_false;

  label_76:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 377} true;
    assert in_xi != 0;
    out_pi := Mem_T.FLOAT[PLUS(in_xi, 8, out_i)];
    assume value_is(__ctobpl_const_61, out_pi);
    assume value_is(__ctobpl_const_62, in_xi);
    assume value_is(__ctobpl_const_63, out_i);
    assume value_is(__ctobpl_const_64, Mem_T.FLOAT[PLUS(in_xi, 8, out_i)]);
    goto label_77;

  label_75:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 377} true;
    goto label_76;

  label_73_true:
    assume INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_44, out_i);
    assume value_is(__ctobpl_const_45, in_r);
    goto label_75;

  label_84_dummy:
    call {:si_unique_call 1} out_i, out_info, out_j, out_pi, out_pij, out_result.log$7, out_result.log$8, out_tempBoogie0 := InfoTbl_loop_label_73_head(in_c, in_f, out_i, out_info, out_j, out_pi, out_pij, in_r, out_result.log$7, out_result.log$8, in_xi, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_73_head(in_c: int, in_f: int, in_i: int, in_info: int, in_j: int, in_pi: int, in_pij: int, in_r: int, in_result.log$7: int, in_result.log$8: int, in_xi: int, in_tempBoogie0: int) returns (out_i: int, out_info: int, out_j: int, out_pi: int, out_pij: int, out_result.log$7: int, out_result.log$8: int, out_tempBoogie0: int);



implementation InfoTbl_loop_label_66_head(in_c: int, in_f: int, in_i: int, in_j: int, in_r: int, in_sum: int, in_tempBoogie0: int) returns (out_i: int, out_sum: int, out_tempBoogie0: int)
{

  entry:
    out_i, out_sum, out_tempBoogie0 := in_i, in_sum, in_tempBoogie0;
    goto label_66_head;

  label_66_head:
    goto label_66_true, label_66_false;

  label_66_false:
    assume !INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_90, out_i);
    assume value_is(__ctobpl_const_91, in_r);
    out_i, out_sum, out_tempBoogie0 := in_i, in_sum, in_tempBoogie0;
    return;

  label_69:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_103, out_i);
    goto label_69_dummy;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 366} true;
    assert in_f != 0;
    out_tempBoogie0 := PLUS(out_sum, 1, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, in_j))]);
    out_sum := out_tempBoogie0;
    assume value_is(__ctobpl_const_97, out_sum);
    assume value_is(__ctobpl_const_98, in_f);
    assume value_is(__ctobpl_const_99, out_i);
    assume value_is(__ctobpl_const_100, in_c);
    assume value_is(__ctobpl_const_101, in_j);
    assume value_is(__ctobpl_const_102, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, in_j))]);
    goto label_69;

  label_66_true:
    assume INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_90, out_i);
    assume value_is(__ctobpl_const_91, in_r);
    goto label_68;

  label_69_dummy:
    call {:si_unique_call 1} out_i, out_sum, out_tempBoogie0 := InfoTbl_loop_label_66_head(in_c, in_f, out_i, in_j, in_r, out_sum, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_66_head(in_c: int, in_f: int, in_i: int, in_j: int, in_r: int, in_sum: int, in_tempBoogie0: int) returns (out_i: int, out_sum: int, out_tempBoogie0: int);



implementation InfoTbl_loop_label_60_head(in_c: int, in_f: int, in_i: int, in_j: int, in_r: int, in_sum: int, in_xj: int, in_tempBoogie0: int) returns (out_i: int, out_j: int, out_sum: int, out_tempBoogie0: int)
{

  entry:
    out_i, out_j, out_sum, out_tempBoogie0 := in_i, in_j, in_sum, in_tempBoogie0;
    goto label_60_head;

  label_60_head:
    goto label_60_true, label_60_false;

  label_60_false:
    assume !INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_36, out_j);
    assume value_is(__ctobpl_const_37, in_c);
    out_i, out_j, out_sum, out_tempBoogie0 := in_i, in_j, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    return;

  label_70:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_96, out_j);
    goto label_70_dummy;

  label_67:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 368} true;
    assert in_xj != 0;
    Mem_T.FLOAT := Mem_T.FLOAT[PLUS(in_xj, 8, out_j) := out_sum];
    assume value_is(__ctobpl_const_92, in_xj);
    assume value_is(__ctobpl_const_93, out_j);
    assume value_is(__ctobpl_const_94, Mem_T.FLOAT[PLUS(in_xj, 8, out_j)]);
    assume value_is(__ctobpl_const_95, out_sum);
    goto label_70;

  label_66_false:
    assume !INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_90, out_i);
    assume value_is(__ctobpl_const_91, in_r);
    goto label_67;

  label_66_head:
    call out_i, out_sum, out_tempBoogie0 := InfoTbl_loop_label_66_head(in_c, in_f, out_i, out_j, in_r, out_sum, out_tempBoogie0);
    goto label_66_head_last;

  label_66_head_last:
    out_i, out_j, out_sum, out_tempBoogie0 := in_i, in_j, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    goto label_66_true, label_66_false;

  label_66:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 365} true;
    goto label_66_head;

  label_69:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_103, out_i);
    goto label_69_dummy;

  label_69_dummy:
    assume false;
    out_i, out_j, out_sum, out_tempBoogie0 := in_i, in_j, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    return;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 366} true;
    assert in_f != 0;
    out_tempBoogie0 := PLUS(out_sum, 1, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, out_j))]);
    out_sum := out_tempBoogie0;
    assume value_is(__ctobpl_const_97, out_sum);
    assume value_is(__ctobpl_const_98, in_f);
    assume value_is(__ctobpl_const_99, out_i);
    assume value_is(__ctobpl_const_100, in_c);
    assume value_is(__ctobpl_const_101, out_j);
    assume value_is(__ctobpl_const_102, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, out_j))]);
    goto label_69;

  label_66_true:
    assume INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_90, out_i);
    assume value_is(__ctobpl_const_91, in_r);
    goto label_68;

  label_65:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 365} true;
    out_i := 0;
    assume value_is(__ctobpl_const_89, out_i);
    goto label_66;

  label_64:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 363} true;
    out_sum := 0;
    assume value_is(__ctobpl_const_88, out_sum);
    goto label_65;

  label_60_true:
    assume INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_36, out_j);
    assume value_is(__ctobpl_const_37, in_c);
    goto label_64;

  label_70_dummy:
    call {:si_unique_call 1} out_i, out_j, out_sum, out_tempBoogie0 := InfoTbl_loop_label_60_head(in_c, in_f, out_i, out_j, in_r, out_sum, in_xj, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_60_head(in_c: int, in_f: int, in_i: int, in_j: int, in_r: int, in_sum: int, in_xj: int, in_tempBoogie0: int) returns (out_i: int, out_j: int, out_sum: int, out_tempBoogie0: int);
  modifies Mem_T.FLOAT;



implementation InfoTbl_loop_label_41_head(in_c: int, in_f: int, in_i: int, in_j: int, in_k: int, in_sum: int, in_tempBoogie0: int) returns (out_j: int, out_k: int, out_sum: int, out_tempBoogie0: int)
{

  entry:
    out_j, out_k, out_sum, out_tempBoogie0 := in_j, in_k, in_sum, in_tempBoogie0;
    goto label_41_head;

  label_41_head:
    goto label_41_true, label_41_false;

  label_41_false:
    assume !INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_107, out_j);
    assume value_is(__ctobpl_const_108, in_c);
    out_j, out_k, out_sum, out_tempBoogie0 := in_j, in_k, in_sum, in_tempBoogie0;
    return;

  label_55:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_124, out_j);
    goto label_55_dummy;

  label_46:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 347} true;
    out_tempBoogie0 := PLUS(out_sum, 1, out_k);
    out_sum := out_tempBoogie0;
    assume value_is(__ctobpl_const_122, out_sum);
    assume value_is(__ctobpl_const_123, out_k);
    goto label_55;

  label_45_false:
    assume !INT_LT(out_k, 0);
    assume value_is(__ctobpl_const_121, out_k);
    goto label_46;

  label_45:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 341} true;
    goto label_45_true, label_45_false;

  label_45_true:
    assume INT_LT(out_k, 0);
    assume value_is(__ctobpl_const_121, out_k);
    out_j, out_k, out_sum, out_tempBoogie0 := in_j, in_k, in_sum, in_tempBoogie0;
    return;

  label_44:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 339} true;
    assert in_f != 0;
    out_k := Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(in_i, in_c), 1, out_j))];
    assume value_is(__ctobpl_const_115, out_k);
    assume value_is(__ctobpl_const_116, in_f);
    assume value_is(__ctobpl_const_117, in_i);
    assume value_is(__ctobpl_const_118, in_c);
    assume value_is(__ctobpl_const_119, out_j);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(in_i, in_c), 1, out_j))]);
    goto label_45;

  label_43:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 339} true;
    goto label_44;

  label_41_true:
    assume INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_107, out_j);
    assume value_is(__ctobpl_const_108, in_c);
    goto label_43;

  label_55_dummy:
    call {:si_unique_call 1} out_j, out_k, out_sum, out_tempBoogie0 := InfoTbl_loop_label_41_head(in_c, in_f, in_i, out_j, out_k, out_sum, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_41_head(in_c: int, in_f: int, in_i: int, in_j: int, in_k: int, in_sum: int, in_tempBoogie0: int) returns (out_j: int, out_k: int, out_sum: int, out_tempBoogie0: int);



implementation InfoTbl_loop_label_37_head(in_N: int, in_c: int, in_f: int, in_i: int, in_j: int, in_k: int, in_r: int, in_sum: int, in_xi: int, in_tempBoogie0: int) returns (out_N: int, out_i: int, out_j: int, out_k: int, out_sum: int, out_tempBoogie0: int)
{

  entry:
    out_N, out_i, out_j, out_k, out_sum, out_tempBoogie0 := in_N, in_i, in_j, in_k, in_sum, in_tempBoogie0;
    goto label_37_head;

  label_37_head:
    goto label_37_true, label_37_false;

  label_37_false:
    assume !INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_32, out_i);
    assume value_is(__ctobpl_const_33, in_r);
    out_N, out_i, out_j, out_k, out_sum, out_tempBoogie0 := in_N, in_i, in_j, in_k, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    return;

  label_56:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_114, out_i);
    goto label_56_dummy;

  label_42:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 350} true;
    assert in_xi != 0;
    Mem_T.FLOAT := Mem_T.FLOAT[PLUS(in_xi, 8, out_i) := out_sum];
    out_tempBoogie0 := PLUS(out_N, 1, Mem_T.FLOAT[PLUS(in_xi, 8, out_i)]);
    out_N := out_tempBoogie0;
    assume value_is(__ctobpl_const_109, out_N);
    assume value_is(__ctobpl_const_110, in_xi);
    assume value_is(__ctobpl_const_111, out_i);
    assume value_is(__ctobpl_const_112, Mem_T.FLOAT[PLUS(in_xi, 8, out_i)]);
    assume value_is(__ctobpl_const_113, out_sum);
    goto label_56;

  label_41_false:
    assume !INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_107, out_j);
    assume value_is(__ctobpl_const_108, in_c);
    goto label_42;

  label_41_head:
    call out_j, out_k, out_sum, out_tempBoogie0 := InfoTbl_loop_label_41_head(in_c, in_f, out_i, out_j, out_k, out_sum, out_tempBoogie0);
    goto label_41_head_last;

  label_41_head_last:
    out_N, out_i, out_j, out_k, out_sum, out_tempBoogie0 := in_N, in_i, in_j, in_k, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    goto label_41_true, label_41_false;

  label_41:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 337} true;
    goto label_41_head;

  label_55:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_124, out_j);
    goto label_55_dummy;

  label_55_dummy:
    assume false;
    out_N, out_i, out_j, out_k, out_sum, out_tempBoogie0 := in_N, in_i, in_j, in_k, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    return;

  label_46:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 347} true;
    out_tempBoogie0 := PLUS(out_sum, 1, out_k);
    out_sum := out_tempBoogie0;
    assume value_is(__ctobpl_const_122, out_sum);
    assume value_is(__ctobpl_const_123, out_k);
    goto label_55;

  label_45_false:
    assume !INT_LT(out_k, 0);
    assume value_is(__ctobpl_const_121, out_k);
    goto label_46;

  label_45:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 341} true;
    goto label_45_true, label_45_false;

  label_45_true:
    assume INT_LT(out_k, 0);
    assume value_is(__ctobpl_const_121, out_k);
    out_N, out_i, out_j, out_k, out_sum, out_tempBoogie0 := in_N, in_i, in_j, in_k, in_sum, in_tempBoogie0;
    Mem_T.FLOAT := old(Mem_T.FLOAT);
    return;

  label_44:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 339} true;
    assert in_f != 0;
    out_k := Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, out_j))];
    assume value_is(__ctobpl_const_115, out_k);
    assume value_is(__ctobpl_const_116, in_f);
    assume value_is(__ctobpl_const_117, out_i);
    assume value_is(__ctobpl_const_118, in_c);
    assume value_is(__ctobpl_const_119, out_j);
    assume value_is(__ctobpl_const_120, Mem_T.INT4[PLUS(in_f, 4, PLUS(MULT(out_i, in_c), 1, out_j))]);
    goto label_45;

  label_43:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 339} true;
    goto label_44;

  label_41_true:
    assume INT_LT(out_j, in_c);
    assume value_is(__ctobpl_const_107, out_j);
    assume value_is(__ctobpl_const_108, in_c);
    goto label_43;

  label_40:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 337} true;
    out_j := 0;
    assume value_is(__ctobpl_const_106, out_j);
    goto label_41;

  label_39:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 335} true;
    out_sum := 0;
    assume value_is(__ctobpl_const_105, out_sum);
    goto label_40;

  label_37_true:
    assume INT_LT(out_i, in_r);
    assume value_is(__ctobpl_const_32, out_i);
    assume value_is(__ctobpl_const_33, in_r);
    goto label_39;

  label_56_dummy:
    call {:si_unique_call 1} out_N, out_i, out_j, out_k, out_sum, out_tempBoogie0 := InfoTbl_loop_label_37_head(out_N, in_c, in_f, out_i, out_j, out_k, in_r, out_sum, in_xi, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure InfoTbl_loop_label_37_head(in_N: int, in_c: int, in_f: int, in_i: int, in_j: int, in_k: int, in_r: int, in_sum: int, in_xi: int, in_tempBoogie0: int) returns (out_N: int, out_i: int, out_j: int, out_k: int, out_sum: int, out_tempBoogie0: int);
  modifies Mem_T.FLOAT;



implementation LGamma_loop_label_28_head(in_j: int, in_ser: int, in_x: int, in_tempBoogie0: int) returns (out_j: int, out_ser: int, out_x: int, out_tempBoogie0: int)
{

  entry:
    out_j, out_ser, out_x, out_tempBoogie0 := in_j, in_ser, in_x, in_tempBoogie0;
    goto label_28_head;

  label_28_head:
    goto label_28_true, label_28_false;

  label_28_false:
    assume !INT_LT(out_j, 6);
    assume value_is(__ctobpl_const_142, out_j);
    out_j, out_ser, out_x, out_tempBoogie0 := in_j, in_ser, in_x, in_tempBoogie0;
    return;

  label_31:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_153, out_j);
    goto label_31_dummy;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 175} true;
    assert cof != 0;
    out_x := PLUS(out_x, 1, 1);
    out_tempBoogie0 := PLUS(out_ser, 1, BINARY_BOTH_INT(Mem_T.FLOAT[PLUS(cof, 8, out_j)], out_x));
    out_ser := out_tempBoogie0;
    assume value_is(__ctobpl_const_149, out_ser);
    assume value_is(__ctobpl_const_150, out_j);
    assume value_is(__ctobpl_const_151, Mem_T.FLOAT[PLUS(cof, 8, out_j)]);
    assume value_is(__ctobpl_const_152, out_x);
    goto label_31;

  label_28_true:
    assume INT_LT(out_j, 6);
    assume value_is(__ctobpl_const_142, out_j);
    goto label_30;

  label_31_dummy:
    call {:si_unique_call 1} out_j, out_ser, out_x, out_tempBoogie0 := LGamma_loop_label_28_head(out_j, out_ser, out_x, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure LGamma_loop_label_28_head(in_j: int, in_ser: int, in_x: int, in_tempBoogie0: int) returns (out_j: int, out_ser: int, out_x: int, out_tempBoogie0: int);



implementation gcf_loop_label_17_head(in_a: int, in_a0: int, in_a1: int, in_an: int, in_ana: int, in_anf: int, in_b0: int, in_b1: int, in_fac: int, in_g: int, in_gold: int, in_n: int, in_$result.question.2$_123_$static$: int, in_$result.question.3$_123_$static$: int, in_x: int) returns (out_a0: int, out_a1: int, out_an: int, out_ana: int, out_anf: int, out_b0: int, out_b1: int, out_fac: int, out_g: int, out_gold: int, out_n: int, out_$result.question.2$_123_$static$: int, out_$result.question.3$_123_$static$: int)
{

  entry:
    out_a0, out_a1, out_an, out_ana, out_anf, out_b0, out_b1, out_fac, out_g, out_gold, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$ := in_a0, in_a1, in_an, in_ana, in_anf, in_b0, in_b1, in_fac, in_g, in_gold, in_n, in_$result.question.2$_123_$static$, in_$result.question.3$_123_$static$;
    goto label_17_head;

  label_17_head:
    goto label_17_true, label_17_false;

  label_17_false:
    assume !INT_LEQ(out_n, 100);
    assume value_is(__ctobpl_const_209, out_n);
    out_a0, out_a1, out_an, out_ana, out_anf, out_b0, out_b1, out_fac, out_g, out_gold, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$ := in_a0, in_a1, in_an, in_ana, in_anf, in_b0, in_b1, in_fac, in_g, in_gold, in_n, in_$result.question.2$_123_$static$, in_$result.question.3$_123_$static$;
    return;

  label_29:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_n := PLUS(out_n, 1, 1);
    assume value_is(__ctobpl_const_261, out_n);
    goto label_29_dummy;

  label_28_false:
    assume !INT_NEQ(out_a1, 0);
    assume value_is(__ctobpl_const_238, out_a1);
    goto label_29;

  label_41:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 236} true;
    out_gold := out_g;
    assume value_is(__ctobpl_const_259, out_gold);
    assume value_is(__ctobpl_const_260, out_g);
    goto label_29;

  label_40_false:
    assume !INT_LT(out_$result.question.2$_123_$static$, MULT(BOOGIE_FLOAT_CONST_3e__007, out_$result.question.3$_123_$static$));
    assume value_is(__ctobpl_const_257, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_258, out_$result.question.3$_123_$static$);
    goto label_41;

  label_40:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    goto label_40_true, label_40_false;

  label_40_true:
    assume INT_LT(out_$result.question.2$_123_$static$, MULT(BOOGIE_FLOAT_CONST_3e__007, out_$result.question.3$_123_$static$));
    assume value_is(__ctobpl_const_257, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_258, out_$result.question.3$_123_$static$);
    out_a0, out_a1, out_an, out_ana, out_anf, out_b0, out_b1, out_fac, out_g, out_gold, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$ := in_a0, in_a1, in_an, in_ana, in_anf, in_b0, in_b1, in_fac, in_g, in_gold, in_n, in_$result.question.2$_123_$static$, in_$result.question.3$_123_$static$;
    return;

  label_38:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    out_$result.question.3$_123_$static$ := out_g;
    assume value_is(__ctobpl_const_253, out_$result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_254, out_g);
    goto label_40;

  label_39:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    out_$result.question.3$_123_$static$ := -out_g;
    assume value_is(__ctobpl_const_255, out_$result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_256, out_g);
    goto label_40;

  label_37_true:
    assume INT_LT(out_g, 0);
    assume value_is(__ctobpl_const_252, out_g);
    goto label_39;

  label_37:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    goto label_37_true, label_37_false;

  label_35:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    out_$result.question.2$_123_$static$ := out_gold;
    assume value_is(__ctobpl_const_248, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_249, out_gold);
    goto label_37;

  label_36:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    out_$result.question.2$_123_$static$ := -out_gold;
    assume value_is(__ctobpl_const_250, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_251, out_gold);
    goto label_37;

  label_34_true:
    assume INT_LT(out_gold, 0);
    assume value_is(__ctobpl_const_247, out_gold);
    goto label_36;

  label_34:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 233} true;
    goto label_34_true, label_34_false;

  label_33:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 231} true;
    out_gold := MINUS_BOTH_PTR_OR_BOTH_INT(out_g, out_gold, 1);
    assume value_is(__ctobpl_const_244, out_gold);
    assume value_is(__ctobpl_const_245, out_g);
    assume value_is(__ctobpl_const_246, out_gold);
    goto label_34;

  label_32:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 229} true;
    out_g := MULT(out_b1, out_fac);
    assume value_is(__ctobpl_const_241, out_g);
    assume value_is(__ctobpl_const_242, out_b1);
    assume value_is(__ctobpl_const_243, out_fac);
    goto label_33;

  label_31:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 229} true;
    out_fac := BINARY_BOTH_INT(1, out_a1);
    assume value_is(__ctobpl_const_239, out_fac);
    assume value_is(__ctobpl_const_240, out_a1);
    goto label_32;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 229} true;
    goto label_31;

  label_28_true:
    assume INT_NEQ(out_a1, 0);
    assume value_is(__ctobpl_const_238, out_a1);
    goto label_30;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 227} true;
    goto label_28_true, label_28_false;

  label_27:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 225} true;
    out_a1 := PLUS(MULT(in_x, out_a0), 1, MULT(out_anf, out_a1));
    assume value_is(__ctobpl_const_233, out_a1);
    assume value_is(__ctobpl_const_234, in_x);
    assume value_is(__ctobpl_const_235, out_a0);
    assume value_is(__ctobpl_const_236, out_anf);
    assume value_is(__ctobpl_const_237, out_a1);
    goto label_28;

  label_26:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 224} true;
    out_b1 := PLUS(MULT(in_x, out_b0), 1, MULT(out_anf, out_b1));
    assume value_is(__ctobpl_const_228, out_b1);
    assume value_is(__ctobpl_const_229, in_x);
    assume value_is(__ctobpl_const_230, out_b0);
    assume value_is(__ctobpl_const_231, out_anf);
    assume value_is(__ctobpl_const_232, out_b1);
    goto label_27;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 223} true;
    out_anf := MULT(out_an, out_fac);
    assume value_is(__ctobpl_const_225, out_anf);
    assume value_is(__ctobpl_const_226, out_an);
    assume value_is(__ctobpl_const_227, out_fac);
    goto label_26;

  label_24:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 222} true;
    out_b0 := MULT(PLUS(out_b1, 1, MULT(out_b0, out_ana)), out_fac);
    assume value_is(__ctobpl_const_220, out_b0);
    assume value_is(__ctobpl_const_221, out_b1);
    assume value_is(__ctobpl_const_222, out_b0);
    assume value_is(__ctobpl_const_223, out_ana);
    assume value_is(__ctobpl_const_224, out_fac);
    goto label_25;

  label_23:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 221} true;
    out_a0 := MULT(PLUS(out_a1, 1, MULT(out_a0, out_ana)), out_fac);
    assume value_is(__ctobpl_const_215, out_a0);
    assume value_is(__ctobpl_const_216, out_a1);
    assume value_is(__ctobpl_const_217, out_a0);
    assume value_is(__ctobpl_const_218, out_ana);
    assume value_is(__ctobpl_const_219, out_fac);
    goto label_24;

  label_22:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 219} true;
    out_ana := MINUS_BOTH_PTR_OR_BOTH_INT(out_an, in_a, 1);
    assume value_is(__ctobpl_const_212, out_ana);
    assume value_is(__ctobpl_const_213, out_an);
    assume value_is(__ctobpl_const_214, in_a);
    goto label_23;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 219} true;
    goto label_22;

  label_20:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 218} true;
    out_an := out_n;
    assume value_is(__ctobpl_const_210, out_an);
    assume value_is(__ctobpl_const_211, out_n);
    goto label_21;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 218} true;
    goto label_20;

  label_18:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 217} true;
    goto label_19;

  label_17_true:
    assume INT_LEQ(out_n, 100);
    assume value_is(__ctobpl_const_209, out_n);
    goto label_18;

  label_34_false:
    assume !INT_LT(out_gold, 0);
    assume value_is(__ctobpl_const_247, out_gold);
    goto label_35;

  label_37_false:
    assume !INT_LT(out_g, 0);
    assume value_is(__ctobpl_const_252, out_g);
    goto label_38;

  label_29_dummy:
    call {:si_unique_call 1} out_a0, out_a1, out_an, out_ana, out_anf, out_b0, out_b1, out_fac, out_g, out_gold, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$ := gcf_loop_label_17_head(in_a, out_a0, out_a1, out_an, out_ana, out_anf, out_b0, out_b1, out_fac, out_g, out_gold, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$, in_x);
    return;

  exit:
    return;
}



procedure gcf_loop_label_17_head(in_a: int, in_a0: int, in_a1: int, in_an: int, in_ana: int, in_anf: int, in_b0: int, in_b1: int, in_fac: int, in_g: int, in_gold: int, in_n: int, in_$result.question.2$_123_$static$: int, in_$result.question.3$_123_$static$: int, in_x: int) returns (out_a0: int, out_a1: int, out_an: int, out_ana: int, out_anf: int, out_b0: int, out_b1: int, out_fac: int, out_g: int, out_gold: int, out_n: int, out_$result.question.2$_123_$static$: int, out_$result.question.3$_123_$static$: int);



implementation gser_loop_label_13_head(in_ap: int, in_del: int, in_n: int, in_$result.question.2$_123_$static$: int, in_$result.question.3$_123_$static$: int, in_sum: int, in_x: int, in_tempBoogie0: int, in_tempBoogie1: int) returns (out_ap: int, out_del: int, out_n: int, out_$result.question.2$_123_$static$: int, out_$result.question.3$_123_$static$: int, out_sum: int, out_tempBoogie0: int, out_tempBoogie1: int)
{

  entry:
    out_ap, out_del, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$, out_sum, out_tempBoogie0, out_tempBoogie1 := in_ap, in_del, in_n, in_$result.question.2$_123_$static$, in_$result.question.3$_123_$static$, in_sum, in_tempBoogie0, in_tempBoogie1;
    goto label_13_head;

  label_13_head:
    goto label_13_true, label_13_false;

  label_13_false:
    assume !INT_LEQ(out_n, 100);
    assume value_is(__ctobpl_const_285, out_n);
    out_ap, out_del, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$, out_sum, out_tempBoogie0, out_tempBoogie1 := in_ap, in_del, in_n, in_$result.question.2$_123_$static$, in_$result.question.3$_123_$static$, in_sum, in_tempBoogie0, in_tempBoogie1;
    return;

  label_22:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_n := PLUS(out_n, 1, 1);
    assume value_is(__ctobpl_const_302, out_n);
    goto label_22_dummy;

  label_21_false:
    assume !INT_LT(out_$result.question.2$_123_$static$, MULT(out_$result.question.3$_123_$static$, BOOGIE_FLOAT_CONST_3e__007));
    assume value_is(__ctobpl_const_300, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_301, out_$result.question.3$_123_$static$);
    goto label_22;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    goto label_21_true, label_21_false;

  label_21_true:
    assume INT_LT(out_$result.question.2$_123_$static$, MULT(out_$result.question.3$_123_$static$, BOOGIE_FLOAT_CONST_3e__007));
    assume value_is(__ctobpl_const_300, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_301, out_$result.question.3$_123_$static$);
    out_ap, out_del, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$, out_sum, out_tempBoogie0, out_tempBoogie1 := in_ap, in_del, in_n, in_$result.question.2$_123_$static$, in_$result.question.3$_123_$static$, in_sum, in_tempBoogie0, in_tempBoogie1;
    return;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    out_$result.question.3$_123_$static$ := out_sum;
    assume value_is(__ctobpl_const_296, out_$result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_297, out_sum);
    goto label_21;

  label_20:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    out_$result.question.3$_123_$static$ := -out_sum;
    assume value_is(__ctobpl_const_298, out_$result.question.3$_123_$static$);
    assume value_is(__ctobpl_const_299, out_sum);
    goto label_21;

  label_18_true:
    assume INT_LT(out_sum, 0);
    assume value_is(__ctobpl_const_295, out_sum);
    goto label_20;

  label_18:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    goto label_18_true, label_18_false;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    out_$result.question.2$_123_$static$ := out_del;
    assume value_is(__ctobpl_const_291, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_292, out_del);
    goto label_18;

  label_17:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    out_$result.question.2$_123_$static$ := -out_del;
    assume value_is(__ctobpl_const_293, out_$result.question.2$_123_$static$);
    assume value_is(__ctobpl_const_294, out_del);
    goto label_18;

  label_15_true:
    assume INT_LT(out_del, 0);
    assume value_is(__ctobpl_const_290, out_del);
    goto label_17;

  label_15:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 200} true;
    goto label_15_true, label_15_false;

  label_14:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 198} true;
    out_ap := PLUS(out_ap, 1, 1);
    out_tempBoogie0 := INT_MULT(out_del, BINARY_BOTH_INT(in_x, out_ap));
    out_del := out_tempBoogie0;
    out_tempBoogie1 := PLUS(out_sum, 1, out_del);
    out_sum := out_tempBoogie1;
    assume value_is(__ctobpl_const_286, out_sum);
    assume value_is(__ctobpl_const_287, out_del);
    assume value_is(__ctobpl_const_288, in_x);
    assume value_is(__ctobpl_const_289, out_ap);
    goto label_15;

  label_13_true:
    assume INT_LEQ(out_n, 100);
    assume value_is(__ctobpl_const_285, out_n);
    goto label_14;

  label_15_false:
    assume !INT_LT(out_del, 0);
    assume value_is(__ctobpl_const_290, out_del);
    goto label_16;

  label_18_false:
    assume !INT_LT(out_sum, 0);
    assume value_is(__ctobpl_const_295, out_sum);
    goto label_19;

  label_22_dummy:
    call {:si_unique_call 1} out_ap, out_del, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$, out_sum, out_tempBoogie0, out_tempBoogie1 := gser_loop_label_13_head(out_ap, out_del, out_n, out_$result.question.2$_123_$static$, out_$result.question.3$_123_$static$, out_sum, in_x, out_tempBoogie0, out_tempBoogie1);
    return;

  exit:
    return;
}



procedure gser_loop_label_13_head(in_ap: int, in_del: int, in_n: int, in_$result.question.2$_123_$static$: int, in_$result.question.3$_123_$static$: int, in_sum: int, in_x: int, in_tempBoogie0: int, in_tempBoogie1: int) returns (out_ap: int, out_del: int, out_n: int, out_$result.question.2$_123_$static$: int, out_$result.question.3$_123_$static$: int, out_sum: int, out_tempBoogie0: int, out_tempBoogie1: int);



implementation main_loop_label_65_head(in_i: int, in_j: int, in_result.scanf$17: int, in_$scanf.arg.2$18$: int, in_tempBoogie0: int) returns (out_j: int, out_result.scanf$17: int, out_$scanf.arg.2$18$: int, out_tempBoogie0: int)
{

  entry:
    out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    goto label_65_head;

  label_65_head:
    goto label_65_true, label_65_false;

  label_65_false:
    assume !INT_LT(out_j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, out_j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_72:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_412, out_j);
    goto label_72_dummy;

  label_71_false:
    assume !INT_NEQ(out_result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, out_result.scanf$17);
    goto label_72;

  label_71:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    goto label_71_true, label_71_false;

  label_71_true:
    assume INT_NEQ(out_result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, out_result.scanf$17);
    out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    call out_result.scanf$17 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[out_$scanf.arg.2$18$] := out_tempBoogie0;
    assume value_is(__ctobpl_const_410, out_$scanf.arg.2$18$);
    goto label_71;

  label_67:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    assert f != 0;
    out_$scanf.arg.2$18$ := PLUS(f, 4, PLUS(MULT(in_i, Mem_T.INT4[c]), 1, out_j));
    assume value_is(__ctobpl_const_405, out_$scanf.arg.2$18$);
    assume value_is(__ctobpl_const_406, in_i);
    assume value_is(__ctobpl_const_407, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_408, out_j);
    assume value_is(__ctobpl_const_409, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(in_i, Mem_T.INT4[c]), 1, out_j))]);
    goto label_68;

  label_65_true:
    assume INT_LT(out_j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, out_j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_67;

  label_72_dummy:
    call {:si_unique_call 1} out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := main_loop_label_65_head(in_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure main_loop_label_65_head(in_i: int, in_j: int, in_result.scanf$17: int, in_$scanf.arg.2$18$: int, in_tempBoogie0: int) returns (out_j: int, out_result.scanf$17: int, out_$scanf.arg.2$18$: int, out_tempBoogie0: int);
  modifies detChoiceCnt, Mem_T.INT4;



implementation main_loop_label_62_head(in_i: int, in_j: int, in_result.scanf$17: int, in_$scanf.arg.2$18$: int, in_tempBoogie0: int) returns (out_i: int, out_j: int, out_result.scanf$17: int, out_$scanf.arg.2$18$: int, out_tempBoogie0: int)
{

  entry:
    out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_i, in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    goto label_62_head;

  label_62_head:
    goto label_62_true, label_62_false;

  label_62_false:
    assume !INT_LT(out_i, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_359, out_i);
    assume value_is(__ctobpl_const_360, Mem_T.INT4[r]);
    out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_i, in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_66:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_404, out_i);
    goto label_66_dummy;

  label_65_false:
    assume !INT_LT(out_j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, out_j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_66;

  label_65_head:
    call out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := main_loop_label_65_head(out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0);
    goto label_65_head_last;

  label_65_head_last:
    out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_i, in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_65_true, label_65_false;

  label_65:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 84} true;
    goto label_65_head;

  label_72:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_412, out_j);
    goto label_72_dummy;

  label_72_dummy:
    assume false;
    out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_i, in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_71_false:
    assume !INT_NEQ(out_result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, out_result.scanf$17);
    goto label_72;

  label_71:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    goto label_71_true, label_71_false;

  label_71_true:
    assume INT_NEQ(out_result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, out_result.scanf$17);
    out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := in_i, in_j, in_result.scanf$17, in_$scanf.arg.2$18$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    call out_result.scanf$17 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[out_$scanf.arg.2$18$] := out_tempBoogie0;
    assume value_is(__ctobpl_const_410, out_$scanf.arg.2$18$);
    goto label_71;

  label_67:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    assert f != 0;
    out_$scanf.arg.2$18$ := PLUS(f, 4, PLUS(MULT(out_i, Mem_T.INT4[c]), 1, out_j));
    assume value_is(__ctobpl_const_405, out_$scanf.arg.2$18$);
    assume value_is(__ctobpl_const_406, out_i);
    assume value_is(__ctobpl_const_407, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_408, out_j);
    assume value_is(__ctobpl_const_409, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(out_i, Mem_T.INT4[c]), 1, out_j))]);
    goto label_68;

  label_65_true:
    assume INT_LT(out_j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, out_j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_67;

  label_64:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 84} true;
    out_j := 0;
    assume value_is(__ctobpl_const_401, out_j);
    goto label_65;

  label_62_true:
    assume INT_LT(out_i, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_359, out_i);
    assume value_is(__ctobpl_const_360, Mem_T.INT4[r]);
    goto label_64;

  label_66_dummy:
    call {:si_unique_call 1} out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := main_loop_label_62_head(out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure main_loop_label_62_head(in_i: int, in_j: int, in_result.scanf$17: int, in_$scanf.arg.2$18$: int, in_tempBoogie0: int) returns (out_i: int, out_j: int, out_result.scanf$17: int, out_$scanf.arg.2$18$: int, out_tempBoogie0: int);
  modifies detChoiceCnt, Mem_T.INT4;



implementation main_loop_label_22_head(in_$isspace.arg.1$6$: int, in_p: int, in_result.isspace$5: int) returns (out_$isspace.arg.1$6$: int, out_p: int, out_result.isspace$5: int)
{

  entry:
    out_$isspace.arg.1$6$, out_p, out_result.isspace$5 := in_$isspace.arg.1$6$, in_p, in_result.isspace$5;
    goto label_22_head;

  label_22_head:
    assert out_p != 0;
    goto label_22_true, label_22_false;

  label_22_false:
    assume Mem_T.CHAR[out_p] == 0;
    assume value_is(__ctobpl_const_341, out_p);
    assume value_is(__ctobpl_const_342, Mem_T.CHAR[out_p]);
    out_$isspace.arg.1$6$, out_p, out_result.isspace$5 := in_$isspace.arg.1$6$, in_p, in_result.isspace$5;
    return;

  label_29:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_p := PLUS(out_p, 1, 1);
    assume value_is(__ctobpl_const_429, out_p);
    goto label_29_dummy;

  label_28_true:
    assume out_result.isspace$5 != 0;
    assume value_is(__ctobpl_const_348, out_result.isspace$5);
    goto label_29;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    goto label_28_true, label_28_false;

  label_28_false:
    assume out_result.isspace$5 == 0;
    assume value_is(__ctobpl_const_348, out_result.isspace$5);
    out_$isspace.arg.1$6$, out_p, out_result.isspace$5 := in_$isspace.arg.1$6$, in_p, in_result.isspace$5;
    return;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    call out_result.isspace$5 := isspace(out_$isspace.arg.1$6$);
    assume value_is(__ctobpl_const_346, out_$isspace.arg.1$6$);
    assume value_is(__ctobpl_const_347, out_$isspace.arg.1$6$);
    goto label_28;

  label_24:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    assert out_p != 0;
    out_$isspace.arg.1$6$ := Mem_T.CHAR[out_p];
    assume value_is(__ctobpl_const_343, out_$isspace.arg.1$6$);
    assume value_is(__ctobpl_const_344, out_p);
    assume value_is(__ctobpl_const_345, Mem_T.CHAR[out_p]);
    goto label_25;

  label_22_true:
    assume Mem_T.CHAR[out_p] != 0;
    assume value_is(__ctobpl_const_341, out_p);
    assume value_is(__ctobpl_const_342, Mem_T.CHAR[out_p]);
    goto label_24;

  label_29_dummy:
    call {:si_unique_call 1} out_$isspace.arg.1$6$, out_p, out_result.isspace$5 := main_loop_label_22_head(out_$isspace.arg.1$6$, out_p, out_result.isspace$5);
    return;

  exit:
    return;
}



procedure main_loop_label_22_head(in_$isspace.arg.1$6$: int, in_p: int, in_result.isspace$5: int) returns (out_$isspace.arg.1$6$: int, out_p: int, out_result.isspace$5: int);



implementation main_loop_label_12_head(in_havoc_stringTemp: int, in_$InfoTbl.arg.3$23$: int, in_$QChiSq.arg.1$26$: int, in_$fgets.arg.3$4$: int, in_$fputs.arg.2$31$: int, in_$fputs.arg.2$9$: int, in_i: int, in_info: int, in_infodf: int, in_$isspace.arg.1$6$: int, in_j: int, in_p: int, in_$printf.arg.2$28$: int, in_$printf.arg.4$27$: int, in_result.InfoTbl$22: int, in_result.QChiSq$25: int, in_result.__iob_func$30: int, in_result.__iob_func$3: int, in_result.__iob_func$8: int, in_result.fgets$2: int, in_result.fputs$29: int, in_result.fputs$7: int, in_result.isspace$5: int, in_result.printf$24: int, in_$result.question.32$: int, in_$result.question.33$: int, in_$result.question.34$: int, in_result.scanf$17: int, in_result.sscanf$10: int, in_$scanf.arg.2$18$: int, in_totdf: int, in_totinfo: int, in_tempBoogie0: int, in_tempBoogie1: int) returns (out_$QChiSq.arg.1$26$: int, out_$fgets.arg.3$4$: int, out_$fputs.arg.2$31$: int, out_$fputs.arg.2$9$: int, out_i: int, out_info: int, out_$isspace.arg.1$6$: int, out_j: int, out_p: int, out_$printf.arg.2$28$: int, out_$printf.arg.4$27$: int, out_result.InfoTbl$22: int, out_result.QChiSq$25: int, out_result.__iob_func$30: int, out_result.__iob_func$3: int, out_result.__iob_func$8: int, out_result.fgets$2: int, out_result.fputs$29: int, out_result.fputs$7: int, out_result.isspace$5: int, out_result.printf$24: int, out_$result.question.32$: int, out_$result.question.33$: int, out_$result.question.34$: int, out_result.scanf$17: int, out_result.sscanf$10: int, out_$scanf.arg.2$18$: int, out_totdf: int, out_totinfo: int, out_tempBoogie0: int, out_tempBoogie1: int)
{

  entry:
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    goto label_12_head;

  label_12_head:
    call out_result.__iob_func$3 := __iob_func();
    goto label_15;

  label_30:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 61} true;
    goto label_30_dummy;

  label_23_false:
    assume Mem_T.CHAR[out_p] == 0;
    assume value_is(__ctobpl_const_349, out_p);
    assume value_is(__ctobpl_const_350, Mem_T.CHAR[out_p]);
    goto label_30;

  label_23:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 60} true;
    assert out_p != 0;
    goto label_23_true, label_23_false;

  label_23_true:
    assume Mem_T.CHAR[out_p] != 0;
    assume value_is(__ctobpl_const_349, out_p);
    assume value_is(__ctobpl_const_350, Mem_T.CHAR[out_p]);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_31;

  label_22_false:
    assume Mem_T.CHAR[out_p] == 0;
    assume value_is(__ctobpl_const_341, out_p);
    assume value_is(__ctobpl_const_342, Mem_T.CHAR[out_p]);
    goto label_23;

  label_28_false:
    assume out_result.isspace$5 == 0;
    assume value_is(__ctobpl_const_348, out_result.isspace$5);
    goto label_23;

  label_28:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    goto label_28_true, label_28_false;

  label_25:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    call out_result.isspace$5 := isspace(out_$isspace.arg.1$6$);
    assume value_is(__ctobpl_const_346, out_$isspace.arg.1$6$);
    assume value_is(__ctobpl_const_347, out_$isspace.arg.1$6$);
    goto label_28;

  label_24:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    assert out_p != 0;
    out_$isspace.arg.1$6$ := Mem_T.CHAR[out_p];
    assume value_is(__ctobpl_const_343, out_$isspace.arg.1$6$);
    assume value_is(__ctobpl_const_344, out_p);
    assume value_is(__ctobpl_const_345, Mem_T.CHAR[out_p]);
    goto label_25;

  label_22_true:
    assume Mem_T.CHAR[out_p] != 0;
    assume value_is(__ctobpl_const_341, out_p);
    assume value_is(__ctobpl_const_342, Mem_T.CHAR[out_p]);
    goto label_24;

  label_22_head:
    call out_$isspace.arg.1$6$, out_p, out_result.isspace$5 := main_loop_label_22_head(out_$isspace.arg.1$6$, out_p, out_result.isspace$5);
    goto label_22_head_last;

  label_22_head_last:
    assert out_p != 0;
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_22_true, label_22_false;

  label_22:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    goto label_22_head;

  label_29:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_p := PLUS(out_p, 1, 1);
    assume value_is(__ctobpl_const_429, out_p);
    goto label_29_dummy;

  label_29_dummy:
    assume false;
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_28_true:
    assume out_result.isspace$5 != 0;
    assume value_is(__ctobpl_const_348, out_result.isspace$5);
    goto label_29;

  label_21:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 57} true;
    out_p := line;
    assume value_is(__ctobpl_const_340, out_p);
    goto label_22;

  label_19_true:
    assume out_result.fgets$2 != 0;
    assume value_is(__ctobpl_const_324, out_result.fgets$2);
    goto label_21;

  label_19:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    goto label_19_true, label_19_false;

  label_19_false:
    assume out_result.fgets$2 == 0;
    assume value_is(__ctobpl_const_324, out_result.fgets$2);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_16:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    call out_result.fgets$2 := fgets(line, 26, out_$fgets.arg.3$4$);
    assume value_is(__ctobpl_const_322, out_$fgets.arg.3$4$);
    assume value_is(__ctobpl_const_323, out_$fgets.arg.3$4$);
    goto label_19;

  label_15:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 55} true;
    assert out_result.__iob_func$3 != 0;
    out_$fgets.arg.3$4$ := PLUS(out_result.__iob_func$3, 32, 0);
    assume value_is(__ctobpl_const_320, out_$fgets.arg.3$4$);
    assume value_is(__ctobpl_const_321, out_result.__iob_func$3);
    goto label_16;

  label_30_dummy:
    call {:si_unique_call 1} out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := main_loop_label_12_head(in_havoc_stringTemp, in_$InfoTbl.arg.3$23$, out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, in_infodf, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1);
    return;

  label_104:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    call out_result.fputs$29 := fputs(out_$result.question.32$, out_$fputs.arg.2$31$);
    assume value_is(__ctobpl_const_383, out_$result.question.32$);
    assume value_is(__ctobpl_const_384, out_$fputs.arg.2$31$);
    assume value_is(__ctobpl_const_385, out_$result.question.32$);
    assume value_is(__ctobpl_const_386, out_$fputs.arg.2$31$);
    goto label_104_dummy;

  label_109:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    out_$result.question.32$ := out_$result.question.33$;
    assume value_is(__ctobpl_const_380, out_$result.question.32$);
    assume value_is(__ctobpl_const_381, out_$result.question.33$);
    goto label_104;

  label_103:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    out_$result.question.32$ := in_havoc_stringTemp;
    assume value_is(__ctobpl_const_382, out_$result.question.32$);
    goto label_104;

  label_101_true:
    assume INT_LT(out_info, BOOGIE_FLOAT_CONST___3.5);
    assume value_is(__ctobpl_const_372, out_info);
    goto label_103;

  label_101:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 109} true;
    goto label_101_true, label_101_false;

  label_100:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 113} true;
    assert out_result.__iob_func$30 != 0;
    out_$fputs.arg.2$31$ := PLUS(out_result.__iob_func$30, 32, 1);
    assume value_is(__ctobpl_const_370, out_$fputs.arg.2$31$);
    assume value_is(__ctobpl_const_371, out_result.__iob_func$30);
    goto label_101;

  label_86:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 113} true;
    call out_result.__iob_func$30 := __iob_func();
    goto label_100;

  label_85_false:
    assume !INT_LEQ(0, out_info);
    assume value_is(__ctobpl_const_369, out_info);
    goto label_86;

  label_85:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 99} true;
    goto label_85_true, label_85_false;

  label_85_true:
    assume INT_LEQ(0, out_info);
    assume value_is(__ctobpl_const_369, out_info);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_89;

  label_84:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 95} true;
    out_info := out_result.InfoTbl$22;
    assume value_is(__ctobpl_const_367, out_info);
    assume value_is(__ctobpl_const_368, out_result.InfoTbl$22);
    goto label_85;

  label_81:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 95} true;
    call out_result.InfoTbl$22 := InfoTbl(Mem_T.INT4[r], Mem_T.INT4[c], in_$InfoTbl.arg.3$23$, in_infodf);
    assume value_is(__ctobpl_const_361, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_362, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_363, Mem_T.INT4[in_infodf]);
    assume value_is(__ctobpl_const_364, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_365, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_366, Mem_T.INT4[in_infodf]);
    goto label_84;

  label_63:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 95} true;
    goto label_81;

  label_62_false:
    assume !INT_LT(out_i, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_359, out_i);
    assume value_is(__ctobpl_const_360, Mem_T.INT4[r]);
    goto label_63;

  label_62_head:
    call out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := main_loop_label_62_head(out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0);
    goto label_62_head_last;

  label_62_head_last:
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_62_true, label_62_false;

  label_62:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 83} true;
    goto label_62_head;

  label_66:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_i := PLUS(out_i, 1, 1);
    assume value_is(__ctobpl_const_404, out_i);
    goto label_66_dummy;

  label_66_dummy:
    assume false;
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_65_false:
    assume !INT_LT(out_j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, out_j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_66;

  label_65_head:
    call out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0 := main_loop_label_65_head(out_i, out_j, out_result.scanf$17, out_$scanf.arg.2$18$, out_tempBoogie0);
    goto label_65_head_last;

  label_65_head_last:
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_65_true, label_65_false;

  label_65:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 84} true;
    goto label_65_head;

  label_72:
    assert {:sourcefile "unknown"} {:sourceline 0} true;
    out_j := PLUS(out_j, 1, 1);
    assume value_is(__ctobpl_const_412, out_j);
    goto label_72_dummy;

  label_72_dummy:
    assume false;
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_71_false:
    assume !INT_NEQ(out_result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, out_result.scanf$17);
    goto label_72;

  label_71:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    goto label_71_true, label_71_false;

  label_71_true:
    assume INT_NEQ(out_result.scanf$17, 1);
    assume value_is(__ctobpl_const_411, out_result.scanf$17);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_68:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    call out_result.scanf$17 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[out_$scanf.arg.2$18$] := out_tempBoogie0;
    assume value_is(__ctobpl_const_410, out_$scanf.arg.2$18$);
    goto label_71;

  label_67:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 85} true;
    assert f != 0;
    out_$scanf.arg.2$18$ := PLUS(f, 4, PLUS(MULT(out_i, Mem_T.INT4[c]), 1, out_j));
    assume value_is(__ctobpl_const_405, out_$scanf.arg.2$18$);
    assume value_is(__ctobpl_const_406, out_i);
    assume value_is(__ctobpl_const_407, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_408, out_j);
    assume value_is(__ctobpl_const_409, Mem_T.INT4[PLUS(f, 4, PLUS(MULT(out_i, Mem_T.INT4[c]), 1, out_j))]);
    goto label_68;

  label_65_true:
    assume INT_LT(out_j, Mem_T.INT4[c]);
    assume value_is(__ctobpl_const_402, out_j);
    assume value_is(__ctobpl_const_403, Mem_T.INT4[c]);
    goto label_67;

  label_64:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 84} true;
    out_j := 0;
    assume value_is(__ctobpl_const_401, out_j);
    goto label_65;

  label_62_true:
    assume INT_LT(out_i, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_359, out_i);
    assume value_is(__ctobpl_const_360, Mem_T.INT4[r]);
    goto label_64;

  label_53:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 83} true;
    out_i := 0;
    assume value_is(__ctobpl_const_358, out_i);
    goto label_62;

  label_44_false:
    assume !INT_LT(1000, MULT(Mem_T.INT4[r], Mem_T.INT4[c]));
    assume value_is(__ctobpl_const_356, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_357, Mem_T.INT4[c]);
    goto label_53;

  label_44:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 75} true;
    goto label_44_true, label_44_false;

  label_44_true:
    assume INT_LT(1000, MULT(Mem_T.INT4[r], Mem_T.INT4[c]));
    assume value_is(__ctobpl_const_356, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_357, Mem_T.INT4[c]);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_43_false:
    assume !INT_NEQ(out_result.sscanf$10, 2);
    assume value_is(__ctobpl_const_355, out_result.sscanf$10);
    goto label_44;

  label_43:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 69} true;
    goto label_43_true, label_43_false;

  label_43_true:
    assume INT_NEQ(out_result.sscanf$10, 2);
    assume value_is(__ctobpl_const_355, out_result.sscanf$10);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    return;

  label_32:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 69} true;
    call out_result.sscanf$10 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[r] := out_tempBoogie0;
    call out_tempBoogie1 := det_choice();
    Mem_T.INT4[c] := out_tempBoogie1;
    assume value_is(__ctobpl_const_353, Mem_T.INT4[r]);
    assume value_is(__ctobpl_const_354, Mem_T.INT4[c]);
    goto label_43;

  label_31_false:
    assume !INT_EQ(Mem_T.CHAR[out_p], 35);
    assume value_is(__ctobpl_const_351, out_p);
    assume value_is(__ctobpl_const_352, Mem_T.CHAR[out_p]);
    goto label_32;

  label_31:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 63} true;
    assert out_p != 0;
    goto label_31_true, label_31_false;

  label_31_true:
    assume INT_EQ(Mem_T.CHAR[out_p], 35);
    assume value_is(__ctobpl_const_351, out_p);
    assume value_is(__ctobpl_const_352, Mem_T.CHAR[out_p]);
    out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := in_$QChiSq.arg.1$26$, in_$fgets.arg.3$4$, in_$fputs.arg.2$31$, in_$fputs.arg.2$9$, in_i, in_info, in_$isspace.arg.1$6$, in_j, in_p, in_$printf.arg.2$28$, in_$printf.arg.4$27$, in_result.InfoTbl$22, in_result.QChiSq$25, in_result.__iob_func$30, in_result.__iob_func$3, in_result.__iob_func$8, in_result.fgets$2, in_result.fputs$29, in_result.fputs$7, in_result.isspace$5, in_result.printf$24, in_$result.question.32$, in_$result.question.33$, in_$result.question.34$, in_result.scanf$17, in_result.sscanf$10, in_$scanf.arg.2$18$, in_totdf, in_totinfo, in_tempBoogie0, in_tempBoogie1;
    detChoiceCnt, Mem_T.INT4 := old(detChoiceCnt), old(Mem_T.INT4);
    goto label_35;

  label_112:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 110} true;
    out_$result.question.33$ := out_$result.question.34$;
    assume value_is(__ctobpl_const_377, out_$result.question.33$);
    assume value_is(__ctobpl_const_378, out_$result.question.34$);
    goto label_109;

  label_108:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 110} true;
    out_$result.question.33$ := in_havoc_stringTemp;
    assume value_is(__ctobpl_const_379, out_$result.question.33$);
    goto label_109;

  label_102_true:
    assume INT_LT(out_info, BOOGIE_FLOAT_CONST___2.5);
    assume value_is(__ctobpl_const_373, out_info);
    goto label_108;

  label_102:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 110} true;
    goto label_102_true, label_102_false;

  label_101_false:
    assume !INT_LT(out_info, BOOGIE_FLOAT_CONST___3.5);
    assume value_is(__ctobpl_const_372, out_info);
    goto label_102;

  label_110:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 111} true;
    out_$result.question.34$ := in_havoc_stringTemp;
    assume value_is(__ctobpl_const_375, out_$result.question.34$);
    goto label_112;

  label_111:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 111} true;
    out_$result.question.34$ := in_havoc_stringTemp;
    assume value_is(__ctobpl_const_376, out_$result.question.34$);
    goto label_112;

  label_107_true:
    assume INT_LT(out_info, BOOGIE_FLOAT_CONST___1.5);
    assume value_is(__ctobpl_const_374, out_info);
    goto label_111;

  label_107:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 111} true;
    goto label_107_true, label_107_false;

  label_102_false:
    assume !INT_LT(out_info, BOOGIE_FLOAT_CONST___2.5);
    assume value_is(__ctobpl_const_373, out_info);
    goto label_107;

  label_107_false:
    assume !INT_LT(out_info, BOOGIE_FLOAT_CONST___1.5);
    assume value_is(__ctobpl_const_374, out_info);
    goto label_110;

  label_104_dummy:
    call {:si_unique_call 2} out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := main_loop_label_12_head(in_havoc_stringTemp, in_$InfoTbl.arg.3$23$, out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, in_infodf, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1);
    return;

  label_99:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 106} true;
    out_tempBoogie0 := PLUS(out_totdf, 1, Mem_T.INT4[in_infodf]);
    out_totdf := out_tempBoogie0;
    assume value_is(__ctobpl_const_399, out_totdf);
    assume value_is(__ctobpl_const_400, Mem_T.INT4[in_infodf]);
    goto label_99_dummy;

  label_98:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 105} true;
    out_tempBoogie0 := PLUS(out_totinfo, 1, out_info);
    out_totinfo := out_tempBoogie0;
    assume value_is(__ctobpl_const_397, out_totinfo);
    assume value_is(__ctobpl_const_398, out_info);
    goto label_99;

  label_95:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 101} true;
    call out_result.printf$24 := det_choice();
    goto label_98;

  label_94:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 102} true;
    out_$printf.arg.2$28$ := out_info;
    assume value_is(__ctobpl_const_395, out_$printf.arg.2$28$);
    assume value_is(__ctobpl_const_396, out_info);
    goto label_95;

  label_93:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 103} true;
    out_$printf.arg.4$27$ := out_result.QChiSq$25;
    assume value_is(__ctobpl_const_393, out_$printf.arg.4$27$);
    assume value_is(__ctobpl_const_394, out_result.QChiSq$25);
    goto label_94;

  label_90:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 103} true;
    call out_result.QChiSq$25 := QChiSq(out_$QChiSq.arg.1$26$, Mem_T.INT4[in_infodf]);
    assume value_is(__ctobpl_const_389, out_$QChiSq.arg.1$26$);
    assume value_is(__ctobpl_const_390, Mem_T.INT4[in_infodf]);
    assume value_is(__ctobpl_const_391, out_$QChiSq.arg.1$26$);
    assume value_is(__ctobpl_const_392, Mem_T.INT4[in_infodf]);
    goto label_93;

  label_89:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 103} true;
    out_$QChiSq.arg.1$26$ := out_info;
    assume value_is(__ctobpl_const_387, out_$QChiSq.arg.1$26$);
    assume value_is(__ctobpl_const_388, out_info);
    goto label_90;

  label_99_dummy:
    call {:si_unique_call 3} out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := main_loop_label_12_head(in_havoc_stringTemp, in_$InfoTbl.arg.3$23$, out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, in_infodf, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1);
    return;

  label_42:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 66} true;
    goto label_42_dummy;

  label_39:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 65} true;
    call out_result.fputs$7 := fputs(line, out_$fputs.arg.2$9$);
    assume value_is(__ctobpl_const_427, out_$fputs.arg.2$9$);
    assume value_is(__ctobpl_const_428, out_$fputs.arg.2$9$);
    goto label_42;

  label_38:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 65} true;
    assert out_result.__iob_func$8 != 0;
    out_$fputs.arg.2$9$ := PLUS(out_result.__iob_func$8, 32, 1);
    assume value_is(__ctobpl_const_425, out_$fputs.arg.2$9$);
    assume value_is(__ctobpl_const_426, out_result.__iob_func$8);
    goto label_39;

  label_35:
    assert {:sourcefile ".\v19\tot_info.c"} {:sourceline 65} true;
    call out_result.__iob_func$8 := __iob_func();
    goto label_38;

  label_42_dummy:
    call {:si_unique_call 4} out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1 := main_loop_label_12_head(in_havoc_stringTemp, in_$InfoTbl.arg.3$23$, out_$QChiSq.arg.1$26$, out_$fgets.arg.3$4$, out_$fputs.arg.2$31$, out_$fputs.arg.2$9$, out_i, out_info, in_infodf, out_$isspace.arg.1$6$, out_j, out_p, out_$printf.arg.2$28$, out_$printf.arg.4$27$, out_result.InfoTbl$22, out_result.QChiSq$25, out_result.__iob_func$30, out_result.__iob_func$3, out_result.__iob_func$8, out_result.fgets$2, out_result.fputs$29, out_result.fputs$7, out_result.isspace$5, out_result.printf$24, out_$result.question.32$, out_$result.question.33$, out_$result.question.34$, out_result.scanf$17, out_result.sscanf$10, out_$scanf.arg.2$18$, out_totdf, out_totinfo, out_tempBoogie0, out_tempBoogie1);
    return;

  exit:
    return;
}



procedure main_loop_label_12_head(in_havoc_stringTemp: int, in_$InfoTbl.arg.3$23$: int, in_$QChiSq.arg.1$26$: int, in_$fgets.arg.3$4$: int, in_$fputs.arg.2$31$: int, in_$fputs.arg.2$9$: int, in_i: int, in_info: int, in_infodf: int, in_$isspace.arg.1$6$: int, in_j: int, in_p: int, in_$printf.arg.2$28$: int, in_$printf.arg.4$27$: int, in_result.InfoTbl$22: int, in_result.QChiSq$25: int, in_result.__iob_func$30: int, in_result.__iob_func$3: int, in_result.__iob_func$8: int, in_result.fgets$2: int, in_result.fputs$29: int, in_result.fputs$7: int, in_result.isspace$5: int, in_result.printf$24: int, in_$result.question.32$: int, in_$result.question.33$: int, in_$result.question.34$: int, in_result.scanf$17: int, in_result.sscanf$10: int, in_$scanf.arg.2$18$: int, in_totdf: int, in_totinfo: int, in_tempBoogie0: int, in_tempBoogie1: int) returns (out_$QChiSq.arg.1$26$: int, out_$fgets.arg.3$4$: int, out_$fputs.arg.2$31$: int, out_$fputs.arg.2$9$: int, out_i: int, out_info: int, out_$isspace.arg.1$6$: int, out_j: int, out_p: int, out_$printf.arg.2$28$: int, out_$printf.arg.4$27$: int, out_result.InfoTbl$22: int, out_result.QChiSq$25: int, out_result.__iob_func$30: int, out_result.__iob_func$3: int, out_result.__iob_func$8: int, out_result.fgets$2: int, out_result.fputs$29: int, out_result.fputs$7: int, out_result.isspace$5: int, out_result.printf$24: int, out_$result.question.32$: int, out_$result.question.33$: int, out_$result.question.34$: int, out_result.scanf$17: int, out_result.sscanf$10: int, out_$scanf.arg.2$18$: int, out_totdf: int, out_totinfo: int, out_tempBoogie0: int, out_tempBoogie1: int);
  modifies detChoiceCnt, Mem_T.INT4;


