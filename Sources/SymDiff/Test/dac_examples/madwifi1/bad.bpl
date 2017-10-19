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

var {:extern} Mem_T.A1CHAR: [int]int;

var {:extern} Mem_T.A5UCHAR: [int]int;

var {:extern} Mem_T.A6UCHAR: [int]int;

var {:extern} Mem_T.CHAR: [int]int;

var {:extern} Mem_T.INT4: [int]int;

var {:extern} Mem_T.PCHAR: [int]int;

var {:extern} Mem_T.PUCHAR: [int]int;

var {:extern} Mem_T.PVOID: [int]int;

var {:extern} Mem_T.Pieee80211_scan_entry: [int]int;

var {:extern} Mem_T.UCHAR: [int]int;

var {:extern} Mem_T.VOID: [int]int;

var {:extern} Mem_T.ieee80211_scan_entry: [int]int;

var {:extern} Mem_T.se_rsn_ie_ieee80211_scan_entry: [int]int;

function {:extern} Match(a: int, t: name) : bool;

function {:extern} MatchBase(b: int, a: int, t: name) : bool;

function {:extern} HasType(v: int, t: name) : bool;

function {:extern} T.Ptr(t: name) : name;

axiom (forall a: int, t: name :: { Match(a, T.Ptr(t)) } Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { MatchBase(b, a, T.Ptr(t)) } MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b);

axiom (forall v: int, t: name :: { HasType(v, T.Ptr(t)) } HasType(v, T.Ptr(t)) <==> v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t)));

const {:extern} unique T.se_rsn_ie_ieee80211_scan_entry: name;

const {:extern} unique T.A1CHAR: name;

const {:extern} unique T.A5UCHAR: name;

const {:extern} unique T.A6UCHAR: name;

const {:extern} unique T.CHAR: name;

const {:extern} unique T.INT4: name;

const {:extern} unique T.PA1CHAR: name;

const {:extern} unique T.PA5UCHAR: name;

const {:extern} unique T.PA6UCHAR: name;

const {:extern} unique T.PCHAR: name;

const {:extern} unique T.PINT4: name;

const {:extern} unique T.PPCHAR: name;

const {:extern} unique T.PPUCHAR: name;

const {:extern} unique T.PPVOID: name;

const {:extern} unique T.PPieee80211_scan_entry: name;

const {:extern} unique T.PUCHAR: name;

const {:extern} unique T.PUINT4: name;

const {:extern} unique T.PVOID: name;

const {:extern} unique T.Pieee80211_scan_entry: name;

const {:extern} unique T.UCHAR: name;

const {:extern} unique T.UINT4: name;

const {:extern} unique T.VOID: name;

const {:extern} unique T.ieee80211_scan_entry: name;

function {:extern} se_rsn_ie_ieee80211_scan_entry(int) : int;

function {:extern} se_rsn_ie_ieee80211_scan_entryInv(int) : int;

function {:extern} _S_se_rsn_ie_ieee80211_scan_entry([int]bool) : [int]bool;

function {:extern} _S_se_rsn_ie_ieee80211_scan_entryInv([int]bool) : [int]bool;

axiom (forall x: int, S: [int]bool :: { _S_se_rsn_ie_ieee80211_scan_entry(S)[x] } _S_se_rsn_ie_ieee80211_scan_entry(S)[x] <==> S[se_rsn_ie_ieee80211_scan_entryInv(x)]);

axiom (forall x: int, S: [int]bool :: { _S_se_rsn_ie_ieee80211_scan_entryInv(S)[x] } _S_se_rsn_ie_ieee80211_scan_entryInv(S)[x] <==> S[se_rsn_ie_ieee80211_scan_entry(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_se_rsn_ie_ieee80211_scan_entry(S) } S[x] ==> _S_se_rsn_ie_ieee80211_scan_entry(S)[se_rsn_ie_ieee80211_scan_entry(x)]);

axiom (forall x: int, S: [int]bool :: { S[x], _S_se_rsn_ie_ieee80211_scan_entryInv(S) } S[x] ==> _S_se_rsn_ie_ieee80211_scan_entryInv(S)[se_rsn_ie_ieee80211_scan_entryInv(x)]);

axiom (forall x: int :: { se_rsn_ie_ieee80211_scan_entry(x) } se_rsn_ie_ieee80211_scan_entry(x) == INT_ADD(x, 0));

axiom (forall x: int :: { se_rsn_ie_ieee80211_scan_entryInv(x) } se_rsn_ie_ieee80211_scan_entryInv(x) == INT_SUB(x, 0));

axiom (forall x: int :: { se_rsn_ie_ieee80211_scan_entry(x) } se_rsn_ie_ieee80211_scan_entry(x) == INT_PLUS(x, 1, 0));

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

function {:extern} Res_VALID_REGION(int) : int;

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

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 16} unique __ctobpl_const_5: int;

const {:extern} {:model_const "leader"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 16} unique __ctobpl_const_6: int;

const {:extern} {:model_const "leader_len"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 16} unique __ctobpl_const_7: int;

const {:extern} {:model_const "leader"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 16} unique __ctobpl_const_9: int;

const {:extern} {:model_const "bufsize"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 13} unique __ctobpl_const_1: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 16} unique __ctobpl_const_8: int;

const {:extern} {:model_const "leader_len"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 16} unique __ctobpl_const_10: int;

const {:extern} {:model_const "leader_len"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 13} unique __ctobpl_const_2: int;

const {:extern} {:model_const "*(p + 1)"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 32} unique __ctobpl_const_24: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 33} unique __ctobpl_const_25: int;

const {:extern} {:model_const "i"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 20} unique __ctobpl_const_26: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_28: int;

const {:extern} {:model_const "bufsize"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 17} unique __ctobpl_const_11: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 32} unique __ctobpl_const_23: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 18} unique __ctobpl_const_13: int;

const {:extern} {:model_const "buf"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_30: int;

const {:extern} {:model_const "se"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 50} unique __ctobpl_const_32: int;

const {:extern} {:model_const "leader_len"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 17} unique __ctobpl_const_12: int;

const {:extern} {:model_const "se->se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 50} unique __ctobpl_const_33: int;

const {:extern} {:model_const "bufsize"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 20} unique __ctobpl_const_20: int;

const {:extern} {:model_const "*p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 30} unique __ctobpl_const_22: int;

const {:extern} {:model_const "i"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_18: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_31: int;

const {:extern} {:model_const "ielen"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_19: int;

const {:extern} {:model_const "i"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 20} unique __ctobpl_const_16: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 30} unique __ctobpl_const_21: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_29: int;

const {:extern} {:model_const "result.question.3"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 38} unique __ctobpl_const_27: int;

const {:extern} {:model_const "ielen"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 20} unique __ctobpl_const_17: int;

const {:extern} {:model_const "leader_len"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 18} unique __ctobpl_const_14: int;

const {:extern} {:model_const "i"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 20} unique __ctobpl_const_15: int;

const {:extern} {:model_const "p"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 15} unique __ctobpl_const_3: int;

const {:extern} {:model_const "buf"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 15} unique __ctobpl_const_4: int;

const {:extern} {:model_const "se.se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 66} unique __ctobpl_const_50: int;

const {:extern} {:model_const "(se.se_rsn_ie)[0]"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 65} unique __ctobpl_const_49: int;

const {:extern} {:model_const "se.se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 65} unique __ctobpl_const_48: int;

const {:extern} {:model_const "(se.se_rsn_ie)[1]"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 66} unique __ctobpl_const_51: int;

const {:extern} {:model_const "se.se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 64} unique __ctobpl_const_47: int;

const {:extern} {:model_const "se"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 52} unique __ctobpl_const_41: int;

const {:extern} {:model_const "se->se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 52} unique __ctobpl_const_42: int;

const {:extern} {:model_const "se->se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 52} unique __ctobpl_const_45: int;

const {:extern} {:model_const "se->se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 51} unique __ctobpl_const_35: int;

const {:extern} {:model_const "se"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 52} unique __ctobpl_const_44: int;

const {:extern} {:model_const "se"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 51} unique __ctobpl_const_34: int;

const {:extern} {:model_const "(se->se_rsn_ie)[1]"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 53} unique __ctobpl_const_40: int;

const {:extern} {:model_const "se"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 53} unique __ctobpl_const_38: int;

const {:extern} {:model_const "encode_ie.arg.4"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 52} unique __ctobpl_const_43: int;

const {:extern} {:model_const "encode_ie.arg.4"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 52} unique __ctobpl_const_46: int;

const {:extern} {:model_const "(se->se_rsn_ie)[0]"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 51} unique __ctobpl_const_36: int;

const {:extern} {:model_const "encode_ie.arg.4"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 53} unique __ctobpl_const_37: int;

const {:extern} {:model_const "se->se_rsn_ie"} {:sourceFile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceLine 53} unique __ctobpl_const_39: int;

procedure {:extern} memcpy(a0: int, a1: int, a2: int) returns (ret: int);
  free requires INT_LT(0, alloc);
  modifies alloc, detChoiceCnt;
  free ensures INT_LEQ(old(alloc), alloc);



procedure {:extern} encode_ie(buf_.1: int, bufsize_.1: int, ie_.1: int, ielen_.1: int, leader_.1: int, leader_len_.1: int) returns (result.encode_ie$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc, detChoiceCnt, Res_KERNEL_SOURCE, Res_PROBED, Mem_T.A1CHAR, Mem_T.A5UCHAR, Mem_T.A6UCHAR, Mem_T.CHAR, Mem_T.INT4, Mem_T.PCHAR, Mem_T.PUCHAR, Mem_T.PVOID, Mem_T.Pieee80211_scan_entry, Mem_T.UCHAR, Mem_T.VOID, Mem_T.ieee80211_scan_entry, Mem_T.se_rsn_ie_ieee80211_scan_entry;
  free ensures INT_LEQ(old(alloc), alloc);
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_KERNEL_SOURCE[_r] } old(Res_KERNEL_SOURCE)[_r] == Res_KERNEL_SOURCE[_r]);
  free ensures old(Res_KERNEL_SOURCE) == Res_KERNEL_SOURCE;
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_PROBED[_r] } old(Res_PROBED)[_r] == Res_PROBED[_r]);
  free ensures old(Res_PROBED) == Res_PROBED;
  free ensures Subset(Empty(), Union(Empty(), Singleton(ie_.1))) && (forall _m: int :: { Mem_T.UCHAR[_m] } _m == ie_.1 || Mem_T.UCHAR[_m] == old(Mem_T.UCHAR)[_m]);
  free ensures Subset(Empty(), Union(Empty(), Singleton(leader_.1))) && (forall _m: int :: { Mem_T.CHAR[_m] } _m == leader_.1 || Mem_T.CHAR[_m] == old(Mem_T.CHAR)[_m]);
  free ensures Mem_T.A1CHAR == old(Mem_T.A1CHAR);
  free ensures Mem_T.A5UCHAR == old(Mem_T.A5UCHAR);
  free ensures Mem_T.A6UCHAR == old(Mem_T.A6UCHAR);
  free ensures Mem_T.INT4 == old(Mem_T.INT4);
  free ensures Mem_T.PCHAR == old(Mem_T.PCHAR);
  free ensures Mem_T.PUCHAR == old(Mem_T.PUCHAR);
  free ensures Mem_T.PVOID == old(Mem_T.PVOID);
  free ensures Mem_T.Pieee80211_scan_entry == old(Mem_T.Pieee80211_scan_entry);
  free ensures Mem_T.VOID == old(Mem_T.VOID);
  free ensures Mem_T.ieee80211_scan_entry == old(Mem_T.ieee80211_scan_entry);
  free ensures Mem_T.se_rsn_ie_ieee80211_scan_entry == old(Mem_T.se_rsn_ie_ieee80211_scan_entry);



implementation {:extern} encode_ie(buf_.1: int, bufsize_.1: int, ie_.1: int, ielen_.1: int, leader_.1: int, leader_len_.1: int) returns (result.encode_ie$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} buf: int;
  var {:extern} bufsize: int;
  var {:extern} i: int;
  var {:extern} ie: int;
  var {:extern} ielen: int;
  var {:extern} leader: int;
  var {:extern} leader_len: int;
  var {:extern} p: int;
  var {:extern} result.memcpy$2: int;
  var {:extern} $result.question.3.$$static$: int;
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

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    assume INT_LT(buf_.1, alloc);
    assume INT_LT(ie_.1, alloc);
    assume INT_LT(leader_.1, alloc);
    buf := 0;
    assume INT_GEQ(buf_.1, 0);
    bufsize := 0;
    i := 0;
    ie := 0;
    assume INT_GEQ(ie_.1, 0);
    ielen := 0;
    leader := 0;
    assume INT_GEQ(leader_.1, 0);
    leader_len := 0;
    p := 0;
    result.encode_ie$1 := 0;
    result.memcpy$2 := 0;
    $result.question.3.$$static$ := 0;
    buf := buf_.1;
    bufsize := bufsize_.1;
    ie := ie_.1;
    ielen := ielen_.1;
    leader := leader_.1;
    leader_len := leader_len_.1;
    goto label_3;

  label_3:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 9} true;
    goto label_4;

  label_4:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 10} true;
    goto label_5;

  label_5:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 13} true;
    goto label_5_true, label_5_false;

  label_5_false:
    assume !INT_LT(bufsize, leader_len);
    assume value_is(__ctobpl_const_1, bufsize);
    assume value_is(__ctobpl_const_2, leader_len);
    goto label_6;

  label_6:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 15} true;
    p := buf;
    assume value_is(__ctobpl_const_3, p);
    assume value_is(__ctobpl_const_4, buf);
    goto label_8;

  label_8:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 16} true;
    call result.memcpy$2 := memcpy(p, leader, leader_len);
    assume value_is(__ctobpl_const_5, p);
    assume value_is(__ctobpl_const_6, leader);
    assume value_is(__ctobpl_const_7, leader_len);
    assume value_is(__ctobpl_const_8, p);
    assume value_is(__ctobpl_const_9, leader);
    assume value_is(__ctobpl_const_10, leader_len);
    goto label_11;

  label_11:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 17} true;
    tempBoogie0 := INT_MINUS_BOTH_PTR_OR_BOTH_INT(bufsize, leader_len, 1);
    bufsize := tempBoogie0;
    assume value_is(__ctobpl_const_11, bufsize);
    assume value_is(__ctobpl_const_12, leader_len);
    goto label_12;

  label_12:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 18} true;
    tempBoogie0 := INT_PLUS(p, 1, leader_len);
    p := tempBoogie0;
    assume value_is(__ctobpl_const_13, p);
    assume value_is(__ctobpl_const_14, leader_len);
    goto label_13;

  label_13:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 20} true;
    i := 0;
    assume value_is(__ctobpl_const_15, i);
    goto label_14;

  label_14:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 20} true;
    goto label_14_head;

  label_14_head:
    call i, p, tempBoogie0 := encode_ie_loop_label_14_head(bufsize, i, ielen, p, tempBoogie0);
    goto label_14_head_last;

  label_14_false:
    assume !INT_LT(i, ielen);
    assume value_is(__ctobpl_const_16, i);
    assume value_is(__ctobpl_const_17, ielen);
    goto label_15;

  label_15:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 38} true;
    goto label_15_true, label_15_false;

  label_15_false:
    assume !INT_EQ(i, ielen);
    assume value_is(__ctobpl_const_18, i);
    assume value_is(__ctobpl_const_19, ielen);
    goto label_21;

  label_21:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 38} true;
    $result.question.3.$$static$ := 0;
    assume value_is(__ctobpl_const_27, $result.question.3.$$static$);
    goto label_23;

  label_23:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 38} true;
    result.encode_ie$1 := $result.question.3.$$static$;
    assume value_is(__ctobpl_const_31, $result.question.3.$$static$);
    goto label_1;

  label_1:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 39} true;
    return;

  label_15_true:
    assume INT_EQ(i, ielen);
    assume value_is(__ctobpl_const_18, i);
    assume value_is(__ctobpl_const_19, ielen);
    goto label_22;

  label_22:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 38} true;
    $result.question.3.$$static$ := INT_MINUS_BOTH_PTR_OR_BOTH_INT(p, buf, 1);
    assume value_is(__ctobpl_const_28, $result.question.3.$$static$);
    assume value_is(__ctobpl_const_29, p);
    assume value_is(__ctobpl_const_30, buf);
    goto label_23;

  label_14_true:
    assume INT_LT(i, ielen);
    assume value_is(__ctobpl_const_16, i);
    assume value_is(__ctobpl_const_17, ielen);
    goto label_16;

  label_16:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 20} true;
    goto label_16_true, label_16_false;

  label_16_false:
    assume !INT_LT(2, bufsize);
    assume value_is(__ctobpl_const_20, bufsize);
    goto label_15;

  label_16_true:
    assume INT_LT(2, bufsize);
    assume value_is(__ctobpl_const_20, bufsize);
    goto label_17;

  label_17:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 30} true;
    assume INT_GEQ(p, 0);
    assert Res_VALID_REGION(p) == 1;
    Mem_T.UCHAR := Mem_T.UCHAR[p := 120];
    assume value_is(__ctobpl_const_21, p);
    assume value_is(__ctobpl_const_22, Mem_T.UCHAR[p]);
    goto label_18;

  label_18:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 32} true;
    assume INT_GEQ(INT_PLUS(p, 1, 1), 0);
    assert Res_VALID_REGION(INT_PLUS(p, 1, 1)) == 1;
    Mem_T.UCHAR := Mem_T.UCHAR[INT_PLUS(p, 1, 1) := 120];
    assume value_is(__ctobpl_const_23, p);
    assume value_is(__ctobpl_const_24, Mem_T.UCHAR[INT_PLUS(p, 1, 1)]);
    goto label_19;

  label_19:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 33} true;
    tempBoogie0 := INT_PLUS(p, 1, 2);
    p := tempBoogie0;
    assume value_is(__ctobpl_const_25, p);
    goto label_20;

  label_20:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 20} true;
    assume value_is(__ctobpl_const_26, i);
    i := INT_PLUS(i, 1, 1);
    goto label_20_dummy;

  label_5_true:
    assume INT_LT(bufsize, leader_len);
    assume value_is(__ctobpl_const_1, bufsize);
    assume value_is(__ctobpl_const_2, leader_len);
    goto label_7;

  label_7:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 14} true;
    result.encode_ie$1 := 0;
    goto label_1;

  label_20_dummy:
    assume false;
    return;

  label_14_head_last:
    goto label_14_true, label_14_false;
}



procedure {:extern} giwscan_cb(se_.1: int) returns (result.giwscan_cb$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc, detChoiceCnt, Res_KERNEL_SOURCE, Res_PROBED, Mem_T.A1CHAR, Mem_T.A5UCHAR, Mem_T.A6UCHAR, Mem_T.CHAR, Mem_T.INT4, Mem_T.PCHAR, Mem_T.PUCHAR, Mem_T.PVOID, Mem_T.Pieee80211_scan_entry, Mem_T.UCHAR, Mem_T.VOID, Mem_T.ieee80211_scan_entry, Mem_T.se_rsn_ie_ieee80211_scan_entry;
  free ensures INT_LEQ(old(alloc), alloc);
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_KERNEL_SOURCE[_r] } old(Res_KERNEL_SOURCE)[_r] == Res_KERNEL_SOURCE[_r]);
  free ensures old(Res_KERNEL_SOURCE) == Res_KERNEL_SOURCE;
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_PROBED[_r] } old(Res_PROBED)[_r] == Res_PROBED[_r]);
  free ensures old(Res_PROBED) == Res_PROBED;
  free ensures Mem_T.A1CHAR == old(Mem_T.A1CHAR);
  free ensures Mem_T.A5UCHAR == old(Mem_T.A5UCHAR);
  free ensures Mem_T.A6UCHAR == old(Mem_T.A6UCHAR);
  free ensures Mem_T.CHAR == old(Mem_T.CHAR);
  free ensures Mem_T.INT4 == old(Mem_T.INT4);
  free ensures Mem_T.PCHAR == old(Mem_T.PCHAR);
  free ensures Mem_T.PUCHAR == old(Mem_T.PUCHAR);
  free ensures Mem_T.PVOID == old(Mem_T.PVOID);
  free ensures Mem_T.Pieee80211_scan_entry == old(Mem_T.Pieee80211_scan_entry);
  free ensures Mem_T.UCHAR == old(Mem_T.UCHAR);
  free ensures Mem_T.VOID == old(Mem_T.VOID);
  free ensures Mem_T.ieee80211_scan_entry == old(Mem_T.ieee80211_scan_entry);
  free ensures Mem_T.se_rsn_ie_ieee80211_scan_entry == old(Mem_T.se_rsn_ie_ieee80211_scan_entry);



implementation {:extern} giwscan_cb(se_.1: int) returns (result.giwscan_cb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} buf: int;
  var {:extern} $encode_ie.arg.4$3.$$static$: int;
  var {:extern} result.encode_ie$2: int;
  var {:extern} rsn_leader: int;
  var {:extern} se: int;
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

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    assume INT_LT(se_.1, alloc);
    call buf := __HAVOC_det_malloc(6);
    $encode_ie.arg.4$3.$$static$ := 0;
    result.encode_ie$2 := 0;
    result.giwscan_cb$1 := 0;
    call rsn_leader := __HAVOC_det_malloc(1);
    se := 0;
    assume INT_GEQ(se_.1, 0);
    se := se_.1;
    goto label_3;

  label_3:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 45} true;
    goto label_4;

  label_4:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 46} true;
    goto label_5;

  label_5:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 50} true;
    assume INT_GEQ(se, 0);
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    goto label_5_true, label_5_false;

  label_5_false:
    assume Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)] == 0;
    assume value_is(__ctobpl_const_32, se);
    assume value_is(__ctobpl_const_33, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    goto label_6;

  label_6:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 57} true;
    result.giwscan_cb$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 58} true;
    call __HAVOC_free(buf);
    call __HAVOC_free(rsn_leader);
    return;

  label_5_true:
    assume Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)] != 0;
    assume value_is(__ctobpl_const_32, se);
    assume value_is(__ctobpl_const_33, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    goto label_7;

  label_7:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 51} true;
    assume INT_GEQ(se, 0);
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    assume INT_GEQ(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 0);
    assert Res_VALID_REGION(INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)) == 1;
    goto label_7_true, label_7_false;

  label_7_false:
    assume !INT_EQ(Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)], 200);
    assume value_is(__ctobpl_const_34, se);
    assume value_is(__ctobpl_const_35, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_36, Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)]);
    goto label_6;

  label_7_true:
    assume INT_EQ(Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)], 200);
    assume value_is(__ctobpl_const_34, se);
    assume value_is(__ctobpl_const_35, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_36, Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)]);
    goto label_8;

  label_8:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 53} true;
    assume INT_GEQ(se, 0);
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    assume INT_GEQ(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 0);
    assert Res_VALID_REGION(INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 1)) == 1;
    $encode_ie.arg.4$3.$$static$ := INT_PLUS(Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 1)], 1, 2);
    assume value_is(__ctobpl_const_37, $encode_ie.arg.4$3.$$static$);
    assume value_is(__ctobpl_const_38, se);
    assume value_is(__ctobpl_const_39, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_40, Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 1)]);
    goto label_9;

  label_9:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 52} true;
    assume INT_GEQ(se, 0);
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    assume INT_GEQ(se, 0);
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    call result.encode_ie$2 := encode_ie(buf, 6, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], $encode_ie.arg.4$3.$$static$, rsn_leader, 1);
    assume value_is(__ctobpl_const_41, se);
    assume value_is(__ctobpl_const_42, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_43, $encode_ie.arg.4$3.$$static$);
    assume value_is(__ctobpl_const_44, se);
    assume value_is(__ctobpl_const_45, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_46, $encode_ie.arg.4$3.$$static$);
    goto label_6;
}



procedure {:extern} main() returns (result.main$1: int);
  free requires INT_LT(0, alloc);
  modifies alloc, detChoiceCnt, Res_KERNEL_SOURCE, Res_PROBED, Mem_T.A1CHAR, Mem_T.A5UCHAR, Mem_T.A6UCHAR, Mem_T.CHAR, Mem_T.INT4, Mem_T.PCHAR, Mem_T.PUCHAR, Mem_T.PVOID, Mem_T.Pieee80211_scan_entry, Mem_T.UCHAR, Mem_T.VOID, Mem_T.ieee80211_scan_entry, Mem_T.se_rsn_ie_ieee80211_scan_entry;
  free ensures INT_LEQ(old(alloc), alloc);
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_KERNEL_SOURCE[_r] } old(Res_KERNEL_SOURCE)[_r] == Res_KERNEL_SOURCE[_r]);
  free ensures old(Res_KERNEL_SOURCE) == Res_KERNEL_SOURCE;
  ensures Subset(Empty(), Empty()) && (forall _r: int :: { Res_PROBED[_r] } old(Res_PROBED)[_r] == Res_PROBED[_r]);
  free ensures old(Res_PROBED) == Res_PROBED;
  free ensures Mem_T.A1CHAR == old(Mem_T.A1CHAR);
  free ensures Mem_T.A5UCHAR == old(Mem_T.A5UCHAR);
  free ensures Mem_T.A6UCHAR == old(Mem_T.A6UCHAR);
  free ensures Mem_T.CHAR == old(Mem_T.CHAR);
  free ensures Mem_T.INT4 == old(Mem_T.INT4);
  free ensures Mem_T.PCHAR == old(Mem_T.PCHAR);
  free ensures Mem_T.PUCHAR == old(Mem_T.PUCHAR);
  free ensures Mem_T.PVOID == old(Mem_T.PVOID);
  free ensures Mem_T.Pieee80211_scan_entry == old(Mem_T.Pieee80211_scan_entry);
  free ensures Mem_T.UCHAR == old(Mem_T.UCHAR);
  free ensures Mem_T.VOID == old(Mem_T.VOID);
  free ensures Mem_T.ieee80211_scan_entry == old(Mem_T.ieee80211_scan_entry);
  free ensures Mem_T.se_rsn_ie_ieee80211_scan_entry == old(Mem_T.se_rsn_ie_ieee80211_scan_entry);



implementation {:extern} main() returns (result.main$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} ie: int;
  var {:extern} result.giwscan_cb$2: int;
  var {:extern} se: int;
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

  anon0:
    havoc_stringTemp := 0;
    goto start;

  start:
    call ie := __HAVOC_det_malloc(5);
    result.giwscan_cb$2 := 0;
    result.main$1 := 0;
    call se := __HAVOC_det_malloc(4);
    goto label_3;

  label_3:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 62} true;
    goto label_4;

  label_4:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 63} true;
    goto label_5;

  label_5:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 64} true;
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    Mem_T.se_rsn_ie_ieee80211_scan_entry := Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se) := ie];
    assume value_is(__ctobpl_const_47, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    goto label_6;

  label_6:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 65} true;
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    assume INT_GEQ(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 0);
    assert Res_VALID_REGION(INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)) == 1;
    Mem_T.UCHAR := Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0) := 200];
    assume value_is(__ctobpl_const_48, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_49, Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 0)]);
    goto label_7;

  label_7:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 66} true;
    assert Res_VALID_REGION(se_rsn_ie_ieee80211_scan_entry(se)) == 1;
    assume INT_GEQ(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 0);
    assert Res_VALID_REGION(INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 1)) == 1;
    Mem_T.UCHAR := Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 1) := 3];
    assume value_is(__ctobpl_const_50, Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)]);
    assume value_is(__ctobpl_const_51, Mem_T.UCHAR[INT_PLUS(Mem_T.se_rsn_ie_ieee80211_scan_entry[se_rsn_ie_ieee80211_scan_entry(se)], 1, 1)]);
    goto label_8;

  label_8:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 68} true;
    assume INT_GT(se, 0);
    assume INT_GT(se, 0);
    call result.giwscan_cb$2 := giwscan_cb(se);
    goto label_11;

  label_11:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 70} true;
    result.main$1 := 0;
    goto label_1;

  label_1:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 71} true;
    call __HAVOC_free(ie);
    call __HAVOC_free(se);
    return;
}



implementation encode_ie_loop_label_14_head(in_bufsize: int, in_i: int, in_ielen: int, in_p: int, in_tempBoogie0: int) returns (out_i: int, out_p: int, out_tempBoogie0: int)
{

  entry:
    out_i, out_p, out_tempBoogie0 := in_i, in_p, in_tempBoogie0;
    goto label_14_head;

  label_14_head:
    goto label_14_true, label_14_false;

  label_14_false:
    assume !INT_LT(out_i, in_ielen);
    assume value_is(__ctobpl_const_16, out_i);
    assume value_is(__ctobpl_const_17, in_ielen);
    out_i, out_p, out_tempBoogie0 := in_i, in_p, in_tempBoogie0;
    Mem_T.UCHAR := old(Mem_T.UCHAR);
    return;

  label_20:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 20} true;
    assume value_is(__ctobpl_const_26, out_i);
    out_i := INT_PLUS(out_i, 1, 1);
    goto label_20_dummy;

  label_19:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 33} true;
    out_tempBoogie0 := INT_PLUS(out_p, 1, 2);
    out_p := out_tempBoogie0;
    assume value_is(__ctobpl_const_25, out_p);
    goto label_20;

  label_18:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 32} true;
    assume INT_GEQ(INT_PLUS(out_p, 1, 1), 0);
    assert Res_VALID_REGION(INT_PLUS(out_p, 1, 1)) == 1;
    Mem_T.UCHAR := Mem_T.UCHAR[INT_PLUS(out_p, 1, 1) := 120];
    assume value_is(__ctobpl_const_23, out_p);
    assume value_is(__ctobpl_const_24, Mem_T.UCHAR[INT_PLUS(out_p, 1, 1)]);
    goto label_19;

  label_17:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 30} true;
    assume INT_GEQ(out_p, 0);
    assert Res_VALID_REGION(out_p) == 1;
    Mem_T.UCHAR := Mem_T.UCHAR[out_p := 120];
    assume value_is(__ctobpl_const_21, out_p);
    assume value_is(__ctobpl_const_22, Mem_T.UCHAR[out_p]);
    goto label_18;

  label_16_true:
    assume INT_LT(2, in_bufsize);
    assume value_is(__ctobpl_const_20, in_bufsize);
    goto label_17;

  label_16:
    assert {:sourcefile "d:\tvm\projects\symb_diff\benchmarks\verisec-suite\programs\apps\madwifi\cve-2006-6332\bad\interproc_bad.c"} {:sourceline 20} true;
    goto label_16_true, label_16_false;

  label_16_false:
    assume !INT_LT(2, in_bufsize);
    assume value_is(__ctobpl_const_20, in_bufsize);
    out_i, out_p, out_tempBoogie0 := in_i, in_p, in_tempBoogie0;
    Mem_T.UCHAR := old(Mem_T.UCHAR);
    return;

  label_14_true:
    assume INT_LT(out_i, in_ielen);
    assume value_is(__ctobpl_const_16, out_i);
    assume value_is(__ctobpl_const_17, in_ielen);
    goto label_16;

  label_20_dummy:
    call {:si_unique_call 1} out_i, out_p, out_tempBoogie0 := encode_ie_loop_label_14_head(in_bufsize, out_i, in_ielen, out_p, out_tempBoogie0);
    return;

  exit:
    return;
}



procedure encode_ie_loop_label_14_head(in_bufsize: int, in_i: int, in_ielen: int, in_p: int, in_tempBoogie0: int) returns (out_i: int, out_p: int, out_tempBoogie0: int);
  modifies Mem_T.UCHAR;


