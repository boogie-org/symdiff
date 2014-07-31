var {:extern} v2.Mem: [name][int]int;

var {:extern} v2.alloc: int;

var {:extern} v2.Mem_T.INT4: [int]int;

var {:extern} v2.detChoiceCnt: int;

var {:extern} v2.Res_KERNEL_SOURCE: [int]int;

var {:extern} v2.Res_PROBED: [int]int;

const {:extern} unique v2.T.INT4: name;

const {:extern} unique v2.T.PINT4: name;

const {:extern} {:model_const "result.callee"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceLine 2} unique v2.__ctobpl_const_4: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceLine 6} unique v2.__ctobpl_const_1: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceLine 7} unique v2.__ctobpl_const_2: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceLine 8} unique v2.__ctobpl_const_3: int;

function {:extern} v2.OneByteToInt(arg_0: byte) : int;

function {:extern} v2.TwoBytesToInt(arg_0: byte, arg_1: byte) : int;

function {:extern} v2.FourBytesToInt(arg_0: byte, arg_1: byte, arg_2: byte, arg_3: byte) : int;

function {:extern} v2.Field(arg_0: int) : name;

function {:extern} v2.Base(arg_0: int) : int;

function {:extern} v2.Match(a: int, t: name) : bool;

function {:extern} v2.MatchBase(b: int, a: int, t: name) : bool;

function {:extern} v2.HasType(v: int, t: name) : bool;

function {:extern} v2.T.Ptr(t: name) : name;

function {:extern} v2.INT_EQ(x: int, y: int) : bool;

function {:extern} v2.INT_NEQ(x: int, y: int) : bool;

function {:extern} v2.INT_ADD(x: int, y: int) : int;

function {:extern} v2.INT_SUB(x: int, y: int) : int;

function {:extern} v2.INT_LT(x: int, y: int) : bool;

function {:extern} v2.INT_ULT(x: int, y: int) : bool;

function {:extern} v2.INT_LEQ(x: int, y: int) : bool;

function {:extern} v2.INT_ULEQ(x: int, y: int) : bool;

function {:extern} v2.INT_GT(x: int, y: int) : bool;

function {:extern} v2.INT_UGT(x: int, y: int) : bool;

function {:extern} v2.INT_GEQ(x: int, y: int) : bool;

function {:extern} v2.INT_UGEQ(x: int, y: int) : bool;

function {:extern} v2.INT_AND(a: int, b: int) : int;

function {:extern} v2.INT_OR(a: int, b: int) : int;

function {:extern} v2.INT_XOR(a: int, b: int) : int;

function {:extern} v2.INT_NOT(a: int) : int;

function {:extern} v2.POW2(a: int) : bool;

function {:extern} v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a: int, b: int, size: int) : int;

function {:extern} v2.INT_MINUS_LEFT_PTR(a: int, a_size: int, b: int) : int;

function {:extern} v2.INT_PLUS(a: int, a_size: int, b: int) : int;

function {:extern} v2.INT_MULT(a: int, b: int) : int;

function {:extern} v2.INT_DIV(a: int, b: int) : int;

function {:extern} v2.INT_BINARY_BOTH_INT(a: int, b: int) : int;

function {:extern} v2.BV32_EQ(x: bv32, y: bv32) : bool;

function {:extern} v2.BV32_NEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvadd"} v2.BV32_ADD(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvsub"} v2.BV32_SUB(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvmul"} v2.BV32_MULT(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvudiv"} v2.BV32_DIV(x: bv32, y: bv32) : bv32;

function {:extern} {:bvbuiltin "bvult"} v2.BV32_ULT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvslt"} v2.BV32_LT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvule"} v2.BV32_ULEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsle"} v2.BV32_LEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvugt"} v2.BV32_UGT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsgt"} v2.BV32_GT(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvuge"} v2.BV32_UGEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvsge"} v2.BV32_GEQ(x: bv32, y: bv32) : bool;

function {:extern} {:bvbuiltin "bvand"} v2.BV32_AND(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvor"} v2.BV32_OR(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvxor"} v2.BV32_XOR(a: bv32, b: bv32) : bv32;

function {:extern} {:bvbuiltin "bvnot"} v2.BV32_NOT(a: bv32) : bv32;

function {:extern} v2.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a: bv32, b: bv32, size: bv32) : bv32;

function {:extern} v2.BV32_MINUS_LEFT_PTR(a: bv32, a_size: bv32, b: bv32) : bv32;

function {:extern} v2.BV32_PLUS(a: bv32, a_size: bv32, b: bv32) : bv32;

function {:extern} v2.BV32_BINARY_BOTH_INT(a: bv32, b: bv32) : bv32;

function {:extern} v2.bv32ToInt(arg_0: bv32) : int;

function {:extern} v2.intToBv32(arg_0: int) : bv32;

function {:extern} v2.choose(a: bool, b: int, c: int) : int;

function {:extern} v2.LIFT(a: bool) : int;

function {:extern} v2.PTR_NOT(a: int) : int;

function {:extern} v2.NULL_CHECK(a: int) : int;

function {:extern} v2.NewAlloc(x: int, y: int) : int;

function {:extern} v2.DetChoiceFunc(a: int) : int;

function {:extern} v2.Equal(arg_0: [int]bool, arg_1: [int]bool) : bool;

function {:extern} v2.Subset(arg_0: [int]bool, arg_1: [int]bool) : bool;

function {:extern} v2.Disjoint(arg_0: [int]bool, arg_1: [int]bool) : bool;

function {:extern} v2.Empty() : [int]bool;

function {:extern} v2.SetTrue() : [int]bool;

function {:extern} v2.Singleton(arg_0: int) : [int]bool;

function {:extern} v2.Reachable(arg_0: [int,int]bool, arg_1: int) : [int]bool;

function {:extern} v2.Union(arg_0: [int]bool, arg_1: [int]bool) : [int]bool;

function {:extern} v2.Intersection(arg_0: [int]bool, arg_1: [int]bool) : [int]bool;

function {:extern} v2.Difference(arg_0: [int]bool, arg_1: [int]bool) : [int]bool;

function {:extern} v2.Dereference(arg_0: [int]bool, arg_1: [int]int) : [int]bool;

function {:extern} v2.Inverse(f: [int]int, x: int) : [int]bool;

function {:extern} v2.AtLeast(arg_0: int, arg_1: int) : [int]bool;

function {:extern} v2.Rep(arg_0: int, arg_1: int) : int;

function {:extern} v2.Array(arg_0: int, arg_1: int, arg_2: int) : [int]bool;

function {:extern} v2.Unified(arg_0: [name][int]int) : [int]int;

function {:extern} v2.value_is(c: int, e: int) : bool;

axiom (forall b0: byte, c0: byte :: { v2.OneByteToInt(b0), v2.OneByteToInt(c0) } v2.OneByteToInt(b0) == v2.OneByteToInt(c0) ==> b0 == c0);

axiom (forall b0: byte, b1: byte, c0: byte, c1: byte :: { v2.TwoBytesToInt(b0, b1), v2.TwoBytesToInt(c0, c1) } v2.TwoBytesToInt(b0, b1) == v2.TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);

axiom (forall b0: byte, b1: byte, b2: byte, b3: byte, c0: byte, c1: byte, c2: byte, c3: byte :: { v2.FourBytesToInt(b0, b1, b2, b3), v2.FourBytesToInt(c0, c1, c2, c3) } v2.FourBytesToInt(b0, b1, b2, b3) == v2.FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

axiom (forall x: int :: { v2.Base(x) } v2.INT_LEQ(v2.Base(x), x));

axiom (forall a: int, t: name :: { v2.Match(a, v2.T.Ptr(t)) } v2.Match(a, v2.T.Ptr(t)) <==> v2.Field(a) == v2.T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { v2.MatchBase(b, a, v2.T.Ptr(t)) } v2.MatchBase(b, a, v2.T.Ptr(t)) <==> v2.Base(a) == b);

axiom (forall v: int, t: name :: { v2.HasType(v, v2.T.Ptr(t)) } v2.HasType(v, v2.T.Ptr(t)) <==> v == 0 || (v2.INT_GT(v, 0) && v2.Match(v, t) && v2.MatchBase(v2.Base(v), v, t)));

axiom (forall x: int, y: int :: {:extern} { v2.INT_EQ(x, y): bool } v2.INT_EQ(x, y): bool <==> x == y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_NEQ(x, y): bool } v2.INT_NEQ(x, y): bool <==> x != y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_ADD(x, y): int } v2.INT_ADD(x, y): int == x + y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_SUB(x, y): int } v2.INT_SUB(x, y): int == x - y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_LT(x, y): bool } v2.INT_LT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_ULT(x, y): bool } v2.INT_ULT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_LEQ(x, y): bool } v2.INT_LEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_ULEQ(x, y): bool } v2.INT_ULEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_GT(x, y): bool } v2.INT_GT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_UGT(x, y): bool } v2.INT_UGT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_GEQ(x, y): bool } v2.INT_GEQ(x, y): bool <==> x >= y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_UGEQ(x, y): bool } v2.INT_UGEQ(x, y): bool <==> x >= y);

axiom (forall a: int, b: int :: { v2.INT_AND(a, b) } a == b ==> v2.INT_AND(a, b) == a);

axiom (forall a: int, b: int :: { v2.INT_AND(a, b) } v2.POW2(a) && v2.POW2(b) && a != b ==> v2.INT_AND(a, b) == 0);

axiom (forall a: int, b: int :: { v2.INT_AND(a, b) } a == 0 || b == 0 ==> v2.INT_AND(a, b) == 0);

axiom v2.POW2(1);

axiom v2.POW2(2);

axiom v2.POW2(4);

axiom v2.POW2(8);

axiom v2.POW2(16);

axiom v2.POW2(32);

axiom v2.POW2(64);

axiom v2.POW2(128);

axiom v2.POW2(256);

axiom v2.POW2(512);

axiom v2.POW2(1024);

axiom v2.POW2(2048);

axiom v2.POW2(4096);

axiom v2.POW2(8192);

axiom v2.POW2(16384);

axiom v2.POW2(32768);

axiom v2.POW2(65536);

axiom v2.POW2(131072);

axiom v2.POW2(262144);

axiom v2.POW2(524288);

axiom v2.POW2(1048576);

axiom v2.POW2(2097152);

axiom v2.POW2(4194304);

axiom v2.POW2(8388608);

axiom v2.POW2(16777216);

axiom v2.POW2(33554432);

axiom (forall a: int, b: int, size: int :: { v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } size * v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) <= a - b && a - b < size * (v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) + 1));

axiom (forall a: int, a_size: int, b: int :: { v2.INT_MINUS_LEFT_PTR(a, a_size, b) } v2.INT_MINUS_LEFT_PTR(a, a_size, b) == a - a_size * b);

axiom (forall a: int, a_size: int, b: int :: { v2.INT_PLUS(a, a_size, b) } v2.INT_PLUS(a, a_size, b) == a + a_size * b);

axiom (forall a: int, b: int :: { v2.INT_MULT(a, b) } v2.INT_MULT(a, b) == a * b);

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a >= 0 && b > 0 ==> b * v2.INT_DIV(a, b) <= a && a < b * (v2.INT_DIV(a, b) + 1));

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a >= 0 && b < 0 ==> b * v2.INT_DIV(a, b) <= a && a < b * (v2.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a < 0 && b > 0 ==> b * v2.INT_DIV(a, b) >= a && a > b * (v2.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a < 0 && b < 0 ==> b * v2.INT_DIV(a, b) >= a && a > b * (v2.INT_DIV(a, b) + 1));

axiom (forall x: bv32, y: bv32 :: {:extern} { v2.BV32_EQ(x, y): bool } v2.BV32_EQ(x, y): bool <==> x == y);

axiom (forall x: bv32, y: bv32 :: {:extern} { v2.BV32_NEQ(x, y): bool } v2.BV32_NEQ(x, y): bool <==> x != y);

axiom (forall a: bv32, b: bv32, size: bv32 :: {:extern} { v2.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 } v2.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 == v2.BV32_DIV(v2.BV32_SUB(a, b), size));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v2.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 } v2.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 == v2.BV32_SUB(a, v2.BV32_MULT(a_size, b)));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v2.BV32_PLUS(a, a_size, b): bv32 } v2.BV32_PLUS(a, a_size, b): bv32 == v2.BV32_ADD(a, v2.BV32_MULT(a_size, b)));

axiom (forall a: bool, b: int, c: int :: { v2.choose(a, b, c) } a ==> v2.choose(a, b, c) == b);

axiom (forall a: bool, b: int, c: int :: { v2.choose(a, b, c) } !a ==> v2.choose(a, b, c) == c);

axiom (forall a: bool :: { v2.LIFT(a) } a <==> v2.LIFT(a) != 0);

axiom (forall a: int :: { v2.PTR_NOT(a) } a == 0 ==> v2.PTR_NOT(a) != 0);

axiom (forall a: int :: { v2.PTR_NOT(a) } a != 0 ==> v2.PTR_NOT(a) == 0);

axiom (forall a: int :: { v2.NULL_CHECK(a) } a == 0 ==> v2.NULL_CHECK(a) != 0);

axiom (forall a: int :: { v2.NULL_CHECK(a) } a != 0 ==> v2.NULL_CHECK(a) == 0);

axiom (forall n: int, x: int, y: int :: { v2.AtLeast(n, x)[y] } v2.AtLeast(n, x)[y] ==> v2.INT_LEQ(x, y) && v2.Rep(n, x) == v2.Rep(n, y));

axiom (forall n: int, x: int, y: int :: { v2.AtLeast(n, x), v2.Rep(n, x), v2.Rep(n, y) } v2.INT_LEQ(x, y) && v2.Rep(n, x) == v2.Rep(n, y) ==> v2.AtLeast(n, x)[y]);

axiom (forall n: int, x: int :: { v2.AtLeast(n, x) } v2.AtLeast(n, x)[x]);

axiom (forall n: int, x: int, z: int :: { v2.INT_PLUS(x, n, z) } v2.Rep(n, x) == v2.Rep(n, v2.INT_PLUS(x, n, z)));

axiom (forall n: int, x: int :: { v2.Rep(n, x) } (exists k: int :: v2.INT_SUB(v2.Rep(n, x), x) == v2.INT_MULT(n, k)));

axiom (forall x: int, n: int, z: int :: { v2.Array(x, n, z) } v2.INT_LEQ(z, 0) ==> v2.Equal(v2.Array(x, n, z), v2.Empty()));

axiom (forall x: int, n: int, z: int :: { v2.Array(x, n, z) } v2.INT_GT(z, 0) ==> v2.Equal(v2.Array(x, n, z), v2.Difference(v2.AtLeast(n, x), v2.AtLeast(n, v2.INT_PLUS(x, n, z)))));

axiom (forall x: int :: !v2.Empty()[x]);

axiom (forall x: int :: v2.SetTrue()[x]);

axiom (forall x: int, y: int :: { v2.Singleton(y)[x] } v2.Singleton(y)[x] <==> x == y);

axiom (forall y: int :: { v2.Singleton(y) } v2.Singleton(y)[y]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v2.Union(S, T)[x] } { v2.Union(S, T), S[x] } { v2.Union(S, T), T[x] } v2.Union(S, T)[x] <==> S[x] || T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v2.Intersection(S, T)[x] } { v2.Intersection(S, T), S[x] } { v2.Intersection(S, T), T[x] } v2.Intersection(S, T)[x] <==> S[x] && T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v2.Difference(S, T)[x] } { v2.Difference(S, T), S[x] } { v2.Difference(S, T), T[x] } v2.Difference(S, T)[x] <==> S[x] && !T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v2.Equal(S, T) } v2.Equal(S, T) <==> v2.Subset(S, T) && v2.Subset(T, S));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v2.Subset(S, T) } { T[x], v2.Subset(S, T) } S[x] && v2.Subset(S, T) ==> T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v2.Subset(S, T) } v2.Subset(S, T) || (exists x: int :: S[x] && !T[x]));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v2.Disjoint(S, T) } { T[x], v2.Disjoint(S, T) } !(S[x] && v2.Disjoint(S, T) && T[x]));

axiom (forall S: [int]bool, T: [int]bool :: { v2.Disjoint(S, T) } v2.Disjoint(S, T) || (exists x: int :: S[x] && T[x]));

axiom (forall f: [int]int, x: int :: { v2.Inverse(f, f[x]) } v2.Inverse(f, f[x])[x]);

axiom (forall f: [int]int, x: int, y: int :: { v2.Inverse(f, y), f[x] } v2.Inverse(f, y)[x] ==> f[x] == y);

axiom (forall f: [int]int, x: int, y: int :: { v2.Inverse(f[x := y], y) } v2.Equal(v2.Inverse(f[x := y], y), v2.Union(v2.Inverse(f, y), v2.Singleton(x))));

axiom (forall f: [int]int, x: int, y: int, z: int :: { v2.Inverse(f[x := y], z) } y == z || v2.Equal(v2.Inverse(f[x := y], z), v2.Difference(v2.Inverse(f, z), v2.Singleton(x))));

axiom (forall x: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M)[x] } v2.Dereference(S, M)[x] ==> (exists y: int :: x == M[y] && S[y]));

axiom (forall x: int, S: [int]bool, M: [int]int :: { M[x], S[x], v2.Dereference(S, M) } S[x] ==> v2.Dereference(S, M)[M[x]]);

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M[x := y]) } !S[x] ==> v2.Equal(v2.Dereference(S, M[x := y]), v2.Dereference(S, M)));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M[x := y]) } S[x] && v2.Equal(v2.Intersection(v2.Inverse(M, M[x]), S), v2.Singleton(x)) ==> v2.Equal(v2.Dereference(S, M[x := y]), v2.Union(v2.Difference(v2.Dereference(S, M), v2.Singleton(M[x])), v2.Singleton(y))));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M[x := y]) } S[x] && !v2.Equal(v2.Intersection(v2.Inverse(M, M[x]), S), v2.Singleton(x)) ==> v2.Equal(v2.Dereference(S, M[x := y]), v2.Union(v2.Dereference(S, M), v2.Singleton(y))));

axiom (forall M: [name][int]int, x: int :: { v2.Unified(M)[x] } v2.Unified(M)[x] == M[v2.Field(x)][x]);

axiom (forall M: [name][int]int, x: int, y: int :: { v2.Unified(M[v2.Field(x) := M[v2.Field(x)][x := y]]) } v2.Unified(M[v2.Field(x) := M[v2.Field(x)][x := y]]) == v2.Unified(M)[x := y]);

procedure v2.havoc_assert(i: int);



procedure v2.havoc_assume(i: int);



procedure v2.__HAVOC_free(a: int);



procedure v2.__HAVOC_malloc(obj_size: int) returns (new: int);
  modifies v2.alloc;
  free ensures new == _uf_v2.__HAVOC_malloc_new(obj_size, old(v2.alloc));
  free ensures v2.alloc == _uf_v2.__HAVOC_malloc_v2.alloc(obj_size, old(v2.alloc));



procedure v2.__HAVOC_det_malloc(obj_size: int) returns (new: int);
  modifies v2.alloc;
  free ensures new == _uf_v2.__HAVOC_det_malloc_new(obj_size, old(v2.alloc));
  free ensures v2.alloc == _uf_v2.__HAVOC_det_malloc_v2.alloc(obj_size, old(v2.alloc));



procedure v2.__HAVOC_memset_split_1(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v2.__HAVOC_memset_split_1_ret(A, p, c, n);



procedure v2.__HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v2.__HAVOC_memset_split_2_ret(A, p, c, n);



procedure v2.__HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v2.__HAVOC_memset_split_4_ret(A, p, c, n);



procedure v2.nondet_choice() returns (x: int);
  free ensures x == _uf_v2.nondet_choice_x();



procedure v2.det_choice() returns (x: int);
  modifies v2.detChoiceCnt;
  free ensures x == _uf_v2.det_choice_x(old(v2.detChoiceCnt));
  free ensures v2.detChoiceCnt == _uf_v2.det_choice_v2.detChoiceCnt(old(v2.detChoiceCnt));



procedure v2._strdup(str: int) returns (new: int);
  free ensures new == _uf_v2._strdup_new(str);



procedure v2._xstrcasecmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v2._xstrcasecmp_ret(a0, a1);



procedure v2._xstrcmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v2._xstrcmp_ret(a0, a1);



procedure v2.callee() returns (result.callee$1: int);
  free ensures result.callee$1 == _uf_v2.callee_result.callee$1();



procedure {:inline 1} v2.caller() returns (result.caller$1: int);
  free ensures result.caller$1 == _uf_v2.caller_result.caller$1(old(v2.alloc), old(v2.detChoiceCnt), old(v2.Res_KERNEL_SOURCE), old(v2.Res_PROBED), old(v2.Mem_T.INT4));



implementation v2.callee() returns (result.callee$1: int)
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
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 6} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 6} true;
    x := 2;
    assume v2.value_is(v2.__ctobpl_const_1, x);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 7} true;
    assume v2.value_is(v2.__ctobpl_const_2, x);
    x := v2.INT_PLUS(x, 1, 1);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 8} true;
    result.callee$1 := x;
    assume v2.value_is(v2.__ctobpl_const_3, x);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 9} true;
    return;
}



implementation {:inline 1} v2.caller() returns (result.caller$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.callee$2: int;
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
  var inline$callee$0$havoc_stringTemp: int;
  var inline$callee$0$condVal: int;
  var inline$callee$0$x: int;
  var inline$callee$0$tempBoogie0: int;
  var inline$callee$0$tempBoogie1: int;
  var inline$callee$0$tempBoogie2: int;
  var inline$callee$0$tempBoogie3: int;
  var inline$callee$0$tempBoogie4: int;
  var inline$callee$0$tempBoogie5: int;
  var inline$callee$0$tempBoogie6: int;
  var inline$callee$0$tempBoogie7: int;
  var inline$callee$0$tempBoogie8: int;
  var inline$callee$0$tempBoogie9: int;
  var inline$callee$0$tempBoogie10: int;
  var inline$callee$0$tempBoogie11: int;
  var inline$callee$0$tempBoogie12: int;
  var inline$callee$0$tempBoogie13: int;
  var inline$callee$0$tempBoogie14: int;
  var inline$callee$0$tempBoogie15: int;
  var inline$callee$0$tempBoogie16: int;
  var inline$callee$0$tempBoogie17: int;
  var inline$callee$0$tempBoogie18: int;
  var inline$callee$0$tempBoogie19: int;
  var inline$callee$0$__havoc_dummy_return: int;
  var inline$callee$0$result.callee$1: int;
  var inline$callee$0$alloc: int;
  var inline$callee$0$detChoiceCnt: int;
  var inline$callee$0$Res_KERNEL_SOURCE: [int]int;
  var inline$callee$0$Res_PROBED: [int]int;
  var inline$callee$0$Mem_T.INT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.callee$2 := 0;
    result.caller$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 2} true;
    goto inline$callee$0$Entry;

  inline$callee$0$Entry:
    
    inline$callee$0$alloc := v2.alloc;
    inline$callee$0$detChoiceCnt := v2.detChoiceCnt;
    inline$callee$0$Res_KERNEL_SOURCE := v2.Res_KERNEL_SOURCE;
    inline$callee$0$Res_PROBED := v2.Res_PROBED;
    inline$callee$0$Mem_T.INT4 := v2.Mem_T.INT4;
    goto inline$callee$0$anon0#2;

  inline$callee$0$anon0#2:
    inline$callee$0$havoc_stringTemp := 0;
    goto inline$callee$0$start#2;

  inline$callee$0$start#2:
    inline$callee$0$result.callee$1 := 0;
    inline$callee$0$x := 0;
    goto inline$callee$0$label_3#2;

  inline$callee$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 6} true;
    goto inline$callee$0$label_4#2;

  inline$callee$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 6} true;
    inline$callee$0$x := 2;
    assume v2.value_is(v2.__ctobpl_const_1, inline$callee$0$x);
    goto inline$callee$0$label_5#2;

  inline$callee$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 7} true;
    assume v2.value_is(v2.__ctobpl_const_2, inline$callee$0$x);
    inline$callee$0$x := v2.INT_PLUS(inline$callee$0$x, 1, 1);
    goto inline$callee$0$label_6#2;

  inline$callee$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 8} true;
    inline$callee$0$result.callee$1 := inline$callee$0$x;
    assume v2.value_is(v2.__ctobpl_const_3, inline$callee$0$x);
    goto inline$callee$0$label_1#2;

  inline$callee$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 9} true;
    goto inline$callee$0$Return;

  inline$callee$0$Return:
    assume true;
    assert v2.Subset(v2.Empty(), v2.Empty()) && (forall _r: int :: { v2.Res_KERNEL_SOURCE[_r] } inline$callee$0$Res_KERNEL_SOURCE[_r] == v2.Res_KERNEL_SOURCE[_r]);
    assume true;
    assert v2.Subset(v2.Empty(), v2.Empty()) && (forall _r: int :: { v2.Res_PROBED[_r] } inline$callee$0$Res_PROBED[_r] == v2.Res_PROBED[_r]);
    assume true;
    assume true;
    result.callee$2 := inline$callee$0$result.callee$1;
    goto label_3#2$1;

  label_3#2$1:
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 2} true;
    result.caller$1 := v2.INT_PLUS(result.callee$2, 1, 2);
    assume v2.value_is(v2.__ctobpl_const_4, result.callee$2);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 3} true;
    return;
}



var {:extern} v1.Mem: [name][int]int;

var {:extern} v1.alloc: int;

var {:extern} v1.Mem_T.INT4: [int]int;

var {:extern} v1.detChoiceCnt: int;

var {:extern} v1.Res_KERNEL_SOURCE: [int]int;

var {:extern} v1.Res_PROBED: [int]int;

const {:extern} unique v1.T.INT4: name;

const {:extern} unique v1.T.PINT4: name;

const {:extern} {:model_const "result.callee"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceLine 2} unique v1.__ctobpl_const_4: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceLine 6} unique v1.__ctobpl_const_1: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceLine 7} unique v1.__ctobpl_const_2: int;

const {:extern} {:model_const "x"} {:sourceFile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceLine 8} unique v1.__ctobpl_const_3: int;

axiom (forall b0: byte, c0: byte :: { v2.OneByteToInt(b0), v2.OneByteToInt(c0) } v2.OneByteToInt(b0) == v2.OneByteToInt(c0) ==> b0 == c0);

axiom (forall b0: byte, b1: byte, c0: byte, c1: byte :: { v2.TwoBytesToInt(b0, b1), v2.TwoBytesToInt(c0, c1) } v2.TwoBytesToInt(b0, b1) == v2.TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);

axiom (forall b0: byte, b1: byte, b2: byte, b3: byte, c0: byte, c1: byte, c2: byte, c3: byte :: { v2.FourBytesToInt(b0, b1, b2, b3), v2.FourBytesToInt(c0, c1, c2, c3) } v2.FourBytesToInt(b0, b1, b2, b3) == v2.FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

axiom (forall x: int :: { v2.Base(x) } v2.INT_LEQ(v2.Base(x), x));

axiom (forall a: int, t: name :: { v2.Match(a, v2.T.Ptr(t)) } v2.Match(a, v2.T.Ptr(t)) <==> v2.Field(a) == v2.T.Ptr(t));

axiom (forall b: int, a: int, t: name :: { v2.MatchBase(b, a, v2.T.Ptr(t)) } v2.MatchBase(b, a, v2.T.Ptr(t)) <==> v2.Base(a) == b);

axiom (forall v: int, t: name :: { v2.HasType(v, v2.T.Ptr(t)) } v2.HasType(v, v2.T.Ptr(t)) <==> v == 0 || (v2.INT_GT(v, 0) && v2.Match(v, t) && v2.MatchBase(v2.Base(v), v, t)));

axiom (forall x: int, y: int :: {:extern} { v2.INT_EQ(x, y): bool } v2.INT_EQ(x, y): bool <==> x == y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_NEQ(x, y): bool } v2.INT_NEQ(x, y): bool <==> x != y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_ADD(x, y): int } v2.INT_ADD(x, y): int == x + y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_SUB(x, y): int } v2.INT_SUB(x, y): int == x - y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_LT(x, y): bool } v2.INT_LT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_ULT(x, y): bool } v2.INT_ULT(x, y): bool <==> x < y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_LEQ(x, y): bool } v2.INT_LEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_ULEQ(x, y): bool } v2.INT_ULEQ(x, y): bool <==> x <= y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_GT(x, y): bool } v2.INT_GT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_UGT(x, y): bool } v2.INT_UGT(x, y): bool <==> x > y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_GEQ(x, y): bool } v2.INT_GEQ(x, y): bool <==> x >= y);

axiom (forall x: int, y: int :: {:extern} { v2.INT_UGEQ(x, y): bool } v2.INT_UGEQ(x, y): bool <==> x >= y);

axiom (forall a: int, b: int :: { v2.INT_AND(a, b) } a == b ==> v2.INT_AND(a, b) == a);

axiom (forall a: int, b: int :: { v2.INT_AND(a, b) } v2.POW2(a) && v2.POW2(b) && a != b ==> v2.INT_AND(a, b) == 0);

axiom (forall a: int, b: int :: { v2.INT_AND(a, b) } a == 0 || b == 0 ==> v2.INT_AND(a, b) == 0);

axiom v2.POW2(1);

axiom v2.POW2(2);

axiom v2.POW2(4);

axiom v2.POW2(8);

axiom v2.POW2(16);

axiom v2.POW2(32);

axiom v2.POW2(64);

axiom v2.POW2(128);

axiom v2.POW2(256);

axiom v2.POW2(512);

axiom v2.POW2(1024);

axiom v2.POW2(2048);

axiom v2.POW2(4096);

axiom v2.POW2(8192);

axiom v2.POW2(16384);

axiom v2.POW2(32768);

axiom v2.POW2(65536);

axiom v2.POW2(131072);

axiom v2.POW2(262144);

axiom v2.POW2(524288);

axiom v2.POW2(1048576);

axiom v2.POW2(2097152);

axiom v2.POW2(4194304);

axiom v2.POW2(8388608);

axiom v2.POW2(16777216);

axiom v2.POW2(33554432);

axiom (forall a: int, b: int, size: int :: { v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) } size * v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) <= a - b && a - b < size * (v2.INT_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size) + 1));

axiom (forall a: int, a_size: int, b: int :: { v2.INT_MINUS_LEFT_PTR(a, a_size, b) } v2.INT_MINUS_LEFT_PTR(a, a_size, b) == a - a_size * b);

axiom (forall a: int, a_size: int, b: int :: { v2.INT_PLUS(a, a_size, b) } v2.INT_PLUS(a, a_size, b) == a + a_size * b);

axiom (forall a: int, b: int :: { v2.INT_MULT(a, b) } v2.INT_MULT(a, b) == a * b);

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a >= 0 && b > 0 ==> b * v2.INT_DIV(a, b) <= a && a < b * (v2.INT_DIV(a, b) + 1));

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a >= 0 && b < 0 ==> b * v2.INT_DIV(a, b) <= a && a < b * (v2.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a < 0 && b > 0 ==> b * v2.INT_DIV(a, b) >= a && a > b * (v2.INT_DIV(a, b) - 1));

axiom (forall a: int, b: int :: { v2.INT_DIV(a, b) } a < 0 && b < 0 ==> b * v2.INT_DIV(a, b) >= a && a > b * (v2.INT_DIV(a, b) + 1));

axiom (forall x: bv32, y: bv32 :: {:extern} { v2.BV32_EQ(x, y): bool } v2.BV32_EQ(x, y): bool <==> x == y);

axiom (forall x: bv32, y: bv32 :: {:extern} { v2.BV32_NEQ(x, y): bool } v2.BV32_NEQ(x, y): bool <==> x != y);

axiom (forall a: bv32, b: bv32, size: bv32 :: {:extern} { v2.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 } v2.BV32_MINUS_BOTH_PTR_OR_BOTH_INT(a, b, size): bv32 == v2.BV32_DIV(v2.BV32_SUB(a, b), size));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v2.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 } v2.BV32_MINUS_LEFT_PTR(a, a_size, b): bv32 == v2.BV32_SUB(a, v2.BV32_MULT(a_size, b)));

axiom (forall a: bv32, a_size: bv32, b: bv32 :: {:extern} { v2.BV32_PLUS(a, a_size, b): bv32 } v2.BV32_PLUS(a, a_size, b): bv32 == v2.BV32_ADD(a, v2.BV32_MULT(a_size, b)));

axiom (forall a: bool, b: int, c: int :: { v2.choose(a, b, c) } a ==> v2.choose(a, b, c) == b);

axiom (forall a: bool, b: int, c: int :: { v2.choose(a, b, c) } !a ==> v2.choose(a, b, c) == c);

axiom (forall a: bool :: { v2.LIFT(a) } a <==> v2.LIFT(a) != 0);

axiom (forall a: int :: { v2.PTR_NOT(a) } a == 0 ==> v2.PTR_NOT(a) != 0);

axiom (forall a: int :: { v2.PTR_NOT(a) } a != 0 ==> v2.PTR_NOT(a) == 0);

axiom (forall a: int :: { v2.NULL_CHECK(a) } a == 0 ==> v2.NULL_CHECK(a) != 0);

axiom (forall a: int :: { v2.NULL_CHECK(a) } a != 0 ==> v2.NULL_CHECK(a) == 0);

axiom (forall n: int, x: int, y: int :: { v2.AtLeast(n, x)[y] } v2.AtLeast(n, x)[y] ==> v2.INT_LEQ(x, y) && v2.Rep(n, x) == v2.Rep(n, y));

axiom (forall n: int, x: int, y: int :: { v2.AtLeast(n, x), v2.Rep(n, x), v2.Rep(n, y) } v2.INT_LEQ(x, y) && v2.Rep(n, x) == v2.Rep(n, y) ==> v2.AtLeast(n, x)[y]);

axiom (forall n: int, x: int :: { v2.AtLeast(n, x) } v2.AtLeast(n, x)[x]);

axiom (forall n: int, x: int, z: int :: { v2.INT_PLUS(x, n, z) } v2.Rep(n, x) == v2.Rep(n, v2.INT_PLUS(x, n, z)));

axiom (forall n: int, x: int :: { v2.Rep(n, x) } (exists k: int :: v2.INT_SUB(v2.Rep(n, x), x) == v2.INT_MULT(n, k)));

axiom (forall x: int, n: int, z: int :: { v2.Array(x, n, z) } v2.INT_LEQ(z, 0) ==> v2.Equal(v2.Array(x, n, z), v2.Empty()));

axiom (forall x: int, n: int, z: int :: { v2.Array(x, n, z) } v2.INT_GT(z, 0) ==> v2.Equal(v2.Array(x, n, z), v2.Difference(v2.AtLeast(n, x), v2.AtLeast(n, v2.INT_PLUS(x, n, z)))));

axiom (forall x: int :: !v2.Empty()[x]);

axiom (forall x: int :: v2.SetTrue()[x]);

axiom (forall x: int, y: int :: { v2.Singleton(y)[x] } v2.Singleton(y)[x] <==> x == y);

axiom (forall y: int :: { v2.Singleton(y) } v2.Singleton(y)[y]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v2.Union(S, T)[x] } { v2.Union(S, T), S[x] } { v2.Union(S, T), T[x] } v2.Union(S, T)[x] <==> S[x] || T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v2.Intersection(S, T)[x] } { v2.Intersection(S, T), S[x] } { v2.Intersection(S, T), T[x] } v2.Intersection(S, T)[x] <==> S[x] && T[x]);

axiom (forall x: int, S: [int]bool, T: [int]bool :: { v2.Difference(S, T)[x] } { v2.Difference(S, T), S[x] } { v2.Difference(S, T), T[x] } v2.Difference(S, T)[x] <==> S[x] && !T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v2.Equal(S, T) } v2.Equal(S, T) <==> v2.Subset(S, T) && v2.Subset(T, S));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v2.Subset(S, T) } { T[x], v2.Subset(S, T) } S[x] && v2.Subset(S, T) ==> T[x]);

axiom (forall S: [int]bool, T: [int]bool :: { v2.Subset(S, T) } v2.Subset(S, T) || (exists x: int :: S[x] && !T[x]));

axiom (forall x: int, S: [int]bool, T: [int]bool :: { S[x], v2.Disjoint(S, T) } { T[x], v2.Disjoint(S, T) } !(S[x] && v2.Disjoint(S, T) && T[x]));

axiom (forall S: [int]bool, T: [int]bool :: { v2.Disjoint(S, T) } v2.Disjoint(S, T) || (exists x: int :: S[x] && T[x]));

axiom (forall f: [int]int, x: int :: { v2.Inverse(f, f[x]) } v2.Inverse(f, f[x])[x]);

axiom (forall f: [int]int, x: int, y: int :: { v2.Inverse(f, y), f[x] } v2.Inverse(f, y)[x] ==> f[x] == y);

axiom (forall f: [int]int, x: int, y: int :: { v2.Inverse(f[x := y], y) } v2.Equal(v2.Inverse(f[x := y], y), v2.Union(v2.Inverse(f, y), v2.Singleton(x))));

axiom (forall f: [int]int, x: int, y: int, z: int :: { v2.Inverse(f[x := y], z) } y == z || v2.Equal(v2.Inverse(f[x := y], z), v2.Difference(v2.Inverse(f, z), v2.Singleton(x))));

axiom (forall x: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M)[x] } v2.Dereference(S, M)[x] ==> (exists y: int :: x == M[y] && S[y]));

axiom (forall x: int, S: [int]bool, M: [int]int :: { M[x], S[x], v2.Dereference(S, M) } S[x] ==> v2.Dereference(S, M)[M[x]]);

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M[x := y]) } !S[x] ==> v2.Equal(v2.Dereference(S, M[x := y]), v2.Dereference(S, M)));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M[x := y]) } S[x] && v2.Equal(v2.Intersection(v2.Inverse(M, M[x]), S), v2.Singleton(x)) ==> v2.Equal(v2.Dereference(S, M[x := y]), v2.Union(v2.Difference(v2.Dereference(S, M), v2.Singleton(M[x])), v2.Singleton(y))));

axiom (forall x: int, y: int, S: [int]bool, M: [int]int :: { v2.Dereference(S, M[x := y]) } S[x] && !v2.Equal(v2.Intersection(v2.Inverse(M, M[x]), S), v2.Singleton(x)) ==> v2.Equal(v2.Dereference(S, M[x := y]), v2.Union(v2.Dereference(S, M), v2.Singleton(y))));

axiom (forall M: [name][int]int, x: int :: { v2.Unified(M)[x] } v2.Unified(M)[x] == M[v2.Field(x)][x]);

axiom (forall M: [name][int]int, x: int, y: int :: { v2.Unified(M[v2.Field(x) := M[v2.Field(x)][x := y]]) } v2.Unified(M[v2.Field(x) := M[v2.Field(x)][x := y]]) == v2.Unified(M)[x := y]);

procedure v1.havoc_assert(i: int);



procedure v1.havoc_assume(i: int);



procedure v1.__HAVOC_free(a: int);



procedure v1.__HAVOC_malloc(obj_size: int) returns (new: int);
  modifies v2.alloc;
  free ensures new == _uf_v2.__HAVOC_malloc_new(obj_size, old(v2.alloc));
  free ensures v2.alloc == _uf_v2.__HAVOC_malloc_v2.alloc(obj_size, old(v2.alloc));



procedure v1.__HAVOC_det_malloc(obj_size: int) returns (new: int);
  modifies v2.alloc;
  free ensures new == _uf_v2.__HAVOC_det_malloc_new(obj_size, old(v2.alloc));
  free ensures v2.alloc == _uf_v2.__HAVOC_det_malloc_v2.alloc(obj_size, old(v2.alloc));



procedure v1.__HAVOC_memset_split_1(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v2.__HAVOC_memset_split_1_ret(A, p, c, n);



procedure v1.__HAVOC_memset_split_2(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v2.__HAVOC_memset_split_2_ret(A, p, c, n);



procedure v1.__HAVOC_memset_split_4(A: [int]int, p: int, c: int, n: int) returns (ret: [int]int);
  free ensures ret == _uf_v2.__HAVOC_memset_split_4_ret(A, p, c, n);



procedure v1.nondet_choice() returns (x: int);
  free ensures x == _uf_v2.nondet_choice_x();



procedure v1.det_choice() returns (x: int);
  modifies v2.detChoiceCnt;
  free ensures x == _uf_v2.det_choice_x(old(v2.detChoiceCnt));
  free ensures v2.detChoiceCnt == _uf_v2.det_choice_v2.detChoiceCnt(old(v2.detChoiceCnt));



procedure v1._strdup(str: int) returns (new: int);
  free ensures new == _uf_v2._strdup_new(str);



procedure v1._xstrcasecmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v2._xstrcasecmp_ret(a0, a1);



procedure v1._xstrcmp(a0: int, a1: int) returns (ret: int);
  free ensures ret == _uf_v2._xstrcmp_ret(a0, a1);



procedure v1.callee() returns (result.callee$1: int);
  free ensures result.callee$1 == _uf_v2.callee_result.callee$1();



procedure {:inline 1} v1.caller() returns (result.caller$1: int);
  free ensures result.caller$1 == _uf_v2.caller_result.caller$1(old(v2.alloc), old(v2.detChoiceCnt), old(v2.Res_KERNEL_SOURCE), old(v2.Res_PROBED), old(v2.Mem_T.INT4));



implementation v1.callee() returns (result.callee$1: int)
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
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 6} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 6} true;
    x := 1;
    assume v2.value_is(v1.__ctobpl_const_1, x);
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 7} true;
    assume v2.value_is(v1.__ctobpl_const_2, x);
    x := v2.INT_PLUS(x, 1, 1);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 8} true;
    result.callee$1 := x;
    assume v2.value_is(v1.__ctobpl_const_3, x);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 9} true;
    return;
}



implementation {:inline 1} v1.caller() returns (result.caller$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} result.callee$2: int;
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
  var inline$callee$0$havoc_stringTemp: int;
  var inline$callee$0$condVal: int;
  var inline$callee$0$x: int;
  var inline$callee$0$tempBoogie0: int;
  var inline$callee$0$tempBoogie1: int;
  var inline$callee$0$tempBoogie2: int;
  var inline$callee$0$tempBoogie3: int;
  var inline$callee$0$tempBoogie4: int;
  var inline$callee$0$tempBoogie5: int;
  var inline$callee$0$tempBoogie6: int;
  var inline$callee$0$tempBoogie7: int;
  var inline$callee$0$tempBoogie8: int;
  var inline$callee$0$tempBoogie9: int;
  var inline$callee$0$tempBoogie10: int;
  var inline$callee$0$tempBoogie11: int;
  var inline$callee$0$tempBoogie12: int;
  var inline$callee$0$tempBoogie13: int;
  var inline$callee$0$tempBoogie14: int;
  var inline$callee$0$tempBoogie15: int;
  var inline$callee$0$tempBoogie16: int;
  var inline$callee$0$tempBoogie17: int;
  var inline$callee$0$tempBoogie18: int;
  var inline$callee$0$tempBoogie19: int;
  var inline$callee$0$__havoc_dummy_return: int;
  var inline$callee$0$result.callee$1: int;
  var inline$callee$0$alloc: int;
  var inline$callee$0$detChoiceCnt: int;
  var inline$callee$0$Res_KERNEL_SOURCE: [int]int;
  var inline$callee$0$Res_PROBED: [int]int;
  var inline$callee$0$Mem_T.INT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.callee$2 := 0;
    result.caller$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 2} true;
    goto inline$callee$0$Entry;

  inline$callee$0$Entry:
    
    inline$callee$0$alloc := v2.alloc;
    inline$callee$0$detChoiceCnt := v2.detChoiceCnt;
    inline$callee$0$Res_KERNEL_SOURCE := v2.Res_KERNEL_SOURCE;
    inline$callee$0$Res_PROBED := v2.Res_PROBED;
    inline$callee$0$Mem_T.INT4 := v2.Mem_T.INT4;
    goto inline$callee$0$anon0#2;

  inline$callee$0$anon0#2:
    inline$callee$0$havoc_stringTemp := 0;
    goto inline$callee$0$start#2;

  inline$callee$0$start#2:
    inline$callee$0$result.callee$1 := 0;
    inline$callee$0$x := 0;
    goto inline$callee$0$label_3#2;

  inline$callee$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 6} true;
    goto inline$callee$0$label_4#2;

  inline$callee$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 6} true;
    inline$callee$0$x := 1;
    assume v2.value_is(v1.__ctobpl_const_1, inline$callee$0$x);
    goto inline$callee$0$label_5#2;

  inline$callee$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 7} true;
    assume v2.value_is(v1.__ctobpl_const_2, inline$callee$0$x);
    inline$callee$0$x := v2.INT_PLUS(inline$callee$0$x, 1, 1);
    goto inline$callee$0$label_6#2;

  inline$callee$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 8} true;
    inline$callee$0$result.callee$1 := inline$callee$0$x;
    assume v2.value_is(v1.__ctobpl_const_3, inline$callee$0$x);
    goto inline$callee$0$label_1#2;

  inline$callee$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 9} true;
    goto inline$callee$0$Return;

  inline$callee$0$Return:
    assume true;
    assert v2.Subset(v2.Empty(), v2.Empty()) && (forall _r: int :: { v2.Res_KERNEL_SOURCE[_r] } inline$callee$0$Res_KERNEL_SOURCE[_r] == v2.Res_KERNEL_SOURCE[_r]);
    assume true;
    assert v2.Subset(v2.Empty(), v2.Empty()) && (forall _r: int :: { v2.Res_PROBED[_r] } inline$callee$0$Res_PROBED[_r] == v2.Res_PROBED[_r]);
    assume true;
    assume true;
    result.callee$2 := inline$callee$0$result.callee$1;
    goto label_3#2$1;

  label_3#2$1:
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 2} true;
    result.caller$1 := v2.INT_PLUS(result.callee$2, 1, 2);
    assume v2.value_is(v1.__ctobpl_const_4, result.callee$2);
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 3} true;
    return;
}



type {:extern} name;

type {:extern} byte;

function _uf_v2.__HAVOC_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v2.__HAVOC_malloc_v2.alloc(arg_0: int, arg_1: int) : int;

function _uf_v1.__HAVOC_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v1.__HAVOC_malloc_v2.alloc(arg_0: int, arg_1: int) : int;

function _uf_v2.__HAVOC_det_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v2.__HAVOC_det_malloc_v2.alloc(arg_0: int, arg_1: int) : int;

function _uf_v1.__HAVOC_det_malloc_new(arg_0: int, arg_1: int) : int;

function _uf_v1.__HAVOC_det_malloc_v2.alloc(arg_0: int, arg_1: int) : int;

function _uf_v2.__HAVOC_memset_split_1_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v1.__HAVOC_memset_split_1_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v2.__HAVOC_memset_split_2_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v1.__HAVOC_memset_split_2_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v2.__HAVOC_memset_split_4_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v1.__HAVOC_memset_split_4_ret(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: int) : [int]int;

function _uf_v2.nondet_choice_x() : int;

function _uf_v1.nondet_choice_x() : int;

function _uf_v2.det_choice_x(arg_0: int) : int;

function _uf_v2.det_choice_v2.detChoiceCnt(arg_0: int) : int;

function _uf_v1.det_choice_x(arg_0: int) : int;

function _uf_v1.det_choice_v2.detChoiceCnt(arg_0: int) : int;

function _uf_v2._strdup_new(arg_0: int) : int;

function _uf_v1._strdup_new(arg_0: int) : int;

function _uf_v2._xstrcasecmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v1._xstrcasecmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v2._xstrcmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v1._xstrcmp_ret(arg_0: int, arg_1: int) : int;

function _uf_v2.callee_result.callee$1() : int;

function _uf_v1.callee_result.callee$1() : int;

function _uf_v2.caller_result.caller$1(arg_0: int, arg_1: int, arg_2: [int]int, arg_3: [int]int, arg_4: [int]int) : int;

function _uf_v1.caller_result.caller$1(arg_0: int, arg_1: int, arg_2: [int]int, arg_3: [int]int, arg_4: [int]int) : int;

var Output_of_v1.caller_result.caller$1: int;

var Output_of_v2.caller_result.caller$1: int;

procedure EQ_v1.caller__xx__v2.caller() returns (AA_TEMP30: bool);
  modifies Output_of_v1.caller_result.caller$1, Output_of_v2.caller_result.caller$1;
  ensures AA_TEMP30;



implementation EQ_v1.caller__xx__v2.caller() returns (AA_TEMP30: bool)
{
  var AA_TEMP20: int;
  var result.caller$1: int;
  var inline$v1.caller$0$havoc_stringTemp: int;
  var inline$v1.caller$0$condVal: int;
  var inline$v1.caller$0$result.callee$2: int;
  var inline$v1.caller$0$tempBoogie0: int;
  var inline$v1.caller$0$tempBoogie1: int;
  var inline$v1.caller$0$tempBoogie2: int;
  var inline$v1.caller$0$tempBoogie3: int;
  var inline$v1.caller$0$tempBoogie4: int;
  var inline$v1.caller$0$tempBoogie5: int;
  var inline$v1.caller$0$tempBoogie6: int;
  var inline$v1.caller$0$tempBoogie7: int;
  var inline$v1.caller$0$tempBoogie8: int;
  var inline$v1.caller$0$tempBoogie9: int;
  var inline$v1.caller$0$tempBoogie10: int;
  var inline$v1.caller$0$tempBoogie11: int;
  var inline$v1.caller$0$tempBoogie12: int;
  var inline$v1.caller$0$tempBoogie13: int;
  var inline$v1.caller$0$tempBoogie14: int;
  var inline$v1.caller$0$tempBoogie15: int;
  var inline$v1.caller$0$tempBoogie16: int;
  var inline$v1.caller$0$tempBoogie17: int;
  var inline$v1.caller$0$tempBoogie18: int;
  var inline$v1.caller$0$tempBoogie19: int;
  var inline$v1.caller$0$__havoc_dummy_return: int;
  var inline$v1.caller$0$inline$callee$0$havoc_stringTemp: int;
  var inline$v1.caller$0$inline$callee$0$condVal: int;
  var inline$v1.caller$0$inline$callee$0$x: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie0: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie1: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie2: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie3: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie4: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie5: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie6: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie7: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie8: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie9: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie10: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie11: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie12: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie13: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie14: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie15: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie16: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie17: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie18: int;
  var inline$v1.caller$0$inline$callee$0$tempBoogie19: int;
  var inline$v1.caller$0$inline$callee$0$__havoc_dummy_return: int;
  var inline$v1.caller$0$inline$callee$0$result.callee$1: int;
  var inline$v1.caller$0$inline$callee$0$alloc: int;
  var inline$v1.caller$0$inline$callee$0$detChoiceCnt: int;
  var inline$v1.caller$0$inline$callee$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v1.caller$0$inline$callee$0$Res_PROBED: [int]int;
  var inline$v1.caller$0$inline$callee$0$Mem_T.INT4: [int]int;
  var inline$v1.caller$0$result.caller$1: int;
  var inline$v2.caller$0$havoc_stringTemp: int;
  var inline$v2.caller$0$condVal: int;
  var inline$v2.caller$0$result.callee$2: int;
  var inline$v2.caller$0$tempBoogie0: int;
  var inline$v2.caller$0$tempBoogie1: int;
  var inline$v2.caller$0$tempBoogie2: int;
  var inline$v2.caller$0$tempBoogie3: int;
  var inline$v2.caller$0$tempBoogie4: int;
  var inline$v2.caller$0$tempBoogie5: int;
  var inline$v2.caller$0$tempBoogie6: int;
  var inline$v2.caller$0$tempBoogie7: int;
  var inline$v2.caller$0$tempBoogie8: int;
  var inline$v2.caller$0$tempBoogie9: int;
  var inline$v2.caller$0$tempBoogie10: int;
  var inline$v2.caller$0$tempBoogie11: int;
  var inline$v2.caller$0$tempBoogie12: int;
  var inline$v2.caller$0$tempBoogie13: int;
  var inline$v2.caller$0$tempBoogie14: int;
  var inline$v2.caller$0$tempBoogie15: int;
  var inline$v2.caller$0$tempBoogie16: int;
  var inline$v2.caller$0$tempBoogie17: int;
  var inline$v2.caller$0$tempBoogie18: int;
  var inline$v2.caller$0$tempBoogie19: int;
  var inline$v2.caller$0$__havoc_dummy_return: int;
  var inline$v2.caller$0$inline$callee$0$havoc_stringTemp: int;
  var inline$v2.caller$0$inline$callee$0$condVal: int;
  var inline$v2.caller$0$inline$callee$0$x: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie0: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie1: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie2: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie3: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie4: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie5: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie6: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie7: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie8: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie9: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie10: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie11: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie12: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie13: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie14: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie15: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie16: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie17: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie18: int;
  var inline$v2.caller$0$inline$callee$0$tempBoogie19: int;
  var inline$v2.caller$0$inline$callee$0$__havoc_dummy_return: int;
  var inline$v2.caller$0$inline$callee$0$result.callee$1: int;
  var inline$v2.caller$0$inline$callee$0$alloc: int;
  var inline$v2.caller$0$inline$callee$0$detChoiceCnt: int;
  var inline$v2.caller$0$inline$callee$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v2.caller$0$inline$callee$0$Res_PROBED: [int]int;
  var inline$v2.caller$0$inline$callee$0$Mem_T.INT4: [int]int;
  var inline$v2.caller$0$result.caller$1: int;

  AA_INSTR_EQ_BODY:
    goto inline$v1.caller$0$Entry;

  inline$v1.caller$0$Entry:
    goto inline$v1.caller$0$anon0#2;

  inline$v1.caller$0$anon0#2:
    inline$v1.caller$0$havoc_stringTemp := 0;
    goto inline$v1.caller$0$start#2;

  inline$v1.caller$0$start#2:
    inline$v1.caller$0$result.callee$2 := 0;
    inline$v1.caller$0$result.caller$1 := 0;
    goto inline$v1.caller$0$label_3#2;

  inline$v1.caller$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 2} true;
    goto inline$v1.caller$0$inline$callee$0$Entry;

  inline$v1.caller$0$inline$callee$0$Entry:
    
    inline$v1.caller$0$inline$callee$0$alloc := v2.alloc;
    inline$v1.caller$0$inline$callee$0$detChoiceCnt := v2.detChoiceCnt;
    inline$v1.caller$0$inline$callee$0$Res_KERNEL_SOURCE := v2.Res_KERNEL_SOURCE;
    inline$v1.caller$0$inline$callee$0$Res_PROBED := v2.Res_PROBED;
    inline$v1.caller$0$inline$callee$0$Mem_T.INT4 := v2.Mem_T.INT4;
    goto inline$v1.caller$0$inline$callee$0$anon0#2;

  inline$v1.caller$0$inline$callee$0$anon0#2:
    inline$v1.caller$0$inline$callee$0$havoc_stringTemp := 0;
    goto inline$v1.caller$0$inline$callee$0$start#2;

  inline$v1.caller$0$inline$callee$0$start#2:
    inline$v1.caller$0$inline$callee$0$result.callee$1 := 0;
    inline$v1.caller$0$inline$callee$0$x := 0;
    goto inline$v1.caller$0$inline$callee$0$label_3#2;

  inline$v1.caller$0$inline$callee$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 6} true;
    goto inline$v1.caller$0$inline$callee$0$label_4#2;

  inline$v1.caller$0$inline$callee$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 6} true;
    inline$v1.caller$0$inline$callee$0$x := 1;
    assume v2.value_is(v1.__ctobpl_const_1, inline$v1.caller$0$inline$callee$0$x);
    goto inline$v1.caller$0$inline$callee$0$label_5#2;

  inline$v1.caller$0$inline$callee$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 7} true;
    assume v2.value_is(v1.__ctobpl_const_2, inline$v1.caller$0$inline$callee$0$x);
    inline$v1.caller$0$inline$callee$0$x := v2.INT_PLUS(inline$v1.caller$0$inline$callee$0$x, 1, 1);
    goto inline$v1.caller$0$inline$callee$0$label_6#2;

  inline$v1.caller$0$inline$callee$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 8} true;
    inline$v1.caller$0$inline$callee$0$result.callee$1 := inline$v1.caller$0$inline$callee$0$x;
    assume v2.value_is(v1.__ctobpl_const_3, inline$v1.caller$0$inline$callee$0$x);
    goto inline$v1.caller$0$inline$callee$0$label_1#2;

  inline$v1.caller$0$inline$callee$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 9} true;
    goto inline$v1.caller$0$inline$callee$0$Return;

  inline$v1.caller$0$inline$callee$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    inline$v1.caller$0$result.callee$2 := inline$v1.caller$0$inline$callee$0$result.callee$1;
    goto inline$v1.caller$0$label_3#2$1;

  inline$v1.caller$0$label_3#2$1:
    goto inline$v1.caller$0$label_6#2;

  inline$v1.caller$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 2} true;
    inline$v1.caller$0$result.caller$1 := v2.INT_PLUS(inline$v1.caller$0$result.callee$2, 1, 2);
    assume v2.value_is(v1.__ctobpl_const_4, inline$v1.caller$0$result.callee$2);
    goto inline$v1.caller$0$label_1#2;

  inline$v1.caller$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v1\tcas.c"} {:sourceline 3} true;
    goto inline$v1.caller$0$Return;

  inline$v1.caller$0$Return:
    assume true;
    result.caller$1 := inline$v1.caller$0$result.caller$1;
    goto AA_INSTR_EQ_BODY$1;

  AA_INSTR_EQ_BODY$1:
    AA_TEMP20 := result.caller$1;
    goto inline$v2.caller$0$Entry;

  inline$v2.caller$0$Entry:
    goto inline$v2.caller$0$anon0#2;

  inline$v2.caller$0$anon0#2:
    inline$v2.caller$0$havoc_stringTemp := 0;
    goto inline$v2.caller$0$start#2;

  inline$v2.caller$0$start#2:
    inline$v2.caller$0$result.callee$2 := 0;
    inline$v2.caller$0$result.caller$1 := 0;
    goto inline$v2.caller$0$label_3#2;

  inline$v2.caller$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 2} true;
    goto inline$v2.caller$0$inline$callee$0$Entry;

  inline$v2.caller$0$inline$callee$0$Entry:
    
    inline$v2.caller$0$inline$callee$0$alloc := v2.alloc;
    inline$v2.caller$0$inline$callee$0$detChoiceCnt := v2.detChoiceCnt;
    inline$v2.caller$0$inline$callee$0$Res_KERNEL_SOURCE := v2.Res_KERNEL_SOURCE;
    inline$v2.caller$0$inline$callee$0$Res_PROBED := v2.Res_PROBED;
    inline$v2.caller$0$inline$callee$0$Mem_T.INT4 := v2.Mem_T.INT4;
    goto inline$v2.caller$0$inline$callee$0$anon0#2;

  inline$v2.caller$0$inline$callee$0$anon0#2:
    inline$v2.caller$0$inline$callee$0$havoc_stringTemp := 0;
    goto inline$v2.caller$0$inline$callee$0$start#2;

  inline$v2.caller$0$inline$callee$0$start#2:
    inline$v2.caller$0$inline$callee$0$result.callee$1 := 0;
    inline$v2.caller$0$inline$callee$0$x := 0;
    goto inline$v2.caller$0$inline$callee$0$label_3#2;

  inline$v2.caller$0$inline$callee$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 6} true;
    goto inline$v2.caller$0$inline$callee$0$label_4#2;

  inline$v2.caller$0$inline$callee$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 6} true;
    inline$v2.caller$0$inline$callee$0$x := 2;
    assume v2.value_is(v2.__ctobpl_const_1, inline$v2.caller$0$inline$callee$0$x);
    goto inline$v2.caller$0$inline$callee$0$label_5#2;

  inline$v2.caller$0$inline$callee$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 7} true;
    assume v2.value_is(v2.__ctobpl_const_2, inline$v2.caller$0$inline$callee$0$x);
    inline$v2.caller$0$inline$callee$0$x := v2.INT_PLUS(inline$v2.caller$0$inline$callee$0$x, 1, 1);
    goto inline$v2.caller$0$inline$callee$0$label_6#2;

  inline$v2.caller$0$inline$callee$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 8} true;
    inline$v2.caller$0$inline$callee$0$result.callee$1 := inline$v2.caller$0$inline$callee$0$x;
    assume v2.value_is(v2.__ctobpl_const_3, inline$v2.caller$0$inline$callee$0$x);
    goto inline$v2.caller$0$inline$callee$0$label_1#2;

  inline$v2.caller$0$inline$callee$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 9} true;
    goto inline$v2.caller$0$inline$callee$0$Return;

  inline$v2.caller$0$inline$callee$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    inline$v2.caller$0$result.callee$2 := inline$v2.caller$0$inline$callee$0$result.callee$1;
    goto inline$v2.caller$0$label_3#2$1;

  inline$v2.caller$0$label_3#2$1:
    goto inline$v2.caller$0$label_6#2;

  inline$v2.caller$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 2} true;
    inline$v2.caller$0$result.caller$1 := v2.INT_PLUS(inline$v2.caller$0$result.callee$2, 1, 2);
    assume v2.value_is(v2.__ctobpl_const_4, inline$v2.caller$0$result.callee$2);
    goto inline$v2.caller$0$label_1#2;

  inline$v2.caller$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\rsinha\rootcause\benchmarks\equivalence\scratch\tcas\test\v2\tcas.c"} {:sourceline 3} true;
    goto inline$v2.caller$0$Return;

  inline$v2.caller$0$Return:
    assume true;
    result.caller$1 := inline$v2.caller$0$result.caller$1;
    goto AA_INSTR_EQ_BODY$2;

  AA_INSTR_EQ_BODY$2:
    Output_of_v1.caller_result.caller$1 := AA_TEMP20;
    Output_of_v2.caller_result.caller$1 := result.caller$1;
    AA_TEMP30 := AA_TEMP20 == result.caller$1;
    return;
}


