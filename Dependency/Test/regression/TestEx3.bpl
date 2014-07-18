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

var {:extern} Mem_T.INT4: [int]int;

var {:extern} Mem_T.op1__EXPR: [int]int;

var {:extern} Mem_T.op2__EXPR: [int]int;

var {:extern} Mem_T.oper__EXPR: [int]int;

var {:extern} Mem_T.result__EXPR: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.oper__EXPR: name;

const {:extern} unique T.op1__EXPR: name;

const {:extern} unique T.op2__EXPR: name;

const {:extern} unique T.result__EXPR: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PP_EXPR: name;

const {:extern} unique T.P_EXPR: name;

const {:extern} unique T._EXPR: name;

function {:extern} op1__EXPR(int) : int;

function {:extern} op1__EXPRInv(int) : int;

function {:extern} _S_op1__EXPR([int]bool) : [int]bool;

function {:extern} _S_op1__EXPRInv([int]bool) : [int]bool;

axiom (forall x: int, S: [int]bool :: { _S_op1__EXPR(S)[x] } _S_op1__EXPR(S)[x] <==> S[op1__EXPRInv(x)]);

axiom (forall x: int, S: [int]bool :: { _S_op1__EXPRInv(S)[x] } _S_op1__EXPRInv(S)[x] <==> S[op1__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_op1__EXPR(S) } S[x] ==> _S_op1__EXPR(S)[op1__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_op1__EXPRInv(S) } S[x] ==> _S_op1__EXPRInv(S)[op1__EXPRInv(x)]);

axiom (forall x: int :: { op1__EXPR(x) } op1__EXPR(x) == INT_ADD(x, 4));

axiom (forall x: int :: { op1__EXPRInv(x) } op1__EXPRInv(x) == INT_SUB(x, 4));

axiom (forall x: int :: { op1__EXPR(x) } op1__EXPR(x) == INT_PLUS(x, 1, 4));

function {:extern} op2__EXPR(int) : int;

function {:extern} op2__EXPRInv(int) : int;

function {:extern} _S_op2__EXPR([int]bool) : [int]bool;

function {:extern} _S_op2__EXPRInv([int]bool) : [int]bool;

axiom (forall x: int, S: [int]bool :: { _S_op2__EXPR(S)[x] } _S_op2__EXPR(S)[x] <==> S[op2__EXPRInv(x)]);

axiom (forall x: int, S: [int]bool :: { _S_op2__EXPRInv(S)[x] } _S_op2__EXPRInv(S)[x] <==> S[op2__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_op2__EXPR(S) } S[x] ==> _S_op2__EXPR(S)[op2__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_op2__EXPRInv(S) } S[x] ==> _S_op2__EXPRInv(S)[op2__EXPRInv(x)]);

axiom (forall x: int :: { op2__EXPR(x) } op2__EXPR(x) == INT_ADD(x, 8));

axiom (forall x: int :: { op2__EXPRInv(x) } op2__EXPRInv(x) == INT_SUB(x, 8));

axiom (forall x: int :: { op2__EXPR(x) } op2__EXPR(x) == INT_PLUS(x, 1, 8));

function {:extern} oper__EXPR(int) : int;

function {:extern} oper__EXPRInv(int) : int;

function {:extern} _S_oper__EXPR([int]bool) : [int]bool;

function {:extern} _S_oper__EXPRInv([int]bool) : [int]bool;

axiom (forall x: int, S: [int]bool :: { _S_oper__EXPR(S)[x] } _S_oper__EXPR(S)[x] <==> S[oper__EXPRInv(x)]);

axiom (forall x: int, S: [int]bool :: { _S_oper__EXPRInv(S)[x] } _S_oper__EXPRInv(S)[x] <==> S[oper__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_oper__EXPR(S) } S[x] ==> _S_oper__EXPR(S)[oper__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_oper__EXPRInv(S) } S[x] ==> _S_oper__EXPRInv(S)[oper__EXPRInv(x)]);

axiom (forall x: int :: { oper__EXPR(x) } oper__EXPR(x) == INT_ADD(x, 0));

axiom (forall x: int :: { oper__EXPRInv(x) } oper__EXPRInv(x) == INT_SUB(x, 0));

axiom (forall x: int :: { oper__EXPR(x) } oper__EXPR(x) == INT_PLUS(x, 1, 0));

function {:extern} result__EXPR(int) : int;

function {:extern} result__EXPRInv(int) : int;

function {:extern} _S_result__EXPR([int]bool) : [int]bool;

function {:extern} _S_result__EXPRInv([int]bool) : [int]bool;

axiom (forall x: int, S: [int]bool :: { _S_result__EXPR(S)[x] } _S_result__EXPR(S)[x] <==> S[result__EXPRInv(x)]);

axiom (forall x: int, S: [int]bool :: { _S_result__EXPRInv(S)[x] } _S_result__EXPRInv(S)[x] <==> S[result__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_result__EXPR(S) } S[x] ==> _S_result__EXPR(S)[result__EXPR(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_result__EXPRInv(S) } S[x] ==> _S_result__EXPRInv(S)[result__EXPRInv(x)]);

axiom (forall x: int :: { result__EXPR(x) } result__EXPR(x) == INT_ADD(x, 12));

axiom (forall x: int :: { result__EXPRInv(x) } result__EXPRInv(x) == INT_SUB(x, 12));

axiom (forall x: int :: { result__EXPR(x) } result__EXPR(x) == INT_PLUS(x, 1, 12));

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

function {:extern} INT_AND(a: int, b: int) : int;

axiom (forall a: int, b: int :: { INT_AND(a, b) } a == b ==> INT_AND(a, b) == a);

axiom (forall a: int, b: int :: { INT_AND(a, b) } POW2(a) && POW2(b) && a != b ==> INT_AND(a, b) == 0);

axiom (forall a: int, b: int :: { INT_AND(a, b) } a == 0 || b == 0 ==> INT_AND(a, b) == 0);

function {:extern} INT_OR(a: int, b: int) : int;

function {:extern} INT_XOR(a: int, b: int) : int;

function {:extern} INT_NOT(a: int) : int;

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

function {:extern} INT_MINUS_BOTH_PTR_OR_BOTH_INT(a: int, b: int, size: int) : int;

axiom (forall a: int, b: int, size: int :: { INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } size * INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) <= a - b && a - b < size * (INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) + 1));

function {:extern} INT_MINUS_LEFT_PTR(a: int, a_size: int, b: int) : int;

axiom (forall a: int, a_size: int, b: int :: { INT_MINUS_LEFT_PTR(a, a_size, b) } INT_MINUS_LEFT_PTR(a, a_size, b) == a - a_size * b);

function {:extern} INT_PLUS(a: int, a_size: int, b: int) : int;

axiom (forall a: int, a_size: int, b: int :: { INT_PLUS(a, a_size, b) } INT_PLUS(a, a_size, b) == a + a_size * b);

function {:extern} INT_MULT(a: int, b: int) : int;

axiom (forall a: int, b: int :: { INT_MULT(a, b) } INT_MULT(a, b) == a * b);

function {:extern} INT_DIV(a: int, b: int) : int;

axiom (forall a: int, b: int :: { INT_DIV(a, b) } a >= 0 && b > 0 ==> b * INT_DIV(a, b) <= a && a < b * (INT_DIV(a, b) + 1));

axiom (forall a: int, b: int :: { INT_DIV(a, b) } a >= 0 && b < 0 ==> b * INT_DIV(a, b) <= a && a < b * (INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { INT_DIV(a, b) } a < 0 && b > 0 ==> b * INT_DIV(a, b) >= a && a > b * (INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { INT_DIV(a, b) } a < 0 && b < 0 ==> b * INT_DIV(a, b) >= a && a > b * (INT_DIV(a, b) + 1));

function {:extern} INT_BINARY_BOTH_INT(a: int, b: int) : int;

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

function {:extern} {:bvbuiltin "bvand"} BV32_AND(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvor"} BV32_OR(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvxor"} BV32_XOR(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvnot"} BV32_NOT(a: bv32) : bv32;

function {:extern}  BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a: bv32, b: bv32, size: bv32) : bv32
{
  BV32_DIV(BV32_SUB(a, b), size)
}

function {:extern}  BV32_MINUS_LEFT_PTR(a: bv32, a_size: bv32, b: bv32) : bv32
{
  BV32_SUB(a, BV32_MULT(a_size, b))
}

function {:extern}  BV32_PLUS(a: bv32, a_size: bv32, b: bv32) : bv32
{
  BV32_ADD(a, BV32_MULT(a_size, b))
}

function {:extern} BV32_BINARY_BOTH_INT(a: bv32, b: bv32) : bv32;

function {:extern} bv32ToInt(bv32) : int;

function {:extern} intToBv32(int) : bv32;

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
  requires INT_GEQ(obj_size, 0);
  modifies alloc;
  ensures new == old(alloc);
  ensures INT_GT(alloc, INT_ADD(new, obj_size));
  ensures Base(new) == new;
  ensures INT_GEQ(new, 0);



procedure {:extern} __HAVOC_det_malloc(obj_size: int) returns (new: int);
  requires INT_GEQ(obj_size, 0);
  modifies alloc;
  ensures new == old(alloc);
  ensures INT_GT(alloc, INT_ADD(new, obj_size));
  ensures Base(new) == new;
  ensures alloc == NewAlloc(old(alloc), obj_size);
  ensures INT_GEQ(new, 0);



procedure {:extern} __HAVOC_memset_split_1(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 1, n)) && (forall i: int :: { ret[i] } Array(p, 1, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 1, n)) && (forall i: int :: { ret[i] } Array(p, 1, n)[i] ==> ret[i] == c);



procedure {:extern} __HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 2, n)) && (forall i: int :: { ret[i] } Array(p, 2, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 2, n)) && (forall i: int :: { ret[i] } Array(p, 2, n)[i] ==> ret[i] == c);



procedure {:extern} __HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  ensures Subset(Empty(), Array(p, 4, n)) && (forall i: int :: { ret[i] } Array(p, 4, n)[i] || ret[i] == A[i]);
  ensures Subset(Empty(), Array(p, 4, n)) && (forall i: int :: { ret[i] } Array(p, 4, n)[i] ==> ret[i] == c);



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



var {:extern} Res_KERNEL_SOURCE: [int]int;

var {:extern} Res_PROBED: [int]int;

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

axiom (forall n: int, x: int, z: int :: { INT_PLUS(x, n, z) } Rep(n, x) == Rep(n, INT_PLUS(x, n, z)));

axiom (forall n: int, x: int :: { Rep(n, x) } (exists k: int :: INT_SUB(Rep(n, x), x) == INT_MULT(n, k)));

function {:extern} Array(int, int, int) : [int]bool;

axiom (forall x: int, n: int, z: int :: { Array(x, n, z) } INT_LEQ(z, 0) ==> Equal(Array(x, n, z), Empty()));

axiom (forall x: int, n: int, z: int :: { Array(x, n, z) } INT_GT(z, 0) ==> Equal(Array(x, n, z), Difference(AtLeast(n, x), AtLeast(n, INT_PLUS(x, n, z)))));

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

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 10} unique __ctobpl_const_1: int;

const {:extern} {:model_const "e->oper"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 10} unique __ctobpl_const_2: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 14} unique __ctobpl_const_3: int;

const {:extern} {:model_const "e->op2"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 12} unique __ctobpl_const_10: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 20} unique __ctobpl_const_11: int;

const {:extern} {:model_const "e->result"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 20} unique __ctobpl_const_12: int;

const {:extern} {:model_const "e->oper"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 14} unique __ctobpl_const_4: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 12} unique __ctobpl_const_5: int;

const {:extern} {:model_const "e->result"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 12} unique __ctobpl_const_6: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 12} unique __ctobpl_const_7: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 12} unique __ctobpl_const_9: int;

const {:extern} {:model_const "e->op1"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 12} unique __ctobpl_const_8: int;

const {:extern} {:model_const "e->op1"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 16} unique __ctobpl_const_16: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 16} unique __ctobpl_const_13: int;

const {:extern} {:model_const "e->result"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 16} unique __ctobpl_const_14: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 16} unique __ctobpl_const_17: int;

const {:extern} {:model_const "e->op2"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 16} unique __ctobpl_const_18: int;

const {:extern} {:model_const "e"} {:sourceFile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceLine 16} unique __ctobpl_const_15: int;

procedure {:extern} Eval(e_.1: int);
  free requires INT_LT(0, alloc);
  modifies alloc, detChoiceCnt, Res_KERNEL_SOURCE, Res_PROBED, Mem_T.INT4, Mem_T.op1__EXPR, Mem_T.op2__EXPR, Mem_T.oper__EXPR, Mem_T.result__EXPR;
  free ensures INT_LEQ(old(alloc), alloc);
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_KERNEL_SOURCE[_r] } old(Res_KERNEL_SOURCE)[_r] == Res_KERNEL_SOURCE[_r]);
  free ensures old(Res_KERNEL_SOURCE) == Res_KERNEL_SOURCE;
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_PROBED[_r] } old(Res_PROBED)[_r] == Res_PROBED[_r]);
  free ensures old(Res_PROBED) == Res_PROBED;
  free ensures Mem_T.INT4 == old(Mem_T.INT4);
  free ensures Mem_T.op1__EXPR == old(Mem_T.op1__EXPR);
  free ensures Mem_T.op2__EXPR == old(Mem_T.op2__EXPR);
  free ensures Mem_T.oper__EXPR == old(Mem_T.oper__EXPR);
  free ensures Mem_T.result__EXPR == old(Mem_T.result__EXPR);



implementation {:extern} Eval(e_.1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} e: int;
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    assume INT_LT(e_.1, alloc);
    e := 0;
    e := e_.1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceline 10} true;
    assert INT_NEQ(e, 0);
    goto label_3_true#2, label_3_false#2;

  label_3_false#2:
    assume !INT_EQ(Mem_T.oper__EXPR[oper__EXPR(e)], 1);
    assume value_is(__ctobpl_const_1, e);
    assume value_is(__ctobpl_const_2, Mem_T.oper__EXPR[oper__EXPR(e)]);
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceline 14} true;
    assert INT_NEQ(e, 0);
    goto label_4_true#2, label_4_false#2;

  label_4_false#2:
    assume !INT_EQ(Mem_T.oper__EXPR[oper__EXPR(e)], 2);
    assume value_is(__ctobpl_const_3, e);
    assume value_is(__ctobpl_const_4, Mem_T.oper__EXPR[oper__EXPR(e)]);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceline 20} true;
    assert INT_NEQ(e, 0);
    Mem_T.result__EXPR := Mem_T.result__EXPR[result__EXPR(e) := -1];
    assume value_is(__ctobpl_const_11, e);
    assume value_is(__ctobpl_const_12, Mem_T.result__EXPR[result__EXPR(e)]);
    goto label_1#2;

  label_4_true#2:
    assume INT_EQ(Mem_T.oper__EXPR[oper__EXPR(e)], 2);
    assume value_is(__ctobpl_const_3, e);
    assume value_is(__ctobpl_const_4, Mem_T.oper__EXPR[oper__EXPR(e)]);
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceline 16} true;
    assert INT_NEQ(e, 0);
    assert INT_NEQ(e, 0);
    assert INT_NEQ(e, 0);
    Mem_T.result__EXPR := Mem_T.result__EXPR[result__EXPR(e) := INT_MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.op1__EXPR[op1__EXPR(e)], Mem_T.op2__EXPR[op2__EXPR(e)], 1)];
    assume value_is(__ctobpl_const_13, e);
    assume value_is(__ctobpl_const_14, Mem_T.result__EXPR[result__EXPR(e)]);
    assume value_is(__ctobpl_const_15, e);
    assume value_is(__ctobpl_const_16, Mem_T.op1__EXPR[op1__EXPR(e)]);
    assume value_is(__ctobpl_const_17, e);
    assume value_is(__ctobpl_const_18, Mem_T.op2__EXPR[op2__EXPR(e)]);
    goto label_1#2;

  label_3_true#2:
    assume INT_EQ(Mem_T.oper__EXPR[oper__EXPR(e)], 1);
    assume value_is(__ctobpl_const_1, e);
    assume value_is(__ctobpl_const_2, Mem_T.oper__EXPR[oper__EXPR(e)]);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceline 12} true;
    assert INT_NEQ(e, 0);
    assert INT_NEQ(e, 0);
    assert INT_NEQ(e, 0);
    Mem_T.result__EXPR := Mem_T.result__EXPR[result__EXPR(e) := INT_PLUS(Mem_T.op1__EXPR[op1__EXPR(e)], 1, Mem_T.op2__EXPR[op2__EXPR(e)])];
    assume value_is(__ctobpl_const_5, e);
    assume value_is(__ctobpl_const_6, Mem_T.result__EXPR[result__EXPR(e)]);
    assume value_is(__ctobpl_const_7, e);
    assume value_is(__ctobpl_const_8, Mem_T.op1__EXPR[op1__EXPR(e)]);
    assume value_is(__ctobpl_const_9, e);
    assume value_is(__ctobpl_const_10, Mem_T.op2__EXPR[op2__EXPR(e)]);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-nisebb\documents\symdiff.1.0\examples\c_examples\ex3\v1\foo.c"} {:sourceline 22} true;
    return;
}


