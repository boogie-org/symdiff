var {:extern} v4.Mem: [name][int]int;

var {:extern} v4.alloc: int;

var {:extern} v4.Mem_T.INT4: [int]int;

var {:extern} v4.detChoiceCnt: int;

var {:extern} v4.Res_KERNEL_SOURCE: [int]int;

var {:extern} v4.Res_PROBED: [int]int;

const {:extern} unique v4.T.INT4: name;

const {:extern} unique v4.T.PINT4: name;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceLine 4} unique v4.__ctobpl_const_3: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceLine 2} unique v4.__ctobpl_const_1: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceLine 3} unique v4.__ctobpl_const_2: int;

function {:extern} v4.OneByteToInt(arg_0: byte) : int;

function {:extern} v4.TwoBytesToInt(arg_0: byte, arg_1: byte) : int;

function {:extern} v4.FourBytesToInt(arg_0: byte, arg_1: byte, arg_2: byte, arg_3: byte) : int;

function {:extern} v4.Field(arg_0: int) : name;

function {:extern} v4.Base(arg_0: int) : int;

function {:extern} v4.Match(a: int, t: name) : bool;

function {:extern} v4.MatchBase(b: int, a: int, t: name) : bool;

function {:extern} v4.HasType(v: int, t: name) : bool;

function {:extern} v4.T.Ptr(t: name) : name;

function {:extern} v4.INT_EQ(x: int, y: int) : bool;

function {:extern} v4.INT_NEQ(x: int, y: int) : bool;

function {:extern} v4.INT_ADD(x: int, y: int) : int;

function {:extern} v4.INT_SUB(x: int, y: int) : int;

function {:extern} v4.INT_LT(x: int, y: int) : bool;

function {:extern} v4.INT_ULT(x: int, y: int) : bool;

function {:extern} v4.INT_LEQ(x: int, y: int) : bool;

function {:extern} v4.INT_ULEQ(x: int, y: int) : bool;

function {:extern} v4.INT_GT(x: int, y: int) : bool;

function {:extern} v4.INT_UGT(x: int, y: int) : bool;

function {:extern} v4.INT_GEQ(x: int, y: int) : bool;

function {:extern} v4.INT_UGEQ(x: int, y: int) : bool;

function {:extern} v4.INT_AND(a: int, b: int) : int;

function {:extern} v4.INT_OR(a: int, b: int) : int;

function {:extern} v4.INT_XOR(a: int, b: int) : int;

function {:extern} v4.INT_NOT(a: int) : int;

function {:extern} v4.POW2(a: int) : bool;

function {:extern} v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a: int, b: int, size: int) : int;

function {:extern} v4.INT_MINUS_LEFT_PTR(a: int, a_size: int, b: int) : int;

function {:extern} v4.INT_PLUS(a: int, a_size: int, b: int) : int;

function {:extern} v4.INT_MULT(a: int, b: int) : int;

function {:extern} v4.INT_DIV(a: int, b: int) : int;

function {:extern} v4.INT_BINARY_BOTH_INT(a: int, b: int) : int;

function {:extern} v4.BV32_EQ(x: bv32, y: bv32) : bool;

function {:extern} v4.BV32_NEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvadd"} v4.BV32_ADD(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvsub"} v4.BV32_SUB(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvmul"} v4.BV32_MULT(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvudiv"} v4.BV32_DIV(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvult"} v4.BV32_ULT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvslt"} v4.BV32_LT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvule"} v4.BV32_ULEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsle"} v4.BV32_LEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvugt"} v4.BV32_UGT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsgt"} v4.BV32_GT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvuge"} v4.BV32_UGEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsge"} v4.BV32_GEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvand"} v4.BV32_AND(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvor"} v4.BV32_OR(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvxor"} v4.BV32_XOR(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvnot"} v4.BV32_NOT(a: bv32) : bv32;

function {:extern} v4.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a: bv32, b: bv32, size: bv32) : bv32;

function {:extern} v4.BV32_MINUS_LEFT_PTR(a: bv32, a_size: bv32, b: bv32) : bv32;

function {:extern} v4.BV32_PLUS(a: bv32, a_size: bv32, b: bv32) : bv32;

function {:extern} v4.BV32_BINARY_BOTH_INT(a: bv32, b: bv32) : bv32;

function {:extern} v4.bv32ToInt(arg_0: bv32) : int;

function {:extern} v4.intToBv32(arg_0: int) : bv32;

function {:extern} v4.choose(a: bool, b: int, c: int) : int;

function {:extern} v4.LIFT(a: bool) : int;

function {:extern} v4.PTR_NOT(a: int) : int;

function {:extern} v4.NULL_CHECK(a: int) : int;

function {:extern} v4.NewAlloc(x: int, y: int) : int;

function {:extern} v4.DetChoiceFunc(a: int) : int;

function {:extern} v4.Equal(arg_0: [int]bool, arg_1: [int]bool) : bool;

function {:extern} v4.Subset(arg_0: [int]bool, arg_1: [int]bool) : bool;

function {:extern} v4.Disjoint(arg_0: [int]bool, arg_1: [int]bool) : bool;

function {:extern} v4.Empty() : [int]bool;

function {:extern} v4.SetTrue() : [int]bool;

function {:extern} v4.Singleton(arg_0: int) : [int]bool;

function {:extern} v4.Reachable(arg_0: [int,int]bool, arg_1: int) : [int]bool;

function {:extern} v4.Union(arg_0: [int]bool, arg_1: [int]bool) : [int]bool;

function {:extern} v4.Intersection(arg_0: [int]bool, arg_1: [int]bool) : [int]bool;

function {:extern} v4.Difference(arg_0: [int]bool, arg_1: [int]bool) : [int]bool;

function {:extern} v4.Dereference(arg_0: [int]bool, arg_1: [int]int) : [int]bool;

function {:extern} v4.Inverse(f: [int]int, x: int) : [int]bool;

function {:extern} v4.AtLeast(arg_0: int, arg_1: int) : [int]bool;

function {:extern} v4.Rep(arg_0: int, arg_1: int) : int;

function {:extern} v4.Array(arg_0: int, arg_1: int, arg_2: int) : [int]bool;

function {:extern} v4.Unified(arg_0: [name][int]int) : [int]int;

function {:extern} v4.value_is(c: int, e: int) : bool;

axiom (forall b0: byte, c0: byte :: { v4.OneByteToInt(b0), v4.OneByteToInt(c0) } v4.OneByteToInt(b0) == v4.OneByteToInt(c0) ==> b0 == c0);

axiom (forall b0: byte, b1: byte, c0: byte, c1: byte :: { v4.TwoBytesToInt(b0, b1), v4.TwoBytesToInt(c0, c1) } v4.TwoBytesToInt(b0, b1) == v4.TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);

axiom (forall b0: byte, b1: byte, b2: byte, b3: byte, c0: byte, c1: byte, c2: byte, c3: byte :: { v4.FourBytesToInt(b0, b1, b2, b3), v4.FourBytesToInt(c0, c1, c2, c3) } v4.FourBytesToInt(b0, b1, b2, b3) == v4.FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

axiom (forall x: int :: { v4.Base(x) } v4.INT_LEQ(v4.Base(x), x));

axiom (forall a: int, t: name :: { v4.Match(a, v4.T.Ptr(t)) } v4.Match(a, v4.T.Ptr(t)) <==> v4.Field(a) == v4.T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { v4.MatchBase(b, a, v4.T.Ptr(t)) } v4.MatchBase(b, a, v4.T.Ptr(t)) <==> v4.Base(a) == b);

axiom (forall v: int, t: name :: { v4.HasType(v, v4.T.Ptr(t)) } v4.HasType(v, v4.T.Ptr(t)) <==> v == 0 || (v4.INT_GT(v, 0) && v4.Match(v, t) && v4.MatchBase(v4.Base(v), v, t)));

axiom (forall x: int, y: int :: {:extern} { v4.INT_EQ(x, y): bool } v4.INT_EQ(x, y): bool <==> x == y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_NEQ(x, y): bool } v4.INT_NEQ(x, y): bool <==> x != y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_ADD(x, y): int } v4.INT_ADD(x, y): int == x + y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_SUB(x, y): int } v4.INT_SUB(x, y): int == x - y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_LT(x, y): bool } v4.INT_LT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_ULT(x, y): bool } v4.INT_ULT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_LEQ(x, y): bool } v4.INT_LEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_ULEQ(x, y): bool } v4.INT_ULEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_GT(x, y): bool } v4.INT_GT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_UGT(x, y): bool } v4.INT_UGT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_GEQ(x, y): bool } v4.INT_GEQ(x, y): bool <==> x >= y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_UGEQ(x, y): bool } v4.INT_UGEQ(x, y): bool <==> x >= y);

axiom (forall a: int, b: int :: { v4.INT_AND(a, b) } a == b ==> v4.INT_AND(a, b) == a);

axiom (forall a: int, b: int :: { v4.INT_AND(a, b) } v4.POW2(a) && v4.POW2(b) && a != b ==> v4.INT_AND(a, b) == 0);

axiom (forall a: int, b: int :: { v4.INT_AND(a, b) } a == 0 || b == 0 ==> v4.INT_AND(a, b) == 0);

axiom v4.POW2(1);

axiom v4.POW2(2);

axiom v4.POW2(4);

axiom v4.POW2(8);

axiom v4.POW2(16);

axiom v4.POW2(32);

axiom v4.POW2(64);

axiom v4.POW2(128);

axiom v4.POW2(256);

axiom v4.POW2(512);

axiom v4.POW2(1024);

axiom v4.POW2(2048);

axiom v4.POW2(4096);

axiom v4.POW2(8192);

axiom v4.POW2(16384);

axiom v4.POW2(32768);

axiom v4.POW2(65536);

axiom v4.POW2(131072);

axiom v4.POW2(262144);

axiom v4.POW2(524288);

axiom v4.POW2(1048576);

axiom v4.POW2(2097152);

axiom v4.POW2(4194304);

axiom v4.POW2(8388608);

axiom v4.POW2(16777216);

axiom v4.POW2(33554432);

axiom (forall a: int, b: int, size: int :: { v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } size * v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) <= a - b && a - b < size * (v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) + 1));

axiom (forall a: int, a_size: int, b: int :: { v4.INT_MINUS_LEFT_PTR(a, a_size, b) } v4.INT_MINUS_LEFT_PTR(a, a_size, b) == a - a_size * b);

axiom (forall a: int, a_size: int, b: int :: { v4.INT_PLUS(a, a_size, b) } v4.INT_PLUS(a, a_size, b) == a + a_size * b);

axiom (forall a: int, b: int :: { v4.INT_MULT(a, b) } v4.INT_MULT(a, b) == a * b);

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a >= 0 && b > 0 ==> b * v4.INT_DIV(a, b) <= a && a < b * (v4.INT_DIV(a, b) + 1));

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a >= 0 && b < 0 ==> b * v4.INT_DIV(a, b) <= a && a < b * (v4.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a < 0 && b > 0 ==> b * v4.INT_DIV(a, b) >= a && a > b * (v4.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a < 0 && b < 0 ==> b * v4.INT_DIV(a, b) >= a && a > b * (v4.INT_DIV(a, b) + 1));

axiom (forall x: bv32, y: bv32 :: {:extern} { v4.BV32_EQ(x, y): bool } v4.BV32_EQ(x, y): bool <==> x == y);

axiom (forall x: bv32, y: bv32 :: {:extern} { v4.BV32_NEQ(x, y): bool } v4.BV32_NEQ(x, y): bool <==> x != y);

axiom (forall a: bv32, b: bv32, size: bv32 :: {:extern} { v4.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 } v4.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 == v4.BV32_DIV(v4.BV32_SUB(a, b), size));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v4.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 } v4.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 == v4.BV32_SUB(a, v4.BV32_MULT(a_size, b)));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v4.BV32_PLUS(a, a_size, b): bv32 } v4.BV32_PLUS(a, a_size, b): bv32 == v4.BV32_ADD(a, v4.BV32_MULT(a_size, b)));

axiom (forall a: bool, b: int, c: int :: { v4.choose(a, b, c) } a ==> v4.choose(a, b, c) == b);

axiom (forall a: bool, b: int, c: int :: { v4.choose(a, b, c) } !a ==> v4.choose(a, b, c) == c);

axiom (forall a: bool :: { v4.LIFT(a) } a <==> v4.LIFT(a) != 0);

axiom (forall a: int :: { v4.PTR_NOT(a) } a == 0 ==> v4.PTR_NOT(a) != 0);

axiom (forall a: int :: { v4.PTR_NOT(a) } a != 0 ==> v4.PTR_NOT(a) == 0);

axiom (forall a: int :: { v4.NULL_CHECK(a) } a == 0 ==> v4.NULL_CHECK(a) != 0);

axiom (forall a: int :: { v4.NULL_CHECK(a) } a != 0 ==> v4.NULL_CHECK(a) == 0);

axiom (forall n: int, x: int, y: int :: { v4.AtLeast(n, x)[y] } v4.AtLeast(n, x)[y] ==> v4.INT_LEQ(x, y) && v4.Rep(n, x) == v4.Rep(n, y));

axiom (forall n: int, x: int, y: int :: { v4.AtLeast(n, x), v4.Rep(n, x), v4.Rep(n, y) } v4.INT_LEQ(x, y) && v4.Rep(n, x) == v4.Rep(n, y) ==> v4.AtLeast(n, x)[y]);

axiom (forall n: int, x: int :: { v4.AtLeast(n, x) } v4.AtLeast(n, x)[x]);

axiom (forall n: int, x: int, z: int :: { v4.INT_PLUS(x, n, z) } v4.Rep(n, x) == v4.Rep(n, v4.INT_PLUS(x, n, z)));

axiom (forall n: int, x: int :: { v4.Rep(n, x) } (exists k: int :: v4.INT_SUB(v4.Rep(n, x), x) == v4.INT_MULT(n, k)));

axiom (forall x: int, n: int, z: int :: { v4.Array(x, n, z) } v4.INT_LEQ(z, 0) ==> v4.Equal(v4.Array(x, n, z), v4.Empty()));

axiom (forall x: int, n: int, z: int :: { v4.Array(x, n, z) } v4.INT_GT(z, 0) ==> v4.Equal(v4.Array(x, n, z), v4.Difference(v4.AtLeast(n, x), v4.AtLeast(n, v4.INT_PLUS(x, n, z)))));

axiom (forall x: int :: !v4.Empty()[x]);

axiom (forall x: int :: v4.SetTrue()[x]);

axiom (forall x: int, y: int :: { v4.Singleton(y)[x] } v4.Singleton(y)[x] <==> x == y);

axiom (forall y: int :: { v4.Singleton(y) } v4.Singleton(y)[y]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v4.Union(S, T)[x] } { v4.Union(S, T), S[x] } { v4.Union(S, T), T[x] } v4.Union(S, T)[x] <==> S[x] || T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v4.Intersection(S, T)[x] } { v4.Intersection(S, T), S[x] } { v4.Intersection(S, T), T[x] } v4.Intersection(S, T)[x] <==> S[x] && T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v4.Difference(S, T)[x] } { v4.Difference(S, T), S[x] } { v4.Difference(S, T), T[x] } v4.Difference(S, T)[x] <==> S[x] && !T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v4.Equal(S, T) } v4.Equal(S, T) <==> v4.Subset(S, T) && v4.Subset(T, S));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v4.Subset(S, T) } { T[x], v4.Subset(S, T) } S[x] && v4.Subset(S, T) ==> T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v4.Subset(S, T) } v4.Subset(S, T) || (exists x: int :: S[x] && !T[x]));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v4.Disjoint(S, T) } { T[x], v4.Disjoint(S, T) } !(S[x] && v4.Disjoint(S, T) && T[x]));

axiom (forall S: [int]bool, T: [int]bool :: { v4.Disjoint(S, T) } v4.Disjoint(S, T) || (exists x: int :: S[x] && T[x]));

axiom (forall f: [int]int, x: int :: { v4.Inverse(f, f[x]) } v4.Inverse(f, f[x])[x]);

axiom (forall f: [int]int, x: int, y: int :: { v4.Inverse(f, y), f[x] } v4.Inverse(f, y)[x] ==> f[x] == y);

axiom (forall f: [int]int, x: int, y: int :: { v4.Inverse(f[x := y], y) } v4.Equal(v4.Inverse(f[x := y], y), v4.Union(v4.Inverse(f, y), v4.Singleton(x))));

axiom (forall f: [int]int, x: int, y: int, z: int :: { v4.Inverse(f[x := y], z) } y == z || v4.Equal(v4.Inverse(f[x := y], z), v4.Difference(v4.Inverse(f, z), v4.Singleton(x))));

axiom (forall x: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M)[x] } v4.Dereference(S, M)[x] ==> (exists y: int :: x == M[y] && S[y]));

axiom (forall x: int, S: [int]bool, M: [int]int :: { M[x], S[x], v4.Dereference(S, M) } S[x] ==> v4.Dereference(S, M)[M[x]]);

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M[x := y]) } !S[x] ==> v4.Equal(v4.Dereference(S, M[x := y]), v4.Dereference(S, M)));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M[x := y]) } S[x] && v4.Equal(v4.Intersection(v4.Inverse(M, M[x]), S), v4.Singleton(x)) ==> v4.Equal(v4.Dereference(S, M[x := y]), v4.Union(v4.Difference(v4.Dereference(S, M), v4.Singleton(M[x])), v4.Singleton(y))));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M[x := y]) } S[x] && !v4.Equal(v4.Intersection(v4.Inverse(M, M[x]), S), v4.Singleton(x)) ==> v4.Equal(v4.Dereference(S, M[x := y]), v4.Union(v4.Dereference(S, M), v4.Singleton(y))));

axiom (forall M: [name][int]int, x: int :: { v4.Unified(M)[x] } v4.Unified(M)[x] == M[v4.Field(x)][x]);

axiom (forall M: [name][int]int, x: int, y: int :: { v4.Unified(M[v4.Field(x) := M[v4.Field(x)][x := y]]) } v4.Unified(M[v4.Field(x) := M[v4.Field(x)][x := y]]) == v4.Unified(M)[x := y]);

procedure v4.havoc_assert(i: int);



procedure v4.havoc_assume(i: int);



procedure v4.__HAVOC_free(a: int);



procedure v4.__HAVOC_malloc(obj_size: int) returns (new: int);
  modifies v4.alloc;
  free ensures new == _uf_v4.__HAVOC_malloc_new(obj_size, old(v4.alloc));
  free ensures v4.alloc == _uf_v4.__HAVOC_malloc_v4.alloc(obj_size, old(v4.alloc));



procedure v4.__HAVOC_det_malloc(obj_size: int) returns (new: int);
  modifies v4.alloc;
  free ensures new == _uf_v4.__HAVOC_det_malloc_new(obj_size, old(v4.alloc));
  free ensures v4.alloc == _uf_v4.__HAVOC_det_malloc_v4.alloc(obj_size, old(v4.alloc));



procedure v4.__HAVOC_memset_split_1(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v4.__HAVOC_memset_split_1_ret(A, p, c, n);



procedure v4.__HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v4.__HAVOC_memset_split_2_ret(A, p, c, n);



procedure v4.__HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v4.__HAVOC_memset_split_4_ret(A, p, c, n);



procedure v4.nondet_choice() returns (x: int);
  free ensures x == _uf_v4.nondet_choice_x();



procedure v4.det_choice() returns (x: int);
  modifies v4.detChoiceCnt;
  free ensures x == _uf_v4.det_choice_x(old(v4.detChoiceCnt));
  free ensures v4.detChoiceCnt == _uf_v4.det_choice_v4.detChoiceCnt(old(v4.detChoiceCnt));



procedure v4._strdup(str: int) returns (new: int);
  free ensures new == _uf_v4._strdup_new(str);



procedure v4._xstrcasecmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v4._xstrcasecmp_ret(a0, a1);



procedure v4._xstrcmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v4._xstrcmp_ret(a0, a1);



procedure {:inline 1} v4.callee() returns (result.callee$1: int);
  free ensures result.callee$1 == _uf_v4.callee_result.callee$1();



implementation {:inline 1} v4.callee() returns (result.callee$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.callee$1 := 0;
    x := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 2} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 2} true;
    x := 2;
    assume v4.value_is(v4.__ctobpl_const_1, x);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 3} true;
    assume v4.value_is(v4.__ctobpl_const_2, x);
    x := v4.INT_PLUS(x, 1, 1);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 4} true;
    result.callee$1 := x;
    assume v4.value_is(v4.__ctobpl_const_3, x);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 5} true;
    return;
}



var {:extern} v3.Mem: [name][int]int;

var {:extern} v3.alloc: int;

var {:extern} v3.Mem_T.INT4: [int]int;

var {:extern} v3.detChoiceCnt: int;

var {:extern} v3.Res_KERNEL_SOURCE: [int]int;

var {:extern} v3.Res_PROBED: [int]int;

const {:extern} unique v3.T.INT4: name;

const {:extern} unique v3.T.PINT4: name;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceLine 4} unique v3.__ctobpl_const_3: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceLine 2} unique v3.__ctobpl_const_1: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceLine 3} unique v3.__ctobpl_const_2: int;

axiom (forall b0: byte, c0: byte :: { v4.OneByteToInt(b0), v4.OneByteToInt(c0) } v4.OneByteToInt(b0) == v4.OneByteToInt(c0) ==> b0 == c0);

axiom (forall b0: byte, b1: byte, c0: byte, c1: byte :: { v4.TwoBytesToInt(b0, b1), v4.TwoBytesToInt(c0, c1) } v4.TwoBytesToInt(b0, b1) == v4.TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);

axiom (forall b0: byte, b1: byte, b2: byte, b3: byte, c0: byte, c1: byte, c2: byte, c3: byte :: { v4.FourBytesToInt(b0, b1, b2, b3), v4.FourBytesToInt(c0, c1, c2, c3) } v4.FourBytesToInt(b0, b1, b2, b3) == v4.FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

axiom (forall x: int :: { v4.Base(x) } v4.INT_LEQ(v4.Base(x), x));

axiom (forall a: int, t: name :: { v4.Match(a, v4.T.Ptr(t)) } v4.Match(a, v4.T.Ptr(t)) <==> v4.Field(a) == v4.T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { v4.MatchBase(b, a, v4.T.Ptr(t)) } v4.MatchBase(b, a, v4.T.Ptr(t)) <==> v4.Base(a) == b);

axiom (forall v: int, t: name :: { v4.HasType(v, v4.T.Ptr(t)) } v4.HasType(v, v4.T.Ptr(t)) <==> v == 0 || (v4.INT_GT(v, 0) && v4.Match(v, t) && v4.MatchBase(v4.Base(v), v, t)));

axiom (forall x: int, y: int :: {:extern} { v4.INT_EQ(x, y): bool } v4.INT_EQ(x, y): bool <==> x == y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_NEQ(x, y): bool } v4.INT_NEQ(x, y): bool <==> x != y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_ADD(x, y): int } v4.INT_ADD(x, y): int == x + y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_SUB(x, y): int } v4.INT_SUB(x, y): int == x - y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_LT(x, y): bool } v4.INT_LT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_ULT(x, y): bool } v4.INT_ULT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_LEQ(x, y): bool } v4.INT_LEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_ULEQ(x, y): bool } v4.INT_ULEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_GT(x, y): bool } v4.INT_GT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_UGT(x, y): bool } v4.INT_UGT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_GEQ(x, y): bool } v4.INT_GEQ(x, y): bool <==> x >= y);

axiom (forall x: int, y: int :: {:extern} { v4.INT_UGEQ(x, y): bool } v4.INT_UGEQ(x, y): bool <==> x >= y);

axiom (forall a: int, b: int :: { v4.INT_AND(a, b) } a == b ==> v4.INT_AND(a, b) == a);

axiom (forall a: int, b: int :: { v4.INT_AND(a, b) } v4.POW2(a) && v4.POW2(b) && a != b ==> v4.INT_AND(a, b) == 0);

axiom (forall a: int, b: int :: { v4.INT_AND(a, b) } a == 0 || b == 0 ==> v4.INT_AND(a, b) == 0);

axiom v4.POW2(1);

axiom v4.POW2(2);

axiom v4.POW2(4);

axiom v4.POW2(8);

axiom v4.POW2(16);

axiom v4.POW2(32);

axiom v4.POW2(64);

axiom v4.POW2(128);

axiom v4.POW2(256);

axiom v4.POW2(512);

axiom v4.POW2(1024);

axiom v4.POW2(2048);

axiom v4.POW2(4096);

axiom v4.POW2(8192);

axiom v4.POW2(16384);

axiom v4.POW2(32768);

axiom v4.POW2(65536);

axiom v4.POW2(131072);

axiom v4.POW2(262144);

axiom v4.POW2(524288);

axiom v4.POW2(1048576);

axiom v4.POW2(2097152);

axiom v4.POW2(4194304);

axiom v4.POW2(8388608);

axiom v4.POW2(16777216);

axiom v4.POW2(33554432);

axiom (forall a: int, b: int, size: int :: { v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } size * v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) <= a - b && a - b < size * (v4.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) + 1));

axiom (forall a: int, a_size: int, b: int :: { v4.INT_MINUS_LEFT_PTR(a, a_size, b) } v4.INT_MINUS_LEFT_PTR(a, a_size, b) == a - a_size * b);

axiom (forall a: int, a_size: int, b: int :: { v4.INT_PLUS(a, a_size, b) } v4.INT_PLUS(a, a_size, b) == a + a_size * b);

axiom (forall a: int, b: int :: { v4.INT_MULT(a, b) } v4.INT_MULT(a, b) == a * b);

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a >= 0 && b > 0 ==> b * v4.INT_DIV(a, b) <= a && a < b * (v4.INT_DIV(a, b) + 1));

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a >= 0 && b < 0 ==> b * v4.INT_DIV(a, b) <= a && a < b * (v4.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a < 0 && b > 0 ==> b * v4.INT_DIV(a, b) >= a && a > b * (v4.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v4.INT_DIV(a, b) } a < 0 && b < 0 ==> b * v4.INT_DIV(a, b) >= a && a > b * (v4.INT_DIV(a, b) + 1));

axiom (forall x: bv32, y: bv32 :: {:extern} { v4.BV32_EQ(x, y): bool } v4.BV32_EQ(x, y): bool <==> x == y);

axiom (forall x: bv32, y: bv32 :: {:extern} { v4.BV32_NEQ(x, y): bool } v4.BV32_NEQ(x, y): bool <==> x != y);

axiom (forall a: bv32, b: bv32, size: bv32 :: {:extern} { v4.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 } v4.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 == v4.BV32_DIV(v4.BV32_SUB(a, b), size));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v4.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 } v4.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 == v4.BV32_SUB(a, v4.BV32_MULT(a_size, b)));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v4.BV32_PLUS(a, a_size, b): bv32 } v4.BV32_PLUS(a, a_size, b): bv32 == v4.BV32_ADD(a, v4.BV32_MULT(a_size, b)));

axiom (forall a: bool, b: int, c: int :: { v4.choose(a, b, c) } a ==> v4.choose(a, b, c) == b);

axiom (forall a: bool, b: int, c: int :: { v4.choose(a, b, c) } !a ==> v4.choose(a, b, c) == c);

axiom (forall a: bool :: { v4.LIFT(a) } a <==> v4.LIFT(a) != 0);

axiom (forall a: int :: { v4.PTR_NOT(a) } a == 0 ==> v4.PTR_NOT(a) != 0);

axiom (forall a: int :: { v4.PTR_NOT(a) } a != 0 ==> v4.PTR_NOT(a) == 0);

axiom (forall a: int :: { v4.NULL_CHECK(a) } a == 0 ==> v4.NULL_CHECK(a) != 0);

axiom (forall a: int :: { v4.NULL_CHECK(a) } a != 0 ==> v4.NULL_CHECK(a) == 0);

axiom (forall n: int, x: int, y: int :: { v4.AtLeast(n, x)[y] } v4.AtLeast(n, x)[y] ==> v4.INT_LEQ(x, y) && v4.Rep(n, x) == v4.Rep(n, y));

axiom (forall n: int, x: int, y: int :: { v4.AtLeast(n, x), v4.Rep(n, x), v4.Rep(n, y) } v4.INT_LEQ(x, y) && v4.Rep(n, x) == v4.Rep(n, y) ==> v4.AtLeast(n, x)[y]);

axiom (forall n: int, x: int :: { v4.AtLeast(n, x) } v4.AtLeast(n, x)[x]);

axiom (forall n: int, x: int, z: int :: { v4.INT_PLUS(x, n, z) } v4.Rep(n, x) == v4.Rep(n, v4.INT_PLUS(x, n, z)));

axiom (forall n: int, x: int :: { v4.Rep(n, x) } (exists k: int :: v4.INT_SUB(v4.Rep(n, x), x) == v4.INT_MULT(n, k)));

axiom (forall x: int, n: int, z: int :: { v4.Array(x, n, z) } v4.INT_LEQ(z, 0) ==> v4.Equal(v4.Array(x, n, z), v4.Empty()));

axiom (forall x: int, n: int, z: int :: { v4.Array(x, n, z) } v4.INT_GT(z, 0) ==> v4.Equal(v4.Array(x, n, z), v4.Difference(v4.AtLeast(n, x), v4.AtLeast(n, v4.INT_PLUS(x, n, z)))));

axiom (forall x: int :: !v4.Empty()[x]);

axiom (forall x: int :: v4.SetTrue()[x]);

axiom (forall x: int, y: int :: { v4.Singleton(y)[x] } v4.Singleton(y)[x] <==> x == y);

axiom (forall y: int :: { v4.Singleton(y) } v4.Singleton(y)[y]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v4.Union(S, T)[x] } { v4.Union(S, T), S[x] } { v4.Union(S, T), T[x] } v4.Union(S, T)[x] <==> S[x] || T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v4.Intersection(S, T)[x] } { v4.Intersection(S, T), S[x] } { v4.Intersection(S, T), T[x] } v4.Intersection(S, T)[x] <==> S[x] && T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v4.Difference(S, T)[x] } { v4.Difference(S, T), S[x] } { v4.Difference(S, T), T[x] } v4.Difference(S, T)[x] <==> S[x] && !T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v4.Equal(S, T) } v4.Equal(S, T) <==> v4.Subset(S, T) && v4.Subset(T, S));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v4.Subset(S, T) } { T[x], v4.Subset(S, T) } S[x] && v4.Subset(S, T) ==> T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v4.Subset(S, T) } v4.Subset(S, T) || (exists x: int :: S[x] && !T[x]));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v4.Disjoint(S, T) } { T[x], v4.Disjoint(S, T) } !(S[x] && v4.Disjoint(S, T) && T[x]));

axiom (forall S: [int]bool, T: [int]bool :: { v4.Disjoint(S, T) } v4.Disjoint(S, T) || (exists x: int :: S[x] && T[x]));

axiom (forall f: [int]int, x: int :: { v4.Inverse(f, f[x]) } v4.Inverse(f, f[x])[x]);

axiom (forall f: [int]int, x: int, y: int :: { v4.Inverse(f, y), f[x] } v4.Inverse(f, y)[x] ==> f[x] == y);

axiom (forall f: [int]int, x: int, y: int :: { v4.Inverse(f[x := y], y) } v4.Equal(v4.Inverse(f[x := y], y), v4.Union(v4.Inverse(f, y), v4.Singleton(x))));

axiom (forall f: [int]int, x: int, y: int, z: int :: { v4.Inverse(f[x := y], z) } y == z || v4.Equal(v4.Inverse(f[x := y], z), v4.Difference(v4.Inverse(f, z), v4.Singleton(x))));

axiom (forall x: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M)[x] } v4.Dereference(S, M)[x] ==> (exists y: int :: x == M[y] && S[y]));

axiom (forall x: int, S: [int]bool, M: [int]int :: { M[x], S[x], v4.Dereference(S, M) } S[x] ==> v4.Dereference(S, M)[M[x]]);

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M[x := y]) } !S[x] ==> v4.Equal(v4.Dereference(S, M[x := y]), v4.Dereference(S, M)));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M[x := y]) } S[x] && v4.Equal(v4.Intersection(v4.Inverse(M, M[x]), S), v4.Singleton(x)) ==> v4.Equal(v4.Dereference(S, M[x := y]), v4.Union(v4.Difference(v4.Dereference(S, M), v4.Singleton(M[x])), v4.Singleton(y))));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v4.Dereference(S, M[x := y]) } S[x] && !v4.Equal(v4.Intersection(v4.Inverse(M, M[x]), S), v4.Singleton(x)) ==> v4.Equal(v4.Dereference(S, M[x := y]), v4.Union(v4.Dereference(S, M), v4.Singleton(y))));

axiom (forall M: [name][int]int, x: int :: { v4.Unified(M)[x] } v4.Unified(M)[x] == M[v4.Field(x)][x]);

axiom (forall M: [name][int]int, x: int, y: int :: { v4.Unified(M[v4.Field(x) := M[v4.Field(x)][x := y]]) } v4.Unified(M[v4.Field(x) := M[v4.Field(x)][x := y]]) == v4.Unified(M)[x := y]);

procedure v3.havoc_assert(i: int);



procedure v3.havoc_assume(i: int);



procedure v3.__HAVOC_free(a: int);



procedure v3.__HAVOC_malloc(obj_size: int) returns (new: int);
  modifies v4.alloc;
  free ensures new == _uf_v4.__HAVOC_malloc_new(obj_size, old(v4.alloc));
  free ensures v4.alloc == _uf_v4.__HAVOC_malloc_v4.alloc(obj_size, old(v4.alloc));



procedure v3.__HAVOC_det_malloc(obj_size: int) returns (new: int);
  modifies v4.alloc;
  free ensures new == _uf_v4.__HAVOC_det_malloc_new(obj_size, old(v4.alloc));
  free ensures v4.alloc == _uf_v4.__HAVOC_det_malloc_v4.alloc(obj_size, old(v4.alloc));



procedure v3.__HAVOC_memset_split_1(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v4.__HAVOC_memset_split_1_ret(A, p, c, n);



procedure v3.__HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v4.__HAVOC_memset_split_2_ret(A, p, c, n);



procedure v3.__HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v4.__HAVOC_memset_split_4_ret(A, p, c, n);



procedure v3.nondet_choice() returns (x: int);
  free ensures x == _uf_v4.nondet_choice_x();



procedure v3.det_choice() returns (x: int);
  modifies v4.detChoiceCnt;
  free ensures x == _uf_v4.det_choice_x(old(v4.detChoiceCnt));
  free ensures v4.detChoiceCnt == _uf_v4.det_choice_v4.detChoiceCnt(old(v4.detChoiceCnt));



procedure v3._strdup(str: int) returns (new: int);
  free ensures new == _uf_v4._strdup_new(str);



procedure v3._xstrcasecmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v4._xstrcasecmp_ret(a0, a1);



procedure v3._xstrcmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v4._xstrcmp_ret(a0, a1);



procedure {:inline 1} v3.callee() returns (result.callee$1: int);
  free ensures result.callee$1 == _uf_v4.callee_result.callee$1();



implementation {:inline 1} v3.callee() returns (result.callee$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.callee$1 := 0;
    x := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 2} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 2} true;
    x := 1;
    assume v4.value_is(v3.__ctobpl_const_1, x);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 3} true;
    assume v4.value_is(v3.__ctobpl_const_2, x);
    x := v4.INT_PLUS(x, 1, 1);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 4} true;
    result.callee$1 := x;
    assume v4.value_is(v3.__ctobpl_const_3, x);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 5} true;
    return;
}



type {:extern} name;

type {:extern} byte;

function v4.v4.bv32ToInt(arg_0: bv32) : int;

function v4.v4.intToBv32(arg_0: int) : bv32;

function _uf_v4.__HAVOC_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v4.__HAVOC_malloc_v4.alloc(arg_0: int, arg_1: int) : int;

function _uf_v3.__HAVOC_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v3.__HAVOC_malloc_v4.alloc(arg_0: int, arg_1: int) : int;

function _uf_v4.__HAVOC_det_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v4.__HAVOC_det_malloc_v4.alloc(arg_0: int, arg_1: int) : int;

function _uf_v3.__HAVOC_det_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v3.__HAVOC_det_malloc_v4.alloc(arg_0: int, arg_1: int) : int;

function _uf_v4.__HAVOC_memset_split_1_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v3.__HAVOC_memset_split_1_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v4.__HAVOC_memset_split_2_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v3.__HAVOC_memset_split_2_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v4.__HAVOC_memset_split_4_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v3.__HAVOC_memset_split_4_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v4.nondet_choice_x() : int;

function _uf_v3.nondet_choice_x() : int;

function _uf_v4.det_choice_x(arg_0: int) : int;

function _uf_v4.det_choice_v4.detChoiceCnt(arg_0: int) : int;

function _uf_v3.det_choice_x(arg_0: int) : int;

function _uf_v3.det_choice_v4.detChoiceCnt(arg_0: int) : int;

function _uf_v4._strdup_new(arg_0: int) : int;

function _uf_v3._strdup_new(arg_0: int) : int;

function _uf_v4._xstrcasecmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v3._xstrcasecmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v4._xstrcmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v3._xstrcmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v4.callee_result.callee$1() : int;

function _uf_v3.callee_result.callee$1() : int;

var Output_of_v3.callee_result.callee$1: int;

var Output_of_v4.callee_result.callee$1: int;

procedure EQ_v3.callee__xx__v4.callee() returns (AA_TEMP30: bool);
  modifies Output_of_v3.callee_result.callee$1, Output_of_v4.callee_result.callee$1;
  ensures AA_TEMP30;



implementation EQ_v3.callee__xx__v4.callee() returns (AA_TEMP30: bool)
{
  var AA_TEMP20: int;
  var result.callee$1: int;
  var inline$v3.callee$0$havoc_stringTemp: int;
  var inline$v3.callee$0$condVal: int;
  var inline$v3.callee$0$x: int;
  var inline$v3.callee$0$tempBoogie0: int;
  var inline$v3.callee$0$tempBoogie1: int;
  var inline$v3.callee$0$tempBoogie2: int;
  var inline$v3.callee$0$tempBoogie3: int;
  var inline$v3.callee$0$tempBoogie4: int;
  var inline$v3.callee$0$tempBoogie5: int;
  var inline$v3.callee$0$tempBoogie6: int;
  var inline$v3.callee$0$tempBoogie7: int;
  var inline$v3.callee$0$tempBoogie8: int;
  var inline$v3.callee$0$tempBoogie9: int;
  var inline$v3.callee$0$tempBoogie10: int;
  var inline$v3.callee$0$tempBoogie11: int;
  var inline$v3.callee$0$tempBoogie12: int;
  var inline$v3.callee$0$tempBoogie13: int;
  var inline$v3.callee$0$tempBoogie14: int;
  var inline$v3.callee$0$tempBoogie15: int;
  var inline$v3.callee$0$tempBoogie16: int;
  var inline$v3.callee$0$tempBoogie17: int;
  var inline$v3.callee$0$tempBoogie18: int;
  var inline$v3.callee$0$tempBoogie19: int;
  var inline$v3.callee$0$__havoc_dummy_return: int;
  var inline$v3.callee$0$result.callee$1: int;
  var inline$v4.callee$0$havoc_stringTemp: int;
  var inline$v4.callee$0$condVal: int;
  var inline$v4.callee$0$x: int;
  var inline$v4.callee$0$tempBoogie0: int;
  var inline$v4.callee$0$tempBoogie1: int;
  var inline$v4.callee$0$tempBoogie2: int;
  var inline$v4.callee$0$tempBoogie3: int;
  var inline$v4.callee$0$tempBoogie4: int;
  var inline$v4.callee$0$tempBoogie5: int;
  var inline$v4.callee$0$tempBoogie6: int;
  var inline$v4.callee$0$tempBoogie7: int;
  var inline$v4.callee$0$tempBoogie8: int;
  var inline$v4.callee$0$tempBoogie9: int;
  var inline$v4.callee$0$tempBoogie10: int;
  var inline$v4.callee$0$tempBoogie11: int;
  var inline$v4.callee$0$tempBoogie12: int;
  var inline$v4.callee$0$tempBoogie13: int;
  var inline$v4.callee$0$tempBoogie14: int;
  var inline$v4.callee$0$tempBoogie15: int;
  var inline$v4.callee$0$tempBoogie16: int;
  var inline$v4.callee$0$tempBoogie17: int;
  var inline$v4.callee$0$tempBoogie18: int;
  var inline$v4.callee$0$tempBoogie19: int;
  var inline$v4.callee$0$__havoc_dummy_return: int;
  var inline$v4.callee$0$result.callee$1: int;

  AA_INSTR_EQ_BODY:
    goto inline$v3.callee$0$Entry;

  inline$v3.callee$0$Entry:
    goto inline$v3.callee$0$anon0#2;

  inline$v3.callee$0$anon0#2:
    inline$v3.callee$0$havoc_stringTemp := 0;
    goto inline$v3.callee$0$start#2;

  inline$v3.callee$0$start#2:
    inline$v3.callee$0$result.callee$1 := 0;
    inline$v3.callee$0$x := 0;
    goto inline$v3.callee$0$label_3#2;

  inline$v3.callee$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 2} true;
    goto inline$v3.callee$0$label_4#2;

  inline$v3.callee$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 2} true;
    inline$v3.callee$0$x := 1;
    assume v4.value_is(v3.__ctobpl_const_1, inline$v3.callee$0$x);
    goto inline$v3.callee$0$label_5#2;

  inline$v3.callee$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 3} true;
    assume v4.value_is(v3.__ctobpl_const_2, inline$v3.callee$0$x);
    inline$v3.callee$0$x := v4.INT_PLUS(inline$v3.callee$0$x, 1, 1);
    goto inline$v3.callee$0$label_6#2;

  inline$v3.callee$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 4} true;
    inline$v3.callee$0$result.callee$1 := inline$v3.callee$0$x;
    assume v4.value_is(v3.__ctobpl_const_3, inline$v3.callee$0$x);
    goto inline$v3.callee$0$label_1#2;

  inline$v3.callee$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v3\tcas.c"} {:sourceline 5} true;
    goto inline$v3.callee$0$Return;

  inline$v3.callee$0$Return:
    assume true;
    result.callee$1 := inline$v3.callee$0$result.callee$1;
    goto AA_INSTR_EQ_BODY$1;

  AA_INSTR_EQ_BODY$1:
    AA_TEMP20 := result.callee$1;
    goto inline$v4.callee$0$Entry;

  inline$v4.callee$0$Entry:
    goto inline$v4.callee$0$anon0#2;

  inline$v4.callee$0$anon0#2:
    inline$v4.callee$0$havoc_stringTemp := 0;
    goto inline$v4.callee$0$start#2;

  inline$v4.callee$0$start#2:
    inline$v4.callee$0$result.callee$1 := 0;
    inline$v4.callee$0$x := 0;
    goto inline$v4.callee$0$label_3#2;

  inline$v4.callee$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 2} true;
    goto inline$v4.callee$0$label_4#2;

  inline$v4.callee$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 2} true;
    inline$v4.callee$0$x := 2;
    assume v4.value_is(v4.__ctobpl_const_1, inline$v4.callee$0$x);
    goto inline$v4.callee$0$label_5#2;

  inline$v4.callee$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 3} true;
    assume v4.value_is(v4.__ctobpl_const_2, inline$v4.callee$0$x);
    inline$v4.callee$0$x := v4.INT_PLUS(inline$v4.callee$0$x, 1, 1);
    goto inline$v4.callee$0$label_6#2;

  inline$v4.callee$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 4} true;
    inline$v4.callee$0$result.callee$1 := inline$v4.callee$0$x;
    assume v4.value_is(v4.__ctobpl_const_3, inline$v4.callee$0$x);
    goto inline$v4.callee$0$label_1#2;

  inline$v4.callee$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v4\tcas.c"} {:sourceline 5} true;
    goto inline$v4.callee$0$Return;

  inline$v4.callee$0$Return:
    assume true;
    result.callee$1 := inline$v4.callee$0$result.callee$1;
    goto AA_INSTR_EQ_BODY$2;

  AA_INSTR_EQ_BODY$2:
    Output_of_v3.callee_result.callee$1 := AA_TEMP20;
    Output_of_v4.callee_result.callee$1 := result.callee$1;
    AA_TEMP30 := AA_TEMP20 == result.callee$1;
    return;
}


