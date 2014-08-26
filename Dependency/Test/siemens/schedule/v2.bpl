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

var {:extern} Mem_T.A17CHAR: [int]int;

var {:extern} Mem_T.A21CHAR: [int]int;

var {:extern} Mem_T.A3CHAR: [int]int;

var {:extern} Mem_T.A4CHAR: [int]int;

var {:extern} Mem_T.A4Plist: [int]int;

var {:extern} Mem_T.FLOAT: [int]int;

var {:extern} Mem_T.INT2: [int]int;

var {:extern} Mem_T.INT4: [int]int;

var {:extern} Mem_T.PCHAR: [int]int;

var {:extern} Mem_T.PFLOAT: [int]int;

var {:extern} Mem_T.PINT4: [int]int;

var {:extern} Mem_T.PPlist: [int]int;

var {:extern} Mem_T.P_iobuf: [int]int;

var {:extern} Mem_T.P_job: [int]int;

var {:extern} Mem_T.Plist: [int]int;

var {:extern} Mem_T.UINT4: [int]int;

var {:extern} Mem_T.first_list: [int]int;

var {:extern} Mem_T.last_list: [int]int;

var {:extern} Mem_T.mem_count_list: [int]int;

var {:extern} Mem_T.next__job: [int]int;

var {:extern} Mem_T.prev__job: [int]int;

var {:extern} Mem_T.priority__job: [int]int;

var {:extern} Mem_T.val__job: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.first_list: name;

const {:extern} unique T.last_list: name;

const {:extern} unique T.mem_count_list: name;

const {:extern} unique T.next__job: name;

const {:extern} unique T.prev__job: name;

const {:extern} unique T.priority__job: name;

const {:extern} unique T.val__job: name;

const {:extern} unique T.A17CHAR: name;

const {:extern} unique T.A21CHAR: name;

const {:extern} unique T.A3CHAR: name;

const {:extern} unique T.A4CHAR: name;

const {:extern} unique T.A4Plist: name;

const {:extern} unique T.CHAR: name;

const {:extern} unique T.FLOAT: name;

const {:extern} unique T.INT2: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PA17CHAR: name;

const {:extern} unique T.PA21CHAR: name;

const {:extern} unique T.PA3CHAR: name;

const {:extern} unique T.PA4CHAR: name;

const {:extern} unique T.PA4Plist: name;

const {:extern} unique T.PCHAR: name;

const {:extern} unique T.PFLOAT: name;

const {:extern} unique T.PINT4: name;

const {:extern} unique T.PPCHAR: name;

const {:extern} unique T.PPPCHAR: name;

const {:extern} unique T.PP_iobuf: name;

const {:extern} unique T.PP_job: name;

const {:extern} unique T.PPlist: name;

const {:extern} unique T.P_iobuf: name;

const {:extern} unique T.P_job: name;

const {:extern} unique T.Plist: name;

const {:extern} unique T.UINT4: name;

const {:extern} unique T._iobuf: name;

const {:extern} unique T._job: name;

const {:extern} unique T.list: name;

function {:extern} first_list(int) : int;

axiom (forall x: int :: { first_list(x) } first_list(x) == INT_ADD(x, 0));

axiom (forall x: int :: { first_list(x) } first_list(x) == PLUS(x, 1, 0));

function {:extern} last_list(int) : int;

axiom (forall x: int :: { last_list(x) } last_list(x) == INT_ADD(x, 4));

axiom (forall x: int :: { last_list(x) } last_list(x) == PLUS(x, 1, 4));

function {:extern} mem_count_list(int) : int;

axiom (forall x: int :: { mem_count_list(x) } mem_count_list(x) == INT_ADD(x, 8));

axiom (forall x: int :: { mem_count_list(x) } mem_count_list(x) == PLUS(x, 1, 8));

function {:extern} next__job(int) : int;

axiom (forall x: int :: { next__job(x) } next__job(x) == INT_ADD(x, 0));

axiom (forall x: int :: { next__job(x) } next__job(x) == PLUS(x, 1, 0));

function {:extern} prev__job(int) : int;

axiom (forall x: int :: { prev__job(x) } prev__job(x) == INT_ADD(x, 4));

axiom (forall x: int :: { prev__job(x) } prev__job(x) == PLUS(x, 1, 4));

function {:extern} priority__job(int) : int;

axiom (forall x: int :: { priority__job(x) } priority__job(x) == INT_ADD(x, 12));

axiom (forall x: int :: { priority__job(x) } priority__job(x) == PLUS(x, 1, 12));

function {:extern} val__job(int) : int;

axiom (forall x: int :: { val__job(x) } val__job(x) == INT_ADD(x, 8));

axiom (forall x: int :: { val__job(x) } val__job(x) == PLUS(x, 1, 8));

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

var {:extern} alloc_proc_num: int;

var {:extern} block_queue: int;

var {:extern} cur_proc: int;

var {:extern} num_processes: int;

const {:extern} unique prio_queue: int;

axiom prio_queue != 0;

axiom Base(prio_queue) == prio_queue;

const {:extern} unique BOOGIE_FLOAT_CONST_1: int;

function {:extern} value_is(c: int, e: int) : bool;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_8: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_9: int;

const {:extern} {:model_const "result.new_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 78} unique __ctobpl_const_17: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 84} unique __ctobpl_const_24: int;

const {:extern} {:model_const "a_list->last"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 82} unique __ctobpl_const_28: int;

const {:extern} {:model_const "a_list->last->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 82} unique __ctobpl_const_29: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 85} unique __ctobpl_const_31: int;

const {:extern} {:model_const "a_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 85} unique __ctobpl_const_33: int;

const {:extern} {:model_const "a_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 84} unique __ctobpl_const_26: int;

const {:extern} {:model_const "a_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 82} unique __ctobpl_const_30: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 87} unique __ctobpl_const_36: int;

const {:extern} {:model_const "a_list->mem_count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 87} unique __ctobpl_const_37: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 88} unique __ctobpl_const_38: int;

const {:extern} {:model_const "a_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 86} unique __ctobpl_const_34: int;

const {:extern} {:model_const "queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 289} unique __ctobpl_const_100: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_10: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 77} unique __ctobpl_const_15: int;

const {:extern} {:model_const "a_ele->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 80} unique __ctobpl_const_19: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 78} unique __ctobpl_const_16: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 82} unique __ctobpl_const_27: int;

const {:extern} {:model_const "result.append_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_14: int;

const {:extern} {:model_const "a_list->last"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 85} unique __ctobpl_const_32: int;

const {:extern} {:model_const "a_ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 86} unique __ctobpl_const_35: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_12: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 80} unique __ctobpl_const_20: int;

const {:extern} {:model_const "a_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 81} unique __ctobpl_const_22: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 257} unique __ctobpl_const_39: int;

const {:extern} {:model_const "a_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 80} unique __ctobpl_const_18: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_13: int;

const {:extern} {:model_const "a_list->last"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 81} unique __ctobpl_const_23: int;

const {:extern} {:model_const "a_list->first"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 84} unique __ctobpl_const_25: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_11: int;

const {:extern} {:model_const "a_list->last"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 80} unique __ctobpl_const_21: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_5: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_6: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 278} unique __ctobpl_const_7: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 277} unique __ctobpl_const_1: int;

const {:extern} {:model_const "result.new_process"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 292} unique __ctobpl_const_111: int;

const {:extern} {:model_const "queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 293} unique __ctobpl_const_112: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 290} unique __ctobpl_const_103: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 295} unique __ctobpl_const_106: int;

const {:extern} {:model_const "alloc_proc_num"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 300} unique __ctobpl_const_119: int;

const {:extern} {:model_const "list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 63} unique __ctobpl_const_196: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 325} unique __ctobpl_const_125: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 321} unique __ctobpl_const_123: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 295} unique __ctobpl_const_105: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 292} unique __ctobpl_const_108: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 321} unique __ctobpl_const_122: int;

const {:extern} {:model_const "num_processes"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 301} unique __ctobpl_const_120: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 293} unique __ctobpl_const_113: int;

const {:extern} {:model_const "queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 293} unique __ctobpl_const_114: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 290} unique __ctobpl_const_118: int;

const {:extern} {:model_const "argc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 314} unique __ctobpl_const_121: int;

const {:extern} {:model_const "status"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 325} unique __ctobpl_const_127: int;

const {:extern} {:model_const "result.fscanf"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 325} unique __ctobpl_const_128: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 293} unique __ctobpl_const_115: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 292} unique __ctobpl_const_109: int;

const {:extern} {:model_const "queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 293} unique __ctobpl_const_116: int;

const {:extern} {:model_const "fscanf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 325} unique __ctobpl_const_124: int;

const {:extern} {:model_const "command"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 325} unique __ctobpl_const_126: int;

const {:extern} {:model_const "status"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 326} unique __ctobpl_const_129: int;

const {:extern} {:model_const "status"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 326} unique __ctobpl_const_130: int;

const {:extern} {:model_const "num_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 290} unique __ctobpl_const_104: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 292} unique __ctobpl_const_110: int;

const {:extern} {:model_const "result.append_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 293} unique __ctobpl_const_117: int;

const {:extern} {:model_const "fscanf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 355} unique __ctobpl_const_132: int;

const {:extern} {:model_const "command"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 329} unique __ctobpl_const_131: int;

const {:extern} {:model_const "queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 295} unique __ctobpl_const_107: int;

const {:extern} {:model_const "num_processes"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 170} unique __ctobpl_const_87: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 160} unique __ctobpl_const_95: int;

const {:extern} {:model_const "d_list->mem_count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 132} unique __ctobpl_const_71: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 171} unique __ctobpl_const_89: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 290} unique __ctobpl_const_102: int;

const {:extern} {:model_const "f_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 104} unique __ctobpl_const_74: int;

const {:extern} {:model_const "f_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 106} unique __ctobpl_const_82: int;

const {:extern} {:model_const "total"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 171} unique __ctobpl_const_90: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 159} unique __ctobpl_const_93: int;

const {:extern} {:model_const "ptr"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 144} unique __ctobpl_const_99: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 105} unique __ctobpl_const_77: int;

const {:extern} {:model_const "f_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 105} unique __ctobpl_const_78: int;

const {:extern} {:model_const "d_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 133} unique __ctobpl_const_72: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 105} unique __ctobpl_const_79: int;

const {:extern} {:model_const "f_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 107} unique __ctobpl_const_81: int;

const {:extern} {:model_const "f_list->first"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 104} unique __ctobpl_const_76: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 171} unique __ctobpl_const_88: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 157} unique __ctobpl_const_92: int;

const {:extern} {:model_const "f_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 104} unique __ctobpl_const_75: int;

const {:extern} {:model_const "f_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 106} unique __ctobpl_const_83: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 171} unique __ctobpl_const_91: int;

const {:extern} {:model_const "f_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 102} unique __ctobpl_const_73: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 105} unique __ctobpl_const_80: int;

const {:extern} {:model_const "f_ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 106} unique __ctobpl_const_84: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 159} unique __ctobpl_const_94: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 105} unique __ctobpl_const_85: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 160} unique __ctobpl_const_96: int;

const {:extern} {:model_const "num_processes"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 161} unique __ctobpl_const_97: int;

const {:extern} {:model_const "result.new_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 289} unique __ctobpl_const_101: int;

const {:extern} {:model_const "ptr"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 144} unique __ctobpl_const_98: int;

const {:extern} {:model_const "d_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 132} unique __ctobpl_const_70: int;

const {:extern} {:model_const "total"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 170} unique __ctobpl_const_86: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 355} unique __ctobpl_const_133: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 126} unique __ctobpl_const_52: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 259} unique __ctobpl_const_42: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 124} unique __ctobpl_const_54: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 128} unique __ctobpl_const_68: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 259} unique __ctobpl_const_40: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 259} unique __ctobpl_const_41: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 123} unique __ctobpl_const_48: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 128} unique __ctobpl_const_65: int;

const {:extern} {:model_const "result.append_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 259} unique __ctobpl_const_45: int;

const {:extern} {:model_const "d_ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 128} unique __ctobpl_const_69: int;

const {:extern} {:model_const "d_ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 123} unique __ctobpl_const_49: int;

const {:extern} {:model_const "d_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 126} unique __ctobpl_const_50: int;

const {:extern} {:model_const "d_list->last"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 126} unique __ctobpl_const_51: int;

const {:extern} {:model_const "d_ele->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 126} unique __ctobpl_const_53: int;

const {:extern} {:model_const "d_ele->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 124} unique __ctobpl_const_58: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 127} unique __ctobpl_const_59: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 259} unique __ctobpl_const_44: int;

const {:extern} {:model_const "d_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 130} unique __ctobpl_const_61: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 120} unique __ctobpl_const_47: int;

const {:extern} {:model_const "d_list->first"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 130} unique __ctobpl_const_62: int;

const {:extern} {:model_const "d_ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 130} unique __ctobpl_const_64: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 124} unique __ctobpl_const_57: int;

const {:extern} {:model_const "d_list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 120} unique __ctobpl_const_46: int;

const {:extern} {:model_const "d_ele->prev->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 128} unique __ctobpl_const_67: int;

const {:extern} {:model_const "d_ele->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 127} unique __ctobpl_const_60: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 259} unique __ctobpl_const_43: int;

const {:extern} {:model_const "d_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 130} unique __ctobpl_const_63: int;

const {:extern} {:model_const "d_ele->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 128} unique __ctobpl_const_66: int;

const {:extern} {:model_const "d_ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 124} unique __ctobpl_const_55: int;

const {:extern} {:model_const "d_ele->next->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 124} unique __ctobpl_const_56: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 277} unique __ctobpl_const_2: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 277} unique __ctobpl_const_3: int;

const {:extern} {:model_const "result.new_process"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 277} unique __ctobpl_const_4: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 182} unique __ctobpl_const_229: int;

const {:extern} {:model_const "prio_queue[i]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 184} unique __ctobpl_const_235: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 180} unique __ctobpl_const_232: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 228} unique __ctobpl_const_247: int;

const {:extern} {:model_const "prio_queue[i]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_245: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 231} unique __ctobpl_const_251: int;

const {:extern} {:model_const "ratio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 231} unique __ctobpl_const_253: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 184} unique __ctobpl_const_234: int;

const {:extern} {:model_const "(prio_queue[i])->first"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 184} unique __ctobpl_const_236: int;

const {:extern} {:model_const "prio_queue[i]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_239: int;

const {:extern} {:model_const "del_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_237: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_244: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 230} unique __ctobpl_const_249: int;

const {:extern} {:model_const "del_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_240: int;

const {:extern} {:model_const "(prio_queue[i])->mem_count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 182} unique __ctobpl_const_231: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_241: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 184} unique __ctobpl_const_233: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_243: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 179} unique __ctobpl_const_226: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 180} unique __ctobpl_const_227: int;

const {:extern} {:model_const "result.del_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_246: int;

const {:extern} {:model_const "count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 230} unique __ctobpl_const_248: int;

const {:extern} {:model_const "count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 231} unique __ctobpl_const_252: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 232} unique __ctobpl_const_254: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 232} unique __ctobpl_const_255: int;

const {:extern} {:model_const "prio_queue[i]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 182} unique __ctobpl_const_230: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_238: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 232} unique __ctobpl_const_256: int;

const {:extern} {:model_const "del_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 185} unique __ctobpl_const_242: int;

const {:extern} {:model_const "block_queue->mem_count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 230} unique __ctobpl_const_250: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 232} unique __ctobpl_const_257: int;

const {:extern} {:model_const "i"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 180} unique __ctobpl_const_228: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 248} unique __ctobpl_const_213: int;

const {:extern} {:model_const "new_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 267} unique __ctobpl_const_203: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_216: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_218: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_223: int;

const {:extern} {:model_const "num_processes"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 269} unique __ctobpl_const_210: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 248} unique __ctobpl_const_214: int;

const {:extern} {:model_const "list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 64} unique __ctobpl_const_198: int;

const {:extern} {:model_const "list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 65} unique __ctobpl_const_200: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_224: int;

const {:extern} {:model_const "result.append_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_225: int;

const {:extern} {:model_const "list->mem_count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 64} unique __ctobpl_const_199: int;

const {:extern} {:model_const "alloc_proc_num"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 267} unique __ctobpl_const_202: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 232} unique __ctobpl_const_258: int;

const {:extern} {:model_const "result.new_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 267} unique __ctobpl_const_206: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 246} unique __ctobpl_const_212: int;

const {:extern} {:model_const "proc->priority"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 268} unique __ctobpl_const_208: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 268} unique __ctobpl_const_209: int;

const {:extern} {:model_const "new_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 267} unique __ctobpl_const_201: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_219: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_220: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_221: int;

const {:extern} {:model_const "new_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 267} unique __ctobpl_const_204: int;

const {:extern} {:model_const "cur_proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_222: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 268} unique __ctobpl_const_207: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 205} unique __ctobpl_const_288: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 270} unique __ctobpl_const_211: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 267} unique __ctobpl_const_205: int;

const {:extern} {:model_const "cur_proc->priority"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 248} unique __ctobpl_const_215: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 249} unique __ctobpl_const_217: int;

const {:extern} {:model_const "list->last"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 63} unique __ctobpl_const_197: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_271: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 233} unique __ctobpl_const_260: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_277: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_275: int;

const {:extern} {:model_const "dest_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 204} unique __ctobpl_const_284: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_278: int;

const {:extern} {:model_const "result.append_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_279: int;

const {:extern} {:model_const "count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 205} unique __ctobpl_const_287: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_270: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_274: int;

const {:extern} {:model_const "result.del_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 234} unique __ctobpl_const_266: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 204} unique __ctobpl_const_285: int;

const {:extern} {:model_const "prio_queue[prio + 1]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 204} unique __ctobpl_const_286: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 201} unique __ctobpl_const_280: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 234} unique __ctobpl_const_263: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 203} unique __ctobpl_const_282: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 234} unique __ctobpl_const_262: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 234} unique __ctobpl_const_261: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 236} unique __ctobpl_const_268: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 234} unique __ctobpl_const_264: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 236} unique __ctobpl_const_267: int;

const {:extern} {:model_const "append_ele.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_273: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_276: int;

const {:extern} {:model_const "proc->priority"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 236} unique __ctobpl_const_269: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 237} unique __ctobpl_const_272: int;

const {:extern} {:model_const "prio_queue[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 203} unique __ctobpl_const_283: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 203} unique __ctobpl_const_281: int;

const {:extern} {:model_const "block_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 234} unique __ctobpl_const_265: int;

const {:extern} {:model_const "new_num"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 46} unique __ctobpl_const_190: int;

const {:extern} {:model_const "command"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 327} unique __ctobpl_const_166: int;

const {:extern} {:model_const "result.find_nth"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 232} unique __ctobpl_const_259: int;

const {:extern} {:model_const "argv[prio]"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_172: int;

const {:extern} {:model_const "ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 47} unique __ctobpl_const_191: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 327} unique __ctobpl_const_165: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 321} unique __ctobpl_const_179: int;

const {:extern} {:model_const "list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 60} unique __ctobpl_const_192: int;

const {:extern} {:model_const "ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 44} unique __ctobpl_const_184: int;

const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 60} unique __ctobpl_const_193: int;

const {:extern} {:model_const "list"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 62} unique __ctobpl_const_194: int;

const {:extern} {:model_const "result.fscanf"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 327} unique __ctobpl_const_168: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_174: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_171: int;

const {:extern} {:model_const "argv"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_170: int;

const {:extern} {:model_const "ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 43} unique __ctobpl_const_182: int;

const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 43} unique __ctobpl_const_183: int;

const {:extern} {:model_const "list->first"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 62} unique __ctobpl_const_195: int;

const {:extern} {:model_const "ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 46} unique __ctobpl_const_188: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_176: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_177: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 316} unique __ctobpl_const_181: int;

const {:extern} {:model_const "result.atoi"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_178: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_169: int;

const {:extern} {:model_const "ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 45} unique __ctobpl_const_186: int;

const {:extern} {:model_const "status"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 327} unique __ctobpl_const_167: int;

const {:extern} {:model_const "atoi.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_173: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 323} unique __ctobpl_const_175: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 316} unique __ctobpl_const_180: int;

const {:extern} {:model_const "ele->next"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 44} unique __ctobpl_const_185: int;

const {:extern} {:model_const "ele->prev"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 45} unique __ctobpl_const_187: int;

const {:extern} {:model_const "ele->val"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 46} unique __ctobpl_const_189: int;

const {:extern} {:model_const "ratio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 342} unique __ctobpl_const_161: int;

const {:extern} {:model_const "unblock_process.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 342} unique __ctobpl_const_162: int;

const {:extern} {:model_const "fscanf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 345} unique __ctobpl_const_141: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 355} unique __ctobpl_const_134: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 345} unique __ctobpl_const_142: int;

const {:extern} {:model_const "fscanf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 346} unique __ctobpl_const_144: int;

const {:extern} {:model_const "unblock_process.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 342} unique __ctobpl_const_163: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 347} unique __ctobpl_const_148: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 347} unique __ctobpl_const_147: int;

const {:extern} {:model_const "fscanf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 327} unique __ctobpl_const_164: int;

const {:extern} {:model_const "unblock_process.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 342} unique __ctobpl_const_160: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 352} unique __ctobpl_const_151: int;

const {:extern} {:model_const "ratio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 346} unique __ctobpl_const_146: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 361} unique __ctobpl_const_137: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 357} unique __ctobpl_const_139: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 356} unique __ctobpl_const_136: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 345} unique __ctobpl_const_143: int;

const {:extern} {:model_const "ratio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 352} unique __ctobpl_const_150: int;

const {:extern} {:model_const "upgrade_process_prio.arg.2"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 352} unique __ctobpl_const_152: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 356} unique __ctobpl_const_135: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 361} unique __ctobpl_const_138: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 346} unique __ctobpl_const_145: int;

const {:extern} {:model_const "upgrade_process_prio.arg.2"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 352} unique __ctobpl_const_149: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 352} unique __ctobpl_const_153: int;

const {:extern} {:model_const "fscanf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 341} unique __ctobpl_const_157: int;

const {:extern} {:model_const "upgrade_process_prio.arg.2"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 352} unique __ctobpl_const_154: int;

const {:extern} {:model_const "ratio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 341} unique __ctobpl_const_159: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 357} unique __ctobpl_const_140: int;

const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 348} unique __ctobpl_const_155: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 348} unique __ctobpl_const_156: int;

const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 341} unique __ctobpl_const_158: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 212} unique __ctobpl_const_305: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 215} unique __ctobpl_const_313: int;

const {:extern} {:model_const "src_queue->mem_count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 205} unique __ctobpl_const_289: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 210} unique __ctobpl_const_296: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 210} unique __ctobpl_const_298: int;

const {:extern} {:model_const "prio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 214} unique __ctobpl_const_309: int;

const {:extern} {:model_const "ratio"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 209} unique __ctobpl_const_293: int;

const {:extern} {:model_const "dest_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 215} unique __ctobpl_const_310: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 212} unique __ctobpl_const_303: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 215} unique __ctobpl_const_311: int;

const {:extern} {:model_const "dest_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 215} unique __ctobpl_const_312: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 212} unique __ctobpl_const_304: int;

const {:extern} {:model_const "result.del_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 212} unique __ctobpl_const_306: int;

const {:extern} {:model_const "proc->priority"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 214} unique __ctobpl_const_308: int;

const {:extern} {:model_const "result.find_nth"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 210} unique __ctobpl_const_299: int;

const {:extern} {:model_const "dest_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 215} unique __ctobpl_const_314: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 209} unique __ctobpl_const_291: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 210} unique __ctobpl_const_297: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 212} unique __ctobpl_const_302: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 214} unique __ctobpl_const_307: int;

const {:extern} {:model_const "result.append_ele"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 215} unique __ctobpl_const_315: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 210} unique __ctobpl_const_294: int;

const {:extern} {:model_const "proc"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 211} unique __ctobpl_const_300: int;

const {:extern} {:model_const "count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 209} unique __ctobpl_const_292: int;

const {:extern} {:model_const "src_queue"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 212} unique __ctobpl_const_301: int;

const {:extern} {:model_const "count"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 207} unique __ctobpl_const_290: int;

const {:extern} {:model_const "n"} {:sourceFile ".\v2\schedule.c"} {:sourceLine 210} unique __ctobpl_const_295: int;

procedure {:extern} __iob_func() returns (__dummy_ret__iob_func: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} atoi(__dummy_formal_atoi_0.__1: int) returns (__dummy_retatoi: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} add_process(prio.__1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} add_process(prio.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $append_ele.arg.1$3$: int;
  var {:extern} prio: int;
  var {:extern} proc: int;
  var {:extern} result.append_ele$2: int;
  var {:extern} result.new_process$1: int;
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
    $append_ele.arg.1$3$ := 0;
    prio := 0;
    proc := 0;
    result.append_ele$2 := 0;
    result.new_process$1 := 0;
    prio := prio.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 276} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 277} true;
    call result.new_process$1 := new_process(prio);
    assume value_is(__ctobpl_const_1, prio);
    assume value_is(__ctobpl_const_2, prio);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 277} true;
    proc := result.new_process$1;
    assume value_is(__ctobpl_const_3, proc);
    assume value_is(__ctobpl_const_4, result.new_process$1);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 278} true;
    assert prio_queue != 0;
    $append_ele.arg.1$3$ := Mem_T.Plist[PLUS(prio_queue, 4, prio)];
    assume value_is(__ctobpl_const_5, $append_ele.arg.1$3$);
    assume value_is(__ctobpl_const_6, prio);
    assume value_is(__ctobpl_const_7, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 278} true;
    call result.append_ele$2 := append_ele($append_ele.arg.1$3$, proc);
    assume value_is(__ctobpl_const_8, $append_ele.arg.1$3$);
    assume value_is(__ctobpl_const_9, proc);
    assume value_is(__ctobpl_const_10, $append_ele.arg.1$3$);
    assume value_is(__ctobpl_const_11, proc);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 278} true;
    assert prio_queue != 0;
    Mem_T.Plist := Mem_T.Plist[PLUS(prio_queue, 4, prio) := result.append_ele$2];
    assume value_is(__ctobpl_const_12, prio);
    assume value_is(__ctobpl_const_13, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    assume value_is(__ctobpl_const_14, result.append_ele$2);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 279} true;
    return;
}



procedure {:extern} append_ele(a_list.__1: int, a_ele.__1: int) returns (result.append_ele$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} append_ele(a_list.__1: int, a_ele.__1: int) returns (result.append_ele$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} a_ele: int;
  var {:extern} a_list: int;
  var {:extern} result.new_list$2: int;
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
    assume INT_LT(a_list.__1, alloc);
    assume INT_LT(a_ele.__1, alloc);
    a_ele := 0;
    a_list := 0;
    result.append_ele$1 := 0;
    result.new_list$2 := 0;
    a_list := a_list.__1;
    a_ele := a_ele.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 77} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume a_list == 0;
    assume value_is(__ctobpl_const_15, a_list);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 78} true;
    call result.new_list$2 := new_list();
    goto label_15;

  label_15:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 78} true;
    a_list := result.new_list$2;
    assume value_is(__ctobpl_const_16, a_list);
    assume value_is(__ctobpl_const_17, result.new_list$2);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 80} true;
    assert a_ele != 0;
    assert a_list != 0;
    Mem_T.prev__job := Mem_T.prev__job[prev__job(a_ele) := Mem_T.last_list[last_list(a_list)]];
    assume value_is(__ctobpl_const_18, a_ele);
    assume value_is(__ctobpl_const_19, Mem_T.prev__job[prev__job(a_ele)]);
    assume value_is(__ctobpl_const_20, a_list);
    assume value_is(__ctobpl_const_21, Mem_T.last_list[last_list(a_list)]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 81} true;
    assert a_list != 0;
    goto label_8_true, label_8_false;

  label_8_false:
    assume Mem_T.last_list[last_list(a_list)] == 0;
    assume value_is(__ctobpl_const_22, a_list);
    assume value_is(__ctobpl_const_23, Mem_T.last_list[last_list(a_list)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 84} true;
    assert a_list != 0;
    Mem_T.first_list := Mem_T.first_list[first_list(a_list) := a_ele];
    assume value_is(__ctobpl_const_24, a_list);
    assume value_is(__ctobpl_const_25, Mem_T.first_list[first_list(a_list)]);
    assume value_is(__ctobpl_const_26, a_ele);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 85} true;
    assert a_list != 0;
    Mem_T.last_list := Mem_T.last_list[last_list(a_list) := a_ele];
    assume value_is(__ctobpl_const_31, a_list);
    assume value_is(__ctobpl_const_32, Mem_T.last_list[last_list(a_list)]);
    assume value_is(__ctobpl_const_33, a_ele);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 86} true;
    assert a_ele != 0;
    Mem_T.next__job := Mem_T.next__job[next__job(a_ele) := 0];
    assume value_is(__ctobpl_const_34, a_ele);
    assume value_is(__ctobpl_const_35, Mem_T.next__job[next__job(a_ele)]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 87} true;
    assert a_list != 0;
    assume value_is(__ctobpl_const_36, a_list);
    assume value_is(__ctobpl_const_37, Mem_T.mem_count_list[mem_count_list(a_list)]);
    tempBoogie0 := PLUS(Mem_T.mem_count_list[mem_count_list(a_list)], 1, 1);
    Mem_T.mem_count_list := Mem_T.mem_count_list[mem_count_list(a_list) := tempBoogie0];
    goto label_14;

  label_14:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 88} true;
    result.append_ele$1 := a_list;
    assume value_is(__ctobpl_const_38, a_list);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 89} true;
    return;

  label_8_true:
    assume Mem_T.last_list[last_list(a_list)] != 0;
    assume value_is(__ctobpl_const_22, a_list);
    assume value_is(__ctobpl_const_23, Mem_T.last_list[last_list(a_list)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 82} true;
    assert a_list != 0;
    assert Mem_T.last_list[last_list(a_list)] != 0;
    Mem_T.next__job := Mem_T.next__job[next__job(Mem_T.last_list[last_list(a_list)]) := a_ele];
    assume value_is(__ctobpl_const_27, a_list);
    assume value_is(__ctobpl_const_28, Mem_T.last_list[last_list(a_list)]);
    assume value_is(__ctobpl_const_29, Mem_T.next__job[next__job(Mem_T.last_list[last_list(a_list)])]);
    assume value_is(__ctobpl_const_30, a_ele);
    goto label_11;

  label_3_true:
    assume a_list != 0;
    assume value_is(__ctobpl_const_15, a_list);
    goto label_7;
}



procedure {:extern} block_process();
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} block_process()
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.append_ele$2: int;
  var {:extern} result.schedule$1: int;
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
    result.append_ele$2 := 0;
    result.schedule$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 256} true;
    call result.schedule$1 := schedule();
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 257} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume cur_proc == 0;
    assume value_is(__ctobpl_const_39, cur_proc);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 261} true;
    return;

  label_6_true:
    assume cur_proc != 0;
    assume value_is(__ctobpl_const_39, cur_proc);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 259} true;
    call result.append_ele$2 := append_ele(block_queue, cur_proc);
    assume value_is(__ctobpl_const_40, block_queue);
    assume value_is(__ctobpl_const_41, cur_proc);
    assume value_is(__ctobpl_const_42, block_queue);
    assume value_is(__ctobpl_const_43, cur_proc);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 259} true;
    block_queue := result.append_ele$2;
    assume value_is(__ctobpl_const_44, block_queue);
    assume value_is(__ctobpl_const_45, result.append_ele$2);
    goto label_1;
}



procedure {:extern} del_ele(d_list.__1: int, d_ele.__1: int) returns (result.del_ele$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} del_ele(d_list.__1: int, d_ele.__1: int) returns (result.del_ele$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} d_ele: int;
  var {:extern} d_list: int;
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
    assume INT_LT(d_list.__1, alloc);
    assume INT_LT(d_ele.__1, alloc);
    d_ele := 0;
    d_list := 0;
    result.del_ele$1 := 0;
    d_list := d_list.__1;
    d_ele := d_ele.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 120} true;
    goto label_3_true, label_3_false;

  label_3_false:
    assume d_list == 0;
    assume value_is(__ctobpl_const_46, d_list);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 121} true;
    result.del_ele$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 134} true;
    return;

  label_3_true:
    assume d_list != 0;
    assume value_is(__ctobpl_const_46, d_list);
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 120} true;
    goto label_5_true, label_5_false;

  label_5_false:
    assume d_ele == 0;
    assume value_is(__ctobpl_const_47, d_ele);
    goto label_4;

  label_5_true:
    assume d_ele != 0;
    assume value_is(__ctobpl_const_47, d_ele);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 123} true;
    assert d_ele != 0;
    goto label_6_true, label_6_false;

  label_6_false:
    assume Mem_T.next__job[next__job(d_ele)] == 0;
    assume value_is(__ctobpl_const_48, d_ele);
    assume value_is(__ctobpl_const_49, Mem_T.next__job[next__job(d_ele)]);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 126} true;
    assert d_list != 0;
    assert d_ele != 0;
    Mem_T.last_list := Mem_T.last_list[last_list(d_list) := Mem_T.prev__job[prev__job(d_ele)]];
    assume value_is(__ctobpl_const_50, d_list);
    assume value_is(__ctobpl_const_51, Mem_T.last_list[last_list(d_list)]);
    assume value_is(__ctobpl_const_52, d_ele);
    assume value_is(__ctobpl_const_53, Mem_T.prev__job[prev__job(d_ele)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 127} true;
    assert d_ele != 0;
    goto label_9_true, label_9_false;

  label_9_false:
    assume Mem_T.prev__job[prev__job(d_ele)] == 0;
    assume value_is(__ctobpl_const_59, d_ele);
    assume value_is(__ctobpl_const_60, Mem_T.prev__job[prev__job(d_ele)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 130} true;
    assert d_list != 0;
    assert d_ele != 0;
    Mem_T.first_list := Mem_T.first_list[first_list(d_list) := Mem_T.next__job[next__job(d_ele)]];
    assume value_is(__ctobpl_const_61, d_list);
    assume value_is(__ctobpl_const_62, Mem_T.first_list[first_list(d_list)]);
    assume value_is(__ctobpl_const_63, d_ele);
    assume value_is(__ctobpl_const_64, Mem_T.next__job[next__job(d_ele)]);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 132} true;
    assert d_list != 0;
    assume value_is(__ctobpl_const_70, d_list);
    assume value_is(__ctobpl_const_71, Mem_T.mem_count_list[mem_count_list(d_list)]);
    tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.mem_count_list[mem_count_list(d_list)], 1, 1);
    Mem_T.mem_count_list := Mem_T.mem_count_list[mem_count_list(d_list) := tempBoogie0];
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 133} true;
    result.del_ele$1 := d_list;
    assume value_is(__ctobpl_const_72, d_list);
    goto label_1;

  label_9_true:
    assume Mem_T.prev__job[prev__job(d_ele)] != 0;
    assume value_is(__ctobpl_const_59, d_ele);
    assume value_is(__ctobpl_const_60, Mem_T.prev__job[prev__job(d_ele)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 128} true;
    assert d_ele != 0;
    assert Mem_T.prev__job[prev__job(d_ele)] != 0;
    assert d_ele != 0;
    Mem_T.next__job := Mem_T.next__job[next__job(Mem_T.prev__job[prev__job(d_ele)]) := Mem_T.next__job[next__job(d_ele)]];
    assume value_is(__ctobpl_const_65, d_ele);
    assume value_is(__ctobpl_const_66, Mem_T.prev__job[prev__job(d_ele)]);
    assume value_is(__ctobpl_const_67, Mem_T.next__job[next__job(Mem_T.prev__job[prev__job(d_ele)])]);
    assume value_is(__ctobpl_const_68, d_ele);
    assume value_is(__ctobpl_const_69, Mem_T.next__job[next__job(d_ele)]);
    goto label_12;

  label_6_true:
    assume Mem_T.next__job[next__job(d_ele)] != 0;
    assume value_is(__ctobpl_const_48, d_ele);
    assume value_is(__ctobpl_const_49, Mem_T.next__job[next__job(d_ele)]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 124} true;
    assert d_ele != 0;
    assert Mem_T.next__job[next__job(d_ele)] != 0;
    assert d_ele != 0;
    Mem_T.prev__job := Mem_T.prev__job[prev__job(Mem_T.next__job[next__job(d_ele)]) := Mem_T.prev__job[prev__job(d_ele)]];
    assume value_is(__ctobpl_const_54, d_ele);
    assume value_is(__ctobpl_const_55, Mem_T.next__job[next__job(d_ele)]);
    assume value_is(__ctobpl_const_56, Mem_T.prev__job[prev__job(Mem_T.next__job[next__job(d_ele)])]);
    assume value_is(__ctobpl_const_57, d_ele);
    assume value_is(__ctobpl_const_58, Mem_T.prev__job[prev__job(d_ele)]);
    goto label_9;
}



procedure {:extern} find_nth(f_list.__1: int, n.__1: int) returns (result.find_nth$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} find_nth(f_list.__1: int, n.__1: int) returns (result.find_nth$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} f_ele: int;
  var {:extern} f_list: int;
  var {:extern} i: int;
  var {:extern} n: int;
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
    assume INT_LT(f_list.__1, alloc);
    f_ele := 0;
    f_list := 0;
    i := 0;
    n := 0;
    result.find_nth$1 := 0;
    f_list := f_list.__1;
    n := n.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 99} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 100} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 102} true;
    goto label_5_true, label_5_false;

  label_5_false:
    assume f_list == 0;
    assume value_is(__ctobpl_const_73, f_list);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 103} true;
    result.find_nth$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 108} true;
    return;

  label_5_true:
    assume f_list != 0;
    assume value_is(__ctobpl_const_73, f_list);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 104} true;
    assert f_list != 0;
    f_ele := Mem_T.first_list[first_list(f_list)];
    assume value_is(__ctobpl_const_74, f_ele);
    assume value_is(__ctobpl_const_75, f_list);
    assume value_is(__ctobpl_const_76, Mem_T.first_list[first_list(f_list)]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 105} true;
    i := 1;
    assume value_is(__ctobpl_const_77, i);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 105} true;
    goto label_9_head;

  label_9_head:
    call f_ele, i := find_nth_loop_label_9_head(f_ele, i, n);
    goto label_9_head_last;

  label_9_false:
    assume f_ele == 0;
    assume value_is(__ctobpl_const_78, f_ele);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 107} true;
    result.find_nth$1 := f_ele;
    assume value_is(__ctobpl_const_81, f_ele);
    goto label_1;

  label_9_true:
    assume f_ele != 0;
    assume value_is(__ctobpl_const_78, f_ele);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 105} true;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_LT(i, n);
    assume value_is(__ctobpl_const_79, i);
    assume value_is(__ctobpl_const_80, n);
    goto label_10;

  label_11_true:
    assume INT_LT(i, n);
    assume value_is(__ctobpl_const_79, i);
    assume value_is(__ctobpl_const_80, n);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 106} true;
    assert f_ele != 0;
    f_ele := Mem_T.next__job[next__job(f_ele)];
    assume value_is(__ctobpl_const_82, f_ele);
    assume value_is(__ctobpl_const_83, f_ele);
    assume value_is(__ctobpl_const_84, Mem_T.next__job[next__job(f_ele)]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 105} true;
    assume value_is(__ctobpl_const_85, i);
    i := PLUS(i, 1, 1);
    goto label_13_dummy;

  label_13_dummy:
    assume false;
    return;

  label_9_head_last:
    goto label_9_true, label_9_false;
}



procedure {:extern} finish_all_processes();
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} finish_all_processes()
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} i: int;
  var {:extern} total: int;
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
    i := 0;
    total := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 168} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 169} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 170} true;
    total := num_processes;
    assume value_is(__ctobpl_const_86, total);
    assume value_is(__ctobpl_const_87, num_processes);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 171} true;
    i := 0;
    assume value_is(__ctobpl_const_88, i);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 171} true;
    goto label_7_head;

  label_7_head:
    call i := finish_all_processes_loop_label_7_head(i, total);
    goto label_7_head_last;

  label_7_false:
    assume !INT_LT(i, total);
    assume value_is(__ctobpl_const_89, i);
    assume value_is(__ctobpl_const_90, total);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 173} true;
    return;

  label_7_true:
    assume INT_LT(i, total);
    assume value_is(__ctobpl_const_89, i);
    assume value_is(__ctobpl_const_90, total);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 172} true;
    call finish_process();
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 171} true;
    assume value_is(__ctobpl_const_91, i);
    i := PLUS(i, 1, 1);
    goto label_11_dummy;

  label_11_dummy:
    assume false;
    return;

  label_7_head_last:
    goto label_7_true, label_7_false;
}



procedure {:extern} finish_process();
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} finish_process()
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $fprintf.arg.1$4$: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.fprintf$2: int;
  var {:extern} result.schedule$1: int;
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
    $fprintf.arg.1$4$ := 0;
    result.__iob_func$3 := 0;
    result.fprintf$2 := 0;
    result.schedule$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 156} true;
    call result.schedule$1 := schedule();
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 157} true;
    goto label_6_true, label_6_false;

  label_6_false:
    assume cur_proc == 0;
    assume value_is(__ctobpl_const_92, cur_proc);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 163} true;
    return;

  label_6_true:
    assume cur_proc != 0;
    assume value_is(__ctobpl_const_92, cur_proc);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 159} true;
    call result.__iob_func$3 := __iob_func();
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 159} true;
    assert result.__iob_func$3 != 0;
    $fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1);
    assume value_is(__ctobpl_const_93, $fprintf.arg.1$4$);
    assume value_is(__ctobpl_const_94, result.__iob_func$3);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 159} true;
    call result.fprintf$2 := det_choice();
    goto label_14;

  label_14:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 160} true;
    call free_ele(cur_proc);
    assume value_is(__ctobpl_const_95, cur_proc);
    assume value_is(__ctobpl_const_96, cur_proc);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 161} true;
    assume value_is(__ctobpl_const_97, num_processes);
    num_processes := MINUS_BOTH_PTR_OR_BOTH_INT(num_processes, 1, 1);
    goto label_1;
}



procedure {:extern} free_ele(ptr.__1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} free_ele(ptr.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} ptr: int;
  var {:extern} result.free$1: int;
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
    assume INT_LT(ptr.__1, alloc);
    ptr := 0;
    result.free$1 := 0;
    ptr := ptr.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 144} true;
    call __HAVOC_free(ptr);
    assume value_is(__ctobpl_const_98, ptr);
    assume value_is(__ctobpl_const_99, ptr);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 145} true;
    return;
}



procedure {:extern} init_prio_queue(prio.__1: int, num_proc.__1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} init_prio_queue(prio.__1: int, num_proc.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} i: int;
  var {:extern} num_proc: int;
  var {:extern} prio: int;
  var {:extern} proc: int;
  var {:extern} queue: int;
  var {:extern} result.append_ele$3: int;
  var {:extern} result.new_list$1: int;
  var {:extern} result.new_process$2: int;
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
    i := 0;
    num_proc := 0;
    prio := 0;
    proc := 0;
    queue := 0;
    result.append_ele$3 := 0;
    result.new_list$1 := 0;
    result.new_process$2 := 0;
    prio := prio.__1;
    num_proc := num_proc.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 285} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 286} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 287} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 289} true;
    call result.new_list$1 := new_list();
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 289} true;
    queue := result.new_list$1;
    assume value_is(__ctobpl_const_100, queue);
    assume value_is(__ctobpl_const_101, result.new_list$1);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 290} true;
    i := 0;
    assume value_is(__ctobpl_const_102, i);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 290} true;
    goto label_11_head;

  label_11_head:
    call i, proc, queue, result.append_ele$3, result.new_process$2 := init_prio_queue_loop_label_11_head(i, num_proc, prio, proc, queue, result.append_ele$3, result.new_process$2);
    goto label_11_head_last;

  label_11_false:
    assume !INT_LT(i, num_proc);
    assume value_is(__ctobpl_const_103, i);
    assume value_is(__ctobpl_const_104, num_proc);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 295} true;
    assert prio_queue != 0;
    Mem_T.Plist := Mem_T.Plist[PLUS(prio_queue, 4, prio) := queue];
    assume value_is(__ctobpl_const_105, prio);
    assume value_is(__ctobpl_const_106, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    assume value_is(__ctobpl_const_107, queue);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 296} true;
    return;

  label_11_true:
    assume INT_LT(i, num_proc);
    assume value_is(__ctobpl_const_103, i);
    assume value_is(__ctobpl_const_104, num_proc);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 292} true;
    call result.new_process$2 := new_process(prio);
    assume value_is(__ctobpl_const_108, prio);
    assume value_is(__ctobpl_const_109, prio);
    goto label_16;

  label_16:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 292} true;
    proc := result.new_process$2;
    assume value_is(__ctobpl_const_110, proc);
    assume value_is(__ctobpl_const_111, result.new_process$2);
    goto label_17;

  label_17:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 293} true;
    call result.append_ele$3 := append_ele(queue, proc);
    assume value_is(__ctobpl_const_112, queue);
    assume value_is(__ctobpl_const_113, proc);
    assume value_is(__ctobpl_const_114, queue);
    assume value_is(__ctobpl_const_115, proc);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 293} true;
    queue := result.append_ele$3;
    assume value_is(__ctobpl_const_116, queue);
    assume value_is(__ctobpl_const_117, result.append_ele$3);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 290} true;
    assume value_is(__ctobpl_const_118, i);
    i := PLUS(i, 1, 1);
    goto label_21_dummy;

  label_21_dummy:
    assume false;
    return;

  label_11_head_last:
    goto label_11_true, label_11_false;
}



procedure {:extern} initialize();
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
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
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 300} true;
    alloc_proc_num := 0;
    assume value_is(__ctobpl_const_119, alloc_proc_num);
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 301} true;
    num_processes := 0;
    assume value_is(__ctobpl_const_120, num_processes);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 302} true;
    return;
}



procedure {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} main(argc.__1: int, argv.__1: int) returns (result.main$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} argc: int;
  var {:extern} argv: int;
  var {:extern} $atoi.arg.1$6$: int;
  var {:extern} command: int;
  var {:extern} $fprintf.arg.1$22$: int;
  var {:extern} $fprintf.arg.1$29$: int;
  var {:extern} $fprintf.arg.1$4$: int;
  var {:extern} $fscanf.arg.1$12$: int;
  var {:extern} $fscanf.arg.1$16$: int;
  var {:extern} $fscanf.arg.1$19$: int;
  var {:extern} $fscanf.arg.1$26$: int;
  var {:extern} $fscanf.arg.1$32$: int;
  var {:extern} $fscanf.arg.1$9$: int;
  var {:extern} prio: int;
  var {:extern} ratio: int;
  var {:extern} result.__iob_func$3: int;
  var {:extern} result.__iob_func$8: int;
  var {:extern} result.__iob_func$31: int;
  var {:extern} result.__iob_func$11: int;
  var {:extern} result.__iob_func$15: int;
  var {:extern} result.__iob_func$18: int;
  var {:extern} result.__iob_func$21: int;
  var {:extern} result.__iob_func$25: int;
  var {:extern} result.__iob_func$28: int;
  var {:extern} result.atoi$5: int;
  var {:extern} result.fprintf$2: int;
  var {:extern} result.fprintf$20: int;
  var {:extern} result.fprintf$27: int;
  var {:extern} result.fscanf$7: int;
  var {:extern} result.fscanf$30: int;
  var {:extern} result.fscanf$10: int;
  var {:extern} result.fscanf$14: int;
  var {:extern} result.fscanf$17: int;
  var {:extern} result.fscanf$24: int;
  var {:extern} status: int;
  var {:extern} $unblock_process.arg.1$13$: int;
  var {:extern} $upgrade_process_prio.arg.2$23$: int;
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
    $atoi.arg.1$6$ := 0;
    call command := __HAVOC_det_malloc(4);
    $fprintf.arg.1$22$ := 0;
    $fprintf.arg.1$29$ := 0;
    $fprintf.arg.1$4$ := 0;
    $fscanf.arg.1$12$ := 0;
    $fscanf.arg.1$16$ := 0;
    $fscanf.arg.1$19$ := 0;
    $fscanf.arg.1$26$ := 0;
    $fscanf.arg.1$32$ := 0;
    $fscanf.arg.1$9$ := 0;
    call prio := __HAVOC_det_malloc(4);
    call ratio := __HAVOC_det_malloc(4);
    result.__iob_func$3 := 0;
    result.__iob_func$8 := 0;
    result.__iob_func$31 := 0;
    result.__iob_func$11 := 0;
    result.__iob_func$15 := 0;
    result.__iob_func$18 := 0;
    result.__iob_func$21 := 0;
    result.__iob_func$25 := 0;
    result.__iob_func$28 := 0;
    result.atoi$5 := 0;
    result.fprintf$2 := 0;
    result.fprintf$20 := 0;
    result.fprintf$27 := 0;
    result.fscanf$7 := 0;
    result.fscanf$30 := 0;
    result.fscanf$10 := 0;
    result.fscanf$14 := 0;
    result.fscanf$17 := 0;
    result.fscanf$24 := 0;
    result.main$1 := 0;
    status := 0;
    $unblock_process.arg.1$13$ := 0;
    $upgrade_process_prio.arg.2$23$ := 0;
    argc := argc.__1;
    argv := argv.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 309} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 310} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 311} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 312} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 314} true;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_LT(argc, 4);
    assume value_is(__ctobpl_const_121, argc);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 320} true;
    call initialize();
    goto label_19;

  label_19:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 321} true;
    Mem_T.INT4 := Mem_T.INT4[prio := 3];
    assume value_is(__ctobpl_const_122, Mem_T.INT4[prio]);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 321} true;
    goto label_20_head;

  label_20_head:
    call $atoi.arg.1$6$, result.atoi$5, tempBoogie0 := main_loop_label_20_head(argv, $atoi.arg.1$6$, prio, result.atoi$5, tempBoogie0);
    goto label_20_head_last;

  label_20_false:
    assume !INT_LEQ(1, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_123, Mem_T.INT4[prio]);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 325} true;
    call result.__iob_func$8 := __iob_func();
    goto label_32;

  label_32:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 325} true;
    assert result.__iob_func$8 != 0;
    $fscanf.arg.1$9$ := PLUS(result.__iob_func$8, 32, 0);
    assume value_is(__ctobpl_const_124, $fscanf.arg.1$9$);
    assume value_is(__ctobpl_const_125, result.__iob_func$8);
    goto label_33;

  label_33:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 325} true;
    call result.fscanf$7 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.INT4[command] := tempBoogie0;
    assume value_is(__ctobpl_const_126, Mem_T.INT4[command]);
    goto label_36;

  label_36:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 325} true;
    status := result.fscanf$7;
    assume value_is(__ctobpl_const_127, status);
    assume value_is(__ctobpl_const_128, result.fscanf$7);
    goto label_37;

  label_37:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 326} true;
    goto label_37_head;

  label_37_head:
    call $fscanf.arg.1$12$, $fscanf.arg.1$16$, $fscanf.arg.1$19$, $fscanf.arg.1$26$, $fscanf.arg.1$32$, result.__iob_func$31, result.__iob_func$11, result.__iob_func$15, result.__iob_func$18, result.__iob_func$25, result.fscanf$30, result.fscanf$10, result.fscanf$14, result.fscanf$17, result.fscanf$24, status, $unblock_process.arg.1$13$, $upgrade_process_prio.arg.2$23$, tempBoogie0 := main_loop_label_37_head(command, $fscanf.arg.1$12$, $fscanf.arg.1$16$, $fscanf.arg.1$19$, $fscanf.arg.1$26$, $fscanf.arg.1$32$, prio, ratio, result.__iob_func$31, result.__iob_func$11, result.__iob_func$15, result.__iob_func$18, result.__iob_func$25, result.fscanf$30, result.fscanf$10, result.fscanf$14, result.fscanf$17, result.fscanf$24, status, $unblock_process.arg.1$13$, $upgrade_process_prio.arg.2$23$, tempBoogie0);
    goto label_37_head_last;

  label_37_false:
    assume !INT_NEQ(status, -1);
    assume value_is(__ctobpl_const_129, status);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 368} true;
    call __HAVOC_free(command);
    call __HAVOC_free(prio);
    call __HAVOC_free(ratio);
    return;

  label_37_true:
    assume INT_NEQ(status, -1);
    assume value_is(__ctobpl_const_129, status);
    goto label_38;

  label_38:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 326} true;
    goto label_38_true, label_38_false;

  label_38_false:
    assume status == 0;
    assume value_is(__ctobpl_const_130, status);
    goto label_1;

  label_38_true:
    assume status != 0;
    assume value_is(__ctobpl_const_130, status);
    goto label_39;

  label_39:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 329} true;
    goto label_39_case_0, label_39_case_1, label_39_case_2, label_39_case_3, label_39_case_4, label_39_case_5, label_39_case_6, label_39_case_7;

  label_39_case_7:
    assume INT_EQ(Mem_T.INT4[command], 7);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_61;

  label_61:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 364} true;
    call finish_all_processes();
    goto label_64;

  label_64:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 365} true;
    goto label_40;

  label_40:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    call result.__iob_func$31 := __iob_func();
    goto label_121;

  label_121:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    assert result.__iob_func$31 != 0;
    $fscanf.arg.1$32$ := PLUS(result.__iob_func$31, 32, 0);
    assume value_is(__ctobpl_const_164, $fscanf.arg.1$32$);
    assume value_is(__ctobpl_const_165, result.__iob_func$31);
    goto label_122;

  label_122:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    call result.fscanf$30 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.INT4[command] := tempBoogie0;
    assume value_is(__ctobpl_const_166, Mem_T.INT4[command]);
    goto label_125;

  label_125:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    status := result.fscanf$30;
    assume value_is(__ctobpl_const_167, status);
    assume value_is(__ctobpl_const_168, result.fscanf$30);
    goto label_125_dummy;

  label_39_case_6:
    assume INT_EQ(Mem_T.INT4[command], 6);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_58;

  label_58:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 332} true;
    call finish_process();
    goto label_65;

  label_65:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 333} true;
    goto label_40;

  label_39_case_5:
    assume INT_EQ(Mem_T.INT4[command], 5);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_55;

  label_55:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 338} true;
    call quantum_expire();
    goto label_66;

  label_66:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 339} true;
    goto label_40;

  label_39_case_4:
    assume INT_EQ(Mem_T.INT4[command], 4);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_52;

  label_52:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 341} true;
    call result.__iob_func$11 := __iob_func();
    goto label_67;

  label_67:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 341} true;
    assert result.__iob_func$11 != 0;
    $fscanf.arg.1$12$ := PLUS(result.__iob_func$11, 32, 0);
    assume value_is(__ctobpl_const_157, $fscanf.arg.1$12$);
    assume value_is(__ctobpl_const_158, result.__iob_func$11);
    goto label_68;

  label_68:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 341} true;
    call result.fscanf$10 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.FLOAT[ratio] := tempBoogie0;
    assume value_is(__ctobpl_const_159, Mem_T.FLOAT[ratio]);
    goto label_71;

  label_71:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 342} true;
    $unblock_process.arg.1$13$ := Mem_T.FLOAT[ratio];
    assume value_is(__ctobpl_const_160, $unblock_process.arg.1$13$);
    assume value_is(__ctobpl_const_161, Mem_T.FLOAT[ratio]);
    goto label_72;

  label_72:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 342} true;
    call unblock_process($unblock_process.arg.1$13$);
    assume value_is(__ctobpl_const_162, $unblock_process.arg.1$13$);
    assume value_is(__ctobpl_const_163, $unblock_process.arg.1$13$);
    goto label_75;

  label_75:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 343} true;
    goto label_40;

  label_39_case_3:
    assume INT_EQ(Mem_T.INT4[command], 3);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_49;

  label_49:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 335} true;
    call block_process();
    goto label_76;

  label_76:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 336} true;
    goto label_40;

  label_39_case_2:
    assume INT_EQ(Mem_T.INT4[command], 2);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_46;

  label_46:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 345} true;
    call result.__iob_func$15 := __iob_func();
    goto label_77;

  label_77:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 345} true;
    assert result.__iob_func$15 != 0;
    $fscanf.arg.1$16$ := PLUS(result.__iob_func$15, 32, 0);
    assume value_is(__ctobpl_const_141, $fscanf.arg.1$16$);
    assume value_is(__ctobpl_const_142, result.__iob_func$15);
    goto label_78;

  label_78:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 345} true;
    call result.fscanf$14 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.INT4[prio] := tempBoogie0;
    assume value_is(__ctobpl_const_143, Mem_T.INT4[prio]);
    goto label_81;

  label_81:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 346} true;
    call result.__iob_func$18 := __iob_func();
    goto label_84;

  label_84:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 346} true;
    assert result.__iob_func$18 != 0;
    $fscanf.arg.1$19$ := PLUS(result.__iob_func$18, 32, 0);
    assume value_is(__ctobpl_const_144, $fscanf.arg.1$19$);
    assume value_is(__ctobpl_const_145, result.__iob_func$18);
    goto label_85;

  label_85:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 346} true;
    call result.fscanf$17 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.FLOAT[ratio] := tempBoogie0;
    assume value_is(__ctobpl_const_146, Mem_T.FLOAT[ratio]);
    goto label_88;

  label_88:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 347} true;
    goto label_88_true, label_88_false;

  label_88_false:
    assume !INT_LT(3, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_147, Mem_T.INT4[prio]);
    goto label_89;

  label_89:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 347} true;
    goto label_89_true, label_89_false;

  label_89_false:
    assume !INT_LEQ(Mem_T.INT4[prio], 0);
    assume value_is(__ctobpl_const_148, Mem_T.INT4[prio]);
    goto label_98;

  label_98:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 352} true;
    $upgrade_process_prio.arg.2$23$ := Mem_T.FLOAT[ratio];
    assume value_is(__ctobpl_const_149, $upgrade_process_prio.arg.2$23$);
    assume value_is(__ctobpl_const_150, Mem_T.FLOAT[ratio]);
    goto label_99;

  label_99:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 352} true;
    call upgrade_process_prio(Mem_T.INT4[prio], $upgrade_process_prio.arg.2$23$);
    assume value_is(__ctobpl_const_151, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_152, $upgrade_process_prio.arg.2$23$);
    assume value_is(__ctobpl_const_153, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_154, $upgrade_process_prio.arg.2$23$);
    goto label_102;

  label_102:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 353} true;
    goto label_40;

  label_89_true:
    assume INT_LEQ(Mem_T.INT4[prio], 0);
    assume value_is(__ctobpl_const_148, Mem_T.INT4[prio]);
    goto label_90;

  label_90:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 348} true;
    call result.__iob_func$21 := __iob_func();
    goto label_93;

  label_93:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 348} true;
    assert result.__iob_func$21 != 0;
    $fprintf.arg.1$22$ := PLUS(result.__iob_func$21, 32, 1);
    assume value_is(__ctobpl_const_155, $fprintf.arg.1$22$);
    assume value_is(__ctobpl_const_156, result.__iob_func$21);
    goto label_94;

  label_94:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 348} true;
    call result.fprintf$20 := det_choice();
    goto label_97;

  label_97:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 349} true;
    goto label_1;

  label_88_true:
    assume INT_LT(3, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_147, Mem_T.INT4[prio]);
    goto label_90;

  label_39_case_1:
    assume INT_EQ(Mem_T.INT4[command], 1);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_43;

  label_43:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 355} true;
    call result.__iob_func$25 := __iob_func();
    goto label_103;

  label_103:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 355} true;
    assert result.__iob_func$25 != 0;
    $fscanf.arg.1$26$ := PLUS(result.__iob_func$25, 32, 0);
    assume value_is(__ctobpl_const_132, $fscanf.arg.1$26$);
    assume value_is(__ctobpl_const_133, result.__iob_func$25);
    goto label_104;

  label_104:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 355} true;
    call result.fscanf$24 := det_choice();
    call tempBoogie0 := det_choice();
    Mem_T.INT4[prio] := tempBoogie0;
    assume value_is(__ctobpl_const_134, Mem_T.INT4[prio]);
    goto label_107;

  label_107:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 356} true;
    goto label_107_true, label_107_false;

  label_107_false:
    assume !INT_LT(3, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_135, Mem_T.INT4[prio]);
    goto label_108;

  label_108:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 356} true;
    goto label_108_true, label_108_false;

  label_108_false:
    assume !INT_LEQ(Mem_T.INT4[prio], 0);
    assume value_is(__ctobpl_const_136, Mem_T.INT4[prio]);
    goto label_117;

  label_117:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 361} true;
    call add_process(Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_137, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_138, Mem_T.INT4[prio]);
    goto label_120;

  label_120:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 362} true;
    goto label_40;

  label_108_true:
    assume INT_LEQ(Mem_T.INT4[prio], 0);
    assume value_is(__ctobpl_const_136, Mem_T.INT4[prio]);
    goto label_109;

  label_109:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 357} true;
    call result.__iob_func$28 := __iob_func();
    goto label_112;

  label_112:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 357} true;
    assert result.__iob_func$28 != 0;
    $fprintf.arg.1$29$ := PLUS(result.__iob_func$28, 32, 1);
    assume value_is(__ctobpl_const_139, $fprintf.arg.1$29$);
    assume value_is(__ctobpl_const_140, result.__iob_func$28);
    goto label_113;

  label_113:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 357} true;
    call result.fprintf$27 := det_choice();
    goto label_116;

  label_116:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 358} true;
    goto label_1;

  label_107_true:
    assume INT_LT(3, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_135, Mem_T.INT4[prio]);
    goto label_109;

  label_39_case_0:
    assume INT_NEQ(Mem_T.INT4[command], 1);
    assume INT_NEQ(Mem_T.INT4[command], 2);
    assume INT_NEQ(Mem_T.INT4[command], 3);
    assume INT_NEQ(Mem_T.INT4[command], 4);
    assume INT_NEQ(Mem_T.INT4[command], 5);
    assume INT_NEQ(Mem_T.INT4[command], 6);
    assume INT_NEQ(Mem_T.INT4[command], 7);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[command]);
    goto label_40;

  label_20_true:
    assume INT_LEQ(1, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_123, Mem_T.INT4[prio]);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 323} true;
    assert argv != 0;
    $atoi.arg.1$6$ := Mem_T.PCHAR[PLUS(argv, 4, Mem_T.INT4[prio])];
    assume value_is(__ctobpl_const_169, $atoi.arg.1$6$);
    assume value_is(__ctobpl_const_170, argv);
    assume value_is(__ctobpl_const_171, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_172, Mem_T.PCHAR[PLUS(argv, 4, Mem_T.INT4[prio])]);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 323} true;
    call result.atoi$5 := atoi($atoi.arg.1$6$);
    assume value_is(__ctobpl_const_173, $atoi.arg.1$6$);
    assume value_is(__ctobpl_const_174, $atoi.arg.1$6$);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 323} true;
    call init_prio_queue(Mem_T.INT4[prio], result.atoi$5);
    assume value_is(__ctobpl_const_175, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_176, result.atoi$5);
    assume value_is(__ctobpl_const_177, Mem_T.INT4[prio]);
    assume value_is(__ctobpl_const_178, result.atoi$5);
    goto label_31;

  label_31:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 321} true;
    assume value_is(__ctobpl_const_179, Mem_T.INT4[prio]);
    tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[prio], 1, 1);
    Mem_T.INT4 := Mem_T.INT4[prio := tempBoogie0];
    goto label_31_dummy;

  label_7_true:
    assume INT_LT(argc, 4);
    assume value_is(__ctobpl_const_121, argc);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 316} true;
    call result.__iob_func$3 := __iob_func();
    goto label_14;

  label_14:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 316} true;
    assert result.__iob_func$3 != 0;
    $fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1);
    assume value_is(__ctobpl_const_180, $fprintf.arg.1$4$);
    assume value_is(__ctobpl_const_181, result.__iob_func$3);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 316} true;
    call result.fprintf$2 := det_choice();
    goto label_18;

  label_18:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 317} true;
    goto label_1;

  label_125_dummy:
    assume false;
    return;

  label_37_head_last:
    goto label_37_true, label_37_false;

  label_31_dummy:
    assume false;
    return;

  label_20_head_last:
    goto label_20_true, label_20_false;
}



procedure {:extern} new_ele(new_num.__1: int) returns (result.new_ele$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} new_ele(new_num.__1: int) returns (result.new_ele$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} ele: int;
  var {:extern} new_num: int;
  var {:extern} result.malloc$2: int;
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
    ele := 0;
    new_num := 0;
    result.malloc$2 := 0;
    result.new_ele$1 := 0;
    new_num := new_num.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 41} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 43} true;
    call result.malloc$2 := __HAVOC_det_malloc(16);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 43} true;
    ele := result.malloc$2;
    assume value_is(__ctobpl_const_182, ele);
    assume value_is(__ctobpl_const_183, result.malloc$2);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 44} true;
    assert ele != 0;
    Mem_T.next__job := Mem_T.next__job[next__job(ele) := 0];
    assume value_is(__ctobpl_const_184, ele);
    assume value_is(__ctobpl_const_185, Mem_T.next__job[next__job(ele)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 45} true;
    assert ele != 0;
    Mem_T.prev__job := Mem_T.prev__job[prev__job(ele) := 0];
    assume value_is(__ctobpl_const_186, ele);
    assume value_is(__ctobpl_const_187, Mem_T.prev__job[prev__job(ele)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 46} true;
    assert ele != 0;
    Mem_T.val__job := Mem_T.val__job[val__job(ele) := new_num];
    assume value_is(__ctobpl_const_188, ele);
    assume value_is(__ctobpl_const_189, Mem_T.val__job[val__job(ele)]);
    assume value_is(__ctobpl_const_190, new_num);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 47} true;
    result.new_ele$1 := ele;
    assume value_is(__ctobpl_const_191, ele);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 48} true;
    return;
}



procedure {:extern} new_list() returns (result.new_list$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} new_list() returns (result.new_list$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} list: int;
  var {:extern} result.malloc$2: int;
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
    list := 0;
    result.malloc$2 := 0;
    result.new_list$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 58} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 60} true;
    call result.malloc$2 := __HAVOC_det_malloc(12);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 60} true;
    list := result.malloc$2;
    assume value_is(__ctobpl_const_192, list);
    assume value_is(__ctobpl_const_193, result.malloc$2);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 62} true;
    assert list != 0;
    Mem_T.first_list := Mem_T.first_list[first_list(list) := 0];
    assume value_is(__ctobpl_const_194, list);
    assume value_is(__ctobpl_const_195, Mem_T.first_list[first_list(list)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 63} true;
    assert list != 0;
    Mem_T.last_list := Mem_T.last_list[last_list(list) := 0];
    assume value_is(__ctobpl_const_196, list);
    assume value_is(__ctobpl_const_197, Mem_T.last_list[last_list(list)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 64} true;
    assert list != 0;
    Mem_T.mem_count_list := Mem_T.mem_count_list[mem_count_list(list) := 0];
    assume value_is(__ctobpl_const_198, list);
    assume value_is(__ctobpl_const_199, Mem_T.mem_count_list[mem_count_list(list)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 65} true;
    result.new_list$1 := list;
    assume value_is(__ctobpl_const_200, list);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 66} true;
    return;
}



procedure {:extern} new_process(prio.__1: int) returns (result.new_process$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} new_process(prio.__1: int) returns (result.new_process$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $new_ele.arg.1$3$: int;
  var {:extern} prio: int;
  var {:extern} proc: int;
  var {:extern} result.new_ele$2: int;
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
    $new_ele.arg.1$3$ := 0;
    prio := 0;
    proc := 0;
    result.new_ele$2 := 0;
    result.new_process$1 := 0;
    prio := prio.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 266} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 267} true;
    $new_ele.arg.1$3$ := alloc_proc_num;
    assume value_is(__ctobpl_const_201, $new_ele.arg.1$3$);
    assume value_is(__ctobpl_const_202, alloc_proc_num);
    alloc_proc_num := PLUS(alloc_proc_num, 1, 1);
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 267} true;
    call result.new_ele$2 := new_ele($new_ele.arg.1$3$);
    assume value_is(__ctobpl_const_203, $new_ele.arg.1$3$);
    assume value_is(__ctobpl_const_204, $new_ele.arg.1$3$);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 267} true;
    proc := result.new_ele$2;
    assume value_is(__ctobpl_const_205, proc);
    assume value_is(__ctobpl_const_206, result.new_ele$2);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 268} true;
    assert proc != 0;
    Mem_T.priority__job := Mem_T.priority__job[priority__job(proc) := prio];
    assume value_is(__ctobpl_const_207, proc);
    assume value_is(__ctobpl_const_208, Mem_T.priority__job[priority__job(proc)]);
    assume value_is(__ctobpl_const_209, prio);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 269} true;
    assume value_is(__ctobpl_const_210, num_processes);
    num_processes := PLUS(num_processes, 1, 1);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 270} true;
    result.new_process$1 := proc;
    assume value_is(__ctobpl_const_211, proc);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 271} true;
    return;
}



procedure {:extern} quantum_expire();
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} quantum_expire()
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $append_ele.arg.1$3$: int;
  var {:extern} prio: int;
  var {:extern} result.append_ele$2: int;
  var {:extern} result.schedule$1: int;
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
    $append_ele.arg.1$3$ := 0;
    prio := 0;
    result.append_ele$2 := 0;
    result.schedule$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 244} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 245} true;
    call result.schedule$1 := schedule();
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 246} true;
    goto label_7_true, label_7_false;

  label_7_false:
    assume cur_proc == 0;
    assume value_is(__ctobpl_const_212, cur_proc);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 251} true;
    return;

  label_7_true:
    assume cur_proc != 0;
    assume value_is(__ctobpl_const_212, cur_proc);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 248} true;
    assert cur_proc != 0;
    prio := Mem_T.priority__job[priority__job(cur_proc)];
    assume value_is(__ctobpl_const_213, prio);
    assume value_is(__ctobpl_const_214, cur_proc);
    assume value_is(__ctobpl_const_215, Mem_T.priority__job[priority__job(cur_proc)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 249} true;
    assert prio_queue != 0;
    $append_ele.arg.1$3$ := Mem_T.Plist[PLUS(prio_queue, 4, prio)];
    assume value_is(__ctobpl_const_216, $append_ele.arg.1$3$);
    assume value_is(__ctobpl_const_217, prio);
    assume value_is(__ctobpl_const_218, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 249} true;
    call result.append_ele$2 := append_ele($append_ele.arg.1$3$, cur_proc);
    assume value_is(__ctobpl_const_219, $append_ele.arg.1$3$);
    assume value_is(__ctobpl_const_220, cur_proc);
    assume value_is(__ctobpl_const_221, $append_ele.arg.1$3$);
    assume value_is(__ctobpl_const_222, cur_proc);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 249} true;
    assert prio_queue != 0;
    Mem_T.Plist := Mem_T.Plist[PLUS(prio_queue, 4, prio) := result.append_ele$2];
    assume value_is(__ctobpl_const_223, prio);
    assume value_is(__ctobpl_const_224, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    assume value_is(__ctobpl_const_225, result.append_ele$2);
    goto label_1;
}



procedure {:extern} schedule() returns (result.schedule$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} schedule() returns (result.schedule$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $del_ele.arg.1$3$: int;
  var {:extern} i: int;
  var {:extern} result.del_ele$2: int;
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
    $del_ele.arg.1$3$ := 0;
    i := 0;
    result.del_ele$2 := 0;
    result.schedule$1 := 0;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 177} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 179} true;
    cur_proc := 0;
    assume value_is(__ctobpl_const_226, cur_proc);
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 180} true;
    i := 3;
    assume value_is(__ctobpl_const_227, i);
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 180} true;
    goto label_6_head;

  label_6_head:
    call i := schedule_loop_label_6_head(i);
    goto label_6_head_last;

  label_6_false:
    assume !INT_LT(0, i);
    assume value_is(__ctobpl_const_228, i);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 189} true;
    return;

  label_6_true:
    assume INT_LT(0, i);
    assume value_is(__ctobpl_const_228, i);
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 182} true;
    assert prio_queue != 0;
    assert Mem_T.Plist[PLUS(prio_queue, 4, i)] != 0;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_LT(0, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, i)])]);
    assume value_is(__ctobpl_const_229, i);
    assume value_is(__ctobpl_const_230, Mem_T.Plist[PLUS(prio_queue, 4, i)]);
    assume value_is(__ctobpl_const_231, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, i)])]);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 180} true;
    assume value_is(__ctobpl_const_232, i);
    i := MINUS_BOTH_PTR_OR_BOTH_INT(i, 1, 1);
    goto label_8_dummy;

  label_7_true:
    assume INT_LT(0, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, i)])]);
    assume value_is(__ctobpl_const_229, i);
    assume value_is(__ctobpl_const_230, Mem_T.Plist[PLUS(prio_queue, 4, i)]);
    assume value_is(__ctobpl_const_231, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, i)])]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 184} true;
    assert prio_queue != 0;
    assert Mem_T.Plist[PLUS(prio_queue, 4, i)] != 0;
    cur_proc := Mem_T.first_list[first_list(Mem_T.Plist[PLUS(prio_queue, 4, i)])];
    assume value_is(__ctobpl_const_233, cur_proc);
    assume value_is(__ctobpl_const_234, i);
    assume value_is(__ctobpl_const_235, Mem_T.Plist[PLUS(prio_queue, 4, i)]);
    assume value_is(__ctobpl_const_236, Mem_T.first_list[first_list(Mem_T.Plist[PLUS(prio_queue, 4, i)])]);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 185} true;
    assert prio_queue != 0;
    $del_ele.arg.1$3$ := Mem_T.Plist[PLUS(prio_queue, 4, i)];
    assume value_is(__ctobpl_const_237, $del_ele.arg.1$3$);
    assume value_is(__ctobpl_const_238, i);
    assume value_is(__ctobpl_const_239, Mem_T.Plist[PLUS(prio_queue, 4, i)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 185} true;
    call result.del_ele$2 := del_ele($del_ele.arg.1$3$, cur_proc);
    assume value_is(__ctobpl_const_240, $del_ele.arg.1$3$);
    assume value_is(__ctobpl_const_241, cur_proc);
    assume value_is(__ctobpl_const_242, $del_ele.arg.1$3$);
    assume value_is(__ctobpl_const_243, cur_proc);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 185} true;
    assert prio_queue != 0;
    Mem_T.Plist := Mem_T.Plist[PLUS(prio_queue, 4, i) := result.del_ele$2];
    assume value_is(__ctobpl_const_244, i);
    assume value_is(__ctobpl_const_245, Mem_T.Plist[PLUS(prio_queue, 4, i)]);
    assume value_is(__ctobpl_const_246, result.del_ele$2);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 186} true;
    goto label_1;

  label_8_dummy:
    assume false;
    return;

  label_6_head_last:
    goto label_6_true, label_6_false;
}



procedure {:extern} unblock_process(ratio.__1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} unblock_process(ratio.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $append_ele.arg.1$4$: int;
  var {:extern} count: int;
  var {:extern} n: int;
  var {:extern} prio: int;
  var {:extern} proc: int;
  var {:extern} ratio: int;
  var {:extern} result.append_ele$3: int;
  var {:extern} result.del_ele$2: int;
  var {:extern} result.find_nth$1: int;
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
    $append_ele.arg.1$4$ := 0;
    count := 0;
    n := 0;
    prio := 0;
    proc := 0;
    ratio := 0;
    result.append_ele$3 := 0;
    result.del_ele$2 := 0;
    result.find_nth$1 := 0;
    ratio := ratio.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 224} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 225} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 226} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 227} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 228} true;
    goto label_7_true, label_7_false;

  label_7_false:
    assume block_queue == 0;
    assume value_is(__ctobpl_const_247, block_queue);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 240} true;
    return;

  label_7_true:
    assume block_queue != 0;
    assume value_is(__ctobpl_const_247, block_queue);
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 230} true;
    assert block_queue != 0;
    count := PLUS(Mem_T.mem_count_list[mem_count_list(block_queue)], 1, 1);
    assume value_is(__ctobpl_const_248, count);
    assume value_is(__ctobpl_const_249, block_queue);
    assume value_is(__ctobpl_const_250, Mem_T.mem_count_list[mem_count_list(block_queue)]);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 231} true;
    n := MULT(count, ratio);
    assume value_is(__ctobpl_const_251, n);
    assume value_is(__ctobpl_const_252, count);
    assume value_is(__ctobpl_const_253, ratio);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 232} true;
    call result.find_nth$1 := find_nth(block_queue, n);
    assume value_is(__ctobpl_const_254, block_queue);
    assume value_is(__ctobpl_const_255, n);
    assume value_is(__ctobpl_const_256, block_queue);
    assume value_is(__ctobpl_const_257, n);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 232} true;
    proc := result.find_nth$1;
    assume value_is(__ctobpl_const_258, proc);
    assume value_is(__ctobpl_const_259, result.find_nth$1);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 233} true;
    goto label_14_true, label_14_false;

  label_14_false:
    assume proc == 0;
    assume value_is(__ctobpl_const_260, proc);
    goto label_1;

  label_14_true:
    assume proc != 0;
    assume value_is(__ctobpl_const_260, proc);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 234} true;
    call result.del_ele$2 := del_ele(block_queue, proc);
    assume value_is(__ctobpl_const_261, block_queue);
    assume value_is(__ctobpl_const_262, proc);
    assume value_is(__ctobpl_const_263, block_queue);
    assume value_is(__ctobpl_const_264, proc);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 234} true;
    block_queue := result.del_ele$2;
    assume value_is(__ctobpl_const_265, block_queue);
    assume value_is(__ctobpl_const_266, result.del_ele$2);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 236} true;
    assert proc != 0;
    prio := Mem_T.priority__job[priority__job(proc)];
    assume value_is(__ctobpl_const_267, prio);
    assume value_is(__ctobpl_const_268, proc);
    assume value_is(__ctobpl_const_269, Mem_T.priority__job[priority__job(proc)]);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 237} true;
    assert prio_queue != 0;
    $append_ele.arg.1$4$ := Mem_T.Plist[PLUS(prio_queue, 4, prio)];
    assume value_is(__ctobpl_const_270, $append_ele.arg.1$4$);
    assume value_is(__ctobpl_const_271, prio);
    assume value_is(__ctobpl_const_272, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    goto label_21;

  label_21:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 237} true;
    call result.append_ele$3 := append_ele($append_ele.arg.1$4$, proc);
    assume value_is(__ctobpl_const_273, $append_ele.arg.1$4$);
    assume value_is(__ctobpl_const_274, proc);
    assume value_is(__ctobpl_const_275, $append_ele.arg.1$4$);
    assume value_is(__ctobpl_const_276, proc);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 237} true;
    assert prio_queue != 0;
    Mem_T.Plist := Mem_T.Plist[PLUS(prio_queue, 4, prio) := result.append_ele$3];
    assume value_is(__ctobpl_const_277, prio);
    assume value_is(__ctobpl_const_278, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    assume value_is(__ctobpl_const_279, result.append_ele$3);
    goto label_1;
}



procedure {:extern} upgrade_process_prio(prio.__1: int, ratio.__1: int);
  free requires INT_LT(0, alloc);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;
  free ensures INT_LEQ(old(alloc), alloc);



implementation {:extern} upgrade_process_prio(prio.__1: int, ratio.__1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} count: int;
  var {:extern} dest_queue: int;
  var {:extern} n: int;
  var {:extern} prio: int;
  var {:extern} proc: int;
  var {:extern} ratio: int;
  var {:extern} result.append_ele$3: int;
  var {:extern} result.del_ele$2: int;
  var {:extern} result.find_nth$1: int;
  var {:extern} src_queue: int;
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
    count := 0;
    dest_queue := 0;
    n := 0;
    prio := 0;
    proc := 0;
    ratio := 0;
    result.append_ele$3 := 0;
    result.del_ele$2 := 0;
    result.find_nth$1 := 0;
    src_queue := 0;
    prio := prio.__1;
    ratio := ratio.__1;
    goto label_3;

  label_3:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 196} true;
    goto label_4;

  label_4:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 197} true;
    goto label_5;

  label_5:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 198} true;
    goto label_6;

  label_6:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 199} true;
    goto label_7;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 199} true;
    goto label_8;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 201} true;
    goto label_8_true, label_8_false;

  label_8_false:
    assume !INT_LEQ(3, prio);
    assume value_is(__ctobpl_const_280, prio);
    goto label_9;

  label_9:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 203} true;
    assert prio_queue != 0;
    src_queue := Mem_T.Plist[PLUS(prio_queue, 4, prio)];
    assume value_is(__ctobpl_const_281, src_queue);
    assume value_is(__ctobpl_const_282, prio);
    assume value_is(__ctobpl_const_283, Mem_T.Plist[PLUS(prio_queue, 4, prio)]);
    goto label_11;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 204} true;
    assert prio_queue != 0;
    dest_queue := Mem_T.Plist[PLUS(prio_queue, 4, PLUS(prio, 1, 1))];
    assume value_is(__ctobpl_const_284, dest_queue);
    assume value_is(__ctobpl_const_285, prio);
    assume value_is(__ctobpl_const_286, Mem_T.Plist[PLUS(prio_queue, 4, PLUS(prio, 1, 1))]);
    goto label_12;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 205} true;
    assert src_queue != 0;
    count := Mem_T.mem_count_list[mem_count_list(src_queue)];
    assume value_is(__ctobpl_const_287, count);
    assume value_is(__ctobpl_const_288, src_queue);
    assume value_is(__ctobpl_const_289, Mem_T.mem_count_list[mem_count_list(src_queue)]);
    goto label_13;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 207} true;
    goto label_13_true, label_13_false;

  label_13_false:
    assume !INT_LT(0, count);
    assume value_is(__ctobpl_const_290, count);
    goto label_1;

  label_1:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 218} true;
    return;

  label_13_true:
    assume INT_LT(0, count);
    assume value_is(__ctobpl_const_290, count);
    goto label_14;

  label_14:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 209} true;
    n := PLUS(MULT(count, ratio), 1, 1);
    assume value_is(__ctobpl_const_291, n);
    assume value_is(__ctobpl_const_292, count);
    assume value_is(__ctobpl_const_293, ratio);
    goto label_15;

  label_15:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 210} true;
    call result.find_nth$1 := find_nth(src_queue, n);
    assume value_is(__ctobpl_const_294, src_queue);
    assume value_is(__ctobpl_const_295, n);
    assume value_is(__ctobpl_const_296, src_queue);
    assume value_is(__ctobpl_const_297, n);
    goto label_18;

  label_18:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 210} true;
    proc := result.find_nth$1;
    assume value_is(__ctobpl_const_298, proc);
    assume value_is(__ctobpl_const_299, result.find_nth$1);
    goto label_19;

  label_19:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 211} true;
    goto label_19_true, label_19_false;

  label_19_false:
    assume proc == 0;
    assume value_is(__ctobpl_const_300, proc);
    goto label_1;

  label_19_true:
    assume proc != 0;
    assume value_is(__ctobpl_const_300, proc);
    goto label_20;

  label_20:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 212} true;
    call result.del_ele$2 := del_ele(src_queue, proc);
    assume value_is(__ctobpl_const_301, src_queue);
    assume value_is(__ctobpl_const_302, proc);
    assume value_is(__ctobpl_const_303, src_queue);
    assume value_is(__ctobpl_const_304, proc);
    goto label_23;

  label_23:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 212} true;
    src_queue := result.del_ele$2;
    assume value_is(__ctobpl_const_305, src_queue);
    assume value_is(__ctobpl_const_306, result.del_ele$2);
    goto label_24;

  label_24:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 214} true;
    assert proc != 0;
    Mem_T.priority__job := Mem_T.priority__job[priority__job(proc) := prio];
    assume value_is(__ctobpl_const_307, proc);
    assume value_is(__ctobpl_const_308, Mem_T.priority__job[priority__job(proc)]);
    assume value_is(__ctobpl_const_309, prio);
    goto label_25;

  label_25:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 215} true;
    call result.append_ele$3 := append_ele(dest_queue, proc);
    assume value_is(__ctobpl_const_310, dest_queue);
    assume value_is(__ctobpl_const_311, proc);
    assume value_is(__ctobpl_const_312, dest_queue);
    assume value_is(__ctobpl_const_313, proc);
    goto label_28;

  label_28:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 215} true;
    dest_queue := result.append_ele$3;
    assume value_is(__ctobpl_const_314, dest_queue);
    assume value_is(__ctobpl_const_315, result.append_ele$3);
    goto label_1;

  label_8_true:
    assume INT_LEQ(3, prio);
    assume value_is(__ctobpl_const_280, prio);
    goto label_10;

  label_10:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 202} true;
    goto label_1;
}



implementation find_nth_loop_label_9_head(in_f_ele: int, in_i: int, in_n: int) returns (out_f_ele: int, out_i: int)
{

  entry:
    out_f_ele, out_i := in_f_ele, in_i;
    goto label_9_head;

  label_9_head:
    goto label_9_true, label_9_false;

  label_9_false:
    assume out_f_ele == 0;
    assume value_is(__ctobpl_const_78, out_f_ele);
    out_f_ele, out_i := in_f_ele, in_i;
    return;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 105} true;
    assume value_is(__ctobpl_const_85, out_i);
    out_i := PLUS(out_i, 1, 1);
    goto label_13_dummy;

  label_12:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 106} true;
    assert out_f_ele != 0;
    out_f_ele := Mem_T.next__job[next__job(out_f_ele)];
    assume value_is(__ctobpl_const_82, out_f_ele);
    assume value_is(__ctobpl_const_83, out_f_ele);
    assume value_is(__ctobpl_const_84, Mem_T.next__job[next__job(out_f_ele)]);
    goto label_13;

  label_11_true:
    assume INT_LT(out_i, in_n);
    assume value_is(__ctobpl_const_79, out_i);
    assume value_is(__ctobpl_const_80, in_n);
    goto label_12;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 105} true;
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_LT(out_i, in_n);
    assume value_is(__ctobpl_const_79, out_i);
    assume value_is(__ctobpl_const_80, in_n);
    out_f_ele, out_i := in_f_ele, in_i;
    return;

  label_9_true:
    assume out_f_ele != 0;
    assume value_is(__ctobpl_const_78, out_f_ele);
    goto label_11;

  label_13_dummy:
    call {:si_unique_call 1} out_f_ele, out_i := find_nth_loop_label_9_head(out_f_ele, out_i, in_n);
    return;

  exit:
    return;
}



procedure find_nth_loop_label_9_head(in_f_ele: int, in_i: int, in_n: int) returns (out_f_ele: int, out_i: int);



implementation finish_all_processes_loop_label_7_head(in_i: int, in_total: int) returns (out_i: int)
{

  entry:
    out_i := in_i;
    goto label_7_head;

  label_7_head:
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_LT(out_i, in_total);
    assume value_is(__ctobpl_const_89, out_i);
    assume value_is(__ctobpl_const_90, in_total);
    out_i := in_i;
    alloc_proc_num, block_queue, cur_proc, num_processes := old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes);
    return;

  label_11:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 171} true;
    assume value_is(__ctobpl_const_91, out_i);
    out_i := PLUS(out_i, 1, 1);
    goto label_11_dummy;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 172} true;
    call finish_process();
    goto label_11;

  label_7_true:
    assume INT_LT(out_i, in_total);
    assume value_is(__ctobpl_const_89, out_i);
    assume value_is(__ctobpl_const_90, in_total);
    goto label_8;

  label_11_dummy:
    call {:si_unique_call 1} out_i := finish_all_processes_loop_label_7_head(out_i, in_total);
    return;

  exit:
    return;
}



procedure finish_all_processes_loop_label_7_head(in_i: int, in_total: int) returns (out_i: int);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;



implementation init_prio_queue_loop_label_11_head(in_i: int, in_num_proc: int, in_prio: int, in_proc: int, in_queue: int, in_result.append_ele$3: int, in_result.new_process$2: int) returns (out_i: int, out_proc: int, out_queue: int, out_result.append_ele$3: int, out_result.new_process$2: int)
{

  entry:
    out_i, out_proc, out_queue, out_result.append_ele$3, out_result.new_process$2 := in_i, in_proc, in_queue, in_result.append_ele$3, in_result.new_process$2;
    goto label_11_head;

  label_11_head:
    goto label_11_true, label_11_false;

  label_11_false:
    assume !INT_LT(out_i, in_num_proc);
    assume value_is(__ctobpl_const_103, out_i);
    assume value_is(__ctobpl_const_104, in_num_proc);
    out_i, out_proc, out_queue, out_result.append_ele$3, out_result.new_process$2 := in_i, in_proc, in_queue, in_result.append_ele$3, in_result.new_process$2;
    alloc_proc_num, block_queue, cur_proc, num_processes := old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes);
    return;

  label_21:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 290} true;
    assume value_is(__ctobpl_const_118, out_i);
    out_i := PLUS(out_i, 1, 1);
    goto label_21_dummy;

  label_20:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 293} true;
    out_queue := out_result.append_ele$3;
    assume value_is(__ctobpl_const_116, out_queue);
    assume value_is(__ctobpl_const_117, out_result.append_ele$3);
    goto label_21;

  label_17:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 293} true;
    call out_result.append_ele$3 := append_ele(out_queue, out_proc);
    assume value_is(__ctobpl_const_112, out_queue);
    assume value_is(__ctobpl_const_113, out_proc);
    assume value_is(__ctobpl_const_114, out_queue);
    assume value_is(__ctobpl_const_115, out_proc);
    goto label_20;

  label_16:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 292} true;
    out_proc := out_result.new_process$2;
    assume value_is(__ctobpl_const_110, out_proc);
    assume value_is(__ctobpl_const_111, out_result.new_process$2);
    goto label_17;

  label_13:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 292} true;
    call out_result.new_process$2 := new_process(in_prio);
    assume value_is(__ctobpl_const_108, in_prio);
    assume value_is(__ctobpl_const_109, in_prio);
    goto label_16;

  label_11_true:
    assume INT_LT(out_i, in_num_proc);
    assume value_is(__ctobpl_const_103, out_i);
    assume value_is(__ctobpl_const_104, in_num_proc);
    goto label_13;

  label_21_dummy:
    call {:si_unique_call 1} out_i, out_proc, out_queue, out_result.append_ele$3, out_result.new_process$2 := init_prio_queue_loop_label_11_head(out_i, in_num_proc, in_prio, out_proc, out_queue, out_result.append_ele$3, out_result.new_process$2);
    return;

  exit:
    return;
}



procedure init_prio_queue_loop_label_11_head(in_i: int, in_num_proc: int, in_prio: int, in_proc: int, in_queue: int, in_result.append_ele$3: int, in_result.new_process$2: int) returns (out_i: int, out_proc: int, out_queue: int, out_result.append_ele$3: int, out_result.new_process$2: int);
  modifies alloc_proc_num, block_queue, cur_proc, num_processes;



implementation main_loop_label_37_head(in_command: int, in_$fscanf.arg.1$12$: int, in_$fscanf.arg.1$16$: int, in_$fscanf.arg.1$19$: int, in_$fscanf.arg.1$26$: int, in_$fscanf.arg.1$32$: int, in_prio: int, in_ratio: int, in_result.__iob_func$31: int, in_result.__iob_func$11: int, in_result.__iob_func$15: int, in_result.__iob_func$18: int, in_result.__iob_func$25: int, in_result.fscanf$30: int, in_result.fscanf$10: int, in_result.fscanf$14: int, in_result.fscanf$17: int, in_result.fscanf$24: int, in_status: int, in_$unblock_process.arg.1$13$: int, in_$upgrade_process_prio.arg.2$23$: int, in_tempBoogie0: int) returns (out_$fscanf.arg.1$12$: int, out_$fscanf.arg.1$16$: int, out_$fscanf.arg.1$19$: int, out_$fscanf.arg.1$26$: int, out_$fscanf.arg.1$32$: int, out_result.__iob_func$31: int, out_result.__iob_func$11: int, out_result.__iob_func$15: int, out_result.__iob_func$18: int, out_result.__iob_func$25: int, out_result.fscanf$30: int, out_result.fscanf$10: int, out_result.fscanf$14: int, out_result.fscanf$17: int, out_result.fscanf$24: int, out_status: int, out_$unblock_process.arg.1$13$: int, out_$upgrade_process_prio.arg.2$23$: int, out_tempBoogie0: int)
{

  entry:
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    goto label_37_head;

  label_37_head:
    goto label_37_true, label_37_false;

  label_37_false:
    assume !INT_NEQ(out_status, -1);
    assume value_is(__ctobpl_const_129, out_status);
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT := old(detChoiceCnt), old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes), old(Mem_T.FLOAT);
    return;

  label_125:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    out_status := out_result.fscanf$30;
    assume value_is(__ctobpl_const_167, out_status);
    assume value_is(__ctobpl_const_168, out_result.fscanf$30);
    goto label_125_dummy;

  label_122:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    call out_result.fscanf$30 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[in_command] := out_tempBoogie0;
    assume value_is(__ctobpl_const_166, Mem_T.INT4[in_command]);
    goto label_125;

  label_121:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    assert out_result.__iob_func$31 != 0;
    out_$fscanf.arg.1$32$ := PLUS(out_result.__iob_func$31, 32, 0);
    assume value_is(__ctobpl_const_164, out_$fscanf.arg.1$32$);
    assume value_is(__ctobpl_const_165, out_result.__iob_func$31);
    goto label_122;

  label_40:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 327} true;
    call out_result.__iob_func$31 := __iob_func();
    goto label_121;

  label_64:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 365} true;
    goto label_40;

  label_65:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 333} true;
    goto label_40;

  label_66:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 339} true;
    goto label_40;

  label_75:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 343} true;
    goto label_40;

  label_76:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 336} true;
    goto label_40;

  label_102:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 353} true;
    goto label_40;

  label_120:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 362} true;
    goto label_40;

  label_39_case_0:
    assume INT_NEQ(Mem_T.INT4[in_command], 1);
    assume INT_NEQ(Mem_T.INT4[in_command], 2);
    assume INT_NEQ(Mem_T.INT4[in_command], 3);
    assume INT_NEQ(Mem_T.INT4[in_command], 4);
    assume INT_NEQ(Mem_T.INT4[in_command], 5);
    assume INT_NEQ(Mem_T.INT4[in_command], 6);
    assume INT_NEQ(Mem_T.INT4[in_command], 7);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_40;

  label_39:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 329} true;
    goto label_39_case_0, label_39_case_1, label_39_case_2, label_39_case_3, label_39_case_4, label_39_case_5, label_39_case_6, label_39_case_7;

  label_38_true:
    assume out_status != 0;
    assume value_is(__ctobpl_const_130, out_status);
    goto label_39;

  label_38:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 326} true;
    goto label_38_true, label_38_false;

  label_38_false:
    assume out_status == 0;
    assume value_is(__ctobpl_const_130, out_status);
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT := old(detChoiceCnt), old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes), old(Mem_T.FLOAT);
    return;

  label_37_true:
    assume INT_NEQ(out_status, -1);
    assume value_is(__ctobpl_const_129, out_status);
    goto label_38;

  label_117:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 361} true;
    call add_process(Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_137, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_138, Mem_T.INT4[in_prio]);
    goto label_120;

  label_108_false:
    assume !INT_LEQ(Mem_T.INT4[in_prio], 0);
    assume value_is(__ctobpl_const_136, Mem_T.INT4[in_prio]);
    goto label_117;

  label_108:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 356} true;
    goto label_108_true, label_108_false;

  label_108_true:
    assume INT_LEQ(Mem_T.INT4[in_prio], 0);
    assume value_is(__ctobpl_const_136, Mem_T.INT4[in_prio]);
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT := old(detChoiceCnt), old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes), old(Mem_T.FLOAT);
    return;

  label_107_false:
    assume !INT_LT(3, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_135, Mem_T.INT4[in_prio]);
    goto label_108;

  label_107:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 356} true;
    goto label_107_true, label_107_false;

  label_107_true:
    assume INT_LT(3, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_135, Mem_T.INT4[in_prio]);
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT := old(detChoiceCnt), old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes), old(Mem_T.FLOAT);
    return;

  label_104:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 355} true;
    call out_result.fscanf$24 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[in_prio] := out_tempBoogie0;
    assume value_is(__ctobpl_const_134, Mem_T.INT4[in_prio]);
    goto label_107;

  label_103:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 355} true;
    assert out_result.__iob_func$25 != 0;
    out_$fscanf.arg.1$26$ := PLUS(out_result.__iob_func$25, 32, 0);
    assume value_is(__ctobpl_const_132, out_$fscanf.arg.1$26$);
    assume value_is(__ctobpl_const_133, out_result.__iob_func$25);
    goto label_104;

  label_43:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 355} true;
    call out_result.__iob_func$25 := __iob_func();
    goto label_103;

  label_39_case_1:
    assume INT_EQ(Mem_T.INT4[in_command], 1);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_43;

  label_99:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 352} true;
    call upgrade_process_prio(Mem_T.INT4[in_prio], out_$upgrade_process_prio.arg.2$23$);
    assume value_is(__ctobpl_const_151, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_152, out_$upgrade_process_prio.arg.2$23$);
    assume value_is(__ctobpl_const_153, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_154, out_$upgrade_process_prio.arg.2$23$);
    goto label_102;

  label_98:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 352} true;
    out_$upgrade_process_prio.arg.2$23$ := Mem_T.FLOAT[in_ratio];
    assume value_is(__ctobpl_const_149, out_$upgrade_process_prio.arg.2$23$);
    assume value_is(__ctobpl_const_150, Mem_T.FLOAT[in_ratio]);
    goto label_99;

  label_89_false:
    assume !INT_LEQ(Mem_T.INT4[in_prio], 0);
    assume value_is(__ctobpl_const_148, Mem_T.INT4[in_prio]);
    goto label_98;

  label_89:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 347} true;
    goto label_89_true, label_89_false;

  label_89_true:
    assume INT_LEQ(Mem_T.INT4[in_prio], 0);
    assume value_is(__ctobpl_const_148, Mem_T.INT4[in_prio]);
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT := old(detChoiceCnt), old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes), old(Mem_T.FLOAT);
    return;

  label_88_false:
    assume !INT_LT(3, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_147, Mem_T.INT4[in_prio]);
    goto label_89;

  label_88:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 347} true;
    goto label_88_true, label_88_false;

  label_88_true:
    assume INT_LT(3, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_147, Mem_T.INT4[in_prio]);
    out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := in_$fscanf.arg.1$12$, in_$fscanf.arg.1$16$, in_$fscanf.arg.1$19$, in_$fscanf.arg.1$26$, in_$fscanf.arg.1$32$, in_result.__iob_func$31, in_result.__iob_func$11, in_result.__iob_func$15, in_result.__iob_func$18, in_result.__iob_func$25, in_result.fscanf$30, in_result.fscanf$10, in_result.fscanf$14, in_result.fscanf$17, in_result.fscanf$24, in_status, in_$unblock_process.arg.1$13$, in_$upgrade_process_prio.arg.2$23$, in_tempBoogie0;
    detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT := old(detChoiceCnt), old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes), old(Mem_T.FLOAT);
    return;

  label_85:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 346} true;
    call out_result.fscanf$17 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.FLOAT[in_ratio] := out_tempBoogie0;
    assume value_is(__ctobpl_const_146, Mem_T.FLOAT[in_ratio]);
    goto label_88;

  label_84:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 346} true;
    assert out_result.__iob_func$18 != 0;
    out_$fscanf.arg.1$19$ := PLUS(out_result.__iob_func$18, 32, 0);
    assume value_is(__ctobpl_const_144, out_$fscanf.arg.1$19$);
    assume value_is(__ctobpl_const_145, out_result.__iob_func$18);
    goto label_85;

  label_81:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 346} true;
    call out_result.__iob_func$18 := __iob_func();
    goto label_84;

  label_78:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 345} true;
    call out_result.fscanf$14 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.INT4[in_prio] := out_tempBoogie0;
    assume value_is(__ctobpl_const_143, Mem_T.INT4[in_prio]);
    goto label_81;

  label_77:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 345} true;
    assert out_result.__iob_func$15 != 0;
    out_$fscanf.arg.1$16$ := PLUS(out_result.__iob_func$15, 32, 0);
    assume value_is(__ctobpl_const_141, out_$fscanf.arg.1$16$);
    assume value_is(__ctobpl_const_142, out_result.__iob_func$15);
    goto label_78;

  label_46:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 345} true;
    call out_result.__iob_func$15 := __iob_func();
    goto label_77;

  label_39_case_2:
    assume INT_EQ(Mem_T.INT4[in_command], 2);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_46;

  label_49:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 335} true;
    call block_process();
    goto label_76;

  label_39_case_3:
    assume INT_EQ(Mem_T.INT4[in_command], 3);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_49;

  label_72:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 342} true;
    call unblock_process(out_$unblock_process.arg.1$13$);
    assume value_is(__ctobpl_const_162, out_$unblock_process.arg.1$13$);
    assume value_is(__ctobpl_const_163, out_$unblock_process.arg.1$13$);
    goto label_75;

  label_71:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 342} true;
    out_$unblock_process.arg.1$13$ := Mem_T.FLOAT[in_ratio];
    assume value_is(__ctobpl_const_160, out_$unblock_process.arg.1$13$);
    assume value_is(__ctobpl_const_161, Mem_T.FLOAT[in_ratio]);
    goto label_72;

  label_68:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 341} true;
    call out_result.fscanf$10 := det_choice();
    call out_tempBoogie0 := det_choice();
    Mem_T.FLOAT[in_ratio] := out_tempBoogie0;
    assume value_is(__ctobpl_const_159, Mem_T.FLOAT[in_ratio]);
    goto label_71;

  label_67:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 341} true;
    assert out_result.__iob_func$11 != 0;
    out_$fscanf.arg.1$12$ := PLUS(out_result.__iob_func$11, 32, 0);
    assume value_is(__ctobpl_const_157, out_$fscanf.arg.1$12$);
    assume value_is(__ctobpl_const_158, out_result.__iob_func$11);
    goto label_68;

  label_52:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 341} true;
    call out_result.__iob_func$11 := __iob_func();
    goto label_67;

  label_39_case_4:
    assume INT_EQ(Mem_T.INT4[in_command], 4);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_52;

  label_55:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 338} true;
    call quantum_expire();
    goto label_66;

  label_39_case_5:
    assume INT_EQ(Mem_T.INT4[in_command], 5);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_55;

  label_58:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 332} true;
    call finish_process();
    goto label_65;

  label_39_case_6:
    assume INT_EQ(Mem_T.INT4[in_command], 6);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_58;

  label_61:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 364} true;
    call finish_all_processes();
    goto label_64;

  label_39_case_7:
    assume INT_EQ(Mem_T.INT4[in_command], 7);
    assume value_is(__ctobpl_const_131, Mem_T.INT4[in_command]);
    goto label_61;

  label_125_dummy:
    call {:si_unique_call 1} out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0 := main_loop_label_37_head(in_command, out_$fscanf.arg.1$12$, out_$fscanf.arg.1$16$, out_$fscanf.arg.1$19$, out_$fscanf.arg.1$26$, out_$fscanf.arg.1$32$, in_prio, in_ratio, out_result.__iob_func$31, out_result.__iob_func$11, out_result.__iob_func$15, out_result.__iob_func$18, out_result.__iob_func$25, out_result.fscanf$30, out_result.fscanf$10, out_result.fscanf$14, out_result.fscanf$17, out_result.fscanf$24, out_status, out_$unblock_process.arg.1$13$, out_$upgrade_process_prio.arg.2$23$, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure main_loop_label_37_head(in_command: int, in_$fscanf.arg.1$12$: int, in_$fscanf.arg.1$16$: int, in_$fscanf.arg.1$19$: int, in_$fscanf.arg.1$26$: int, in_$fscanf.arg.1$32$: int, in_prio: int, in_ratio: int, in_result.__iob_func$31: int, in_result.__iob_func$11: int, in_result.__iob_func$15: int, in_result.__iob_func$18: int, in_result.__iob_func$25: int, in_result.fscanf$30: int, in_result.fscanf$10: int, in_result.fscanf$14: int, in_result.fscanf$17: int, in_result.fscanf$24: int, in_status: int, in_$unblock_process.arg.1$13$: int, in_$upgrade_process_prio.arg.2$23$: int, in_tempBoogie0: int) returns (out_$fscanf.arg.1$12$: int, out_$fscanf.arg.1$16$: int, out_$fscanf.arg.1$19$: int, out_$fscanf.arg.1$26$: int, out_$fscanf.arg.1$32$: int, out_result.__iob_func$31: int, out_result.__iob_func$11: int, out_result.__iob_func$15: int, out_result.__iob_func$18: int, out_result.__iob_func$25: int, out_result.fscanf$30: int, out_result.fscanf$10: int, out_result.fscanf$14: int, out_result.fscanf$17: int, out_result.fscanf$24: int, out_status: int, out_$unblock_process.arg.1$13$: int, out_$upgrade_process_prio.arg.2$23$: int, out_tempBoogie0: int);
  modifies detChoiceCnt, Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes, Mem_T.FLOAT;



implementation main_loop_label_20_head(in_argv: int, in_$atoi.arg.1$6$: int, in_prio: int, in_result.atoi$5: int, in_tempBoogie0: int) returns (out_$atoi.arg.1$6$: int, out_result.atoi$5: int, out_tempBoogie0: int)
{

  entry:
    out_$atoi.arg.1$6$, out_result.atoi$5, out_tempBoogie0 := in_$atoi.arg.1$6$, in_result.atoi$5, in_tempBoogie0;
    goto label_20_head;

  label_20_head:
    goto label_20_true, label_20_false;

  label_20_false:
    assume !INT_LEQ(1, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_123, Mem_T.INT4[in_prio]);
    out_$atoi.arg.1$6$, out_result.atoi$5, out_tempBoogie0 := in_$atoi.arg.1$6$, in_result.atoi$5, in_tempBoogie0;
    Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes := old(Mem_T.INT4), old(alloc_proc_num), old(block_queue), old(cur_proc), old(num_processes);
    return;

  label_31:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 321} true;
    assume value_is(__ctobpl_const_179, Mem_T.INT4[in_prio]);
    out_tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT(Mem_T.INT4[in_prio], 1, 1);
    Mem_T.INT4 := Mem_T.INT4[in_prio := out_tempBoogie0];
    goto label_31_dummy;

  label_28:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 323} true;
    call init_prio_queue(Mem_T.INT4[in_prio], out_result.atoi$5);
    assume value_is(__ctobpl_const_175, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_176, out_result.atoi$5);
    assume value_is(__ctobpl_const_177, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_178, out_result.atoi$5);
    goto label_31;

  label_25:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 323} true;
    call out_result.atoi$5 := atoi(out_$atoi.arg.1$6$);
    assume value_is(__ctobpl_const_173, out_$atoi.arg.1$6$);
    assume value_is(__ctobpl_const_174, out_$atoi.arg.1$6$);
    goto label_28;

  label_24:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 323} true;
    assert in_argv != 0;
    out_$atoi.arg.1$6$ := Mem_T.PCHAR[PLUS(in_argv, 4, Mem_T.INT4[in_prio])];
    assume value_is(__ctobpl_const_169, out_$atoi.arg.1$6$);
    assume value_is(__ctobpl_const_170, in_argv);
    assume value_is(__ctobpl_const_171, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_172, Mem_T.PCHAR[PLUS(in_argv, 4, Mem_T.INT4[in_prio])]);
    goto label_25;

  label_20_true:
    assume INT_LEQ(1, Mem_T.INT4[in_prio]);
    assume value_is(__ctobpl_const_123, Mem_T.INT4[in_prio]);
    goto label_24;

  label_31_dummy:
    call {:si_unique_call 1} out_$atoi.arg.1$6$, out_result.atoi$5, out_tempBoogie0 := main_loop_label_20_head(in_argv, out_$atoi.arg.1$6$, in_prio, out_result.atoi$5, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure main_loop_label_20_head(in_argv: int, in_$atoi.arg.1$6$: int, in_prio: int, in_result.atoi$5: int, in_tempBoogie0: int) returns (out_$atoi.arg.1$6$: int, out_result.atoi$5: int, out_tempBoogie0: int);
  modifies Mem_T.INT4, alloc_proc_num, block_queue, cur_proc, num_processes;



implementation schedule_loop_label_6_head(in_i: int) returns (out_i: int)
{

  entry:
    out_i := in_i;
    goto label_6_head;

  label_6_head:
    goto label_6_true, label_6_false;

  label_6_false:
    assume !INT_LT(0, out_i);
    assume value_is(__ctobpl_const_228, out_i);
    out_i := in_i;
    return;

  label_8:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 180} true;
    assume value_is(__ctobpl_const_232, out_i);
    out_i := MINUS_BOTH_PTR_OR_BOTH_INT(out_i, 1, 1);
    goto label_8_dummy;

  label_7_false:
    assume !INT_LT(0, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, out_i)])]);
    assume value_is(__ctobpl_const_229, out_i);
    assume value_is(__ctobpl_const_230, Mem_T.Plist[PLUS(prio_queue, 4, out_i)]);
    assume value_is(__ctobpl_const_231, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, out_i)])]);
    goto label_8;

  label_7:
    assert {:sourcefile ".\v2\schedule.c"} {:sourceline 182} true;
    assert prio_queue != 0;
    assert Mem_T.Plist[PLUS(prio_queue, 4, out_i)] != 0;
    goto label_7_true, label_7_false;

  label_7_true:
    assume INT_LT(0, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, out_i)])]);
    assume value_is(__ctobpl_const_229, out_i);
    assume value_is(__ctobpl_const_230, Mem_T.Plist[PLUS(prio_queue, 4, out_i)]);
    assume value_is(__ctobpl_const_231, Mem_T.mem_count_list[mem_count_list(Mem_T.Plist[PLUS(prio_queue, 4, out_i)])]);
    out_i := in_i;
    return;

  label_6_true:
    assume INT_LT(0, out_i);
    assume value_is(__ctobpl_const_228, out_i);
    goto label_7;

  label_8_dummy:
    call {:si_unique_call 1} out_i := schedule_loop_label_6_head(out_i);
    return;

  exit:
    return;
}



procedure schedule_loop_label_6_head(in_i: int) returns (out_i: int);


