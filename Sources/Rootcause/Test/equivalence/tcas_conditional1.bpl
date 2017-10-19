var {:extern} v4.Mem: [name][int]int;

var {:extern} v4.alloc: int;

var {:extern} v4.Mem_T.A4INT4: [int]int;

var {:extern} v4.Mem_T.INT4: [int]int;

var {:extern} v4.Mem_T.PINT4: [int]int;

var {:extern} v4.detChoiceCnt: int;

var {:extern} v4.Res_KERNEL_SOURCE: [int]int;

var {:extern} v4.Res_PROBED: [int]int;

const {:extern} unique v4.T.A4INT4: name;

const {:extern} unique v4.T.INT4: name;

const {:extern} unique v4.T.PA4INT4: name;

const {:extern} unique v4.T.PINT4: name;

const {:extern} unique v4.Alt_Layer_Value: int;

const {:extern} unique v4.Climb_Inhibit: int;

const {:extern} unique v4.Cur_Vertical_Sep: int;

const {:extern} unique v4.Down_Separation: int;

const {:extern} unique v4.High_Confidence: int;

const {:extern} unique v4.Other_Capability: int;

const {:extern} unique v4.Other_RAC: int;

const {:extern} unique v4.Other_Tracked_Alt: int;

const {:extern} unique v4.Own_Tracked_Alt: int;

const {:extern} unique v4.Own_Tracked_Alt_Rate: int;

const {:extern} unique v4.Positive_RA_Alt_Thresh: int;

const {:extern} unique v4.Two_of_Three_Reports_Valid: int;

const {:extern} unique v4.Up_Separation: int;





























































































































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

axiom v4.INT_GT(v4.Alt_Layer_Value, 0);

axiom v4.Base(v4.Alt_Layer_Value) == v4.Alt_Layer_Value;

axiom v4.INT_GT(v4.Climb_Inhibit, 0);

axiom v4.Base(v4.Climb_Inhibit) == v4.Climb_Inhibit;

axiom v4.INT_GT(v4.Cur_Vertical_Sep, 0);

axiom v4.Base(v4.Cur_Vertical_Sep) == v4.Cur_Vertical_Sep;

axiom v4.INT_GT(v4.Down_Separation, 0);

axiom v4.Base(v4.Down_Separation) == v4.Down_Separation;

axiom v4.INT_GT(v4.High_Confidence, 0);

axiom v4.Base(v4.High_Confidence) == v4.High_Confidence;

axiom v4.INT_GT(v4.Other_Capability, 0);

axiom v4.Base(v4.Other_Capability) == v4.Other_Capability;

axiom v4.INT_GT(v4.Other_RAC, 0);

axiom v4.Base(v4.Other_RAC) == v4.Other_RAC;

axiom v4.INT_GT(v4.Other_Tracked_Alt, 0);

axiom v4.Base(v4.Other_Tracked_Alt) == v4.Other_Tracked_Alt;

axiom v4.INT_GT(v4.Own_Tracked_Alt, 0);

axiom v4.Base(v4.Own_Tracked_Alt) == v4.Own_Tracked_Alt;

axiom v4.INT_GT(v4.Own_Tracked_Alt_Rate, 0);

axiom v4.Base(v4.Own_Tracked_Alt_Rate) == v4.Own_Tracked_Alt_Rate;

axiom v4.INT_GT(v4.Positive_RA_Alt_Thresh, 0);

axiom v4.Base(v4.Positive_RA_Alt_Thresh) == v4.Positive_RA_Alt_Thresh;

axiom v4.INT_GT(v4.Two_of_Three_Reports_Valid, 0);

axiom v4.Base(v4.Two_of_Three_Reports_Valid) == v4.Two_of_Three_Reports_Valid;

axiom v4.INT_GT(v4.Up_Separation, 0);

axiom v4.Base(v4.Up_Separation) == v4.Up_Separation;

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



procedure v4.ALIM() returns (result.ALIM$1: int);
  free ensures result.ALIM$1 == _uf_v4.ALIM_result.ALIM$1(old(v4.Mem_T.INT4));



procedure v4.Inhibit_Biased_Climb() returns (result.Inhibit_Biased_Climb$1: int);
  free ensures result.Inhibit_Biased_Climb$1 == _uf_v4.Inhibit_Biased_Climb_result.Inhibit_Biased_Climb$1(old(v4.Mem_T.INT4));



procedure v4.Non_Crossing_Biased_Climb() returns (result.Non_Crossing_Biased_Climb$1: int);
  free ensures result.Non_Crossing_Biased_Climb$1 == _uf_v4.Non_Crossing_Biased_Climb_result.Non_Crossing_Biased_Climb$1(old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));



procedure v4.Non_Crossing_Biased_Descend() returns (result.Non_Crossing_Biased_Descend$1: int);
  free ensures result.Non_Crossing_Biased_Descend$1 == _uf_v4.Non_Crossing_Biased_Descend_result.Non_Crossing_Biased_Descend$1(old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));



procedure v4.Own_Above_Threat() returns (result.Own_Above_Threat$1: int);
  free ensures result.Own_Above_Threat$1 == _uf_v4.Own_Above_Threat_result.Own_Above_Threat$1(old(v4.Mem_T.INT4));



procedure v4.Own_Below_Threat() returns (result.Own_Below_Threat$1: int);
  free ensures result.Own_Below_Threat$1 == _uf_v4.Own_Below_Threat_result.Own_Below_Threat$1(old(v4.Mem_T.INT4));



procedure v4.alt_sep_test() returns (result.alt_sep_test$1: int);
  free ensures result.alt_sep_test$1 == _uf_v4.alt_sep_test_result.alt_sep_test$1(old(v4.Mem_T.INT4), old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.PINT4));



procedure v4.initialize();
  modifies v4.Mem_T.INT4;
  free ensures v4.Mem_T.INT4 == _uf_v4.initialize_v4.Mem_T.INT4(old(v4.Mem_T.INT4));



procedure {:inline 1} v4.tcas(a1_.1: int, a2_.1: int, a3_.1: int, a4_.1: int, a5_.1: int, a6_.1: int, a7_.1: int, a8_.1: int, a9_.1: int, a10_.1: int, a11_.1: int, a12_.1: int) returns (result.tcas$1: int);
  modifies v4.Mem_T.INT4;
  free ensures result.tcas$1 == _uf_v4.tcas_result.tcas$1(a1_.1, a2_.1, a3_.1, a4_.1, a5_.1, a6_.1, a7_.1, a8_.1, a9_.1, a10_.1, a11_.1, a12_.1, old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));
  free ensures v4.Mem_T.INT4 == _uf_v4.tcas_v4.Mem_T.INT4(a1_.1, a2_.1, a3_.1, a4_.1, a5_.1, a6_.1, a7_.1, a8_.1, a9_.1, a10_.1, a11_.1, a12_.1, old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));



implementation v4.ALIM() returns (result.ALIM$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.ALIM$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    return;
}



implementation v4.Inhibit_Biased_Climb() returns (result.Inhibit_Biased_Climb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $result.question.2$: int;
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
    result.Inhibit_Biased_Climb$1 := 0;
    $result.question.2$ := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto label_3_true#2, label_3_false#2;

  label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    $result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto label_6#2;

  label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    $result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    result.Inhibit_Biased_Climb$1 := $result.question.2$;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    return;
}



implementation v4.Non_Crossing_Biased_Climb() returns (result.Non_Crossing_Biased_Climb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.6$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} result: int;
  var {:extern} result.ALIM$5: int;
  var {:extern} result.ALIM$8: int;
  var {:extern} result.Inhibit_Biased_Climb$2: int;
  var {:extern} result.Own_Above_Threat$7: int;
  var {:extern} result.Own_Below_Threat$3: int;
  var {:extern} result.Own_Below_Threat$4: int;
  var {:extern} upward_crossing_situation: int;
  var {:extern} upward_preferred: int;
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
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$Own_Below_Threat$1$condVal: int;
  var inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$1$alloc: int;
  var inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    $Pred.6$ := 0;
    $Pred.9$ := 0;
    result := 0;
    result.ALIM$5 := 0;
    result.ALIM$8 := 0;
    result.Inhibit_Biased_Climb$2 := 0;
    result.Non_Crossing_Biased_Climb$1 := 0;
    result.Own_Above_Threat$7 := 0;
    result.Own_Below_Threat$3 := 0;
    result.Own_Below_Threat$4 := 0;
    upward_crossing_situation := 0;
    upward_preferred := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 59} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 60} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 61} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto label_6#2$1;

  label_6#2$1:
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], result.Inhibit_Biased_Climb$2));
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 64} true;
    goto label_10_true#2, label_10_false#2;

  label_10_false#2:
    assume upward_preferred == 0;
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    result.Own_Above_Threat$7 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto label_11#2$1;

  label_11#2$1:
    goto label_30#2;

  label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto label_30_true#2, label_30_false#2;

  label_30_false#2:
    assume result.Own_Above_Threat$7 == 0;
    goto label_31#2;

  label_30_true#2:
    assume result.Own_Above_Threat$7 != 0;
    goto label_32#2;

  label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto label_32_true#2, label_32_false#2;

  label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_31#2;

  label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_33#2;

  label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto label_33#2$1;

  label_33#2$1:
    goto label_36#2;

  label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto label_36_true#2, label_36_false#2;

  label_36_false#2:
    assume !v4.INT_LEQ(result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto label_31#2;

  label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    $Pred.9$ := 0;
    goto label_38#2;

  label_36_true#2:
    assume v4.INT_LEQ(result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto label_37#2;

  label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    $Pred.9$ := 1;
    goto label_38#2;

  label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    result := $Pred.9$;
    goto label_29#2;

  label_10_true#2:
    assume upward_preferred != 0;
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto label_14#2$1;

  label_14#2$1:
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto label_17_true#2, label_17_false#2;

  label_17_false#2:
    assume result.Own_Below_Threat$3 == 0;
    goto label_18#2;

  label_17_true#2:
    assume result.Own_Below_Threat$3 != 0;
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$1$Entry;

  inline$Own_Below_Threat$1$Entry:
    inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$1$anon0#2;

  inline$Own_Below_Threat$1$anon0#2:
    inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$1$start#2;

  inline$Own_Below_Threat$1$start#2:
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$1$label_3#2;

  inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$1$label_1#2;

  inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$1$Return;

  inline$Own_Below_Threat$1$Return:
    result.Own_Below_Threat$4 := inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto label_19#2$1;

  label_19#2$1:
    goto label_22#2;

  label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto label_22_true#2, label_22_false#2;

  label_22_false#2:
    assume result.Own_Below_Threat$4 == 0;
    goto label_23#2;

  label_22_true#2:
    assume result.Own_Below_Threat$4 != 0;
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    result.ALIM$5 := inline$ALIM$1$result.ALIM$1;
    goto label_24#2$1;

  label_24#2$1:
    goto label_27#2;

  label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto label_27_true#2, label_27_false#2;

  label_27_false#2:
    assume !v4.INT_LEQ(result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    $Pred.6$ := 1;
    goto label_28#2;

  label_27_true#2:
    assume v4.INT_LEQ(result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_23#2;

  label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    $Pred.6$ := 0;
    goto label_28#2;

  label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    result := $Pred.6$;
    goto label_29#2;

  label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 72} true;
    result.Non_Crossing_Biased_Climb$1 := result;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 73} true;
    return;
}



implementation v4.Non_Crossing_Biased_Descend() returns (result.Non_Crossing_Biased_Descend$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.5$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} result: int;
  var {:extern} result.ALIM$4: int;
  var {:extern} result.ALIM$8: int;
  var {:extern} result.Inhibit_Biased_Climb$2: int;
  var {:extern} result.Own_Above_Threat$6: int;
  var {:extern} result.Own_Above_Threat$7: int;
  var {:extern} result.Own_Below_Threat$3: int;
  var {:extern} upward_crossing_situation: int;
  var {:extern} upward_preferred: int;
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
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$Own_Above_Threat$1$condVal: int;
  var inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$1$alloc: int;
  var inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    $Pred.5$ := 0;
    $Pred.9$ := 0;
    result := 0;
    result.ALIM$4 := 0;
    result.ALIM$8 := 0;
    result.Inhibit_Biased_Climb$2 := 0;
    result.Non_Crossing_Biased_Descend$1 := 0;
    result.Own_Above_Threat$6 := 0;
    result.Own_Above_Threat$7 := 0;
    result.Own_Below_Threat$3 := 0;
    upward_crossing_situation := 0;
    upward_preferred := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 77} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 78} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 79} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto label_6#2$1;

  label_6#2$1:
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], result.Inhibit_Biased_Climb$2));
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 82} true;
    goto label_10_true#2, label_10_false#2;

  label_10_false#2:
    assume upward_preferred == 0;
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    result.Own_Above_Threat$6 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto label_11#2$1;

  label_11#2$1:
    goto label_27#2;

  label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto label_27_true#2, label_27_false#2;

  label_27_false#2:
    assume result.Own_Above_Threat$6 == 0;
    goto label_28#2;

  label_27_true#2:
    assume result.Own_Above_Threat$6 != 0;
    goto label_29#2;

  label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$1$Entry;

  inline$Own_Above_Threat$1$Entry:
    inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$1$anon0#2;

  inline$Own_Above_Threat$1$anon0#2:
    inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$1$start#2;

  inline$Own_Above_Threat$1$start#2:
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$1$label_3#2;

  inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$1$label_1#2;

  inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$1$Return;

  inline$Own_Above_Threat$1$Return:
    result.Own_Above_Threat$7 := inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto label_29#2$1;

  label_29#2$1:
    goto label_32#2;

  label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto label_32_true#2, label_32_false#2;

  label_32_false#2:
    assume result.Own_Above_Threat$7 == 0;
    goto label_33#2;

  label_32_true#2:
    assume result.Own_Above_Threat$7 != 0;
    goto label_34#2;

  label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto label_34#2$1;

  label_34#2$1:
    goto label_37#2;

  label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto label_37_true#2, label_37_false#2;

  label_37_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], result.ALIM$8);
    goto label_33#2;

  label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    $Pred.9$ := 0;
    goto label_38#2;

  label_37_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], result.ALIM$8);
    goto label_28#2;

  label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    $Pred.9$ := 1;
    goto label_38#2;

  label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    result := $Pred.9$;
    goto label_26#2;

  label_10_true#2:
    assume upward_preferred != 0;
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto label_14#2$1;

  label_14#2$1:
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto label_17_true#2, label_17_false#2;

  label_17_false#2:
    assume result.Own_Below_Threat$3 == 0;
    goto label_18#2;

  label_17_true#2:
    assume result.Own_Below_Threat$3 != 0;
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto label_19_true#2, label_19_false#2;

  label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_18#2;

  label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_20#2;

  label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    result.ALIM$4 := inline$ALIM$1$result.ALIM$1;
    goto label_20#2$1;

  label_20#2$1:
    goto label_23#2;

  label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto label_23_true#2, label_23_false#2;

  label_23_false#2:
    assume !v4.INT_LEQ(result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    $Pred.5$ := 0;
    goto label_25#2;

  label_23_true#2:
    assume v4.INT_LEQ(result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    $Pred.5$ := 1;
    goto label_25#2;

  label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    result := $Pred.5$;
    goto label_26#2;

  label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 90} true;
    result.Non_Crossing_Biased_Descend$1 := result;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 91} true;
    return;
}



implementation v4.Own_Above_Threat() returns (result.Own_Above_Threat$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.Own_Above_Threat$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    return;
}



implementation v4.Own_Below_Threat() returns (result.Own_Below_Threat$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.Own_Below_Threat$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    return;
}



implementation v4.alt_sep_test() returns (result.alt_sep_test$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.2$: int;
  var {:extern} $Pred.3$: int;
  var {:extern} $Pred.6$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} alt_sep: int;
  var {:extern} enabled: int;
  var {:extern} intent_not_known: int;
  var {:extern} need_downward_RA: int;
  var {:extern} need_upward_RA: int;
  var {:extern} result.Non_Crossing_Biased_Climb$4: int;
  var {:extern} result.Non_Crossing_Biased_Descend$7: int;
  var {:extern} result.Own_Above_Threat$8: int;
  var {:extern} result.Own_Below_Threat$5: int;
  var {:extern} tcas_equipped: int;
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
  var inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Climb$0$condVal: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.6$: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Climb$0$result: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$5: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1: int;
  var inline$Non_Crossing_Biased_Climb$0$alloc: int;
  var inline$Non_Crossing_Biased_Climb$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$Own_Below_Threat$1$condVal: int;
  var inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$1$alloc: int;
  var inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$2$havoc_stringTemp: int;
  var inline$Own_Below_Threat$2$condVal: int;
  var inline$Own_Below_Threat$2$tempBoogie0: int;
  var inline$Own_Below_Threat$2$tempBoogie1: int;
  var inline$Own_Below_Threat$2$tempBoogie2: int;
  var inline$Own_Below_Threat$2$tempBoogie3: int;
  var inline$Own_Below_Threat$2$tempBoogie4: int;
  var inline$Own_Below_Threat$2$tempBoogie5: int;
  var inline$Own_Below_Threat$2$tempBoogie6: int;
  var inline$Own_Below_Threat$2$tempBoogie7: int;
  var inline$Own_Below_Threat$2$tempBoogie8: int;
  var inline$Own_Below_Threat$2$tempBoogie9: int;
  var inline$Own_Below_Threat$2$tempBoogie10: int;
  var inline$Own_Below_Threat$2$tempBoogie11: int;
  var inline$Own_Below_Threat$2$tempBoogie12: int;
  var inline$Own_Below_Threat$2$tempBoogie13: int;
  var inline$Own_Below_Threat$2$tempBoogie14: int;
  var inline$Own_Below_Threat$2$tempBoogie15: int;
  var inline$Own_Below_Threat$2$tempBoogie16: int;
  var inline$Own_Below_Threat$2$tempBoogie17: int;
  var inline$Own_Below_Threat$2$tempBoogie18: int;
  var inline$Own_Below_Threat$2$tempBoogie19: int;
  var inline$Own_Below_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$2$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$2$alloc: int;
  var inline$Own_Below_Threat$2$detChoiceCnt: int;
  var inline$Own_Below_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.PINT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Descend$0$condVal: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.5$: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Descend$0$result: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$4: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Descend$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1: int;
  var inline$Non_Crossing_Biased_Descend$0$alloc: int;
  var inline$Non_Crossing_Biased_Descend$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$1$condVal: int;
  var inline$Inhibit_Biased_Climb$1$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$1$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$1$alloc: int;
  var inline$Inhibit_Biased_Climb$1$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$1$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$Own_Above_Threat$1$condVal: int;
  var inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$1$alloc: int;
  var inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$2$havoc_stringTemp: int;
  var inline$Own_Above_Threat$2$condVal: int;
  var inline$Own_Above_Threat$2$tempBoogie0: int;
  var inline$Own_Above_Threat$2$tempBoogie1: int;
  var inline$Own_Above_Threat$2$tempBoogie2: int;
  var inline$Own_Above_Threat$2$tempBoogie3: int;
  var inline$Own_Above_Threat$2$tempBoogie4: int;
  var inline$Own_Above_Threat$2$tempBoogie5: int;
  var inline$Own_Above_Threat$2$tempBoogie6: int;
  var inline$Own_Above_Threat$2$tempBoogie7: int;
  var inline$Own_Above_Threat$2$tempBoogie8: int;
  var inline$Own_Above_Threat$2$tempBoogie9: int;
  var inline$Own_Above_Threat$2$tempBoogie10: int;
  var inline$Own_Above_Threat$2$tempBoogie11: int;
  var inline$Own_Above_Threat$2$tempBoogie12: int;
  var inline$Own_Above_Threat$2$tempBoogie13: int;
  var inline$Own_Above_Threat$2$tempBoogie14: int;
  var inline$Own_Above_Threat$2$tempBoogie15: int;
  var inline$Own_Above_Threat$2$tempBoogie16: int;
  var inline$Own_Above_Threat$2$tempBoogie17: int;
  var inline$Own_Above_Threat$2$tempBoogie18: int;
  var inline$Own_Above_Threat$2$tempBoogie19: int;
  var inline$Own_Above_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$2$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$2$alloc: int;
  var inline$Own_Above_Threat$2$detChoiceCnt: int;
  var inline$Own_Above_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.PINT4: [int]int;
  var inline$ALIM$2$havoc_stringTemp: int;
  var inline$ALIM$2$condVal: int;
  var inline$ALIM$2$tempBoogie0: int;
  var inline$ALIM$2$tempBoogie1: int;
  var inline$ALIM$2$tempBoogie2: int;
  var inline$ALIM$2$tempBoogie3: int;
  var inline$ALIM$2$tempBoogie4: int;
  var inline$ALIM$2$tempBoogie5: int;
  var inline$ALIM$2$tempBoogie6: int;
  var inline$ALIM$2$tempBoogie7: int;
  var inline$ALIM$2$tempBoogie8: int;
  var inline$ALIM$2$tempBoogie9: int;
  var inline$ALIM$2$tempBoogie10: int;
  var inline$ALIM$2$tempBoogie11: int;
  var inline$ALIM$2$tempBoogie12: int;
  var inline$ALIM$2$tempBoogie13: int;
  var inline$ALIM$2$tempBoogie14: int;
  var inline$ALIM$2$tempBoogie15: int;
  var inline$ALIM$2$tempBoogie16: int;
  var inline$ALIM$2$tempBoogie17: int;
  var inline$ALIM$2$tempBoogie18: int;
  var inline$ALIM$2$tempBoogie19: int;
  var inline$ALIM$2$__havoc_dummy_return: int;
  var inline$ALIM$2$result.ALIM$1: int;
  var inline$ALIM$2$alloc: int;
  var inline$ALIM$2$detChoiceCnt: int;
  var inline$ALIM$2$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$2$Res_PROBED: [int]int;
  var inline$ALIM$2$Mem_T.A4INT4: [int]int;
  var inline$ALIM$2$Mem_T.INT4: [int]int;
  var inline$ALIM$2$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$3$havoc_stringTemp: int;
  var inline$Own_Below_Threat$3$condVal: int;
  var inline$Own_Below_Threat$3$tempBoogie0: int;
  var inline$Own_Below_Threat$3$tempBoogie1: int;
  var inline$Own_Below_Threat$3$tempBoogie2: int;
  var inline$Own_Below_Threat$3$tempBoogie3: int;
  var inline$Own_Below_Threat$3$tempBoogie4: int;
  var inline$Own_Below_Threat$3$tempBoogie5: int;
  var inline$Own_Below_Threat$3$tempBoogie6: int;
  var inline$Own_Below_Threat$3$tempBoogie7: int;
  var inline$Own_Below_Threat$3$tempBoogie8: int;
  var inline$Own_Below_Threat$3$tempBoogie9: int;
  var inline$Own_Below_Threat$3$tempBoogie10: int;
  var inline$Own_Below_Threat$3$tempBoogie11: int;
  var inline$Own_Below_Threat$3$tempBoogie12: int;
  var inline$Own_Below_Threat$3$tempBoogie13: int;
  var inline$Own_Below_Threat$3$tempBoogie14: int;
  var inline$Own_Below_Threat$3$tempBoogie15: int;
  var inline$Own_Below_Threat$3$tempBoogie16: int;
  var inline$Own_Below_Threat$3$tempBoogie17: int;
  var inline$Own_Below_Threat$3$tempBoogie18: int;
  var inline$Own_Below_Threat$3$tempBoogie19: int;
  var inline$Own_Below_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$3$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$3$alloc: int;
  var inline$Own_Below_Threat$3$detChoiceCnt: int;
  var inline$Own_Below_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.PINT4: [int]int;
  var inline$ALIM$3$havoc_stringTemp: int;
  var inline$ALIM$3$condVal: int;
  var inline$ALIM$3$tempBoogie0: int;
  var inline$ALIM$3$tempBoogie1: int;
  var inline$ALIM$3$tempBoogie2: int;
  var inline$ALIM$3$tempBoogie3: int;
  var inline$ALIM$3$tempBoogie4: int;
  var inline$ALIM$3$tempBoogie5: int;
  var inline$ALIM$3$tempBoogie6: int;
  var inline$ALIM$3$tempBoogie7: int;
  var inline$ALIM$3$tempBoogie8: int;
  var inline$ALIM$3$tempBoogie9: int;
  var inline$ALIM$3$tempBoogie10: int;
  var inline$ALIM$3$tempBoogie11: int;
  var inline$ALIM$3$tempBoogie12: int;
  var inline$ALIM$3$tempBoogie13: int;
  var inline$ALIM$3$tempBoogie14: int;
  var inline$ALIM$3$tempBoogie15: int;
  var inline$ALIM$3$tempBoogie16: int;
  var inline$ALIM$3$tempBoogie17: int;
  var inline$ALIM$3$tempBoogie18: int;
  var inline$ALIM$3$tempBoogie19: int;
  var inline$ALIM$3$__havoc_dummy_return: int;
  var inline$ALIM$3$result.ALIM$1: int;
  var inline$ALIM$3$alloc: int;
  var inline$ALIM$3$detChoiceCnt: int;
  var inline$ALIM$3$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$3$Res_PROBED: [int]int;
  var inline$ALIM$3$Mem_T.A4INT4: [int]int;
  var inline$ALIM$3$Mem_T.INT4: [int]int;
  var inline$ALIM$3$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$3$havoc_stringTemp: int;
  var inline$Own_Above_Threat$3$condVal: int;
  var inline$Own_Above_Threat$3$tempBoogie0: int;
  var inline$Own_Above_Threat$3$tempBoogie1: int;
  var inline$Own_Above_Threat$3$tempBoogie2: int;
  var inline$Own_Above_Threat$3$tempBoogie3: int;
  var inline$Own_Above_Threat$3$tempBoogie4: int;
  var inline$Own_Above_Threat$3$tempBoogie5: int;
  var inline$Own_Above_Threat$3$tempBoogie6: int;
  var inline$Own_Above_Threat$3$tempBoogie7: int;
  var inline$Own_Above_Threat$3$tempBoogie8: int;
  var inline$Own_Above_Threat$3$tempBoogie9: int;
  var inline$Own_Above_Threat$3$tempBoogie10: int;
  var inline$Own_Above_Threat$3$tempBoogie11: int;
  var inline$Own_Above_Threat$3$tempBoogie12: int;
  var inline$Own_Above_Threat$3$tempBoogie13: int;
  var inline$Own_Above_Threat$3$tempBoogie14: int;
  var inline$Own_Above_Threat$3$tempBoogie15: int;
  var inline$Own_Above_Threat$3$tempBoogie16: int;
  var inline$Own_Above_Threat$3$tempBoogie17: int;
  var inline$Own_Above_Threat$3$tempBoogie18: int;
  var inline$Own_Above_Threat$3$tempBoogie19: int;
  var inline$Own_Above_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$3$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$3$alloc: int;
  var inline$Own_Above_Threat$3$detChoiceCnt: int;
  var inline$Own_Above_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    $Pred.2$ := 0;
    $Pred.3$ := 0;
    $Pred.6$ := 0;
    $Pred.9$ := 0;
    alt_sep := 0;
    enabled := 0;
    intent_not_known := 0;
    need_downward_RA := 0;
    need_upward_RA := 0;
    result.Non_Crossing_Biased_Climb$4 := 0;
    result.Non_Crossing_Biased_Descend$7 := 0;
    result.Own_Above_Threat$8 := 0;
    result.Own_Below_Threat$5 := 0;
    result.alt_sep_test$1 := 0;
    tcas_equipped := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 106} true;
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 106} true;
    goto label_8#2;

  label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 107} true;
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto label_9_true#2, label_9_false#2;

  label_9_false#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] == 0;
    goto label_10#2;

  label_9_true#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] != 0;
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto label_11_true#2, label_11_false#2;

  label_11_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto label_10#2;

  label_11_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto label_12#2;

  label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto label_12_true#2, label_12_false#2;

  label_12_false#2:
    assume !v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    $Pred.2$ := 0;
    goto label_14#2;

  label_12_true#2:
    assume v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_13#2;

  label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    $Pred.2$ := 1;
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    enabled := $Pred.2$;
    goto label_15#2;

  label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 110} true;
    tcas_equipped := v4.LIFT(v4.INT_EQ(v4.Mem_T.INT4[v4.Other_Capability], 1));
    goto label_16#2;

  label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    goto label_16_true#2, label_16_false#2;

  label_16_false#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] == 0;
    goto label_17#2;

  label_16_true#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] != 0;
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    goto label_18_true#2, label_18_false#2;

  label_18_false#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] == 0;
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    $Pred.3$ := 1;
    goto label_20#2;

  label_18_true#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] != 0;
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    $Pred.3$ := 0;
    goto label_20#2;

  label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    intent_not_known := $Pred.3$;
    goto label_21#2;

  label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 113} true;
    alt_sep := 0;
    goto label_22#2;

  label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto label_22_true#2, label_22_false#2;

  label_22_false#2:
    assume enabled == 0;
    goto label_23#2;

  label_22_true#2:
    assume enabled != 0;
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto label_24_true#2, label_24_false#2;

  label_24_false#2:
    assume tcas_equipped == 0;
    goto label_25#2;

  label_24_true#2:
    assume tcas_equipped != 0;
    goto label_26#2;

  label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto label_26_true#2, label_26_false#2;

  label_26_false#2:
    assume intent_not_known == 0;
    goto label_25#2;

  label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto label_25_true#2, label_25_false#2;

  label_25_false#2:
    assume tcas_equipped == 0;
    goto label_27#2;

  label_25_true#2:
    assume tcas_equipped != 0;
    goto label_23#2;

  label_26_true#2:
    assume intent_not_known != 0;
    goto label_27#2;

  label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$Non_Crossing_Biased_Climb$0$Entry;

  inline$Non_Crossing_Biased_Climb$0$Entry:
    inline$Non_Crossing_Biased_Climb$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Climb$0$anon0#2;

  inline$Non_Crossing_Biased_Climb$0$anon0#2:
    inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Climb$0$start#2;

  inline$Non_Crossing_Biased_Climb$0$start#2:
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Climb$0$result := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_3#2;

  inline$Non_Crossing_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 59} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_4#2;

  inline$Non_Crossing_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 60} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_5#2;

  inline$Non_Crossing_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 61} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2;

  inline$Non_Crossing_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_9#2;

  inline$Non_Crossing_Biased_Climb$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Climb$0$label_10#2;

  inline$Non_Crossing_Biased_Climb$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 64} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_10_true#2, inline$Non_Crossing_Biased_Climb$0$label_10_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2;

  inline$Non_Crossing_Biased_Climb$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_30#2;

  inline$Non_Crossing_Biased_Climb$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_30_true#2, inline$Non_Crossing_Biased_Climb$0$label_30_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_32#2;

  inline$Non_Crossing_Biased_Climb$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_32_true#2, inline$Non_Crossing_Biased_Climb$0$label_32_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2;

  inline$Non_Crossing_Biased_Climb$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_33#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_36#2;

  inline$Non_Crossing_Biased_Climb$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_36_true#2, inline$Non_Crossing_Biased_Climb$0$label_36_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_37#2;

  inline$Non_Crossing_Biased_Climb$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2;

  inline$Non_Crossing_Biased_Climb$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_17#2;

  inline$Non_Crossing_Biased_Climb$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_17_true#2, inline$Non_Crossing_Biased_Climb$0$label_17_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2;

  inline$Non_Crossing_Biased_Climb$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$1$Entry;

  inline$Own_Below_Threat$1$Entry:
    inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$1$anon0#2;

  inline$Own_Below_Threat$1$anon0#2:
    inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$1$start#2;

  inline$Own_Below_Threat$1$start#2:
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$1$label_3#2;

  inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$1$label_1#2;

  inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$1$Return;

  inline$Own_Below_Threat$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_19#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_22#2;

  inline$Non_Crossing_Biased_Climb$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_22_true#2, inline$Non_Crossing_Biased_Climb$0$label_22_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2;

  inline$Non_Crossing_Biased_Climb$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := inline$ALIM$1$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_24#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_27#2;

  inline$Non_Crossing_Biased_Climb$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_27_true#2, inline$Non_Crossing_Biased_Climb$0$label_27_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.6$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 72} true;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := inline$Non_Crossing_Biased_Climb$0$result;
    goto inline$Non_Crossing_Biased_Climb$0$label_1#2;

  inline$Non_Crossing_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 73} true;
    goto inline$Non_Crossing_Biased_Climb$0$Return;

  inline$Non_Crossing_Biased_Climb$0$Return:
    result.Non_Crossing_Biased_Climb$4 := inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1;
    goto label_27#2$1;

  label_27#2$1:
    goto label_30#2;

  label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto label_30_true#2, label_30_false#2;

  label_30_false#2:
    assume result.Non_Crossing_Biased_Climb$4 == 0;
    goto label_31#2;

  label_30_true#2:
    assume result.Non_Crossing_Biased_Climb$4 != 0;
    goto label_32#2;

  label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$Own_Below_Threat$2$Entry;

  inline$Own_Below_Threat$2$Entry:
    inline$Own_Below_Threat$2$alloc := v4.alloc;
    inline$Own_Below_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$2$anon0#2;

  inline$Own_Below_Threat$2$anon0#2:
    inline$Own_Below_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$2$start#2;

  inline$Own_Below_Threat$2$start#2:
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$2$label_3#2;

  inline$Own_Below_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$2$label_1#2;

  inline$Own_Below_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$2$Return;

  inline$Own_Below_Threat$2$Return:
    result.Own_Below_Threat$5 := inline$Own_Below_Threat$2$result.Own_Below_Threat$1;
    goto label_32#2$1;

  label_32#2$1:
    goto label_35#2;

  label_35#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto label_35_true#2, label_35_false#2;

  label_35_false#2:
    assume result.Own_Below_Threat$5 == 0;
    goto label_31#2;

  label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    $Pred.6$ := 0;
    goto label_37#2;

  label_35_true#2:
    assume result.Own_Below_Threat$5 != 0;
    goto label_36#2;

  label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    $Pred.6$ := 1;
    goto label_37#2;

  label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    need_upward_RA := $Pred.6$;
    goto label_38#2;

  label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$Non_Crossing_Biased_Descend$0$Entry;

  inline$Non_Crossing_Biased_Descend$0$Entry:
    inline$Non_Crossing_Biased_Descend$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Descend$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Descend$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Descend$0$anon0#2;

  inline$Non_Crossing_Biased_Descend$0$anon0#2:
    inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Descend$0$start#2;

  inline$Non_Crossing_Biased_Descend$0$start#2:
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Descend$0$result := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_3#2;

  inline$Non_Crossing_Biased_Descend$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 77} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_4#2;

  inline$Non_Crossing_Biased_Descend$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 78} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_5#2;

  inline$Non_Crossing_Biased_Descend$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 79} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2;

  inline$Non_Crossing_Biased_Descend$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    goto inline$Inhibit_Biased_Climb$1$Entry;

  inline$Inhibit_Biased_Climb$1$Entry:
    inline$Inhibit_Biased_Climb$1$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$1$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$1$anon0#2;

  inline$Inhibit_Biased_Climb$1$anon0#2:
    inline$Inhibit_Biased_Climb$1$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$1$start#2;

  inline$Inhibit_Biased_Climb$1$start#2:
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$1$label_3#2;

  inline$Inhibit_Biased_Climb$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$1$label_3_true#2, inline$Inhibit_Biased_Climb$1$label_3_false#2;

  inline$Inhibit_Biased_Climb$1$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$1$label_4#2;

  inline$Inhibit_Biased_Climb$1$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$1$label_5#2;

  inline$Inhibit_Biased_Climb$1$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$1$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$1$label_1#2;

  inline$Inhibit_Biased_Climb$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$1$Return;

  inline$Inhibit_Biased_Climb$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_9#2;

  inline$Non_Crossing_Biased_Descend$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Descend$0$label_10#2;

  inline$Non_Crossing_Biased_Descend$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 82} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_10_true#2, inline$Non_Crossing_Biased_Descend$0$label_10_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2;

  inline$Non_Crossing_Biased_Descend$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$1$Entry;

  inline$Own_Above_Threat$1$Entry:
    inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$1$anon0#2;

  inline$Own_Above_Threat$1$anon0#2:
    inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$1$start#2;

  inline$Own_Above_Threat$1$start#2:
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$1$label_3#2;

  inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$1$label_1#2;

  inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$1$Return;

  inline$Own_Above_Threat$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_27#2;

  inline$Non_Crossing_Biased_Descend$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_27_true#2, inline$Non_Crossing_Biased_Descend$0$label_27_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2;

  inline$Non_Crossing_Biased_Descend$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$2$Entry;

  inline$Own_Above_Threat$2$Entry:
    inline$Own_Above_Threat$2$alloc := v4.alloc;
    inline$Own_Above_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$2$anon0#2;

  inline$Own_Above_Threat$2$anon0#2:
    inline$Own_Above_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$2$start#2;

  inline$Own_Above_Threat$2$start#2:
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$2$label_3#2;

  inline$Own_Above_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$2$label_1#2;

  inline$Own_Above_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$2$Return;

  inline$Own_Above_Threat$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$2$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_29#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_32#2;

  inline$Non_Crossing_Biased_Descend$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_32_true#2, inline$Non_Crossing_Biased_Descend$0$label_32_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2;

  inline$Non_Crossing_Biased_Descend$0$label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$ALIM$2$Entry;

  inline$ALIM$2$Entry:
    inline$ALIM$2$alloc := v4.alloc;
    inline$ALIM$2$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$2$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$2$anon0#2;

  inline$ALIM$2$anon0#2:
    inline$ALIM$2$havoc_stringTemp := 0;
    goto inline$ALIM$2$start#2;

  inline$ALIM$2$start#2:
    inline$ALIM$2$result.ALIM$1 := 0;
    goto inline$ALIM$2$label_3#2;

  inline$ALIM$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$2$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$2$label_1#2;

  inline$ALIM$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$2$Return;

  inline$ALIM$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := inline$ALIM$2$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_34#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_37#2;

  inline$Non_Crossing_Biased_Descend$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_37_true#2, inline$Non_Crossing_Biased_Descend$0$label_37_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], inline$Non_Crossing_Biased_Descend$0$result.ALIM$8);
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], inline$Non_Crossing_Biased_Descend$0$result.ALIM$8);
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2;

  inline$Non_Crossing_Biased_Descend$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Own_Below_Threat$3$Entry;

  inline$Own_Below_Threat$3$Entry:
    inline$Own_Below_Threat$3$alloc := v4.alloc;
    inline$Own_Below_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$3$anon0#2;

  inline$Own_Below_Threat$3$anon0#2:
    inline$Own_Below_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$3$start#2;

  inline$Own_Below_Threat$3$start#2:
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$3$label_3#2;

  inline$Own_Below_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$3$label_1#2;

  inline$Own_Below_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$3$Return;

  inline$Own_Below_Threat$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$3$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_17#2;

  inline$Non_Crossing_Biased_Descend$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_17_true#2, inline$Non_Crossing_Biased_Descend$0$label_17_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_19#2;

  inline$Non_Crossing_Biased_Descend$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_19_true#2, inline$Non_Crossing_Biased_Descend$0$label_19_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2;

  inline$Non_Crossing_Biased_Descend$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$ALIM$3$Entry;

  inline$ALIM$3$Entry:
    inline$ALIM$3$alloc := v4.alloc;
    inline$ALIM$3$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$3$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$3$anon0#2;

  inline$ALIM$3$anon0#2:
    inline$ALIM$3$havoc_stringTemp := 0;
    goto inline$ALIM$3$start#2;

  inline$ALIM$3$start#2:
    inline$ALIM$3$result.ALIM$1 := 0;
    goto inline$ALIM$3$label_3#2;

  inline$ALIM$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$3$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$3$label_1#2;

  inline$ALIM$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$3$Return;

  inline$ALIM$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := inline$ALIM$3$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_20#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_23#2;

  inline$Non_Crossing_Biased_Descend$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_23_true#2, inline$Non_Crossing_Biased_Descend$0$label_23_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_24#2;

  inline$Non_Crossing_Biased_Descend$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.5$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 90} true;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := inline$Non_Crossing_Biased_Descend$0$result;
    goto inline$Non_Crossing_Biased_Descend$0$label_1#2;

  inline$Non_Crossing_Biased_Descend$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 91} true;
    goto inline$Non_Crossing_Biased_Descend$0$Return;

  inline$Non_Crossing_Biased_Descend$0$Return:
    result.Non_Crossing_Biased_Descend$7 := inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1;
    goto label_38#2$1;

  label_38#2$1:
    goto label_41#2;

  label_41#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto label_41_true#2, label_41_false#2;

  label_41_false#2:
    assume result.Non_Crossing_Biased_Descend$7 == 0;
    goto label_42#2;

  label_41_true#2:
    assume result.Non_Crossing_Biased_Descend$7 != 0;
    goto label_43#2;

  label_43#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$Own_Above_Threat$3$Entry;

  inline$Own_Above_Threat$3$Entry:
    inline$Own_Above_Threat$3$alloc := v4.alloc;
    inline$Own_Above_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$3$anon0#2;

  inline$Own_Above_Threat$3$anon0#2:
    inline$Own_Above_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$3$start#2;

  inline$Own_Above_Threat$3$start#2:
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$3$label_3#2;

  inline$Own_Above_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$3$label_1#2;

  inline$Own_Above_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$3$Return;

  inline$Own_Above_Threat$3$Return:
    result.Own_Above_Threat$8 := inline$Own_Above_Threat$3$result.Own_Above_Threat$1;
    goto label_43#2$1;

  label_43#2$1:
    goto label_46#2;

  label_46#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto label_46_true#2, label_46_false#2;

  label_46_false#2:
    assume result.Own_Above_Threat$8 == 0;
    goto label_42#2;

  label_42#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    $Pred.9$ := 0;
    goto label_48#2;

  label_46_true#2:
    assume result.Own_Above_Threat$8 != 0;
    goto label_47#2;

  label_47#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    $Pred.9$ := 1;
    goto label_48#2;

  label_48#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    need_downward_RA := $Pred.9$;
    goto label_49#2;

  label_49#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 119} true;
    goto label_49_true#2, label_49_false#2;

  label_49_false#2:
    assume need_upward_RA == 0;
    goto label_50#2;

  label_49_true#2:
    assume need_upward_RA != 0;
    goto label_51#2;

  label_51#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 119} true;
    goto label_51_true#2, label_51_false#2;

  label_51_false#2:
    assume need_downward_RA == 0;
    goto label_50#2;

  label_50#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 124} true;
    goto label_50_true#2, label_50_false#2;

  label_50_false#2:
    assume need_upward_RA == 0;
    goto label_53#2;

  label_53#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 126} true;
    goto label_53_true#2, label_53_false#2;

  label_53_false#2:
    assume need_downward_RA == 0;
    goto label_55#2;

  label_55#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 129} true;
    alt_sep := 0;
    goto label_23#2;

  label_53_true#2:
    assume need_downward_RA != 0;
    goto label_56#2;

  label_56#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 127} true;
    alt_sep := 2;
    goto label_23#2;

  label_50_true#2:
    assume need_upward_RA != 0;
    goto label_54#2;

  label_54#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 125} true;
    alt_sep := 1;
    goto label_23#2;

  label_51_true#2:
    assume need_downward_RA != 0;
    goto label_52#2;

  label_52#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 123} true;
    alt_sep := 0;
    goto label_23#2;

  label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 132} true;
    result.alt_sep_test$1 := alt_sep;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 133} true;
    return;
}



implementation v4.initialize()
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 41} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 0) := 400];
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 42} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 1) := 500];
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 43} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 2) := 640];
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 44} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 3) := 740];
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 45} true;
    return;
}



implementation {:inline 1} v4.tcas(a1_.1: int, a2_.1: int, a3_.1: int, a4_.1: int, a5_.1: int, a6_.1: int, a7_.1: int, a8_.1: int, a9_.1: int, a10_.1: int, a11_.1: int, a12_.1: int) returns (result.tcas$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} a1: int;
  var {:extern} a10: int;
  var {:extern} a11: int;
  var {:extern} a12: int;
  var {:extern} a2: int;
  var {:extern} a3: int;
  var {:extern} a4: int;
  var {:extern} a5: int;
  var {:extern} a6: int;
  var {:extern} a7: int;
  var {:extern} a8: int;
  var {:extern} a9: int;
  var {:extern} result.alt_sep_test$2: int;
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
  var inline$initialize$0$havoc_stringTemp: int;
  var inline$initialize$0$condVal: int;
  var inline$initialize$0$tempBoogie0: int;
  var inline$initialize$0$tempBoogie1: int;
  var inline$initialize$0$tempBoogie2: int;
  var inline$initialize$0$tempBoogie3: int;
  var inline$initialize$0$tempBoogie4: int;
  var inline$initialize$0$tempBoogie5: int;
  var inline$initialize$0$tempBoogie6: int;
  var inline$initialize$0$tempBoogie7: int;
  var inline$initialize$0$tempBoogie8: int;
  var inline$initialize$0$tempBoogie9: int;
  var inline$initialize$0$tempBoogie10: int;
  var inline$initialize$0$tempBoogie11: int;
  var inline$initialize$0$tempBoogie12: int;
  var inline$initialize$0$tempBoogie13: int;
  var inline$initialize$0$tempBoogie14: int;
  var inline$initialize$0$tempBoogie15: int;
  var inline$initialize$0$tempBoogie16: int;
  var inline$initialize$0$tempBoogie17: int;
  var inline$initialize$0$tempBoogie18: int;
  var inline$initialize$0$tempBoogie19: int;
  var inline$initialize$0$__havoc_dummy_return: int;
  var inline$initialize$0$alloc: int;
  var inline$initialize$0$detChoiceCnt: int;
  var inline$initialize$0$Res_KERNEL_SOURCE: [int]int;
  var inline$initialize$0$Res_PROBED: [int]int;
  var inline$initialize$0$Mem_T.A4INT4: [int]int;
  var inline$initialize$0$Mem_T.INT4: [int]int;
  var inline$initialize$0$Mem_T.PINT4: [int]int;
  var inline$alt_sep_test$0$havoc_stringTemp: int;
  var inline$alt_sep_test$0$condVal: int;
  var inline$alt_sep_test$0$$Pred.2$: int;
  var inline$alt_sep_test$0$$Pred.3$: int;
  var inline$alt_sep_test$0$$Pred.6$: int;
  var inline$alt_sep_test$0$$Pred.9$: int;
  var inline$alt_sep_test$0$alt_sep: int;
  var inline$alt_sep_test$0$enabled: int;
  var inline$alt_sep_test$0$intent_not_known: int;
  var inline$alt_sep_test$0$need_downward_RA: int;
  var inline$alt_sep_test$0$need_upward_RA: int;
  var inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4: int;
  var inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7: int;
  var inline$alt_sep_test$0$result.Own_Above_Threat$8: int;
  var inline$alt_sep_test$0$result.Own_Below_Threat$5: int;
  var inline$alt_sep_test$0$tcas_equipped: int;
  var inline$alt_sep_test$0$tempBoogie0: int;
  var inline$alt_sep_test$0$tempBoogie1: int;
  var inline$alt_sep_test$0$tempBoogie2: int;
  var inline$alt_sep_test$0$tempBoogie3: int;
  var inline$alt_sep_test$0$tempBoogie4: int;
  var inline$alt_sep_test$0$tempBoogie5: int;
  var inline$alt_sep_test$0$tempBoogie6: int;
  var inline$alt_sep_test$0$tempBoogie7: int;
  var inline$alt_sep_test$0$tempBoogie8: int;
  var inline$alt_sep_test$0$tempBoogie9: int;
  var inline$alt_sep_test$0$tempBoogie10: int;
  var inline$alt_sep_test$0$tempBoogie11: int;
  var inline$alt_sep_test$0$tempBoogie12: int;
  var inline$alt_sep_test$0$tempBoogie13: int;
  var inline$alt_sep_test$0$tempBoogie14: int;
  var inline$alt_sep_test$0$tempBoogie15: int;
  var inline$alt_sep_test$0$tempBoogie16: int;
  var inline$alt_sep_test$0$tempBoogie17: int;
  var inline$alt_sep_test$0$tempBoogie18: int;
  var inline$alt_sep_test$0$tempBoogie19: int;
  var inline$alt_sep_test$0$__havoc_dummy_return: int;
  var inline$alt_sep_test$0$result.alt_sep_test$1: int;
  var inline$alt_sep_test$0$alloc: int;
  var inline$alt_sep_test$0$detChoiceCnt: int;
  var inline$alt_sep_test$0$Res_KERNEL_SOURCE: [int]int;
  var inline$alt_sep_test$0$Res_PROBED: [int]int;
  var inline$alt_sep_test$0$Mem_T.A4INT4: [int]int;
  var inline$alt_sep_test$0$Mem_T.INT4: [int]int;
  var inline$alt_sep_test$0$Mem_T.PINT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Climb$0$condVal: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.6$: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Climb$0$result: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$5: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1: int;
  var inline$Non_Crossing_Biased_Climb$0$alloc: int;
  var inline$Non_Crossing_Biased_Climb$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$Own_Below_Threat$1$condVal: int;
  var inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$1$alloc: int;
  var inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$2$havoc_stringTemp: int;
  var inline$Own_Below_Threat$2$condVal: int;
  var inline$Own_Below_Threat$2$tempBoogie0: int;
  var inline$Own_Below_Threat$2$tempBoogie1: int;
  var inline$Own_Below_Threat$2$tempBoogie2: int;
  var inline$Own_Below_Threat$2$tempBoogie3: int;
  var inline$Own_Below_Threat$2$tempBoogie4: int;
  var inline$Own_Below_Threat$2$tempBoogie5: int;
  var inline$Own_Below_Threat$2$tempBoogie6: int;
  var inline$Own_Below_Threat$2$tempBoogie7: int;
  var inline$Own_Below_Threat$2$tempBoogie8: int;
  var inline$Own_Below_Threat$2$tempBoogie9: int;
  var inline$Own_Below_Threat$2$tempBoogie10: int;
  var inline$Own_Below_Threat$2$tempBoogie11: int;
  var inline$Own_Below_Threat$2$tempBoogie12: int;
  var inline$Own_Below_Threat$2$tempBoogie13: int;
  var inline$Own_Below_Threat$2$tempBoogie14: int;
  var inline$Own_Below_Threat$2$tempBoogie15: int;
  var inline$Own_Below_Threat$2$tempBoogie16: int;
  var inline$Own_Below_Threat$2$tempBoogie17: int;
  var inline$Own_Below_Threat$2$tempBoogie18: int;
  var inline$Own_Below_Threat$2$tempBoogie19: int;
  var inline$Own_Below_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$2$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$2$alloc: int;
  var inline$Own_Below_Threat$2$detChoiceCnt: int;
  var inline$Own_Below_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.PINT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Descend$0$condVal: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.5$: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Descend$0$result: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$4: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Descend$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1: int;
  var inline$Non_Crossing_Biased_Descend$0$alloc: int;
  var inline$Non_Crossing_Biased_Descend$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$1$condVal: int;
  var inline$Inhibit_Biased_Climb$1$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$1$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$1$alloc: int;
  var inline$Inhibit_Biased_Climb$1$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$1$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$Own_Above_Threat$1$condVal: int;
  var inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$1$alloc: int;
  var inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$2$havoc_stringTemp: int;
  var inline$Own_Above_Threat$2$condVal: int;
  var inline$Own_Above_Threat$2$tempBoogie0: int;
  var inline$Own_Above_Threat$2$tempBoogie1: int;
  var inline$Own_Above_Threat$2$tempBoogie2: int;
  var inline$Own_Above_Threat$2$tempBoogie3: int;
  var inline$Own_Above_Threat$2$tempBoogie4: int;
  var inline$Own_Above_Threat$2$tempBoogie5: int;
  var inline$Own_Above_Threat$2$tempBoogie6: int;
  var inline$Own_Above_Threat$2$tempBoogie7: int;
  var inline$Own_Above_Threat$2$tempBoogie8: int;
  var inline$Own_Above_Threat$2$tempBoogie9: int;
  var inline$Own_Above_Threat$2$tempBoogie10: int;
  var inline$Own_Above_Threat$2$tempBoogie11: int;
  var inline$Own_Above_Threat$2$tempBoogie12: int;
  var inline$Own_Above_Threat$2$tempBoogie13: int;
  var inline$Own_Above_Threat$2$tempBoogie14: int;
  var inline$Own_Above_Threat$2$tempBoogie15: int;
  var inline$Own_Above_Threat$2$tempBoogie16: int;
  var inline$Own_Above_Threat$2$tempBoogie17: int;
  var inline$Own_Above_Threat$2$tempBoogie18: int;
  var inline$Own_Above_Threat$2$tempBoogie19: int;
  var inline$Own_Above_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$2$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$2$alloc: int;
  var inline$Own_Above_Threat$2$detChoiceCnt: int;
  var inline$Own_Above_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.PINT4: [int]int;
  var inline$ALIM$2$havoc_stringTemp: int;
  var inline$ALIM$2$condVal: int;
  var inline$ALIM$2$tempBoogie0: int;
  var inline$ALIM$2$tempBoogie1: int;
  var inline$ALIM$2$tempBoogie2: int;
  var inline$ALIM$2$tempBoogie3: int;
  var inline$ALIM$2$tempBoogie4: int;
  var inline$ALIM$2$tempBoogie5: int;
  var inline$ALIM$2$tempBoogie6: int;
  var inline$ALIM$2$tempBoogie7: int;
  var inline$ALIM$2$tempBoogie8: int;
  var inline$ALIM$2$tempBoogie9: int;
  var inline$ALIM$2$tempBoogie10: int;
  var inline$ALIM$2$tempBoogie11: int;
  var inline$ALIM$2$tempBoogie12: int;
  var inline$ALIM$2$tempBoogie13: int;
  var inline$ALIM$2$tempBoogie14: int;
  var inline$ALIM$2$tempBoogie15: int;
  var inline$ALIM$2$tempBoogie16: int;
  var inline$ALIM$2$tempBoogie17: int;
  var inline$ALIM$2$tempBoogie18: int;
  var inline$ALIM$2$tempBoogie19: int;
  var inline$ALIM$2$__havoc_dummy_return: int;
  var inline$ALIM$2$result.ALIM$1: int;
  var inline$ALIM$2$alloc: int;
  var inline$ALIM$2$detChoiceCnt: int;
  var inline$ALIM$2$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$2$Res_PROBED: [int]int;
  var inline$ALIM$2$Mem_T.A4INT4: [int]int;
  var inline$ALIM$2$Mem_T.INT4: [int]int;
  var inline$ALIM$2$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$3$havoc_stringTemp: int;
  var inline$Own_Below_Threat$3$condVal: int;
  var inline$Own_Below_Threat$3$tempBoogie0: int;
  var inline$Own_Below_Threat$3$tempBoogie1: int;
  var inline$Own_Below_Threat$3$tempBoogie2: int;
  var inline$Own_Below_Threat$3$tempBoogie3: int;
  var inline$Own_Below_Threat$3$tempBoogie4: int;
  var inline$Own_Below_Threat$3$tempBoogie5: int;
  var inline$Own_Below_Threat$3$tempBoogie6: int;
  var inline$Own_Below_Threat$3$tempBoogie7: int;
  var inline$Own_Below_Threat$3$tempBoogie8: int;
  var inline$Own_Below_Threat$3$tempBoogie9: int;
  var inline$Own_Below_Threat$3$tempBoogie10: int;
  var inline$Own_Below_Threat$3$tempBoogie11: int;
  var inline$Own_Below_Threat$3$tempBoogie12: int;
  var inline$Own_Below_Threat$3$tempBoogie13: int;
  var inline$Own_Below_Threat$3$tempBoogie14: int;
  var inline$Own_Below_Threat$3$tempBoogie15: int;
  var inline$Own_Below_Threat$3$tempBoogie16: int;
  var inline$Own_Below_Threat$3$tempBoogie17: int;
  var inline$Own_Below_Threat$3$tempBoogie18: int;
  var inline$Own_Below_Threat$3$tempBoogie19: int;
  var inline$Own_Below_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$3$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$3$alloc: int;
  var inline$Own_Below_Threat$3$detChoiceCnt: int;
  var inline$Own_Below_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.PINT4: [int]int;
  var inline$ALIM$3$havoc_stringTemp: int;
  var inline$ALIM$3$condVal: int;
  var inline$ALIM$3$tempBoogie0: int;
  var inline$ALIM$3$tempBoogie1: int;
  var inline$ALIM$3$tempBoogie2: int;
  var inline$ALIM$3$tempBoogie3: int;
  var inline$ALIM$3$tempBoogie4: int;
  var inline$ALIM$3$tempBoogie5: int;
  var inline$ALIM$3$tempBoogie6: int;
  var inline$ALIM$3$tempBoogie7: int;
  var inline$ALIM$3$tempBoogie8: int;
  var inline$ALIM$3$tempBoogie9: int;
  var inline$ALIM$3$tempBoogie10: int;
  var inline$ALIM$3$tempBoogie11: int;
  var inline$ALIM$3$tempBoogie12: int;
  var inline$ALIM$3$tempBoogie13: int;
  var inline$ALIM$3$tempBoogie14: int;
  var inline$ALIM$3$tempBoogie15: int;
  var inline$ALIM$3$tempBoogie16: int;
  var inline$ALIM$3$tempBoogie17: int;
  var inline$ALIM$3$tempBoogie18: int;
  var inline$ALIM$3$tempBoogie19: int;
  var inline$ALIM$3$__havoc_dummy_return: int;
  var inline$ALIM$3$result.ALIM$1: int;
  var inline$ALIM$3$alloc: int;
  var inline$ALIM$3$detChoiceCnt: int;
  var inline$ALIM$3$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$3$Res_PROBED: [int]int;
  var inline$ALIM$3$Mem_T.A4INT4: [int]int;
  var inline$ALIM$3$Mem_T.INT4: [int]int;
  var inline$ALIM$3$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$3$havoc_stringTemp: int;
  var inline$Own_Above_Threat$3$condVal: int;
  var inline$Own_Above_Threat$3$tempBoogie0: int;
  var inline$Own_Above_Threat$3$tempBoogie1: int;
  var inline$Own_Above_Threat$3$tempBoogie2: int;
  var inline$Own_Above_Threat$3$tempBoogie3: int;
  var inline$Own_Above_Threat$3$tempBoogie4: int;
  var inline$Own_Above_Threat$3$tempBoogie5: int;
  var inline$Own_Above_Threat$3$tempBoogie6: int;
  var inline$Own_Above_Threat$3$tempBoogie7: int;
  var inline$Own_Above_Threat$3$tempBoogie8: int;
  var inline$Own_Above_Threat$3$tempBoogie9: int;
  var inline$Own_Above_Threat$3$tempBoogie10: int;
  var inline$Own_Above_Threat$3$tempBoogie11: int;
  var inline$Own_Above_Threat$3$tempBoogie12: int;
  var inline$Own_Above_Threat$3$tempBoogie13: int;
  var inline$Own_Above_Threat$3$tempBoogie14: int;
  var inline$Own_Above_Threat$3$tempBoogie15: int;
  var inline$Own_Above_Threat$3$tempBoogie16: int;
  var inline$Own_Above_Threat$3$tempBoogie17: int;
  var inline$Own_Above_Threat$3$tempBoogie18: int;
  var inline$Own_Above_Threat$3$tempBoogie19: int;
  var inline$Own_Above_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$3$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$3$alloc: int;
  var inline$Own_Above_Threat$3$detChoiceCnt: int;
  var inline$Own_Above_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    a1 := 0;
    a10 := 0;
    a11 := 0;
    a12 := 0;
    a2 := 0;
    a3 := 0;
    a4 := 0;
    a5 := 0;
    a6 := 0;
    a7 := 0;
    a8 := 0;
    a9 := 0;
    result.alt_sep_test$2 := 0;
    result.tcas$1 := 0;
    a1 := a1_.1;
    a2 := a2_.1;
    a3 := a3_.1;
    a4 := a4_.1;
    a5 := a5_.1;
    a6 := a6_.1;
    a7 := a7_.1;
    a8 := a8_.1;
    a9 := a9_.1;
    a10 := a10_.1;
    a11 := a11_.1;
    a12 := a12_.1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 137} true;
    goto inline$initialize$0$Entry;

  inline$initialize$0$Entry:
    inline$initialize$0$alloc := v4.alloc;
    inline$initialize$0$detChoiceCnt := v4.detChoiceCnt;
    inline$initialize$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$initialize$0$Res_PROBED := v4.Res_PROBED;
    inline$initialize$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$initialize$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$initialize$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$initialize$0$anon0#2;

  inline$initialize$0$anon0#2:
    inline$initialize$0$havoc_stringTemp := 0;
    goto inline$initialize$0$start#2;

  inline$initialize$0$start#2:
    goto inline$initialize$0$label_3#2;

  inline$initialize$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 41} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 0) := 400];
    goto inline$initialize$0$label_4#2;

  inline$initialize$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 42} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 1) := 500];
    goto inline$initialize$0$label_5#2;

  inline$initialize$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 43} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 2) := 640];
    goto inline$initialize$0$label_6#2;

  inline$initialize$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 44} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 3) := 740];
    goto inline$initialize$0$label_1#2;

  inline$initialize$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 45} true;
    goto inline$initialize$0$Return;

  inline$initialize$0$Return:
    goto label_3#2$1;

  label_3#2$1:
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 138} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Cur_Vertical_Sep := a1];
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 139} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.High_Confidence := a2];
    goto label_8#2;

  label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 140} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid := a3];
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 141} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt := a4];
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 142} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate := a5];
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 143} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Tracked_Alt := a6];
    goto label_12#2;

  label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 144} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Alt_Layer_Value := a7];
    goto label_13#2;

  label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 145} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Up_Separation := a8];
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 146} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Down_Separation := a9];
    goto label_15#2;

  label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 147} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_RAC := a10];
    goto label_16#2;

  label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 148} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Capability := a11];
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 149} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Climb_Inhibit := a12];
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 151} true;
    goto inline$alt_sep_test$0$Entry;

  inline$alt_sep_test$0$Entry:
    inline$alt_sep_test$0$alloc := v4.alloc;
    inline$alt_sep_test$0$detChoiceCnt := v4.detChoiceCnt;
    inline$alt_sep_test$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$alt_sep_test$0$Res_PROBED := v4.Res_PROBED;
    inline$alt_sep_test$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$alt_sep_test$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$alt_sep_test$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$alt_sep_test$0$anon0#2;

  inline$alt_sep_test$0$anon0#2:
    inline$alt_sep_test$0$havoc_stringTemp := 0;
    goto inline$alt_sep_test$0$start#2;

  inline$alt_sep_test$0$start#2:
    inline$alt_sep_test$0$$Pred.2$ := 0;
    inline$alt_sep_test$0$$Pred.3$ := 0;
    inline$alt_sep_test$0$$Pred.6$ := 0;
    inline$alt_sep_test$0$$Pred.9$ := 0;
    inline$alt_sep_test$0$alt_sep := 0;
    inline$alt_sep_test$0$enabled := 0;
    inline$alt_sep_test$0$intent_not_known := 0;
    inline$alt_sep_test$0$need_downward_RA := 0;
    inline$alt_sep_test$0$need_upward_RA := 0;
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := 0;
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := 0;
    inline$alt_sep_test$0$result.Own_Above_Threat$8 := 0;
    inline$alt_sep_test$0$result.Own_Below_Threat$5 := 0;
    inline$alt_sep_test$0$result.alt_sep_test$1 := 0;
    inline$alt_sep_test$0$tcas_equipped := 0;
    goto inline$alt_sep_test$0$label_3#2;

  inline$alt_sep_test$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto inline$alt_sep_test$0$label_4#2;

  inline$alt_sep_test$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto inline$alt_sep_test$0$label_5#2;

  inline$alt_sep_test$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto inline$alt_sep_test$0$label_6#2;

  inline$alt_sep_test$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 106} true;
    goto inline$alt_sep_test$0$label_7#2;

  inline$alt_sep_test$0$label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 106} true;
    goto inline$alt_sep_test$0$label_8#2;

  inline$alt_sep_test$0$label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 107} true;
    goto inline$alt_sep_test$0$label_9#2;

  inline$alt_sep_test$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto inline$alt_sep_test$0$label_9_true#2, inline$alt_sep_test$0$label_9_false#2;

  inline$alt_sep_test$0$label_9_false#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] == 0;
    goto inline$alt_sep_test$0$label_10#2;

  inline$alt_sep_test$0$label_9_true#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] != 0;
    goto inline$alt_sep_test$0$label_11#2;

  inline$alt_sep_test$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto inline$alt_sep_test$0$label_11_true#2, inline$alt_sep_test$0$label_11_false#2;

  inline$alt_sep_test$0$label_11_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$alt_sep_test$0$label_10#2;

  inline$alt_sep_test$0$label_11_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$alt_sep_test$0$label_12#2;

  inline$alt_sep_test$0$label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto inline$alt_sep_test$0$label_12_true#2, inline$alt_sep_test$0$label_12_false#2;

  inline$alt_sep_test$0$label_12_false#2:
    assume !v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$alt_sep_test$0$label_10#2;

  inline$alt_sep_test$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    inline$alt_sep_test$0$$Pred.2$ := 0;
    goto inline$alt_sep_test$0$label_14#2;

  inline$alt_sep_test$0$label_12_true#2:
    assume v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$alt_sep_test$0$label_13#2;

  inline$alt_sep_test$0$label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    inline$alt_sep_test$0$$Pred.2$ := 1;
    goto inline$alt_sep_test$0$label_14#2;

  inline$alt_sep_test$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    inline$alt_sep_test$0$enabled := inline$alt_sep_test$0$$Pred.2$;
    goto inline$alt_sep_test$0$label_15#2;

  inline$alt_sep_test$0$label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 110} true;
    inline$alt_sep_test$0$tcas_equipped := v4.LIFT(v4.INT_EQ(v4.Mem_T.INT4[v4.Other_Capability], 1));
    goto inline$alt_sep_test$0$label_16#2;

  inline$alt_sep_test$0$label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    goto inline$alt_sep_test$0$label_16_true#2, inline$alt_sep_test$0$label_16_false#2;

  inline$alt_sep_test$0$label_16_false#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] == 0;
    goto inline$alt_sep_test$0$label_17#2;

  inline$alt_sep_test$0$label_16_true#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] != 0;
    goto inline$alt_sep_test$0$label_18#2;

  inline$alt_sep_test$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    goto inline$alt_sep_test$0$label_18_true#2, inline$alt_sep_test$0$label_18_false#2;

  inline$alt_sep_test$0$label_18_false#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] == 0;
    goto inline$alt_sep_test$0$label_19#2;

  inline$alt_sep_test$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    inline$alt_sep_test$0$$Pred.3$ := 1;
    goto inline$alt_sep_test$0$label_20#2;

  inline$alt_sep_test$0$label_18_true#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] != 0;
    goto inline$alt_sep_test$0$label_17#2;

  inline$alt_sep_test$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    inline$alt_sep_test$0$$Pred.3$ := 0;
    goto inline$alt_sep_test$0$label_20#2;

  inline$alt_sep_test$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    inline$alt_sep_test$0$intent_not_known := inline$alt_sep_test$0$$Pred.3$;
    goto inline$alt_sep_test$0$label_21#2;

  inline$alt_sep_test$0$label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 113} true;
    inline$alt_sep_test$0$alt_sep := 0;
    goto inline$alt_sep_test$0$label_22#2;

  inline$alt_sep_test$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_22_true#2, inline$alt_sep_test$0$label_22_false#2;

  inline$alt_sep_test$0$label_22_false#2:
    assume inline$alt_sep_test$0$enabled == 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_22_true#2:
    assume inline$alt_sep_test$0$enabled != 0;
    goto inline$alt_sep_test$0$label_24#2;

  inline$alt_sep_test$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_24_true#2, inline$alt_sep_test$0$label_24_false#2;

  inline$alt_sep_test$0$label_24_false#2:
    assume inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$alt_sep_test$0$label_25#2;

  inline$alt_sep_test$0$label_24_true#2:
    assume inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$alt_sep_test$0$label_26#2;

  inline$alt_sep_test$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_26_true#2, inline$alt_sep_test$0$label_26_false#2;

  inline$alt_sep_test$0$label_26_false#2:
    assume inline$alt_sep_test$0$intent_not_known == 0;
    goto inline$alt_sep_test$0$label_25#2;

  inline$alt_sep_test$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_25_true#2, inline$alt_sep_test$0$label_25_false#2;

  inline$alt_sep_test$0$label_25_false#2:
    assume inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$alt_sep_test$0$label_27#2;

  inline$alt_sep_test$0$label_25_true#2:
    assume inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_26_true#2:
    assume inline$alt_sep_test$0$intent_not_known != 0;
    goto inline$alt_sep_test$0$label_27#2;

  inline$alt_sep_test$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$Non_Crossing_Biased_Climb$0$Entry;

  inline$Non_Crossing_Biased_Climb$0$Entry:
    inline$Non_Crossing_Biased_Climb$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Climb$0$anon0#2;

  inline$Non_Crossing_Biased_Climb$0$anon0#2:
    inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Climb$0$start#2;

  inline$Non_Crossing_Biased_Climb$0$start#2:
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Climb$0$result := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_3#2;

  inline$Non_Crossing_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 59} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_4#2;

  inline$Non_Crossing_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 60} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_5#2;

  inline$Non_Crossing_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 61} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2;

  inline$Non_Crossing_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_9#2;

  inline$Non_Crossing_Biased_Climb$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Climb$0$label_10#2;

  inline$Non_Crossing_Biased_Climb$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 64} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_10_true#2, inline$Non_Crossing_Biased_Climb$0$label_10_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2;

  inline$Non_Crossing_Biased_Climb$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_30#2;

  inline$Non_Crossing_Biased_Climb$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_30_true#2, inline$Non_Crossing_Biased_Climb$0$label_30_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_32#2;

  inline$Non_Crossing_Biased_Climb$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_32_true#2, inline$Non_Crossing_Biased_Climb$0$label_32_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2;

  inline$Non_Crossing_Biased_Climb$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_33#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_36#2;

  inline$Non_Crossing_Biased_Climb$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_36_true#2, inline$Non_Crossing_Biased_Climb$0$label_36_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_37#2;

  inline$Non_Crossing_Biased_Climb$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2;

  inline$Non_Crossing_Biased_Climb$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_17#2;

  inline$Non_Crossing_Biased_Climb$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_17_true#2, inline$Non_Crossing_Biased_Climb$0$label_17_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2;

  inline$Non_Crossing_Biased_Climb$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$1$Entry;

  inline$Own_Below_Threat$1$Entry:
    inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$1$anon0#2;

  inline$Own_Below_Threat$1$anon0#2:
    inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$1$start#2;

  inline$Own_Below_Threat$1$start#2:
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$1$label_3#2;

  inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$1$label_1#2;

  inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$1$Return;

  inline$Own_Below_Threat$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_19#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_22#2;

  inline$Non_Crossing_Biased_Climb$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_22_true#2, inline$Non_Crossing_Biased_Climb$0$label_22_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2;

  inline$Non_Crossing_Biased_Climb$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := inline$ALIM$1$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_24#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_27#2;

  inline$Non_Crossing_Biased_Climb$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_27_true#2, inline$Non_Crossing_Biased_Climb$0$label_27_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.6$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 72} true;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := inline$Non_Crossing_Biased_Climb$0$result;
    goto inline$Non_Crossing_Biased_Climb$0$label_1#2;

  inline$Non_Crossing_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 73} true;
    goto inline$Non_Crossing_Biased_Climb$0$Return;

  inline$Non_Crossing_Biased_Climb$0$Return:
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1;
    goto inline$alt_sep_test$0$label_27#2$1;

  inline$alt_sep_test$0$label_27#2$1:
    goto inline$alt_sep_test$0$label_30#2;

  inline$alt_sep_test$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$alt_sep_test$0$label_30_true#2, inline$alt_sep_test$0$label_30_false#2;

  inline$alt_sep_test$0$label_30_false#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 == 0;
    goto inline$alt_sep_test$0$label_31#2;

  inline$alt_sep_test$0$label_30_true#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 != 0;
    goto inline$alt_sep_test$0$label_32#2;

  inline$alt_sep_test$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$Own_Below_Threat$2$Entry;

  inline$Own_Below_Threat$2$Entry:
    inline$Own_Below_Threat$2$alloc := v4.alloc;
    inline$Own_Below_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$2$anon0#2;

  inline$Own_Below_Threat$2$anon0#2:
    inline$Own_Below_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$2$start#2;

  inline$Own_Below_Threat$2$start#2:
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$2$label_3#2;

  inline$Own_Below_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$2$label_1#2;

  inline$Own_Below_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$2$Return;

  inline$Own_Below_Threat$2$Return:
    inline$alt_sep_test$0$result.Own_Below_Threat$5 := inline$Own_Below_Threat$2$result.Own_Below_Threat$1;
    goto inline$alt_sep_test$0$label_32#2$1;

  inline$alt_sep_test$0$label_32#2$1:
    goto inline$alt_sep_test$0$label_35#2;

  inline$alt_sep_test$0$label_35#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$alt_sep_test$0$label_35_true#2, inline$alt_sep_test$0$label_35_false#2;

  inline$alt_sep_test$0$label_35_false#2:
    assume inline$alt_sep_test$0$result.Own_Below_Threat$5 == 0;
    goto inline$alt_sep_test$0$label_31#2;

  inline$alt_sep_test$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    inline$alt_sep_test$0$$Pred.6$ := 0;
    goto inline$alt_sep_test$0$label_37#2;

  inline$alt_sep_test$0$label_35_true#2:
    assume inline$alt_sep_test$0$result.Own_Below_Threat$5 != 0;
    goto inline$alt_sep_test$0$label_36#2;

  inline$alt_sep_test$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    inline$alt_sep_test$0$$Pred.6$ := 1;
    goto inline$alt_sep_test$0$label_37#2;

  inline$alt_sep_test$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    inline$alt_sep_test$0$need_upward_RA := inline$alt_sep_test$0$$Pred.6$;
    goto inline$alt_sep_test$0$label_38#2;

  inline$alt_sep_test$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$Non_Crossing_Biased_Descend$0$Entry;

  inline$Non_Crossing_Biased_Descend$0$Entry:
    inline$Non_Crossing_Biased_Descend$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Descend$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Descend$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Descend$0$anon0#2;

  inline$Non_Crossing_Biased_Descend$0$anon0#2:
    inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Descend$0$start#2;

  inline$Non_Crossing_Biased_Descend$0$start#2:
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Descend$0$result := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_3#2;

  inline$Non_Crossing_Biased_Descend$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 77} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_4#2;

  inline$Non_Crossing_Biased_Descend$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 78} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_5#2;

  inline$Non_Crossing_Biased_Descend$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 79} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2;

  inline$Non_Crossing_Biased_Descend$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    goto inline$Inhibit_Biased_Climb$1$Entry;

  inline$Inhibit_Biased_Climb$1$Entry:
    inline$Inhibit_Biased_Climb$1$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$1$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$1$anon0#2;

  inline$Inhibit_Biased_Climb$1$anon0#2:
    inline$Inhibit_Biased_Climb$1$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$1$start#2;

  inline$Inhibit_Biased_Climb$1$start#2:
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$1$label_3#2;

  inline$Inhibit_Biased_Climb$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$1$label_3_true#2, inline$Inhibit_Biased_Climb$1$label_3_false#2;

  inline$Inhibit_Biased_Climb$1$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$1$label_4#2;

  inline$Inhibit_Biased_Climb$1$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$1$label_5#2;

  inline$Inhibit_Biased_Climb$1$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$1$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$1$label_1#2;

  inline$Inhibit_Biased_Climb$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$1$Return;

  inline$Inhibit_Biased_Climb$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_9#2;

  inline$Non_Crossing_Biased_Descend$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Descend$0$label_10#2;

  inline$Non_Crossing_Biased_Descend$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 82} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_10_true#2, inline$Non_Crossing_Biased_Descend$0$label_10_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2;

  inline$Non_Crossing_Biased_Descend$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$1$Entry;

  inline$Own_Above_Threat$1$Entry:
    inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$1$anon0#2;

  inline$Own_Above_Threat$1$anon0#2:
    inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$1$start#2;

  inline$Own_Above_Threat$1$start#2:
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$1$label_3#2;

  inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$1$label_1#2;

  inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$1$Return;

  inline$Own_Above_Threat$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_27#2;

  inline$Non_Crossing_Biased_Descend$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_27_true#2, inline$Non_Crossing_Biased_Descend$0$label_27_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2;

  inline$Non_Crossing_Biased_Descend$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$2$Entry;

  inline$Own_Above_Threat$2$Entry:
    inline$Own_Above_Threat$2$alloc := v4.alloc;
    inline$Own_Above_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$2$anon0#2;

  inline$Own_Above_Threat$2$anon0#2:
    inline$Own_Above_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$2$start#2;

  inline$Own_Above_Threat$2$start#2:
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$2$label_3#2;

  inline$Own_Above_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$2$label_1#2;

  inline$Own_Above_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$2$Return;

  inline$Own_Above_Threat$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$2$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_29#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_32#2;

  inline$Non_Crossing_Biased_Descend$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_32_true#2, inline$Non_Crossing_Biased_Descend$0$label_32_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2;

  inline$Non_Crossing_Biased_Descend$0$label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$ALIM$2$Entry;

  inline$ALIM$2$Entry:
    inline$ALIM$2$alloc := v4.alloc;
    inline$ALIM$2$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$2$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$2$anon0#2;

  inline$ALIM$2$anon0#2:
    inline$ALIM$2$havoc_stringTemp := 0;
    goto inline$ALIM$2$start#2;

  inline$ALIM$2$start#2:
    inline$ALIM$2$result.ALIM$1 := 0;
    goto inline$ALIM$2$label_3#2;

  inline$ALIM$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$2$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$2$label_1#2;

  inline$ALIM$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$2$Return;

  inline$ALIM$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := inline$ALIM$2$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_34#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_37#2;

  inline$Non_Crossing_Biased_Descend$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_37_true#2, inline$Non_Crossing_Biased_Descend$0$label_37_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], inline$Non_Crossing_Biased_Descend$0$result.ALIM$8);
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], inline$Non_Crossing_Biased_Descend$0$result.ALIM$8);
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2;

  inline$Non_Crossing_Biased_Descend$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Own_Below_Threat$3$Entry;

  inline$Own_Below_Threat$3$Entry:
    inline$Own_Below_Threat$3$alloc := v4.alloc;
    inline$Own_Below_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$3$anon0#2;

  inline$Own_Below_Threat$3$anon0#2:
    inline$Own_Below_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$3$start#2;

  inline$Own_Below_Threat$3$start#2:
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$3$label_3#2;

  inline$Own_Below_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$3$label_1#2;

  inline$Own_Below_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$3$Return;

  inline$Own_Below_Threat$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$3$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_17#2;

  inline$Non_Crossing_Biased_Descend$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_17_true#2, inline$Non_Crossing_Biased_Descend$0$label_17_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_19#2;

  inline$Non_Crossing_Biased_Descend$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_19_true#2, inline$Non_Crossing_Biased_Descend$0$label_19_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2;

  inline$Non_Crossing_Biased_Descend$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$ALIM$3$Entry;

  inline$ALIM$3$Entry:
    inline$ALIM$3$alloc := v4.alloc;
    inline$ALIM$3$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$3$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$3$anon0#2;

  inline$ALIM$3$anon0#2:
    inline$ALIM$3$havoc_stringTemp := 0;
    goto inline$ALIM$3$start#2;

  inline$ALIM$3$start#2:
    inline$ALIM$3$result.ALIM$1 := 0;
    goto inline$ALIM$3$label_3#2;

  inline$ALIM$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$3$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$3$label_1#2;

  inline$ALIM$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$3$Return;

  inline$ALIM$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := inline$ALIM$3$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_20#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_23#2;

  inline$Non_Crossing_Biased_Descend$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_23_true#2, inline$Non_Crossing_Biased_Descend$0$label_23_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_24#2;

  inline$Non_Crossing_Biased_Descend$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.5$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 90} true;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := inline$Non_Crossing_Biased_Descend$0$result;
    goto inline$Non_Crossing_Biased_Descend$0$label_1#2;

  inline$Non_Crossing_Biased_Descend$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 91} true;
    goto inline$Non_Crossing_Biased_Descend$0$Return;

  inline$Non_Crossing_Biased_Descend$0$Return:
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1;
    goto inline$alt_sep_test$0$label_38#2$1;

  inline$alt_sep_test$0$label_38#2$1:
    goto inline$alt_sep_test$0$label_41#2;

  inline$alt_sep_test$0$label_41#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$alt_sep_test$0$label_41_true#2, inline$alt_sep_test$0$label_41_false#2;

  inline$alt_sep_test$0$label_41_false#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 == 0;
    goto inline$alt_sep_test$0$label_42#2;

  inline$alt_sep_test$0$label_41_true#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 != 0;
    goto inline$alt_sep_test$0$label_43#2;

  inline$alt_sep_test$0$label_43#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$Own_Above_Threat$3$Entry;

  inline$Own_Above_Threat$3$Entry:
    inline$Own_Above_Threat$3$alloc := v4.alloc;
    inline$Own_Above_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$3$anon0#2;

  inline$Own_Above_Threat$3$anon0#2:
    inline$Own_Above_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$3$start#2;

  inline$Own_Above_Threat$3$start#2:
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$3$label_3#2;

  inline$Own_Above_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$3$label_1#2;

  inline$Own_Above_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$3$Return;

  inline$Own_Above_Threat$3$Return:
    inline$alt_sep_test$0$result.Own_Above_Threat$8 := inline$Own_Above_Threat$3$result.Own_Above_Threat$1;
    goto inline$alt_sep_test$0$label_43#2$1;

  inline$alt_sep_test$0$label_43#2$1:
    goto inline$alt_sep_test$0$label_46#2;

  inline$alt_sep_test$0$label_46#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$alt_sep_test$0$label_46_true#2, inline$alt_sep_test$0$label_46_false#2;

  inline$alt_sep_test$0$label_46_false#2:
    assume inline$alt_sep_test$0$result.Own_Above_Threat$8 == 0;
    goto inline$alt_sep_test$0$label_42#2;

  inline$alt_sep_test$0$label_42#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    inline$alt_sep_test$0$$Pred.9$ := 0;
    goto inline$alt_sep_test$0$label_48#2;

  inline$alt_sep_test$0$label_46_true#2:
    assume inline$alt_sep_test$0$result.Own_Above_Threat$8 != 0;
    goto inline$alt_sep_test$0$label_47#2;

  inline$alt_sep_test$0$label_47#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    inline$alt_sep_test$0$$Pred.9$ := 1;
    goto inline$alt_sep_test$0$label_48#2;

  inline$alt_sep_test$0$label_48#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    inline$alt_sep_test$0$need_downward_RA := inline$alt_sep_test$0$$Pred.9$;
    goto inline$alt_sep_test$0$label_49#2;

  inline$alt_sep_test$0$label_49#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 119} true;
    goto inline$alt_sep_test$0$label_49_true#2, inline$alt_sep_test$0$label_49_false#2;

  inline$alt_sep_test$0$label_49_false#2:
    assume inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$alt_sep_test$0$label_50#2;

  inline$alt_sep_test$0$label_49_true#2:
    assume inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$alt_sep_test$0$label_51#2;

  inline$alt_sep_test$0$label_51#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 119} true;
    goto inline$alt_sep_test$0$label_51_true#2, inline$alt_sep_test$0$label_51_false#2;

  inline$alt_sep_test$0$label_51_false#2:
    assume inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$alt_sep_test$0$label_50#2;

  inline$alt_sep_test$0$label_50#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 124} true;
    goto inline$alt_sep_test$0$label_50_true#2, inline$alt_sep_test$0$label_50_false#2;

  inline$alt_sep_test$0$label_50_false#2:
    assume inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$alt_sep_test$0$label_53#2;

  inline$alt_sep_test$0$label_53#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 126} true;
    goto inline$alt_sep_test$0$label_53_true#2, inline$alt_sep_test$0$label_53_false#2;

  inline$alt_sep_test$0$label_53_false#2:
    assume inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$alt_sep_test$0$label_55#2;

  inline$alt_sep_test$0$label_55#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 129} true;
    inline$alt_sep_test$0$alt_sep := 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_53_true#2:
    assume inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$alt_sep_test$0$label_56#2;

  inline$alt_sep_test$0$label_56#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 127} true;
    inline$alt_sep_test$0$alt_sep := 2;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_50_true#2:
    assume inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$alt_sep_test$0$label_54#2;

  inline$alt_sep_test$0$label_54#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 125} true;
    inline$alt_sep_test$0$alt_sep := 1;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_51_true#2:
    assume inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$alt_sep_test$0$label_52#2;

  inline$alt_sep_test$0$label_52#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 123} true;
    inline$alt_sep_test$0$alt_sep := 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 132} true;
    inline$alt_sep_test$0$result.alt_sep_test$1 := inline$alt_sep_test$0$alt_sep;
    goto inline$alt_sep_test$0$label_1#2;

  inline$alt_sep_test$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 133} true;
    goto inline$alt_sep_test$0$Return;

  inline$alt_sep_test$0$Return:
    result.alt_sep_test$2 := inline$alt_sep_test$0$result.alt_sep_test$1;
    goto label_18#2$1;

  label_18#2$1:
    goto label_21#2;

  label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 151} true;
    result.tcas$1 := result.alt_sep_test$2;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 152} true;
    return;
}



var {:extern} v3.Mem: [name][int]int;

var {:extern} v3.alloc: int;

var {:extern} v3.Mem_T.A4INT4: [int]int;

var {:extern} v3.Mem_T.INT4: [int]int;

var {:extern} v3.Mem_T.PINT4: [int]int;

var {:extern} v3.detChoiceCnt: int;

var {:extern} v3.Res_KERNEL_SOURCE: [int]int;

var {:extern} v3.Res_PROBED: [int]int;

const {:extern} unique v3.T.A4INT4: name;

const {:extern} unique v3.T.INT4: name;

const {:extern} unique v3.T.PA4INT4: name;

const {:extern} unique v3.T.PINT4: name;

const {:extern} unique v3.Alt_Layer_Value: int;

const {:extern} unique v3.Climb_Inhibit: int;

const {:extern} unique v3.Cur_Vertical_Sep: int;

const {:extern} unique v3.Down_Separation: int;

const {:extern} unique v3.High_Confidence: int;

const {:extern} unique v3.Other_Capability: int;

const {:extern} unique v3.Other_RAC: int;

const {:extern} unique v3.Other_Tracked_Alt: int;

const {:extern} unique v3.Own_Tracked_Alt: int;

const {:extern} unique v3.Own_Tracked_Alt_Rate: int;

const {:extern} unique v3.Positive_RA_Alt_Thresh: int;

const {:extern} unique v3.Two_of_Three_Reports_Valid: int;

const {:extern} unique v3.Up_Separation: int;





























































































































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

axiom v4.INT_GT(v4.Alt_Layer_Value, 0);

axiom v4.Base(v4.Alt_Layer_Value) == v4.Alt_Layer_Value;

axiom v4.INT_GT(v4.Climb_Inhibit, 0);

axiom v4.Base(v4.Climb_Inhibit) == v4.Climb_Inhibit;

axiom v4.INT_GT(v4.Cur_Vertical_Sep, 0);

axiom v4.Base(v4.Cur_Vertical_Sep) == v4.Cur_Vertical_Sep;

axiom v4.INT_GT(v4.Down_Separation, 0);

axiom v4.Base(v4.Down_Separation) == v4.Down_Separation;

axiom v4.INT_GT(v4.High_Confidence, 0);

axiom v4.Base(v4.High_Confidence) == v4.High_Confidence;

axiom v4.INT_GT(v4.Other_Capability, 0);

axiom v4.Base(v4.Other_Capability) == v4.Other_Capability;

axiom v4.INT_GT(v4.Other_RAC, 0);

axiom v4.Base(v4.Other_RAC) == v4.Other_RAC;

axiom v4.INT_GT(v4.Other_Tracked_Alt, 0);

axiom v4.Base(v4.Other_Tracked_Alt) == v4.Other_Tracked_Alt;

axiom v4.INT_GT(v4.Own_Tracked_Alt, 0);

axiom v4.Base(v4.Own_Tracked_Alt) == v4.Own_Tracked_Alt;

axiom v4.INT_GT(v4.Own_Tracked_Alt_Rate, 0);

axiom v4.Base(v4.Own_Tracked_Alt_Rate) == v4.Own_Tracked_Alt_Rate;

axiom v4.INT_GT(v4.Positive_RA_Alt_Thresh, 0);

axiom v4.Base(v4.Positive_RA_Alt_Thresh) == v4.Positive_RA_Alt_Thresh;

axiom v4.INT_GT(v4.Two_of_Three_Reports_Valid, 0);

axiom v4.Base(v4.Two_of_Three_Reports_Valid) == v4.Two_of_Three_Reports_Valid;

axiom v4.INT_GT(v4.Up_Separation, 0);

axiom v4.Base(v4.Up_Separation) == v4.Up_Separation;

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



procedure v3.ALIM() returns (result.ALIM$1: int);
  free ensures result.ALIM$1 == _uf_v4.ALIM_result.ALIM$1(old(v4.Mem_T.INT4));



procedure v3.Inhibit_Biased_Climb() returns (result.Inhibit_Biased_Climb$1: int);
  free ensures result.Inhibit_Biased_Climb$1 == _uf_v4.Inhibit_Biased_Climb_result.Inhibit_Biased_Climb$1(old(v4.Mem_T.INT4));



procedure v3.Non_Crossing_Biased_Climb() returns (result.Non_Crossing_Biased_Climb$1: int);
  free ensures result.Non_Crossing_Biased_Climb$1 == _uf_v4.Non_Crossing_Biased_Climb_result.Non_Crossing_Biased_Climb$1(old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));



procedure v3.Non_Crossing_Biased_Descend() returns (result.Non_Crossing_Biased_Descend$1: int);
  free ensures result.Non_Crossing_Biased_Descend$1 == _uf_v4.Non_Crossing_Biased_Descend_result.Non_Crossing_Biased_Descend$1(old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));



procedure v3.Own_Above_Threat() returns (result.Own_Above_Threat$1: int);
  free ensures result.Own_Above_Threat$1 == _uf_v4.Own_Above_Threat_result.Own_Above_Threat$1(old(v4.Mem_T.INT4));



procedure v3.Own_Below_Threat() returns (result.Own_Below_Threat$1: int);
  free ensures result.Own_Below_Threat$1 == _uf_v4.Own_Below_Threat_result.Own_Below_Threat$1(old(v4.Mem_T.INT4));



procedure v3.alt_sep_test() returns (result.alt_sep_test$1: int);
  free ensures result.alt_sep_test$1 == _uf_v4.alt_sep_test_result.alt_sep_test$1(old(v4.Mem_T.INT4), old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.PINT4));



procedure v3.initialize();
  modifies v4.Mem_T.INT4;
  free ensures v4.Mem_T.INT4 == _uf_v4.initialize_v4.Mem_T.INT4(old(v4.Mem_T.INT4));



procedure {:inline 1} v3.tcas(a1_.1: int, a2_.1: int, a3_.1: int, a4_.1: int, a5_.1: int, a6_.1: int, a7_.1: int, a8_.1: int, a9_.1: int, a10_.1: int, a11_.1: int, a12_.1: int) returns (result.tcas$1: int);
  modifies v4.Mem_T.INT4;
  free ensures result.tcas$1 == _uf_v4.tcas_result.tcas$1(a1_.1, a2_.1, a3_.1, a4_.1, a5_.1, a6_.1, a7_.1, a8_.1, a9_.1, a10_.1, a11_.1, a12_.1, old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));
  free ensures v4.Mem_T.INT4 == _uf_v4.tcas_v4.Mem_T.INT4(a1_.1, a2_.1, a3_.1, a4_.1, a5_.1, a6_.1, a7_.1, a8_.1, a9_.1, a10_.1, a11_.1, a12_.1, old(v4.alloc), old(v4.detChoiceCnt), old(v4.Res_KERNEL_SOURCE), old(v4.Res_PROBED), old(v4.Mem_T.A4INT4), old(v4.Mem_T.INT4), old(v4.Mem_T.PINT4));



implementation v3.ALIM() returns (result.ALIM$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.ALIM$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    return;
}



implementation v3.Inhibit_Biased_Climb() returns (result.Inhibit_Biased_Climb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $result.question.2$: int;
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
    result.Inhibit_Biased_Climb$1 := 0;
    $result.question.2$ := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto label_3_true#2, label_3_false#2;

  label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    $result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto label_6#2;

  label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    $result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    result.Inhibit_Biased_Climb$1 := $result.question.2$;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    return;
}



implementation v3.Non_Crossing_Biased_Climb() returns (result.Non_Crossing_Biased_Climb$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.6$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} result: int;
  var {:extern} result.ALIM$5: int;
  var {:extern} result.ALIM$8: int;
  var {:extern} result.Inhibit_Biased_Climb$2: int;
  var {:extern} result.Own_Above_Threat$7: int;
  var {:extern} result.Own_Below_Threat$3: int;
  var {:extern} result.Own_Below_Threat$4: int;
  var {:extern} upward_crossing_situation: int;
  var {:extern} upward_preferred: int;
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
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$Own_Below_Threat$1$condVal: int;
  var inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$1$alloc: int;
  var inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    $Pred.6$ := 0;
    $Pred.9$ := 0;
    result := 0;
    result.ALIM$5 := 0;
    result.ALIM$8 := 0;
    result.Inhibit_Biased_Climb$2 := 0;
    result.Non_Crossing_Biased_Climb$1 := 0;
    result.Own_Above_Threat$7 := 0;
    result.Own_Below_Threat$3 := 0;
    result.Own_Below_Threat$4 := 0;
    upward_crossing_situation := 0;
    upward_preferred := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 59} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 60} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 61} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto label_6#2$1;

  label_6#2$1:
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], result.Inhibit_Biased_Climb$2));
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 64} true;
    goto label_10_true#2, label_10_false#2;

  label_10_false#2:
    assume upward_preferred == 0;
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    result.Own_Above_Threat$7 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto label_11#2$1;

  label_11#2$1:
    goto label_30#2;

  label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto label_30_true#2, label_30_false#2;

  label_30_false#2:
    assume result.Own_Above_Threat$7 == 0;
    goto label_31#2;

  label_30_true#2:
    assume result.Own_Above_Threat$7 != 0;
    goto label_32#2;

  label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto label_32_true#2, label_32_false#2;

  label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_31#2;

  label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_33#2;

  label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto label_33#2$1;

  label_33#2$1:
    goto label_36#2;

  label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto label_36_true#2, label_36_false#2;

  label_36_false#2:
    assume !v4.INT_LEQ(result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto label_31#2;

  label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    $Pred.9$ := 0;
    goto label_38#2;

  label_36_true#2:
    assume v4.INT_LEQ(result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto label_37#2;

  label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    $Pred.9$ := 1;
    goto label_38#2;

  label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    result := $Pred.9$;
    goto label_29#2;

  label_10_true#2:
    assume upward_preferred != 0;
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto label_14#2$1;

  label_14#2$1:
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto label_17_true#2, label_17_false#2;

  label_17_false#2:
    assume result.Own_Below_Threat$3 == 0;
    goto label_18#2;

  label_17_true#2:
    assume result.Own_Below_Threat$3 != 0;
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$1$Entry;

  inline$Own_Below_Threat$1$Entry:
    inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$1$anon0#2;

  inline$Own_Below_Threat$1$anon0#2:
    inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$1$start#2;

  inline$Own_Below_Threat$1$start#2:
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$1$label_3#2;

  inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$1$label_1#2;

  inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$1$Return;

  inline$Own_Below_Threat$1$Return:
    result.Own_Below_Threat$4 := inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto label_19#2$1;

  label_19#2$1:
    goto label_22#2;

  label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto label_22_true#2, label_22_false#2;

  label_22_false#2:
    assume result.Own_Below_Threat$4 == 0;
    goto label_23#2;

  label_22_true#2:
    assume result.Own_Below_Threat$4 != 0;
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    result.ALIM$5 := inline$ALIM$1$result.ALIM$1;
    goto label_24#2$1;

  label_24#2$1:
    goto label_27#2;

  label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto label_27_true#2, label_27_false#2;

  label_27_false#2:
    assume !v4.INT_LEQ(result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    $Pred.6$ := 1;
    goto label_28#2;

  label_27_true#2:
    assume v4.INT_LEQ(result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_23#2;

  label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    $Pred.6$ := 0;
    goto label_28#2;

  label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    result := $Pred.6$;
    goto label_29#2;

  label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 72} true;
    result.Non_Crossing_Biased_Climb$1 := result;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 73} true;
    return;
}



implementation v3.Non_Crossing_Biased_Descend() returns (result.Non_Crossing_Biased_Descend$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.5$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} result: int;
  var {:extern} result.ALIM$4: int;
  var {:extern} result.ALIM$8: int;
  var {:extern} result.Inhibit_Biased_Climb$2: int;
  var {:extern} result.Own_Above_Threat$6: int;
  var {:extern} result.Own_Above_Threat$7: int;
  var {:extern} result.Own_Below_Threat$3: int;
  var {:extern} upward_crossing_situation: int;
  var {:extern} upward_preferred: int;
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
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$Own_Above_Threat$1$condVal: int;
  var inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$1$alloc: int;
  var inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    $Pred.5$ := 0;
    $Pred.9$ := 0;
    result := 0;
    result.ALIM$4 := 0;
    result.ALIM$8 := 0;
    result.Inhibit_Biased_Climb$2 := 0;
    result.Non_Crossing_Biased_Descend$1 := 0;
    result.Own_Above_Threat$6 := 0;
    result.Own_Above_Threat$7 := 0;
    result.Own_Below_Threat$3 := 0;
    upward_crossing_situation := 0;
    upward_preferred := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 77} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 78} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 79} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto label_6#2$1;

  label_6#2$1:
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], result.Inhibit_Biased_Climb$2));
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 82} true;
    goto label_10_true#2, label_10_false#2;

  label_10_false#2:
    assume upward_preferred == 0;
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    result.Own_Above_Threat$6 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto label_11#2$1;

  label_11#2$1:
    goto label_27#2;

  label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto label_27_true#2, label_27_false#2;

  label_27_false#2:
    assume result.Own_Above_Threat$6 == 0;
    goto label_28#2;

  label_27_true#2:
    assume result.Own_Above_Threat$6 != 0;
    goto label_29#2;

  label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$1$Entry;

  inline$Own_Above_Threat$1$Entry:
    inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$1$anon0#2;

  inline$Own_Above_Threat$1$anon0#2:
    inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$1$start#2;

  inline$Own_Above_Threat$1$start#2:
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$1$label_3#2;

  inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$1$label_1#2;

  inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$1$Return;

  inline$Own_Above_Threat$1$Return:
    result.Own_Above_Threat$7 := inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto label_29#2$1;

  label_29#2$1:
    goto label_32#2;

  label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto label_32_true#2, label_32_false#2;

  label_32_false#2:
    assume result.Own_Above_Threat$7 == 0;
    goto label_33#2;

  label_32_true#2:
    assume result.Own_Above_Threat$7 != 0;
    goto label_34#2;

  label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto label_34#2$1;

  label_34#2$1:
    goto label_37#2;

  label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto label_37_true#2, label_37_false#2;

  label_37_false#2:
    assume !v4.INT_LEQ(result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto label_33#2;

  label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    $Pred.9$ := 0;
    goto label_38#2;

  label_37_true#2:
    assume v4.INT_LEQ(result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto label_28#2;

  label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    $Pred.9$ := 1;
    goto label_38#2;

  label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    result := $Pred.9$;
    goto label_26#2;

  label_10_true#2:
    assume upward_preferred != 0;
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto label_14#2$1;

  label_14#2$1:
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto label_17_true#2, label_17_false#2;

  label_17_false#2:
    assume result.Own_Below_Threat$3 == 0;
    goto label_18#2;

  label_17_true#2:
    assume result.Own_Below_Threat$3 != 0;
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto label_19_true#2, label_19_false#2;

  label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_18#2;

  label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_20#2;

  label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    result.ALIM$4 := inline$ALIM$1$result.ALIM$1;
    goto label_20#2$1;

  label_20#2$1:
    goto label_23#2;

  label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto label_23_true#2, label_23_false#2;

  label_23_false#2:
    assume !v4.INT_LEQ(result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    $Pred.5$ := 0;
    goto label_25#2;

  label_23_true#2:
    assume v4.INT_LEQ(result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    $Pred.5$ := 1;
    goto label_25#2;

  label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    result := $Pred.5$;
    goto label_26#2;

  label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 90} true;
    result.Non_Crossing_Biased_Descend$1 := result;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 91} true;
    return;
}



implementation v3.Own_Above_Threat() returns (result.Own_Above_Threat$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.Own_Above_Threat$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    return;
}



implementation v3.Own_Below_Threat() returns (result.Own_Below_Threat$1: int)
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    result.Own_Below_Threat$1 := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    return;
}



implementation v3.alt_sep_test() returns (result.alt_sep_test$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} $Pred.2$: int;
  var {:extern} $Pred.3$: int;
  var {:extern} $Pred.6$: int;
  var {:extern} $Pred.9$: int;
  var {:extern} alt_sep: int;
  var {:extern} enabled: int;
  var {:extern} intent_not_known: int;
  var {:extern} need_downward_RA: int;
  var {:extern} need_upward_RA: int;
  var {:extern} result.Non_Crossing_Biased_Climb$4: int;
  var {:extern} result.Non_Crossing_Biased_Descend$7: int;
  var {:extern} result.Own_Above_Threat$8: int;
  var {:extern} result.Own_Below_Threat$5: int;
  var {:extern} tcas_equipped: int;
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
  var inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Climb$0$condVal: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.6$: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Climb$0$result: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$5: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1: int;
  var inline$Non_Crossing_Biased_Climb$0$alloc: int;
  var inline$Non_Crossing_Biased_Climb$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$Own_Below_Threat$1$condVal: int;
  var inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$1$alloc: int;
  var inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$2$havoc_stringTemp: int;
  var inline$Own_Below_Threat$2$condVal: int;
  var inline$Own_Below_Threat$2$tempBoogie0: int;
  var inline$Own_Below_Threat$2$tempBoogie1: int;
  var inline$Own_Below_Threat$2$tempBoogie2: int;
  var inline$Own_Below_Threat$2$tempBoogie3: int;
  var inline$Own_Below_Threat$2$tempBoogie4: int;
  var inline$Own_Below_Threat$2$tempBoogie5: int;
  var inline$Own_Below_Threat$2$tempBoogie6: int;
  var inline$Own_Below_Threat$2$tempBoogie7: int;
  var inline$Own_Below_Threat$2$tempBoogie8: int;
  var inline$Own_Below_Threat$2$tempBoogie9: int;
  var inline$Own_Below_Threat$2$tempBoogie10: int;
  var inline$Own_Below_Threat$2$tempBoogie11: int;
  var inline$Own_Below_Threat$2$tempBoogie12: int;
  var inline$Own_Below_Threat$2$tempBoogie13: int;
  var inline$Own_Below_Threat$2$tempBoogie14: int;
  var inline$Own_Below_Threat$2$tempBoogie15: int;
  var inline$Own_Below_Threat$2$tempBoogie16: int;
  var inline$Own_Below_Threat$2$tempBoogie17: int;
  var inline$Own_Below_Threat$2$tempBoogie18: int;
  var inline$Own_Below_Threat$2$tempBoogie19: int;
  var inline$Own_Below_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$2$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$2$alloc: int;
  var inline$Own_Below_Threat$2$detChoiceCnt: int;
  var inline$Own_Below_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.PINT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Descend$0$condVal: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.5$: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Descend$0$result: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$4: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Descend$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1: int;
  var inline$Non_Crossing_Biased_Descend$0$alloc: int;
  var inline$Non_Crossing_Biased_Descend$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$1$condVal: int;
  var inline$Inhibit_Biased_Climb$1$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$1$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$1$alloc: int;
  var inline$Inhibit_Biased_Climb$1$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$1$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$Own_Above_Threat$1$condVal: int;
  var inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$1$alloc: int;
  var inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$2$havoc_stringTemp: int;
  var inline$Own_Above_Threat$2$condVal: int;
  var inline$Own_Above_Threat$2$tempBoogie0: int;
  var inline$Own_Above_Threat$2$tempBoogie1: int;
  var inline$Own_Above_Threat$2$tempBoogie2: int;
  var inline$Own_Above_Threat$2$tempBoogie3: int;
  var inline$Own_Above_Threat$2$tempBoogie4: int;
  var inline$Own_Above_Threat$2$tempBoogie5: int;
  var inline$Own_Above_Threat$2$tempBoogie6: int;
  var inline$Own_Above_Threat$2$tempBoogie7: int;
  var inline$Own_Above_Threat$2$tempBoogie8: int;
  var inline$Own_Above_Threat$2$tempBoogie9: int;
  var inline$Own_Above_Threat$2$tempBoogie10: int;
  var inline$Own_Above_Threat$2$tempBoogie11: int;
  var inline$Own_Above_Threat$2$tempBoogie12: int;
  var inline$Own_Above_Threat$2$tempBoogie13: int;
  var inline$Own_Above_Threat$2$tempBoogie14: int;
  var inline$Own_Above_Threat$2$tempBoogie15: int;
  var inline$Own_Above_Threat$2$tempBoogie16: int;
  var inline$Own_Above_Threat$2$tempBoogie17: int;
  var inline$Own_Above_Threat$2$tempBoogie18: int;
  var inline$Own_Above_Threat$2$tempBoogie19: int;
  var inline$Own_Above_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$2$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$2$alloc: int;
  var inline$Own_Above_Threat$2$detChoiceCnt: int;
  var inline$Own_Above_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.PINT4: [int]int;
  var inline$ALIM$2$havoc_stringTemp: int;
  var inline$ALIM$2$condVal: int;
  var inline$ALIM$2$tempBoogie0: int;
  var inline$ALIM$2$tempBoogie1: int;
  var inline$ALIM$2$tempBoogie2: int;
  var inline$ALIM$2$tempBoogie3: int;
  var inline$ALIM$2$tempBoogie4: int;
  var inline$ALIM$2$tempBoogie5: int;
  var inline$ALIM$2$tempBoogie6: int;
  var inline$ALIM$2$tempBoogie7: int;
  var inline$ALIM$2$tempBoogie8: int;
  var inline$ALIM$2$tempBoogie9: int;
  var inline$ALIM$2$tempBoogie10: int;
  var inline$ALIM$2$tempBoogie11: int;
  var inline$ALIM$2$tempBoogie12: int;
  var inline$ALIM$2$tempBoogie13: int;
  var inline$ALIM$2$tempBoogie14: int;
  var inline$ALIM$2$tempBoogie15: int;
  var inline$ALIM$2$tempBoogie16: int;
  var inline$ALIM$2$tempBoogie17: int;
  var inline$ALIM$2$tempBoogie18: int;
  var inline$ALIM$2$tempBoogie19: int;
  var inline$ALIM$2$__havoc_dummy_return: int;
  var inline$ALIM$2$result.ALIM$1: int;
  var inline$ALIM$2$alloc: int;
  var inline$ALIM$2$detChoiceCnt: int;
  var inline$ALIM$2$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$2$Res_PROBED: [int]int;
  var inline$ALIM$2$Mem_T.A4INT4: [int]int;
  var inline$ALIM$2$Mem_T.INT4: [int]int;
  var inline$ALIM$2$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$3$havoc_stringTemp: int;
  var inline$Own_Below_Threat$3$condVal: int;
  var inline$Own_Below_Threat$3$tempBoogie0: int;
  var inline$Own_Below_Threat$3$tempBoogie1: int;
  var inline$Own_Below_Threat$3$tempBoogie2: int;
  var inline$Own_Below_Threat$3$tempBoogie3: int;
  var inline$Own_Below_Threat$3$tempBoogie4: int;
  var inline$Own_Below_Threat$3$tempBoogie5: int;
  var inline$Own_Below_Threat$3$tempBoogie6: int;
  var inline$Own_Below_Threat$3$tempBoogie7: int;
  var inline$Own_Below_Threat$3$tempBoogie8: int;
  var inline$Own_Below_Threat$3$tempBoogie9: int;
  var inline$Own_Below_Threat$3$tempBoogie10: int;
  var inline$Own_Below_Threat$3$tempBoogie11: int;
  var inline$Own_Below_Threat$3$tempBoogie12: int;
  var inline$Own_Below_Threat$3$tempBoogie13: int;
  var inline$Own_Below_Threat$3$tempBoogie14: int;
  var inline$Own_Below_Threat$3$tempBoogie15: int;
  var inline$Own_Below_Threat$3$tempBoogie16: int;
  var inline$Own_Below_Threat$3$tempBoogie17: int;
  var inline$Own_Below_Threat$3$tempBoogie18: int;
  var inline$Own_Below_Threat$3$tempBoogie19: int;
  var inline$Own_Below_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$3$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$3$alloc: int;
  var inline$Own_Below_Threat$3$detChoiceCnt: int;
  var inline$Own_Below_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.PINT4: [int]int;
  var inline$ALIM$3$havoc_stringTemp: int;
  var inline$ALIM$3$condVal: int;
  var inline$ALIM$3$tempBoogie0: int;
  var inline$ALIM$3$tempBoogie1: int;
  var inline$ALIM$3$tempBoogie2: int;
  var inline$ALIM$3$tempBoogie3: int;
  var inline$ALIM$3$tempBoogie4: int;
  var inline$ALIM$3$tempBoogie5: int;
  var inline$ALIM$3$tempBoogie6: int;
  var inline$ALIM$3$tempBoogie7: int;
  var inline$ALIM$3$tempBoogie8: int;
  var inline$ALIM$3$tempBoogie9: int;
  var inline$ALIM$3$tempBoogie10: int;
  var inline$ALIM$3$tempBoogie11: int;
  var inline$ALIM$3$tempBoogie12: int;
  var inline$ALIM$3$tempBoogie13: int;
  var inline$ALIM$3$tempBoogie14: int;
  var inline$ALIM$3$tempBoogie15: int;
  var inline$ALIM$3$tempBoogie16: int;
  var inline$ALIM$3$tempBoogie17: int;
  var inline$ALIM$3$tempBoogie18: int;
  var inline$ALIM$3$tempBoogie19: int;
  var inline$ALIM$3$__havoc_dummy_return: int;
  var inline$ALIM$3$result.ALIM$1: int;
  var inline$ALIM$3$alloc: int;
  var inline$ALIM$3$detChoiceCnt: int;
  var inline$ALIM$3$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$3$Res_PROBED: [int]int;
  var inline$ALIM$3$Mem_T.A4INT4: [int]int;
  var inline$ALIM$3$Mem_T.INT4: [int]int;
  var inline$ALIM$3$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$3$havoc_stringTemp: int;
  var inline$Own_Above_Threat$3$condVal: int;
  var inline$Own_Above_Threat$3$tempBoogie0: int;
  var inline$Own_Above_Threat$3$tempBoogie1: int;
  var inline$Own_Above_Threat$3$tempBoogie2: int;
  var inline$Own_Above_Threat$3$tempBoogie3: int;
  var inline$Own_Above_Threat$3$tempBoogie4: int;
  var inline$Own_Above_Threat$3$tempBoogie5: int;
  var inline$Own_Above_Threat$3$tempBoogie6: int;
  var inline$Own_Above_Threat$3$tempBoogie7: int;
  var inline$Own_Above_Threat$3$tempBoogie8: int;
  var inline$Own_Above_Threat$3$tempBoogie9: int;
  var inline$Own_Above_Threat$3$tempBoogie10: int;
  var inline$Own_Above_Threat$3$tempBoogie11: int;
  var inline$Own_Above_Threat$3$tempBoogie12: int;
  var inline$Own_Above_Threat$3$tempBoogie13: int;
  var inline$Own_Above_Threat$3$tempBoogie14: int;
  var inline$Own_Above_Threat$3$tempBoogie15: int;
  var inline$Own_Above_Threat$3$tempBoogie16: int;
  var inline$Own_Above_Threat$3$tempBoogie17: int;
  var inline$Own_Above_Threat$3$tempBoogie18: int;
  var inline$Own_Above_Threat$3$tempBoogie19: int;
  var inline$Own_Above_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$3$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$3$alloc: int;
  var inline$Own_Above_Threat$3$detChoiceCnt: int;
  var inline$Own_Above_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    $Pred.2$ := 0;
    $Pred.3$ := 0;
    $Pred.6$ := 0;
    $Pred.9$ := 0;
    alt_sep := 0;
    enabled := 0;
    intent_not_known := 0;
    need_downward_RA := 0;
    need_upward_RA := 0;
    result.Non_Crossing_Biased_Climb$4 := 0;
    result.Non_Crossing_Biased_Descend$7 := 0;
    result.Own_Above_Threat$8 := 0;
    result.Own_Below_Threat$5 := 0;
    result.alt_sep_test$1 := 0;
    tcas_equipped := 0;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 106} true;
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 106} true;
    goto label_8#2;

  label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 107} true;
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto label_9_true#2, label_9_false#2;

  label_9_false#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] == 0;
    goto label_10#2;

  label_9_true#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] != 0;
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto label_11_true#2, label_11_false#2;

  label_11_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto label_10#2;

  label_11_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto label_12#2;

  label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto label_12_true#2, label_12_false#2;

  label_12_false#2:
    assume !v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    $Pred.2$ := 0;
    goto label_14#2;

  label_12_true#2:
    assume v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto label_13#2;

  label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    $Pred.2$ := 1;
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    enabled := $Pred.2$;
    goto label_15#2;

  label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 110} true;
    tcas_equipped := v4.LIFT(v4.INT_EQ(v4.Mem_T.INT4[v4.Other_Capability], 1));
    goto label_16#2;

  label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    goto label_16_true#2, label_16_false#2;

  label_16_false#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] == 0;
    goto label_17#2;

  label_16_true#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] != 0;
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    goto label_18_true#2, label_18_false#2;

  label_18_false#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] == 0;
    goto label_19#2;

  label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    $Pred.3$ := 1;
    goto label_20#2;

  label_18_true#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] != 0;
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    $Pred.3$ := 0;
    goto label_20#2;

  label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    intent_not_known := $Pred.3$;
    goto label_21#2;

  label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 113} true;
    alt_sep := 0;
    goto label_22#2;

  label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto label_22_true#2, label_22_false#2;

  label_22_false#2:
    assume enabled == 0;
    goto label_23#2;

  label_22_true#2:
    assume enabled != 0;
    goto label_24#2;

  label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto label_24_true#2, label_24_false#2;

  label_24_false#2:
    assume tcas_equipped == 0;
    goto label_25#2;

  label_24_true#2:
    assume tcas_equipped != 0;
    goto label_26#2;

  label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto label_26_true#2, label_26_false#2;

  label_26_false#2:
    assume intent_not_known == 0;
    goto label_25#2;

  label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto label_25_true#2, label_25_false#2;

  label_25_false#2:
    assume tcas_equipped == 0;
    goto label_27#2;

  label_25_true#2:
    assume tcas_equipped != 0;
    goto label_23#2;

  label_26_true#2:
    assume intent_not_known != 0;
    goto label_27#2;

  label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$Non_Crossing_Biased_Climb$0$Entry;

  inline$Non_Crossing_Biased_Climb$0$Entry:
    inline$Non_Crossing_Biased_Climb$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Climb$0$anon0#2;

  inline$Non_Crossing_Biased_Climb$0$anon0#2:
    inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Climb$0$start#2;

  inline$Non_Crossing_Biased_Climb$0$start#2:
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Climb$0$result := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_3#2;

  inline$Non_Crossing_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 59} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_4#2;

  inline$Non_Crossing_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 60} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_5#2;

  inline$Non_Crossing_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 61} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2;

  inline$Non_Crossing_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_9#2;

  inline$Non_Crossing_Biased_Climb$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Climb$0$label_10#2;

  inline$Non_Crossing_Biased_Climb$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 64} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_10_true#2, inline$Non_Crossing_Biased_Climb$0$label_10_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2;

  inline$Non_Crossing_Biased_Climb$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_30#2;

  inline$Non_Crossing_Biased_Climb$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_30_true#2, inline$Non_Crossing_Biased_Climb$0$label_30_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_32#2;

  inline$Non_Crossing_Biased_Climb$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_32_true#2, inline$Non_Crossing_Biased_Climb$0$label_32_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2;

  inline$Non_Crossing_Biased_Climb$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_33#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_36#2;

  inline$Non_Crossing_Biased_Climb$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_36_true#2, inline$Non_Crossing_Biased_Climb$0$label_36_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_37#2;

  inline$Non_Crossing_Biased_Climb$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2;

  inline$Non_Crossing_Biased_Climb$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_17#2;

  inline$Non_Crossing_Biased_Climb$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_17_true#2, inline$Non_Crossing_Biased_Climb$0$label_17_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2;

  inline$Non_Crossing_Biased_Climb$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$1$Entry;

  inline$Own_Below_Threat$1$Entry:
    inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$1$anon0#2;

  inline$Own_Below_Threat$1$anon0#2:
    inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$1$start#2;

  inline$Own_Below_Threat$1$start#2:
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$1$label_3#2;

  inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$1$label_1#2;

  inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$1$Return;

  inline$Own_Below_Threat$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_19#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_22#2;

  inline$Non_Crossing_Biased_Climb$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_22_true#2, inline$Non_Crossing_Biased_Climb$0$label_22_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2;

  inline$Non_Crossing_Biased_Climb$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := inline$ALIM$1$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_24#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_27#2;

  inline$Non_Crossing_Biased_Climb$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_27_true#2, inline$Non_Crossing_Biased_Climb$0$label_27_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.6$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 72} true;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := inline$Non_Crossing_Biased_Climb$0$result;
    goto inline$Non_Crossing_Biased_Climb$0$label_1#2;

  inline$Non_Crossing_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 73} true;
    goto inline$Non_Crossing_Biased_Climb$0$Return;

  inline$Non_Crossing_Biased_Climb$0$Return:
    result.Non_Crossing_Biased_Climb$4 := inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1;
    goto label_27#2$1;

  label_27#2$1:
    goto label_30#2;

  label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto label_30_true#2, label_30_false#2;

  label_30_false#2:
    assume result.Non_Crossing_Biased_Climb$4 == 0;
    goto label_31#2;

  label_30_true#2:
    assume result.Non_Crossing_Biased_Climb$4 != 0;
    goto label_32#2;

  label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$Own_Below_Threat$2$Entry;

  inline$Own_Below_Threat$2$Entry:
    inline$Own_Below_Threat$2$alloc := v4.alloc;
    inline$Own_Below_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$2$anon0#2;

  inline$Own_Below_Threat$2$anon0#2:
    inline$Own_Below_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$2$start#2;

  inline$Own_Below_Threat$2$start#2:
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$2$label_3#2;

  inline$Own_Below_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$2$label_1#2;

  inline$Own_Below_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$2$Return;

  inline$Own_Below_Threat$2$Return:
    result.Own_Below_Threat$5 := inline$Own_Below_Threat$2$result.Own_Below_Threat$1;
    goto label_32#2$1;

  label_32#2$1:
    goto label_35#2;

  label_35#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto label_35_true#2, label_35_false#2;

  label_35_false#2:
    assume result.Own_Below_Threat$5 == 0;
    goto label_31#2;

  label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    $Pred.6$ := 0;
    goto label_37#2;

  label_35_true#2:
    assume result.Own_Below_Threat$5 != 0;
    goto label_36#2;

  label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    $Pred.6$ := 1;
    goto label_37#2;

  label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    need_upward_RA := $Pred.6$;
    goto label_38#2;

  label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$Non_Crossing_Biased_Descend$0$Entry;

  inline$Non_Crossing_Biased_Descend$0$Entry:
    inline$Non_Crossing_Biased_Descend$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Descend$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Descend$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Descend$0$anon0#2;

  inline$Non_Crossing_Biased_Descend$0$anon0#2:
    inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Descend$0$start#2;

  inline$Non_Crossing_Biased_Descend$0$start#2:
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Descend$0$result := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_3#2;

  inline$Non_Crossing_Biased_Descend$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 77} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_4#2;

  inline$Non_Crossing_Biased_Descend$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 78} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_5#2;

  inline$Non_Crossing_Biased_Descend$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 79} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2;

  inline$Non_Crossing_Biased_Descend$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    goto inline$Inhibit_Biased_Climb$1$Entry;

  inline$Inhibit_Biased_Climb$1$Entry:
    inline$Inhibit_Biased_Climb$1$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$1$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$1$anon0#2;

  inline$Inhibit_Biased_Climb$1$anon0#2:
    inline$Inhibit_Biased_Climb$1$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$1$start#2;

  inline$Inhibit_Biased_Climb$1$start#2:
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$1$label_3#2;

  inline$Inhibit_Biased_Climb$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$1$label_3_true#2, inline$Inhibit_Biased_Climb$1$label_3_false#2;

  inline$Inhibit_Biased_Climb$1$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$1$label_4#2;

  inline$Inhibit_Biased_Climb$1$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$1$label_5#2;

  inline$Inhibit_Biased_Climb$1$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$1$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$1$label_1#2;

  inline$Inhibit_Biased_Climb$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$1$Return;

  inline$Inhibit_Biased_Climb$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_9#2;

  inline$Non_Crossing_Biased_Descend$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Descend$0$label_10#2;

  inline$Non_Crossing_Biased_Descend$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 82} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_10_true#2, inline$Non_Crossing_Biased_Descend$0$label_10_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2;

  inline$Non_Crossing_Biased_Descend$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$1$Entry;

  inline$Own_Above_Threat$1$Entry:
    inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$1$anon0#2;

  inline$Own_Above_Threat$1$anon0#2:
    inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$1$start#2;

  inline$Own_Above_Threat$1$start#2:
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$1$label_3#2;

  inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$1$label_1#2;

  inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$1$Return;

  inline$Own_Above_Threat$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_27#2;

  inline$Non_Crossing_Biased_Descend$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_27_true#2, inline$Non_Crossing_Biased_Descend$0$label_27_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2;

  inline$Non_Crossing_Biased_Descend$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$2$Entry;

  inline$Own_Above_Threat$2$Entry:
    inline$Own_Above_Threat$2$alloc := v4.alloc;
    inline$Own_Above_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$2$anon0#2;

  inline$Own_Above_Threat$2$anon0#2:
    inline$Own_Above_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$2$start#2;

  inline$Own_Above_Threat$2$start#2:
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$2$label_3#2;

  inline$Own_Above_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$2$label_1#2;

  inline$Own_Above_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$2$Return;

  inline$Own_Above_Threat$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$2$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_29#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_32#2;

  inline$Non_Crossing_Biased_Descend$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_32_true#2, inline$Non_Crossing_Biased_Descend$0$label_32_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2;

  inline$Non_Crossing_Biased_Descend$0$label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$ALIM$2$Entry;

  inline$ALIM$2$Entry:
    inline$ALIM$2$alloc := v4.alloc;
    inline$ALIM$2$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$2$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$2$anon0#2;

  inline$ALIM$2$anon0#2:
    inline$ALIM$2$havoc_stringTemp := 0;
    goto inline$ALIM$2$start#2;

  inline$ALIM$2$start#2:
    inline$ALIM$2$result.ALIM$1 := 0;
    goto inline$ALIM$2$label_3#2;

  inline$ALIM$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$2$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$2$label_1#2;

  inline$ALIM$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$2$Return;

  inline$ALIM$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := inline$ALIM$2$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_34#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_37#2;

  inline$Non_Crossing_Biased_Descend$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_37_true#2, inline$Non_Crossing_Biased_Descend$0$label_37_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2;

  inline$Non_Crossing_Biased_Descend$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Own_Below_Threat$3$Entry;

  inline$Own_Below_Threat$3$Entry:
    inline$Own_Below_Threat$3$alloc := v4.alloc;
    inline$Own_Below_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$3$anon0#2;

  inline$Own_Below_Threat$3$anon0#2:
    inline$Own_Below_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$3$start#2;

  inline$Own_Below_Threat$3$start#2:
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$3$label_3#2;

  inline$Own_Below_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$3$label_1#2;

  inline$Own_Below_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$3$Return;

  inline$Own_Below_Threat$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$3$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_17#2;

  inline$Non_Crossing_Biased_Descend$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_17_true#2, inline$Non_Crossing_Biased_Descend$0$label_17_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_19#2;

  inline$Non_Crossing_Biased_Descend$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_19_true#2, inline$Non_Crossing_Biased_Descend$0$label_19_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2;

  inline$Non_Crossing_Biased_Descend$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$ALIM$3$Entry;

  inline$ALIM$3$Entry:
    inline$ALIM$3$alloc := v4.alloc;
    inline$ALIM$3$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$3$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$3$anon0#2;

  inline$ALIM$3$anon0#2:
    inline$ALIM$3$havoc_stringTemp := 0;
    goto inline$ALIM$3$start#2;

  inline$ALIM$3$start#2:
    inline$ALIM$3$result.ALIM$1 := 0;
    goto inline$ALIM$3$label_3#2;

  inline$ALIM$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$3$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$3$label_1#2;

  inline$ALIM$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$3$Return;

  inline$ALIM$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := inline$ALIM$3$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_20#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_23#2;

  inline$Non_Crossing_Biased_Descend$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_23_true#2, inline$Non_Crossing_Biased_Descend$0$label_23_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_24#2;

  inline$Non_Crossing_Biased_Descend$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.5$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 90} true;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := inline$Non_Crossing_Biased_Descend$0$result;
    goto inline$Non_Crossing_Biased_Descend$0$label_1#2;

  inline$Non_Crossing_Biased_Descend$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 91} true;
    goto inline$Non_Crossing_Biased_Descend$0$Return;

  inline$Non_Crossing_Biased_Descend$0$Return:
    result.Non_Crossing_Biased_Descend$7 := inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1;
    goto label_38#2$1;

  label_38#2$1:
    goto label_41#2;

  label_41#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto label_41_true#2, label_41_false#2;

  label_41_false#2:
    assume result.Non_Crossing_Biased_Descend$7 == 0;
    goto label_42#2;

  label_41_true#2:
    assume result.Non_Crossing_Biased_Descend$7 != 0;
    goto label_43#2;

  label_43#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$Own_Above_Threat$3$Entry;

  inline$Own_Above_Threat$3$Entry:
    inline$Own_Above_Threat$3$alloc := v4.alloc;
    inline$Own_Above_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$3$anon0#2;

  inline$Own_Above_Threat$3$anon0#2:
    inline$Own_Above_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$3$start#2;

  inline$Own_Above_Threat$3$start#2:
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$3$label_3#2;

  inline$Own_Above_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$3$label_1#2;

  inline$Own_Above_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$3$Return;

  inline$Own_Above_Threat$3$Return:
    result.Own_Above_Threat$8 := inline$Own_Above_Threat$3$result.Own_Above_Threat$1;
    goto label_43#2$1;

  label_43#2$1:
    goto label_46#2;

  label_46#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto label_46_true#2, label_46_false#2;

  label_46_false#2:
    assume result.Own_Above_Threat$8 == 0;
    goto label_42#2;

  label_42#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    $Pred.9$ := 0;
    goto label_48#2;

  label_46_true#2:
    assume result.Own_Above_Threat$8 != 0;
    goto label_47#2;

  label_47#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    $Pred.9$ := 1;
    goto label_48#2;

  label_48#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    need_downward_RA := $Pred.9$;
    goto label_49#2;

  label_49#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 119} true;
    goto label_49_true#2, label_49_false#2;

  label_49_false#2:
    assume need_upward_RA == 0;
    goto label_50#2;

  label_49_true#2:
    assume need_upward_RA != 0;
    goto label_51#2;

  label_51#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 119} true;
    goto label_51_true#2, label_51_false#2;

  label_51_false#2:
    assume need_downward_RA == 0;
    goto label_50#2;

  label_50#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 124} true;
    goto label_50_true#2, label_50_false#2;

  label_50_false#2:
    assume need_upward_RA == 0;
    goto label_53#2;

  label_53#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 126} true;
    goto label_53_true#2, label_53_false#2;

  label_53_false#2:
    assume need_downward_RA == 0;
    goto label_55#2;

  label_55#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 129} true;
    alt_sep := 0;
    goto label_23#2;

  label_53_true#2:
    assume need_downward_RA != 0;
    goto label_56#2;

  label_56#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 127} true;
    alt_sep := 2;
    goto label_23#2;

  label_50_true#2:
    assume need_upward_RA != 0;
    goto label_54#2;

  label_54#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 125} true;
    alt_sep := 1;
    goto label_23#2;

  label_51_true#2:
    assume need_downward_RA != 0;
    goto label_52#2;

  label_52#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 123} true;
    alt_sep := 0;
    goto label_23#2;

  label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 132} true;
    result.alt_sep_test$1 := alt_sep;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 133} true;
    return;
}



implementation v3.initialize()
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
  var {:extern} __havoc_dummy_return: int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 41} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 0) := 400];
    goto label_4#2;

  label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 42} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 1) := 500];
    goto label_5#2;

  label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 43} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 2) := 640];
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 44} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 3) := 740];
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 45} true;
    return;
}



implementation {:inline 1} v3.tcas(a1_.1: int, a2_.1: int, a3_.1: int, a4_.1: int, a5_.1: int, a6_.1: int, a7_.1: int, a8_.1: int, a9_.1: int, a10_.1: int, a11_.1: int, a12_.1: int) returns (result.tcas$1: int)
{
  var {:extern} havoc_stringTemp: int;
  var {:extern} condVal: int;
  var {:extern} a1: int;
  var {:extern} a10: int;
  var {:extern} a11: int;
  var {:extern} a12: int;
  var {:extern} a2: int;
  var {:extern} a3: int;
  var {:extern} a4: int;
  var {:extern} a5: int;
  var {:extern} a6: int;
  var {:extern} a7: int;
  var {:extern} a8: int;
  var {:extern} a9: int;
  var {:extern} result.alt_sep_test$2: int;
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
  var inline$initialize$0$havoc_stringTemp: int;
  var inline$initialize$0$condVal: int;
  var inline$initialize$0$tempBoogie0: int;
  var inline$initialize$0$tempBoogie1: int;
  var inline$initialize$0$tempBoogie2: int;
  var inline$initialize$0$tempBoogie3: int;
  var inline$initialize$0$tempBoogie4: int;
  var inline$initialize$0$tempBoogie5: int;
  var inline$initialize$0$tempBoogie6: int;
  var inline$initialize$0$tempBoogie7: int;
  var inline$initialize$0$tempBoogie8: int;
  var inline$initialize$0$tempBoogie9: int;
  var inline$initialize$0$tempBoogie10: int;
  var inline$initialize$0$tempBoogie11: int;
  var inline$initialize$0$tempBoogie12: int;
  var inline$initialize$0$tempBoogie13: int;
  var inline$initialize$0$tempBoogie14: int;
  var inline$initialize$0$tempBoogie15: int;
  var inline$initialize$0$tempBoogie16: int;
  var inline$initialize$0$tempBoogie17: int;
  var inline$initialize$0$tempBoogie18: int;
  var inline$initialize$0$tempBoogie19: int;
  var inline$initialize$0$__havoc_dummy_return: int;
  var inline$initialize$0$alloc: int;
  var inline$initialize$0$detChoiceCnt: int;
  var inline$initialize$0$Res_KERNEL_SOURCE: [int]int;
  var inline$initialize$0$Res_PROBED: [int]int;
  var inline$initialize$0$Mem_T.A4INT4: [int]int;
  var inline$initialize$0$Mem_T.INT4: [int]int;
  var inline$initialize$0$Mem_T.PINT4: [int]int;
  var inline$alt_sep_test$0$havoc_stringTemp: int;
  var inline$alt_sep_test$0$condVal: int;
  var inline$alt_sep_test$0$$Pred.2$: int;
  var inline$alt_sep_test$0$$Pred.3$: int;
  var inline$alt_sep_test$0$$Pred.6$: int;
  var inline$alt_sep_test$0$$Pred.9$: int;
  var inline$alt_sep_test$0$alt_sep: int;
  var inline$alt_sep_test$0$enabled: int;
  var inline$alt_sep_test$0$intent_not_known: int;
  var inline$alt_sep_test$0$need_downward_RA: int;
  var inline$alt_sep_test$0$need_upward_RA: int;
  var inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4: int;
  var inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7: int;
  var inline$alt_sep_test$0$result.Own_Above_Threat$8: int;
  var inline$alt_sep_test$0$result.Own_Below_Threat$5: int;
  var inline$alt_sep_test$0$tcas_equipped: int;
  var inline$alt_sep_test$0$tempBoogie0: int;
  var inline$alt_sep_test$0$tempBoogie1: int;
  var inline$alt_sep_test$0$tempBoogie2: int;
  var inline$alt_sep_test$0$tempBoogie3: int;
  var inline$alt_sep_test$0$tempBoogie4: int;
  var inline$alt_sep_test$0$tempBoogie5: int;
  var inline$alt_sep_test$0$tempBoogie6: int;
  var inline$alt_sep_test$0$tempBoogie7: int;
  var inline$alt_sep_test$0$tempBoogie8: int;
  var inline$alt_sep_test$0$tempBoogie9: int;
  var inline$alt_sep_test$0$tempBoogie10: int;
  var inline$alt_sep_test$0$tempBoogie11: int;
  var inline$alt_sep_test$0$tempBoogie12: int;
  var inline$alt_sep_test$0$tempBoogie13: int;
  var inline$alt_sep_test$0$tempBoogie14: int;
  var inline$alt_sep_test$0$tempBoogie15: int;
  var inline$alt_sep_test$0$tempBoogie16: int;
  var inline$alt_sep_test$0$tempBoogie17: int;
  var inline$alt_sep_test$0$tempBoogie18: int;
  var inline$alt_sep_test$0$tempBoogie19: int;
  var inline$alt_sep_test$0$__havoc_dummy_return: int;
  var inline$alt_sep_test$0$result.alt_sep_test$1: int;
  var inline$alt_sep_test$0$alloc: int;
  var inline$alt_sep_test$0$detChoiceCnt: int;
  var inline$alt_sep_test$0$Res_KERNEL_SOURCE: [int]int;
  var inline$alt_sep_test$0$Res_PROBED: [int]int;
  var inline$alt_sep_test$0$Mem_T.A4INT4: [int]int;
  var inline$alt_sep_test$0$Mem_T.INT4: [int]int;
  var inline$alt_sep_test$0$Mem_T.PINT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Climb$0$condVal: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.6$: int;
  var inline$Non_Crossing_Biased_Climb$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Climb$0$result: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$5: int;
  var inline$Non_Crossing_Biased_Climb$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Climb$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Climb$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1: int;
  var inline$Non_Crossing_Biased_Climb$0$alloc: int;
  var inline$Non_Crossing_Biased_Climb$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$Own_Above_Threat$0$condVal: int;
  var inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$0$alloc: int;
  var inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$ALIM$0$havoc_stringTemp: int;
  var inline$ALIM$0$condVal: int;
  var inline$ALIM$0$tempBoogie0: int;
  var inline$ALIM$0$tempBoogie1: int;
  var inline$ALIM$0$tempBoogie2: int;
  var inline$ALIM$0$tempBoogie3: int;
  var inline$ALIM$0$tempBoogie4: int;
  var inline$ALIM$0$tempBoogie5: int;
  var inline$ALIM$0$tempBoogie6: int;
  var inline$ALIM$0$tempBoogie7: int;
  var inline$ALIM$0$tempBoogie8: int;
  var inline$ALIM$0$tempBoogie9: int;
  var inline$ALIM$0$tempBoogie10: int;
  var inline$ALIM$0$tempBoogie11: int;
  var inline$ALIM$0$tempBoogie12: int;
  var inline$ALIM$0$tempBoogie13: int;
  var inline$ALIM$0$tempBoogie14: int;
  var inline$ALIM$0$tempBoogie15: int;
  var inline$ALIM$0$tempBoogie16: int;
  var inline$ALIM$0$tempBoogie17: int;
  var inline$ALIM$0$tempBoogie18: int;
  var inline$ALIM$0$tempBoogie19: int;
  var inline$ALIM$0$__havoc_dummy_return: int;
  var inline$ALIM$0$result.ALIM$1: int;
  var inline$ALIM$0$alloc: int;
  var inline$ALIM$0$detChoiceCnt: int;
  var inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$0$Res_PROBED: [int]int;
  var inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$Own_Below_Threat$0$condVal: int;
  var inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$0$alloc: int;
  var inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$Own_Below_Threat$1$condVal: int;
  var inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$1$alloc: int;
  var inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$ALIM$1$havoc_stringTemp: int;
  var inline$ALIM$1$condVal: int;
  var inline$ALIM$1$tempBoogie0: int;
  var inline$ALIM$1$tempBoogie1: int;
  var inline$ALIM$1$tempBoogie2: int;
  var inline$ALIM$1$tempBoogie3: int;
  var inline$ALIM$1$tempBoogie4: int;
  var inline$ALIM$1$tempBoogie5: int;
  var inline$ALIM$1$tempBoogie6: int;
  var inline$ALIM$1$tempBoogie7: int;
  var inline$ALIM$1$tempBoogie8: int;
  var inline$ALIM$1$tempBoogie9: int;
  var inline$ALIM$1$tempBoogie10: int;
  var inline$ALIM$1$tempBoogie11: int;
  var inline$ALIM$1$tempBoogie12: int;
  var inline$ALIM$1$tempBoogie13: int;
  var inline$ALIM$1$tempBoogie14: int;
  var inline$ALIM$1$tempBoogie15: int;
  var inline$ALIM$1$tempBoogie16: int;
  var inline$ALIM$1$tempBoogie17: int;
  var inline$ALIM$1$tempBoogie18: int;
  var inline$ALIM$1$tempBoogie19: int;
  var inline$ALIM$1$__havoc_dummy_return: int;
  var inline$ALIM$1$result.ALIM$1: int;
  var inline$ALIM$1$alloc: int;
  var inline$ALIM$1$detChoiceCnt: int;
  var inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$1$Res_PROBED: [int]int;
  var inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$ALIM$1$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$2$havoc_stringTemp: int;
  var inline$Own_Below_Threat$2$condVal: int;
  var inline$Own_Below_Threat$2$tempBoogie0: int;
  var inline$Own_Below_Threat$2$tempBoogie1: int;
  var inline$Own_Below_Threat$2$tempBoogie2: int;
  var inline$Own_Below_Threat$2$tempBoogie3: int;
  var inline$Own_Below_Threat$2$tempBoogie4: int;
  var inline$Own_Below_Threat$2$tempBoogie5: int;
  var inline$Own_Below_Threat$2$tempBoogie6: int;
  var inline$Own_Below_Threat$2$tempBoogie7: int;
  var inline$Own_Below_Threat$2$tempBoogie8: int;
  var inline$Own_Below_Threat$2$tempBoogie9: int;
  var inline$Own_Below_Threat$2$tempBoogie10: int;
  var inline$Own_Below_Threat$2$tempBoogie11: int;
  var inline$Own_Below_Threat$2$tempBoogie12: int;
  var inline$Own_Below_Threat$2$tempBoogie13: int;
  var inline$Own_Below_Threat$2$tempBoogie14: int;
  var inline$Own_Below_Threat$2$tempBoogie15: int;
  var inline$Own_Below_Threat$2$tempBoogie16: int;
  var inline$Own_Below_Threat$2$tempBoogie17: int;
  var inline$Own_Below_Threat$2$tempBoogie18: int;
  var inline$Own_Below_Threat$2$tempBoogie19: int;
  var inline$Own_Below_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$2$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$2$alloc: int;
  var inline$Own_Below_Threat$2$detChoiceCnt: int;
  var inline$Own_Below_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$2$Mem_T.PINT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp: int;
  var inline$Non_Crossing_Biased_Descend$0$condVal: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.5$: int;
  var inline$Non_Crossing_Biased_Descend$0$$Pred.9$: int;
  var inline$Non_Crossing_Biased_Descend$0$result: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$4: int;
  var inline$Non_Crossing_Biased_Descend$0$result.ALIM$8: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation: int;
  var inline$Non_Crossing_Biased_Descend$0$upward_preferred: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie0: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie1: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie2: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie3: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie4: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie5: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie6: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie7: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie8: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie9: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie10: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie11: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie12: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie13: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie14: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie15: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie16: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie17: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie18: int;
  var inline$Non_Crossing_Biased_Descend$0$tempBoogie19: int;
  var inline$Non_Crossing_Biased_Descend$0$__havoc_dummy_return: int;
  var inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1: int;
  var inline$Non_Crossing_Biased_Descend$0$alloc: int;
  var inline$Non_Crossing_Biased_Descend$0$detChoiceCnt: int;
  var inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Res_PROBED: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4: [int]int;
  var inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$havoc_stringTemp: int;
  var inline$Inhibit_Biased_Climb$1$condVal: int;
  var inline$Inhibit_Biased_Climb$1$$result.question.2$: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie0: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie1: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie2: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie3: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie4: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie5: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie6: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie7: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie8: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie9: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie10: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie11: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie12: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie13: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie14: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie15: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie16: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie17: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie18: int;
  var inline$Inhibit_Biased_Climb$1$tempBoogie19: int;
  var inline$Inhibit_Biased_Climb$1$__havoc_dummy_return: int;
  var inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1: int;
  var inline$Inhibit_Biased_Climb$1$alloc: int;
  var inline$Inhibit_Biased_Climb$1$detChoiceCnt: int;
  var inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Inhibit_Biased_Climb$1$Res_PROBED: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.INT4: [int]int;
  var inline$Inhibit_Biased_Climb$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$Own_Above_Threat$1$condVal: int;
  var inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$1$alloc: int;
  var inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$2$havoc_stringTemp: int;
  var inline$Own_Above_Threat$2$condVal: int;
  var inline$Own_Above_Threat$2$tempBoogie0: int;
  var inline$Own_Above_Threat$2$tempBoogie1: int;
  var inline$Own_Above_Threat$2$tempBoogie2: int;
  var inline$Own_Above_Threat$2$tempBoogie3: int;
  var inline$Own_Above_Threat$2$tempBoogie4: int;
  var inline$Own_Above_Threat$2$tempBoogie5: int;
  var inline$Own_Above_Threat$2$tempBoogie6: int;
  var inline$Own_Above_Threat$2$tempBoogie7: int;
  var inline$Own_Above_Threat$2$tempBoogie8: int;
  var inline$Own_Above_Threat$2$tempBoogie9: int;
  var inline$Own_Above_Threat$2$tempBoogie10: int;
  var inline$Own_Above_Threat$2$tempBoogie11: int;
  var inline$Own_Above_Threat$2$tempBoogie12: int;
  var inline$Own_Above_Threat$2$tempBoogie13: int;
  var inline$Own_Above_Threat$2$tempBoogie14: int;
  var inline$Own_Above_Threat$2$tempBoogie15: int;
  var inline$Own_Above_Threat$2$tempBoogie16: int;
  var inline$Own_Above_Threat$2$tempBoogie17: int;
  var inline$Own_Above_Threat$2$tempBoogie18: int;
  var inline$Own_Above_Threat$2$tempBoogie19: int;
  var inline$Own_Above_Threat$2$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$2$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$2$alloc: int;
  var inline$Own_Above_Threat$2$detChoiceCnt: int;
  var inline$Own_Above_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$2$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$2$Mem_T.PINT4: [int]int;
  var inline$ALIM$2$havoc_stringTemp: int;
  var inline$ALIM$2$condVal: int;
  var inline$ALIM$2$tempBoogie0: int;
  var inline$ALIM$2$tempBoogie1: int;
  var inline$ALIM$2$tempBoogie2: int;
  var inline$ALIM$2$tempBoogie3: int;
  var inline$ALIM$2$tempBoogie4: int;
  var inline$ALIM$2$tempBoogie5: int;
  var inline$ALIM$2$tempBoogie6: int;
  var inline$ALIM$2$tempBoogie7: int;
  var inline$ALIM$2$tempBoogie8: int;
  var inline$ALIM$2$tempBoogie9: int;
  var inline$ALIM$2$tempBoogie10: int;
  var inline$ALIM$2$tempBoogie11: int;
  var inline$ALIM$2$tempBoogie12: int;
  var inline$ALIM$2$tempBoogie13: int;
  var inline$ALIM$2$tempBoogie14: int;
  var inline$ALIM$2$tempBoogie15: int;
  var inline$ALIM$2$tempBoogie16: int;
  var inline$ALIM$2$tempBoogie17: int;
  var inline$ALIM$2$tempBoogie18: int;
  var inline$ALIM$2$tempBoogie19: int;
  var inline$ALIM$2$__havoc_dummy_return: int;
  var inline$ALIM$2$result.ALIM$1: int;
  var inline$ALIM$2$alloc: int;
  var inline$ALIM$2$detChoiceCnt: int;
  var inline$ALIM$2$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$2$Res_PROBED: [int]int;
  var inline$ALIM$2$Mem_T.A4INT4: [int]int;
  var inline$ALIM$2$Mem_T.INT4: [int]int;
  var inline$ALIM$2$Mem_T.PINT4: [int]int;
  var inline$Own_Below_Threat$3$havoc_stringTemp: int;
  var inline$Own_Below_Threat$3$condVal: int;
  var inline$Own_Below_Threat$3$tempBoogie0: int;
  var inline$Own_Below_Threat$3$tempBoogie1: int;
  var inline$Own_Below_Threat$3$tempBoogie2: int;
  var inline$Own_Below_Threat$3$tempBoogie3: int;
  var inline$Own_Below_Threat$3$tempBoogie4: int;
  var inline$Own_Below_Threat$3$tempBoogie5: int;
  var inline$Own_Below_Threat$3$tempBoogie6: int;
  var inline$Own_Below_Threat$3$tempBoogie7: int;
  var inline$Own_Below_Threat$3$tempBoogie8: int;
  var inline$Own_Below_Threat$3$tempBoogie9: int;
  var inline$Own_Below_Threat$3$tempBoogie10: int;
  var inline$Own_Below_Threat$3$tempBoogie11: int;
  var inline$Own_Below_Threat$3$tempBoogie12: int;
  var inline$Own_Below_Threat$3$tempBoogie13: int;
  var inline$Own_Below_Threat$3$tempBoogie14: int;
  var inline$Own_Below_Threat$3$tempBoogie15: int;
  var inline$Own_Below_Threat$3$tempBoogie16: int;
  var inline$Own_Below_Threat$3$tempBoogie17: int;
  var inline$Own_Below_Threat$3$tempBoogie18: int;
  var inline$Own_Below_Threat$3$tempBoogie19: int;
  var inline$Own_Below_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Below_Threat$3$result.Own_Below_Threat$1: int;
  var inline$Own_Below_Threat$3$alloc: int;
  var inline$Own_Below_Threat$3$detChoiceCnt: int;
  var inline$Own_Below_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Below_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Below_Threat$3$Mem_T.PINT4: [int]int;
  var inline$ALIM$3$havoc_stringTemp: int;
  var inline$ALIM$3$condVal: int;
  var inline$ALIM$3$tempBoogie0: int;
  var inline$ALIM$3$tempBoogie1: int;
  var inline$ALIM$3$tempBoogie2: int;
  var inline$ALIM$3$tempBoogie3: int;
  var inline$ALIM$3$tempBoogie4: int;
  var inline$ALIM$3$tempBoogie5: int;
  var inline$ALIM$3$tempBoogie6: int;
  var inline$ALIM$3$tempBoogie7: int;
  var inline$ALIM$3$tempBoogie8: int;
  var inline$ALIM$3$tempBoogie9: int;
  var inline$ALIM$3$tempBoogie10: int;
  var inline$ALIM$3$tempBoogie11: int;
  var inline$ALIM$3$tempBoogie12: int;
  var inline$ALIM$3$tempBoogie13: int;
  var inline$ALIM$3$tempBoogie14: int;
  var inline$ALIM$3$tempBoogie15: int;
  var inline$ALIM$3$tempBoogie16: int;
  var inline$ALIM$3$tempBoogie17: int;
  var inline$ALIM$3$tempBoogie18: int;
  var inline$ALIM$3$tempBoogie19: int;
  var inline$ALIM$3$__havoc_dummy_return: int;
  var inline$ALIM$3$result.ALIM$1: int;
  var inline$ALIM$3$alloc: int;
  var inline$ALIM$3$detChoiceCnt: int;
  var inline$ALIM$3$Res_KERNEL_SOURCE: [int]int;
  var inline$ALIM$3$Res_PROBED: [int]int;
  var inline$ALIM$3$Mem_T.A4INT4: [int]int;
  var inline$ALIM$3$Mem_T.INT4: [int]int;
  var inline$ALIM$3$Mem_T.PINT4: [int]int;
  var inline$Own_Above_Threat$3$havoc_stringTemp: int;
  var inline$Own_Above_Threat$3$condVal: int;
  var inline$Own_Above_Threat$3$tempBoogie0: int;
  var inline$Own_Above_Threat$3$tempBoogie1: int;
  var inline$Own_Above_Threat$3$tempBoogie2: int;
  var inline$Own_Above_Threat$3$tempBoogie3: int;
  var inline$Own_Above_Threat$3$tempBoogie4: int;
  var inline$Own_Above_Threat$3$tempBoogie5: int;
  var inline$Own_Above_Threat$3$tempBoogie6: int;
  var inline$Own_Above_Threat$3$tempBoogie7: int;
  var inline$Own_Above_Threat$3$tempBoogie8: int;
  var inline$Own_Above_Threat$3$tempBoogie9: int;
  var inline$Own_Above_Threat$3$tempBoogie10: int;
  var inline$Own_Above_Threat$3$tempBoogie11: int;
  var inline$Own_Above_Threat$3$tempBoogie12: int;
  var inline$Own_Above_Threat$3$tempBoogie13: int;
  var inline$Own_Above_Threat$3$tempBoogie14: int;
  var inline$Own_Above_Threat$3$tempBoogie15: int;
  var inline$Own_Above_Threat$3$tempBoogie16: int;
  var inline$Own_Above_Threat$3$tempBoogie17: int;
  var inline$Own_Above_Threat$3$tempBoogie18: int;
  var inline$Own_Above_Threat$3$tempBoogie19: int;
  var inline$Own_Above_Threat$3$__havoc_dummy_return: int;
  var inline$Own_Above_Threat$3$result.Own_Above_Threat$1: int;
  var inline$Own_Above_Threat$3$alloc: int;
  var inline$Own_Above_Threat$3$detChoiceCnt: int;
  var inline$Own_Above_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$Own_Above_Threat$3$Res_PROBED: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.INT4: [int]int;
  var inline$Own_Above_Threat$3$Mem_T.PINT4: [int]int;

  anon0#2:
    havoc_stringTemp := 0;
    goto start#2;

  start#2:
    a1 := 0;
    a10 := 0;
    a11 := 0;
    a12 := 0;
    a2 := 0;
    a3 := 0;
    a4 := 0;
    a5 := 0;
    a6 := 0;
    a7 := 0;
    a8 := 0;
    a9 := 0;
    result.alt_sep_test$2 := 0;
    result.tcas$1 := 0;
    a1 := a1_.1;
    a2 := a2_.1;
    a3 := a3_.1;
    a4 := a4_.1;
    a5 := a5_.1;
    a6 := a6_.1;
    a7 := a7_.1;
    a8 := a8_.1;
    a9 := a9_.1;
    a10 := a10_.1;
    a11 := a11_.1;
    a12 := a12_.1;
    goto label_3#2;

  label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 137} true;
    goto inline$initialize$0$Entry;

  inline$initialize$0$Entry:
    inline$initialize$0$alloc := v4.alloc;
    inline$initialize$0$detChoiceCnt := v4.detChoiceCnt;
    inline$initialize$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$initialize$0$Res_PROBED := v4.Res_PROBED;
    inline$initialize$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$initialize$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$initialize$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$initialize$0$anon0#2;

  inline$initialize$0$anon0#2:
    inline$initialize$0$havoc_stringTemp := 0;
    goto inline$initialize$0$start#2;

  inline$initialize$0$start#2:
    goto inline$initialize$0$label_3#2;

  inline$initialize$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 41} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 0) := 400];
    goto inline$initialize$0$label_4#2;

  inline$initialize$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 42} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 1) := 500];
    goto inline$initialize$0$label_5#2;

  inline$initialize$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 43} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 2) := 640];
    goto inline$initialize$0$label_6#2;

  inline$initialize$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 44} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 3) := 740];
    goto inline$initialize$0$label_1#2;

  inline$initialize$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 45} true;
    goto inline$initialize$0$Return;

  inline$initialize$0$Return:
    goto label_3#2$1;

  label_3#2$1:
    goto label_6#2;

  label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 138} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Cur_Vertical_Sep := a1];
    goto label_7#2;

  label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 139} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.High_Confidence := a2];
    goto label_8#2;

  label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 140} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid := a3];
    goto label_9#2;

  label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 141} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt := a4];
    goto label_10#2;

  label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 142} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate := a5];
    goto label_11#2;

  label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 143} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Tracked_Alt := a6];
    goto label_12#2;

  label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 144} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Alt_Layer_Value := a7];
    goto label_13#2;

  label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 145} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Up_Separation := a8];
    goto label_14#2;

  label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 146} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Down_Separation := a9];
    goto label_15#2;

  label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 147} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_RAC := a10];
    goto label_16#2;

  label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 148} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Capability := a11];
    goto label_17#2;

  label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 149} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Climb_Inhibit := a12];
    goto label_18#2;

  label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 151} true;
    goto inline$alt_sep_test$0$Entry;

  inline$alt_sep_test$0$Entry:
    inline$alt_sep_test$0$alloc := v4.alloc;
    inline$alt_sep_test$0$detChoiceCnt := v4.detChoiceCnt;
    inline$alt_sep_test$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$alt_sep_test$0$Res_PROBED := v4.Res_PROBED;
    inline$alt_sep_test$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$alt_sep_test$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$alt_sep_test$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$alt_sep_test$0$anon0#2;

  inline$alt_sep_test$0$anon0#2:
    inline$alt_sep_test$0$havoc_stringTemp := 0;
    goto inline$alt_sep_test$0$start#2;

  inline$alt_sep_test$0$start#2:
    inline$alt_sep_test$0$$Pred.2$ := 0;
    inline$alt_sep_test$0$$Pred.3$ := 0;
    inline$alt_sep_test$0$$Pred.6$ := 0;
    inline$alt_sep_test$0$$Pred.9$ := 0;
    inline$alt_sep_test$0$alt_sep := 0;
    inline$alt_sep_test$0$enabled := 0;
    inline$alt_sep_test$0$intent_not_known := 0;
    inline$alt_sep_test$0$need_downward_RA := 0;
    inline$alt_sep_test$0$need_upward_RA := 0;
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := 0;
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := 0;
    inline$alt_sep_test$0$result.Own_Above_Threat$8 := 0;
    inline$alt_sep_test$0$result.Own_Below_Threat$5 := 0;
    inline$alt_sep_test$0$result.alt_sep_test$1 := 0;
    inline$alt_sep_test$0$tcas_equipped := 0;
    goto inline$alt_sep_test$0$label_3#2;

  inline$alt_sep_test$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto inline$alt_sep_test$0$label_4#2;

  inline$alt_sep_test$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto inline$alt_sep_test$0$label_5#2;

  inline$alt_sep_test$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto inline$alt_sep_test$0$label_6#2;

  inline$alt_sep_test$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 106} true;
    goto inline$alt_sep_test$0$label_7#2;

  inline$alt_sep_test$0$label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 106} true;
    goto inline$alt_sep_test$0$label_8#2;

  inline$alt_sep_test$0$label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 107} true;
    goto inline$alt_sep_test$0$label_9#2;

  inline$alt_sep_test$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto inline$alt_sep_test$0$label_9_true#2, inline$alt_sep_test$0$label_9_false#2;

  inline$alt_sep_test$0$label_9_false#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] == 0;
    goto inline$alt_sep_test$0$label_10#2;

  inline$alt_sep_test$0$label_9_true#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] != 0;
    goto inline$alt_sep_test$0$label_11#2;

  inline$alt_sep_test$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto inline$alt_sep_test$0$label_11_true#2, inline$alt_sep_test$0$label_11_false#2;

  inline$alt_sep_test$0$label_11_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$alt_sep_test$0$label_10#2;

  inline$alt_sep_test$0$label_11_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$alt_sep_test$0$label_12#2;

  inline$alt_sep_test$0$label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto inline$alt_sep_test$0$label_12_true#2, inline$alt_sep_test$0$label_12_false#2;

  inline$alt_sep_test$0$label_12_false#2:
    assume !v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$alt_sep_test$0$label_10#2;

  inline$alt_sep_test$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    inline$alt_sep_test$0$$Pred.2$ := 0;
    goto inline$alt_sep_test$0$label_14#2;

  inline$alt_sep_test$0$label_12_true#2:
    assume v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$alt_sep_test$0$label_13#2;

  inline$alt_sep_test$0$label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    inline$alt_sep_test$0$$Pred.2$ := 1;
    goto inline$alt_sep_test$0$label_14#2;

  inline$alt_sep_test$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    inline$alt_sep_test$0$enabled := inline$alt_sep_test$0$$Pred.2$;
    goto inline$alt_sep_test$0$label_15#2;

  inline$alt_sep_test$0$label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 110} true;
    inline$alt_sep_test$0$tcas_equipped := v4.LIFT(v4.INT_EQ(v4.Mem_T.INT4[v4.Other_Capability], 1));
    goto inline$alt_sep_test$0$label_16#2;

  inline$alt_sep_test$0$label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    goto inline$alt_sep_test$0$label_16_true#2, inline$alt_sep_test$0$label_16_false#2;

  inline$alt_sep_test$0$label_16_false#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] == 0;
    goto inline$alt_sep_test$0$label_17#2;

  inline$alt_sep_test$0$label_16_true#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] != 0;
    goto inline$alt_sep_test$0$label_18#2;

  inline$alt_sep_test$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    goto inline$alt_sep_test$0$label_18_true#2, inline$alt_sep_test$0$label_18_false#2;

  inline$alt_sep_test$0$label_18_false#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] == 0;
    goto inline$alt_sep_test$0$label_19#2;

  inline$alt_sep_test$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    inline$alt_sep_test$0$$Pred.3$ := 1;
    goto inline$alt_sep_test$0$label_20#2;

  inline$alt_sep_test$0$label_18_true#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] != 0;
    goto inline$alt_sep_test$0$label_17#2;

  inline$alt_sep_test$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    inline$alt_sep_test$0$$Pred.3$ := 0;
    goto inline$alt_sep_test$0$label_20#2;

  inline$alt_sep_test$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    inline$alt_sep_test$0$intent_not_known := inline$alt_sep_test$0$$Pred.3$;
    goto inline$alt_sep_test$0$label_21#2;

  inline$alt_sep_test$0$label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 113} true;
    inline$alt_sep_test$0$alt_sep := 0;
    goto inline$alt_sep_test$0$label_22#2;

  inline$alt_sep_test$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_22_true#2, inline$alt_sep_test$0$label_22_false#2;

  inline$alt_sep_test$0$label_22_false#2:
    assume inline$alt_sep_test$0$enabled == 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_22_true#2:
    assume inline$alt_sep_test$0$enabled != 0;
    goto inline$alt_sep_test$0$label_24#2;

  inline$alt_sep_test$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_24_true#2, inline$alt_sep_test$0$label_24_false#2;

  inline$alt_sep_test$0$label_24_false#2:
    assume inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$alt_sep_test$0$label_25#2;

  inline$alt_sep_test$0$label_24_true#2:
    assume inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$alt_sep_test$0$label_26#2;

  inline$alt_sep_test$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_26_true#2, inline$alt_sep_test$0$label_26_false#2;

  inline$alt_sep_test$0$label_26_false#2:
    assume inline$alt_sep_test$0$intent_not_known == 0;
    goto inline$alt_sep_test$0$label_25#2;

  inline$alt_sep_test$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$alt_sep_test$0$label_25_true#2, inline$alt_sep_test$0$label_25_false#2;

  inline$alt_sep_test$0$label_25_false#2:
    assume inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$alt_sep_test$0$label_27#2;

  inline$alt_sep_test$0$label_25_true#2:
    assume inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_26_true#2:
    assume inline$alt_sep_test$0$intent_not_known != 0;
    goto inline$alt_sep_test$0$label_27#2;

  inline$alt_sep_test$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$Non_Crossing_Biased_Climb$0$Entry;

  inline$Non_Crossing_Biased_Climb$0$Entry:
    inline$Non_Crossing_Biased_Climb$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Climb$0$anon0#2;

  inline$Non_Crossing_Biased_Climb$0$anon0#2:
    inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Climb$0$start#2;

  inline$Non_Crossing_Biased_Climb$0$start#2:
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Climb$0$result := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_3#2;

  inline$Non_Crossing_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 59} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_4#2;

  inline$Non_Crossing_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 60} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_5#2;

  inline$Non_Crossing_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 61} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2;

  inline$Non_Crossing_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    goto inline$Inhibit_Biased_Climb$0$Entry;

  inline$Inhibit_Biased_Climb$0$Entry:
    inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$0$start#2;

  inline$Inhibit_Biased_Climb$0$start#2:
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$0$Return;

  inline$Inhibit_Biased_Climb$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_6#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_9#2;

  inline$Non_Crossing_Biased_Climb$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    inline$Non_Crossing_Biased_Climb$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Climb$0$label_10#2;

  inline$Non_Crossing_Biased_Climb$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 64} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_10_true#2, inline$Non_Crossing_Biased_Climb$0$label_10_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2;

  inline$Non_Crossing_Biased_Climb$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Own_Above_Threat$0$Entry;

  inline$Own_Above_Threat$0$Entry:
    inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$0$anon0#2;

  inline$Own_Above_Threat$0$anon0#2:
    inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$0$start#2;

  inline$Own_Above_Threat$0$start#2:
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$0$label_3#2;

  inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$0$label_1#2;

  inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$0$Return;

  inline$Own_Above_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_11#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_30#2;

  inline$Non_Crossing_Biased_Climb$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_30_true#2, inline$Non_Crossing_Biased_Climb$0$label_30_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_30_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_32#2;

  inline$Non_Crossing_Biased_Climb$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_32_true#2, inline$Non_Crossing_Biased_Climb$0$label_32_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2;

  inline$Non_Crossing_Biased_Climb$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$ALIM$0$Entry;

  inline$ALIM$0$Entry:
    inline$ALIM$0$alloc := v4.alloc;
    inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$0$anon0#2;

  inline$ALIM$0$anon0#2:
    inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$ALIM$0$start#2;

  inline$ALIM$0$start#2:
    inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$ALIM$0$label_3#2;

  inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$0$label_1#2;

  inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$0$Return;

  inline$ALIM$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := inline$ALIM$0$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_33#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_33#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_36#2;

  inline$Non_Crossing_Biased_Climb$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_36_true#2, inline$Non_Crossing_Biased_Climb$0$label_36_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$Non_Crossing_Biased_Climb$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_36_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_37#2;

  inline$Non_Crossing_Biased_Climb$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$Non_Crossing_Biased_Climb$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2;

  inline$Non_Crossing_Biased_Climb$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$0$Entry;

  inline$Own_Below_Threat$0$Entry:
    inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$0$anon0#2;

  inline$Own_Below_Threat$0$anon0#2:
    inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$0$start#2;

  inline$Own_Below_Threat$0$start#2:
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$0$label_3#2;

  inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$0$label_1#2;

  inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$0$Return;

  inline$Own_Below_Threat$0$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_14#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_17#2;

  inline$Non_Crossing_Biased_Climb$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_17_true#2, inline$Non_Crossing_Biased_Climb$0$label_17_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2;

  inline$Non_Crossing_Biased_Climb$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Own_Below_Threat$1$Entry;

  inline$Own_Below_Threat$1$Entry:
    inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$1$anon0#2;

  inline$Own_Below_Threat$1$anon0#2:
    inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$1$start#2;

  inline$Own_Below_Threat$1$start#2:
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$1$label_3#2;

  inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$1$label_1#2;

  inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$1$Return;

  inline$Own_Below_Threat$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_19#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_19#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_22#2;

  inline$Non_Crossing_Biased_Climb$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_22_true#2, inline$Non_Crossing_Biased_Climb$0$label_22_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_false#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 == 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_22_true#2:
    assume inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 != 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2;

  inline$Non_Crossing_Biased_Climb$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$ALIM$1$Entry;

  inline$ALIM$1$Entry:
    inline$ALIM$1$alloc := v4.alloc;
    inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$1$anon0#2;

  inline$ALIM$1$anon0#2:
    inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$ALIM$1$start#2;

  inline$ALIM$1$start#2:
    inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$ALIM$1$label_3#2;

  inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$1$label_1#2;

  inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$1$Return;

  inline$ALIM$1$Return:
    inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := inline$ALIM$1$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Climb$0$label_24#2$1;

  inline$Non_Crossing_Biased_Climb$0$label_24#2$1:
    goto inline$Non_Crossing_Biased_Climb$0$label_27#2;

  inline$Non_Crossing_Biased_Climb$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$Non_Crossing_Biased_Climb$0$label_27_true#2, inline$Non_Crossing_Biased_Climb$0$label_27_false#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$Non_Crossing_Biased_Climb$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 1;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_27_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$Non_Crossing_Biased_Climb$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    goto inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$Non_Crossing_Biased_Climb$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$Non_Crossing_Biased_Climb$0$result := inline$Non_Crossing_Biased_Climb$0$$Pred.6$;
    goto inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$Non_Crossing_Biased_Climb$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 72} true;
    inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := inline$Non_Crossing_Biased_Climb$0$result;
    goto inline$Non_Crossing_Biased_Climb$0$label_1#2;

  inline$Non_Crossing_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 73} true;
    goto inline$Non_Crossing_Biased_Climb$0$Return;

  inline$Non_Crossing_Biased_Climb$0$Return:
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1;
    goto inline$alt_sep_test$0$label_27#2$1;

  inline$alt_sep_test$0$label_27#2$1:
    goto inline$alt_sep_test$0$label_30#2;

  inline$alt_sep_test$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$alt_sep_test$0$label_30_true#2, inline$alt_sep_test$0$label_30_false#2;

  inline$alt_sep_test$0$label_30_false#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 == 0;
    goto inline$alt_sep_test$0$label_31#2;

  inline$alt_sep_test$0$label_30_true#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 != 0;
    goto inline$alt_sep_test$0$label_32#2;

  inline$alt_sep_test$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$Own_Below_Threat$2$Entry;

  inline$Own_Below_Threat$2$Entry:
    inline$Own_Below_Threat$2$alloc := v4.alloc;
    inline$Own_Below_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$2$anon0#2;

  inline$Own_Below_Threat$2$anon0#2:
    inline$Own_Below_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$2$start#2;

  inline$Own_Below_Threat$2$start#2:
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$2$label_3#2;

  inline$Own_Below_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$2$label_1#2;

  inline$Own_Below_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$2$Return;

  inline$Own_Below_Threat$2$Return:
    inline$alt_sep_test$0$result.Own_Below_Threat$5 := inline$Own_Below_Threat$2$result.Own_Below_Threat$1;
    goto inline$alt_sep_test$0$label_32#2$1;

  inline$alt_sep_test$0$label_32#2$1:
    goto inline$alt_sep_test$0$label_35#2;

  inline$alt_sep_test$0$label_35#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$alt_sep_test$0$label_35_true#2, inline$alt_sep_test$0$label_35_false#2;

  inline$alt_sep_test$0$label_35_false#2:
    assume inline$alt_sep_test$0$result.Own_Below_Threat$5 == 0;
    goto inline$alt_sep_test$0$label_31#2;

  inline$alt_sep_test$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    inline$alt_sep_test$0$$Pred.6$ := 0;
    goto inline$alt_sep_test$0$label_37#2;

  inline$alt_sep_test$0$label_35_true#2:
    assume inline$alt_sep_test$0$result.Own_Below_Threat$5 != 0;
    goto inline$alt_sep_test$0$label_36#2;

  inline$alt_sep_test$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    inline$alt_sep_test$0$$Pred.6$ := 1;
    goto inline$alt_sep_test$0$label_37#2;

  inline$alt_sep_test$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    inline$alt_sep_test$0$need_upward_RA := inline$alt_sep_test$0$$Pred.6$;
    goto inline$alt_sep_test$0$label_38#2;

  inline$alt_sep_test$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$Non_Crossing_Biased_Descend$0$Entry;

  inline$Non_Crossing_Biased_Descend$0$Entry:
    inline$Non_Crossing_Biased_Descend$0$alloc := v4.alloc;
    inline$Non_Crossing_Biased_Descend$0$detChoiceCnt := v4.detChoiceCnt;
    inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Non_Crossing_Biased_Descend$0$Res_PROBED := v4.Res_PROBED;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Non_Crossing_Biased_Descend$0$anon0#2;

  inline$Non_Crossing_Biased_Descend$0$anon0#2:
    inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp := 0;
    goto inline$Non_Crossing_Biased_Descend$0$start#2;

  inline$Non_Crossing_Biased_Descend$0$start#2:
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    inline$Non_Crossing_Biased_Descend$0$result := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := 0;
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation := 0;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_3#2;

  inline$Non_Crossing_Biased_Descend$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 77} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_4#2;

  inline$Non_Crossing_Biased_Descend$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 78} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_5#2;

  inline$Non_Crossing_Biased_Descend$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 79} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2;

  inline$Non_Crossing_Biased_Descend$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    goto inline$Inhibit_Biased_Climb$1$Entry;

  inline$Inhibit_Biased_Climb$1$Entry:
    inline$Inhibit_Biased_Climb$1$alloc := v4.alloc;
    inline$Inhibit_Biased_Climb$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Inhibit_Biased_Climb$1$Res_PROBED := v4.Res_PROBED;
    inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Inhibit_Biased_Climb$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Inhibit_Biased_Climb$1$anon0#2;

  inline$Inhibit_Biased_Climb$1$anon0#2:
    inline$Inhibit_Biased_Climb$1$havoc_stringTemp := 0;
    goto inline$Inhibit_Biased_Climb$1$start#2;

  inline$Inhibit_Biased_Climb$1$start#2:
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := 0;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := 0;
    goto inline$Inhibit_Biased_Climb$1$label_3#2;

  inline$Inhibit_Biased_Climb$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$Inhibit_Biased_Climb$1$label_3_true#2, inline$Inhibit_Biased_Climb$1$label_3_false#2;

  inline$Inhibit_Biased_Climb$1$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$Inhibit_Biased_Climb$1$label_4#2;

  inline$Inhibit_Biased_Climb$1$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$Inhibit_Biased_Climb$1$label_5#2;

  inline$Inhibit_Biased_Climb$1$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$Inhibit_Biased_Climb$1$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := inline$Inhibit_Biased_Climb$1$$result.question.2$;
    goto inline$Inhibit_Biased_Climb$1$label_1#2;

  inline$Inhibit_Biased_Climb$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$Inhibit_Biased_Climb$1$Return;

  inline$Inhibit_Biased_Climb$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_6#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_6#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_9#2;

  inline$Non_Crossing_Biased_Descend$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    inline$Non_Crossing_Biased_Descend$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2));
    goto inline$Non_Crossing_Biased_Descend$0$label_10#2;

  inline$Non_Crossing_Biased_Descend$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 82} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_10_true#2, inline$Non_Crossing_Biased_Descend$0$label_10_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2;

  inline$Non_Crossing_Biased_Descend$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$1$Entry;

  inline$Own_Above_Threat$1$Entry:
    inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$1$anon0#2;

  inline$Own_Above_Threat$1$anon0#2:
    inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$1$start#2;

  inline$Own_Above_Threat$1$start#2:
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$1$label_3#2;

  inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$1$label_1#2;

  inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$1$Return;

  inline$Own_Above_Threat$1$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_11#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_11#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_27#2;

  inline$Non_Crossing_Biased_Descend$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_27_true#2, inline$Non_Crossing_Biased_Descend$0$label_27_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_27_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2;

  inline$Non_Crossing_Biased_Descend$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Own_Above_Threat$2$Entry;

  inline$Own_Above_Threat$2$Entry:
    inline$Own_Above_Threat$2$alloc := v4.alloc;
    inline$Own_Above_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$2$anon0#2;

  inline$Own_Above_Threat$2$anon0#2:
    inline$Own_Above_Threat$2$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$2$start#2;

  inline$Own_Above_Threat$2$start#2:
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$2$label_3#2;

  inline$Own_Above_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$2$label_1#2;

  inline$Own_Above_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$2$Return;

  inline$Own_Above_Threat$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := inline$Own_Above_Threat$2$result.Own_Above_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_29#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_29#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_32#2;

  inline$Non_Crossing_Biased_Descend$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_32_true#2, inline$Non_Crossing_Biased_Descend$0$label_32_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_32_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2;

  inline$Non_Crossing_Biased_Descend$0$label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$ALIM$2$Entry;

  inline$ALIM$2$Entry:
    inline$ALIM$2$alloc := v4.alloc;
    inline$ALIM$2$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$2$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$2$anon0#2;

  inline$ALIM$2$anon0#2:
    inline$ALIM$2$havoc_stringTemp := 0;
    goto inline$ALIM$2$start#2;

  inline$ALIM$2$start#2:
    inline$ALIM$2$result.ALIM$1 := 0;
    goto inline$ALIM$2$label_3#2;

  inline$ALIM$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$2$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$2$label_1#2;

  inline$ALIM$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$2$Return;

  inline$ALIM$2$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := inline$ALIM$2$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_34#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_34#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_37#2;

  inline$Non_Crossing_Biased_Descend$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_37_true#2, inline$Non_Crossing_Biased_Descend$0$label_37_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$Non_Crossing_Biased_Descend$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_37_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$Non_Crossing_Biased_Descend$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$Non_Crossing_Biased_Descend$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.9$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_10_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$upward_preferred != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2;

  inline$Non_Crossing_Biased_Descend$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Own_Below_Threat$3$Entry;

  inline$Own_Below_Threat$3$Entry:
    inline$Own_Below_Threat$3$alloc := v4.alloc;
    inline$Own_Below_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Below_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Below_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Below_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Below_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Below_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Below_Threat$3$anon0#2;

  inline$Own_Below_Threat$3$anon0#2:
    inline$Own_Below_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Below_Threat$3$start#2;

  inline$Own_Below_Threat$3$start#2:
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := 0;
    goto inline$Own_Below_Threat$3$label_3#2;

  inline$Own_Below_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$Own_Below_Threat$3$label_1#2;

  inline$Own_Below_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$Own_Below_Threat$3$Return;

  inline$Own_Below_Threat$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := inline$Own_Below_Threat$3$result.Own_Below_Threat$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_14#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_14#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_17#2;

  inline$Non_Crossing_Biased_Descend$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_17_true#2, inline$Non_Crossing_Biased_Descend$0$label_17_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_false#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 == 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_17_true#2:
    assume inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 != 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_19#2;

  inline$Non_Crossing_Biased_Descend$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_19_true#2, inline$Non_Crossing_Biased_Descend$0$label_19_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2;

  inline$Non_Crossing_Biased_Descend$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$ALIM$3$Entry;

  inline$ALIM$3$Entry:
    inline$ALIM$3$alloc := v4.alloc;
    inline$ALIM$3$detChoiceCnt := v4.detChoiceCnt;
    inline$ALIM$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$ALIM$3$Res_PROBED := v4.Res_PROBED;
    inline$ALIM$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$ALIM$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$ALIM$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$ALIM$3$anon0#2;

  inline$ALIM$3$anon0#2:
    inline$ALIM$3$havoc_stringTemp := 0;
    goto inline$ALIM$3$start#2;

  inline$ALIM$3$start#2:
    inline$ALIM$3$result.ALIM$1 := 0;
    goto inline$ALIM$3$label_3#2;

  inline$ALIM$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$ALIM$3$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$ALIM$3$label_1#2;

  inline$ALIM$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$ALIM$3$Return;

  inline$ALIM$3$Return:
    inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := inline$ALIM$3$result.ALIM$1;
    goto inline$Non_Crossing_Biased_Descend$0$label_20#2$1;

  inline$Non_Crossing_Biased_Descend$0$label_20#2$1:
    goto inline$Non_Crossing_Biased_Descend$0$label_23#2;

  inline$Non_Crossing_Biased_Descend$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$Non_Crossing_Biased_Descend$0$label_23_true#2, inline$Non_Crossing_Biased_Descend$0$label_23_false#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_false#2:
    assume !v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$Non_Crossing_Biased_Descend$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_23_true#2:
    assume v4.INT_LEQ(inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$Non_Crossing_Biased_Descend$0$label_24#2;

  inline$Non_Crossing_Biased_Descend$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 1;
    goto inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$Non_Crossing_Biased_Descend$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$Non_Crossing_Biased_Descend$0$result := inline$Non_Crossing_Biased_Descend$0$$Pred.5$;
    goto inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$Non_Crossing_Biased_Descend$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 90} true;
    inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := inline$Non_Crossing_Biased_Descend$0$result;
    goto inline$Non_Crossing_Biased_Descend$0$label_1#2;

  inline$Non_Crossing_Biased_Descend$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 91} true;
    goto inline$Non_Crossing_Biased_Descend$0$Return;

  inline$Non_Crossing_Biased_Descend$0$Return:
    inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1;
    goto inline$alt_sep_test$0$label_38#2$1;

  inline$alt_sep_test$0$label_38#2$1:
    goto inline$alt_sep_test$0$label_41#2;

  inline$alt_sep_test$0$label_41#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$alt_sep_test$0$label_41_true#2, inline$alt_sep_test$0$label_41_false#2;

  inline$alt_sep_test$0$label_41_false#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 == 0;
    goto inline$alt_sep_test$0$label_42#2;

  inline$alt_sep_test$0$label_41_true#2:
    assume inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 != 0;
    goto inline$alt_sep_test$0$label_43#2;

  inline$alt_sep_test$0$label_43#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$Own_Above_Threat$3$Entry;

  inline$Own_Above_Threat$3$Entry:
    inline$Own_Above_Threat$3$alloc := v4.alloc;
    inline$Own_Above_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$Own_Above_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$Own_Above_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$Own_Above_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$Own_Above_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$Own_Above_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$Own_Above_Threat$3$anon0#2;

  inline$Own_Above_Threat$3$anon0#2:
    inline$Own_Above_Threat$3$havoc_stringTemp := 0;
    goto inline$Own_Above_Threat$3$start#2;

  inline$Own_Above_Threat$3$start#2:
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := 0;
    goto inline$Own_Above_Threat$3$label_3#2;

  inline$Own_Above_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$Own_Above_Threat$3$label_1#2;

  inline$Own_Above_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$Own_Above_Threat$3$Return;

  inline$Own_Above_Threat$3$Return:
    inline$alt_sep_test$0$result.Own_Above_Threat$8 := inline$Own_Above_Threat$3$result.Own_Above_Threat$1;
    goto inline$alt_sep_test$0$label_43#2$1;

  inline$alt_sep_test$0$label_43#2$1:
    goto inline$alt_sep_test$0$label_46#2;

  inline$alt_sep_test$0$label_46#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$alt_sep_test$0$label_46_true#2, inline$alt_sep_test$0$label_46_false#2;

  inline$alt_sep_test$0$label_46_false#2:
    assume inline$alt_sep_test$0$result.Own_Above_Threat$8 == 0;
    goto inline$alt_sep_test$0$label_42#2;

  inline$alt_sep_test$0$label_42#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    inline$alt_sep_test$0$$Pred.9$ := 0;
    goto inline$alt_sep_test$0$label_48#2;

  inline$alt_sep_test$0$label_46_true#2:
    assume inline$alt_sep_test$0$result.Own_Above_Threat$8 != 0;
    goto inline$alt_sep_test$0$label_47#2;

  inline$alt_sep_test$0$label_47#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    inline$alt_sep_test$0$$Pred.9$ := 1;
    goto inline$alt_sep_test$0$label_48#2;

  inline$alt_sep_test$0$label_48#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    inline$alt_sep_test$0$need_downward_RA := inline$alt_sep_test$0$$Pred.9$;
    goto inline$alt_sep_test$0$label_49#2;

  inline$alt_sep_test$0$label_49#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 119} true;
    goto inline$alt_sep_test$0$label_49_true#2, inline$alt_sep_test$0$label_49_false#2;

  inline$alt_sep_test$0$label_49_false#2:
    assume inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$alt_sep_test$0$label_50#2;

  inline$alt_sep_test$0$label_49_true#2:
    assume inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$alt_sep_test$0$label_51#2;

  inline$alt_sep_test$0$label_51#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 119} true;
    goto inline$alt_sep_test$0$label_51_true#2, inline$alt_sep_test$0$label_51_false#2;

  inline$alt_sep_test$0$label_51_false#2:
    assume inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$alt_sep_test$0$label_50#2;

  inline$alt_sep_test$0$label_50#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 124} true;
    goto inline$alt_sep_test$0$label_50_true#2, inline$alt_sep_test$0$label_50_false#2;

  inline$alt_sep_test$0$label_50_false#2:
    assume inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$alt_sep_test$0$label_53#2;

  inline$alt_sep_test$0$label_53#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 126} true;
    goto inline$alt_sep_test$0$label_53_true#2, inline$alt_sep_test$0$label_53_false#2;

  inline$alt_sep_test$0$label_53_false#2:
    assume inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$alt_sep_test$0$label_55#2;

  inline$alt_sep_test$0$label_55#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 129} true;
    inline$alt_sep_test$0$alt_sep := 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_53_true#2:
    assume inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$alt_sep_test$0$label_56#2;

  inline$alt_sep_test$0$label_56#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 127} true;
    inline$alt_sep_test$0$alt_sep := 2;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_50_true#2:
    assume inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$alt_sep_test$0$label_54#2;

  inline$alt_sep_test$0$label_54#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 125} true;
    inline$alt_sep_test$0$alt_sep := 1;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_51_true#2:
    assume inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$alt_sep_test$0$label_52#2;

  inline$alt_sep_test$0$label_52#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 123} true;
    inline$alt_sep_test$0$alt_sep := 0;
    goto inline$alt_sep_test$0$label_23#2;

  inline$alt_sep_test$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 132} true;
    inline$alt_sep_test$0$result.alt_sep_test$1 := inline$alt_sep_test$0$alt_sep;
    goto inline$alt_sep_test$0$label_1#2;

  inline$alt_sep_test$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 133} true;
    goto inline$alt_sep_test$0$Return;

  inline$alt_sep_test$0$Return:
    result.alt_sep_test$2 := inline$alt_sep_test$0$result.alt_sep_test$1;
    goto label_18#2$1;

  label_18#2$1:
    goto label_21#2;

  label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 151} true;
    result.tcas$1 := result.alt_sep_test$2;
    goto label_1#2;

  label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 152} true;
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

function _uf_v4.ALIM_result.ALIM$1(arg_0: [int]int) : int;

function _uf_v3.ALIM_result.ALIM$1(arg_0: [int]int) : int;

function _uf_v4.Inhibit_Biased_Climb_result.Inhibit_Biased_Climb$1(arg_0: [int]int) : int;

function _uf_v3.Inhibit_Biased_Climb_result.Inhibit_Biased_Climb$1(arg_0: [int]int) : int;

function _uf_v4.Non_Crossing_Biased_Climb_result.Non_Crossing_Biased_Climb$1(arg_0: int, arg_1: int, arg_2: [int]int, arg_3: [int]int, arg_4: [int]int, arg_5: [int]int, arg_6: [int]int) : int;

function _uf_v3.Non_Crossing_Biased_Climb_result.Non_Crossing_Biased_Climb$1(arg_0: int, arg_1: int, arg_2: [int]int, arg_3: [int]int, arg_4: [int]int, arg_5: [int]int, arg_6: [int]int) : int;

function _uf_v4.Non_Crossing_Biased_Descend_result.Non_Crossing_Biased_Descend$1(arg_0: int, arg_1: int, arg_2: [int]int, arg_3: [int]int, arg_4: [int]int, arg_5: [int]int, arg_6: [int]int) : int;

function _uf_v3.Non_Crossing_Biased_Descend_result.Non_Crossing_Biased_Descend$1(arg_0: int, arg_1: int, arg_2: [int]int, arg_3: [int]int, arg_4: [int]int, arg_5: [int]int, arg_6: [int]int) : int;

function _uf_v4.Own_Above_Threat_result.Own_Above_Threat$1(arg_0: [int]int) : int;

function _uf_v3.Own_Above_Threat_result.Own_Above_Threat$1(arg_0: [int]int) : int;

function _uf_v4.Own_Below_Threat_result.Own_Below_Threat$1(arg_0: [int]int) : int;

function _uf_v3.Own_Below_Threat_result.Own_Below_Threat$1(arg_0: [int]int) : int;

function _uf_v4.alt_sep_test_result.alt_sep_test$1(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: [int]int, arg_4: [int]int, arg_5: [int]int, arg_6: [int]int) : int;

function _uf_v3.alt_sep_test_result.alt_sep_test$1(arg_0: [int]int, arg_1: int, arg_2: int, arg_3: [int]int, arg_4: [int]int, arg_5: [int]int, arg_6: [int]int) : int;

function _uf_v4.initialize_v4.Mem_T.INT4(arg_0: [int]int) : [int]int;

function _uf_v3.initialize_v4.Mem_T.INT4(arg_0: [int]int) : [int]int;

function _uf_v4.tcas_result.tcas$1(arg_0: int, arg_1: int, arg_2: int, arg_3: int, arg_4: int, arg_5: int, arg_6: int, arg_7: int, arg_8: int, arg_9: int, arg_10: int, arg_11: int, arg_12: int, arg_13: int, arg_14: [int]int, arg_15: [int]int, arg_16: [int]int, arg_17: [int]int, arg_18: [int]int) : int;

function _uf_v4.tcas_v4.Mem_T.INT4(arg_0: int, arg_1: int, arg_2: int, arg_3: int, arg_4: int, arg_5: int, arg_6: int, arg_7: int, arg_8: int, arg_9: int, arg_10: int, arg_11: int, arg_12: int, arg_13: int, arg_14: [int]int, arg_15: [int]int, arg_16: [int]int, arg_17: [int]int, arg_18: [int]int) : [int]int;

function _uf_v3.tcas_result.tcas$1(arg_0: int, arg_1: int, arg_2: int, arg_3: int, arg_4: int, arg_5: int, arg_6: int, arg_7: int, arg_8: int, arg_9: int, arg_10: int, arg_11: int, arg_12: int, arg_13: int, arg_14: [int]int, arg_15: [int]int, arg_16: [int]int, arg_17: [int]int, arg_18: [int]int) : int;

function _uf_v3.tcas_v4.Mem_T.INT4(arg_0: int, arg_1: int, arg_2: int, arg_3: int, arg_4: int, arg_5: int, arg_6: int, arg_7: int, arg_8: int, arg_9: int, arg_10: int, arg_11: int, arg_12: int, arg_13: int, arg_14: [int]int, arg_15: [int]int, arg_16: [int]int, arg_17: [int]int, arg_18: [int]int) : [int]int;

var Output_of_v3.tcas_result.tcas$1: int;

var Output_of_v4.tcas_result.tcas$1: int;

var Output_of_v3.tcas_v4.Mem_T.INT4: [int]int;

var Output_of_v4.tcas_v4.Mem_T.INT4: [int]int;

procedure EQ_v3.tcas__xx__v4.tcas(a1_.1: int, a2_.1: int, a3_.1: int, a4_.1: int, a5_.1: int, a6_.1: int, a7_.1: int, a8_.1: int, a9_.1: int, a10_.1: int, a11_.1: int, a12_.1: int) returns (AA_TEMP30: bool, AA_TEMP31: bool);
  modifies v4.Mem_T.INT4, Output_of_v3.tcas_result.tcas$1, Output_of_v4.tcas_result.tcas$1, Output_of_v3.tcas_v4.Mem_T.INT4, Output_of_v4.tcas_v4.Mem_T.INT4;
  ensures AA_TEMP31 && AA_TEMP30;



implementation EQ_v3.tcas__xx__v4.tcas(a1_.1: int, a2_.1: int, a3_.1: int, a4_.1: int, a5_.1: int, a6_.1: int, a7_.1: int, a8_.1: int, a9_.1: int, a10_.1: int, a11_.1: int, a12_.1: int) returns (AA_TEMP30: bool, AA_TEMP31: bool)
{
  var AA_TEMP20: int;
  var AA_TEMP10: [int]int;
  var AA_TEMP00: [int]int;
  var result.tcas$1: int;
  var inline$v3.tcas$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$condVal: int;
  var inline$v3.tcas$0$a1: int;
  var inline$v3.tcas$0$a10: int;
  var inline$v3.tcas$0$a11: int;
  var inline$v3.tcas$0$a12: int;
  var inline$v3.tcas$0$a2: int;
  var inline$v3.tcas$0$a3: int;
  var inline$v3.tcas$0$a4: int;
  var inline$v3.tcas$0$a5: int;
  var inline$v3.tcas$0$a6: int;
  var inline$v3.tcas$0$a7: int;
  var inline$v3.tcas$0$a8: int;
  var inline$v3.tcas$0$a9: int;
  var inline$v3.tcas$0$result.alt_sep_test$2: int;
  var inline$v3.tcas$0$tempBoogie0: int;
  var inline$v3.tcas$0$tempBoogie1: int;
  var inline$v3.tcas$0$tempBoogie2: int;
  var inline$v3.tcas$0$tempBoogie3: int;
  var inline$v3.tcas$0$tempBoogie4: int;
  var inline$v3.tcas$0$tempBoogie5: int;
  var inline$v3.tcas$0$tempBoogie6: int;
  var inline$v3.tcas$0$tempBoogie7: int;
  var inline$v3.tcas$0$tempBoogie8: int;
  var inline$v3.tcas$0$tempBoogie9: int;
  var inline$v3.tcas$0$tempBoogie10: int;
  var inline$v3.tcas$0$tempBoogie11: int;
  var inline$v3.tcas$0$tempBoogie12: int;
  var inline$v3.tcas$0$tempBoogie13: int;
  var inline$v3.tcas$0$tempBoogie14: int;
  var inline$v3.tcas$0$tempBoogie15: int;
  var inline$v3.tcas$0$tempBoogie16: int;
  var inline$v3.tcas$0$tempBoogie17: int;
  var inline$v3.tcas$0$tempBoogie18: int;
  var inline$v3.tcas$0$tempBoogie19: int;
  var inline$v3.tcas$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$initialize$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$initialize$0$condVal: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$initialize$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$initialize$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$initialize$0$alloc: int;
  var inline$v3.tcas$0$inline$initialize$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$initialize$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$initialize$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$initialize$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$initialize$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$initialize$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$condVal: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.2$: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.3$: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.6$: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.9$: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$enabled: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$intent_not_known: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$alloc: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$alt_sep_test$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$condVal: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$alloc: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$condVal: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$alloc: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$ALIM$0$condVal: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$ALIM$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$ALIM$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$ALIM$0$result.ALIM$1: int;
  var inline$v3.tcas$0$inline$ALIM$0$alloc: int;
  var inline$v3.tcas$0$inline$ALIM$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$ALIM$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$condVal: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$alloc: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$condVal: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$alloc: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$1$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$ALIM$1$condVal: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie0: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie1: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie2: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie3: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie4: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie5: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie6: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie7: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie8: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie9: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie10: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie11: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie12: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie13: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie14: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie15: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie16: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie17: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie18: int;
  var inline$v3.tcas$0$inline$ALIM$1$tempBoogie19: int;
  var inline$v3.tcas$0$inline$ALIM$1$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$ALIM$1$result.ALIM$1: int;
  var inline$v3.tcas$0$inline$ALIM$1$alloc: int;
  var inline$v3.tcas$0$inline$ALIM$1$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$ALIM$1$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$1$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$condVal: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$alloc: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$2$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$condVal: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$alloc: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$condVal: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$alloc: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$condVal: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$alloc: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$condVal: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$alloc: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$2$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$2$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$ALIM$2$condVal: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie0: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie1: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie2: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie3: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie4: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie5: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie6: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie7: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie8: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie9: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie10: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie11: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie12: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie13: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie14: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie15: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie16: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie17: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie18: int;
  var inline$v3.tcas$0$inline$ALIM$2$tempBoogie19: int;
  var inline$v3.tcas$0$inline$ALIM$2$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$ALIM$2$result.ALIM$1: int;
  var inline$v3.tcas$0$inline$ALIM$2$alloc: int;
  var inline$v3.tcas$0$inline$ALIM$2$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$ALIM$2$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$ALIM$2$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$ALIM$2$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$2$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$2$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$condVal: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$alloc: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Below_Threat$3$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$3$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$ALIM$3$condVal: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie0: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie1: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie2: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie3: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie4: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie5: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie6: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie7: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie8: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie9: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie10: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie11: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie12: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie13: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie14: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie15: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie16: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie17: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie18: int;
  var inline$v3.tcas$0$inline$ALIM$3$tempBoogie19: int;
  var inline$v3.tcas$0$inline$ALIM$3$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$ALIM$3$result.ALIM$1: int;
  var inline$v3.tcas$0$inline$ALIM$3$alloc: int;
  var inline$v3.tcas$0$inline$ALIM$3$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$ALIM$3$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$ALIM$3$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$ALIM$3$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$3$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$ALIM$3$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$havoc_stringTemp: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$condVal: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie0: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie2: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie3: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie4: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie5: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie6: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie7: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie8: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie9: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie10: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie11: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie12: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie13: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie14: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie15: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie16: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie17: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie18: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$tempBoogie19: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$__havoc_dummy_return: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$alloc: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$detChoiceCnt: int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$Res_PROBED: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$Mem_T.INT4: [int]int;
  var inline$v3.tcas$0$inline$Own_Above_Threat$3$Mem_T.PINT4: [int]int;
  var inline$v3.tcas$0$a1_.1: int;
  var inline$v3.tcas$0$a2_.1: int;
  var inline$v3.tcas$0$a3_.1: int;
  var inline$v3.tcas$0$a4_.1: int;
  var inline$v3.tcas$0$a5_.1: int;
  var inline$v3.tcas$0$a6_.1: int;
  var inline$v3.tcas$0$a7_.1: int;
  var inline$v3.tcas$0$a8_.1: int;
  var inline$v3.tcas$0$a9_.1: int;
  var inline$v3.tcas$0$a10_.1: int;
  var inline$v3.tcas$0$a11_.1: int;
  var inline$v3.tcas$0$a12_.1: int;
  var inline$v3.tcas$0$result.tcas$1: int;
  var inline$v3.tcas$0$v4.Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$condVal: int;
  var inline$v4.tcas$0$a1: int;
  var inline$v4.tcas$0$a10: int;
  var inline$v4.tcas$0$a11: int;
  var inline$v4.tcas$0$a12: int;
  var inline$v4.tcas$0$a2: int;
  var inline$v4.tcas$0$a3: int;
  var inline$v4.tcas$0$a4: int;
  var inline$v4.tcas$0$a5: int;
  var inline$v4.tcas$0$a6: int;
  var inline$v4.tcas$0$a7: int;
  var inline$v4.tcas$0$a8: int;
  var inline$v4.tcas$0$a9: int;
  var inline$v4.tcas$0$result.alt_sep_test$2: int;
  var inline$v4.tcas$0$tempBoogie0: int;
  var inline$v4.tcas$0$tempBoogie1: int;
  var inline$v4.tcas$0$tempBoogie2: int;
  var inline$v4.tcas$0$tempBoogie3: int;
  var inline$v4.tcas$0$tempBoogie4: int;
  var inline$v4.tcas$0$tempBoogie5: int;
  var inline$v4.tcas$0$tempBoogie6: int;
  var inline$v4.tcas$0$tempBoogie7: int;
  var inline$v4.tcas$0$tempBoogie8: int;
  var inline$v4.tcas$0$tempBoogie9: int;
  var inline$v4.tcas$0$tempBoogie10: int;
  var inline$v4.tcas$0$tempBoogie11: int;
  var inline$v4.tcas$0$tempBoogie12: int;
  var inline$v4.tcas$0$tempBoogie13: int;
  var inline$v4.tcas$0$tempBoogie14: int;
  var inline$v4.tcas$0$tempBoogie15: int;
  var inline$v4.tcas$0$tempBoogie16: int;
  var inline$v4.tcas$0$tempBoogie17: int;
  var inline$v4.tcas$0$tempBoogie18: int;
  var inline$v4.tcas$0$tempBoogie19: int;
  var inline$v4.tcas$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$initialize$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$initialize$0$condVal: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$initialize$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$initialize$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$initialize$0$alloc: int;
  var inline$v4.tcas$0$inline$initialize$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$initialize$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$initialize$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$initialize$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$initialize$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$initialize$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$condVal: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.2$: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.3$: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.6$: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.9$: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$enabled: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$intent_not_known: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$alloc: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$alt_sep_test$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$condVal: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$alloc: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$condVal: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$alloc: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$condVal: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$alloc: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$ALIM$0$condVal: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$ALIM$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$ALIM$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$ALIM$0$result.ALIM$1: int;
  var inline$v4.tcas$0$inline$ALIM$0$alloc: int;
  var inline$v4.tcas$0$inline$ALIM$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$ALIM$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$ALIM$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$ALIM$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$condVal: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$alloc: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$condVal: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$alloc: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$1$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$1$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$ALIM$1$condVal: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie0: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie1: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie2: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie3: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie4: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie5: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie6: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie7: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie8: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie9: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie10: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie11: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie12: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie13: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie14: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie15: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie16: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie17: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie18: int;
  var inline$v4.tcas$0$inline$ALIM$1$tempBoogie19: int;
  var inline$v4.tcas$0$inline$ALIM$1$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$ALIM$1$result.ALIM$1: int;
  var inline$v4.tcas$0$inline$ALIM$1$alloc: int;
  var inline$v4.tcas$0$inline$ALIM$1$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$ALIM$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$ALIM$1$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$ALIM$1$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$1$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$1$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$condVal: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$alloc: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$2$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$condVal: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$alloc: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$condVal: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$alloc: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$condVal: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$alloc: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$1$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$condVal: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$alloc: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$2$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$2$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$ALIM$2$condVal: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie0: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie1: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie2: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie3: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie4: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie5: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie6: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie7: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie8: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie9: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie10: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie11: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie12: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie13: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie14: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie15: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie16: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie17: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie18: int;
  var inline$v4.tcas$0$inline$ALIM$2$tempBoogie19: int;
  var inline$v4.tcas$0$inline$ALIM$2$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$ALIM$2$result.ALIM$1: int;
  var inline$v4.tcas$0$inline$ALIM$2$alloc: int;
  var inline$v4.tcas$0$inline$ALIM$2$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$ALIM$2$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$ALIM$2$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$ALIM$2$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$2$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$2$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$condVal: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$alloc: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Below_Threat$3$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$3$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$ALIM$3$condVal: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie0: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie1: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie2: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie3: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie4: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie5: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie6: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie7: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie8: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie9: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie10: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie11: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie12: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie13: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie14: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie15: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie16: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie17: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie18: int;
  var inline$v4.tcas$0$inline$ALIM$3$tempBoogie19: int;
  var inline$v4.tcas$0$inline$ALIM$3$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$ALIM$3$result.ALIM$1: int;
  var inline$v4.tcas$0$inline$ALIM$3$alloc: int;
  var inline$v4.tcas$0$inline$ALIM$3$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$ALIM$3$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$ALIM$3$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$ALIM$3$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$3$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$ALIM$3$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$havoc_stringTemp: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$condVal: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie0: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie2: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie3: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie4: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie5: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie6: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie7: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie8: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie9: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie10: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie11: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie12: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie13: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie14: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie15: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie16: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie17: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie18: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$tempBoogie19: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$__havoc_dummy_return: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$alloc: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$detChoiceCnt: int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$Res_KERNEL_SOURCE: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$Res_PROBED: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$Mem_T.A4INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$Mem_T.INT4: [int]int;
  var inline$v4.tcas$0$inline$Own_Above_Threat$3$Mem_T.PINT4: [int]int;
  var inline$v4.tcas$0$a1_.1: int;
  var inline$v4.tcas$0$a2_.1: int;
  var inline$v4.tcas$0$a3_.1: int;
  var inline$v4.tcas$0$a4_.1: int;
  var inline$v4.tcas$0$a5_.1: int;
  var inline$v4.tcas$0$a6_.1: int;
  var inline$v4.tcas$0$a7_.1: int;
  var inline$v4.tcas$0$a8_.1: int;
  var inline$v4.tcas$0$a9_.1: int;
  var inline$v4.tcas$0$a10_.1: int;
  var inline$v4.tcas$0$a11_.1: int;
  var inline$v4.tcas$0$a12_.1: int;
  var inline$v4.tcas$0$result.tcas$1: int;
  var inline$v4.tcas$0$v4.Mem_T.INT4: [int]int;

  AA_INSTR_EQ_BODY:
    AA_TEMP00 := v4.Mem_T.INT4;
    goto inline$v3.tcas$0$Entry;

  inline$v3.tcas$0$Entry:
    inline$v3.tcas$0$a1_.1 := a1_.1;
    inline$v3.tcas$0$a2_.1 := a2_.1;
    inline$v3.tcas$0$a3_.1 := a3_.1;
    inline$v3.tcas$0$a4_.1 := a4_.1;
    inline$v3.tcas$0$a5_.1 := a5_.1;
    inline$v3.tcas$0$a6_.1 := a6_.1;
    inline$v3.tcas$0$a7_.1 := a7_.1;
    inline$v3.tcas$0$a8_.1 := a8_.1;
    inline$v3.tcas$0$a9_.1 := a9_.1;
    inline$v3.tcas$0$a10_.1 := a10_.1;
    inline$v3.tcas$0$a11_.1 := a11_.1;
    inline$v3.tcas$0$a12_.1 := a12_.1;
    inline$v3.tcas$0$v4.Mem_T.INT4 := v4.Mem_T.INT4;
    goto inline$v3.tcas$0$anon0#2;

  inline$v3.tcas$0$anon0#2:
    inline$v3.tcas$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$start#2;

  inline$v3.tcas$0$start#2:
    inline$v3.tcas$0$a1 := 0;
    inline$v3.tcas$0$a10 := 0;
    inline$v3.tcas$0$a11 := 0;
    inline$v3.tcas$0$a12 := 0;
    inline$v3.tcas$0$a2 := 0;
    inline$v3.tcas$0$a3 := 0;
    inline$v3.tcas$0$a4 := 0;
    inline$v3.tcas$0$a5 := 0;
    inline$v3.tcas$0$a6 := 0;
    inline$v3.tcas$0$a7 := 0;
    inline$v3.tcas$0$a8 := 0;
    inline$v3.tcas$0$a9 := 0;
    inline$v3.tcas$0$result.alt_sep_test$2 := 0;
    inline$v3.tcas$0$result.tcas$1 := 0;
    inline$v3.tcas$0$a1 := inline$v3.tcas$0$a1_.1;
    inline$v3.tcas$0$a2 := inline$v3.tcas$0$a2_.1;
    inline$v3.tcas$0$a3 := inline$v3.tcas$0$a3_.1;
    inline$v3.tcas$0$a4 := inline$v3.tcas$0$a4_.1;
    inline$v3.tcas$0$a5 := inline$v3.tcas$0$a5_.1;
    inline$v3.tcas$0$a6 := inline$v3.tcas$0$a6_.1;
    inline$v3.tcas$0$a7 := inline$v3.tcas$0$a7_.1;
    inline$v3.tcas$0$a8 := inline$v3.tcas$0$a8_.1;
    inline$v3.tcas$0$a9 := inline$v3.tcas$0$a9_.1;
    inline$v3.tcas$0$a10 := inline$v3.tcas$0$a10_.1;
    inline$v3.tcas$0$a11 := inline$v3.tcas$0$a11_.1;
    inline$v3.tcas$0$a12 := inline$v3.tcas$0$a12_.1;
    goto inline$v3.tcas$0$label_3#2;

  inline$v3.tcas$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 137} true;
    goto inline$v3.tcas$0$inline$initialize$0$Entry;

  inline$v3.tcas$0$inline$initialize$0$Entry:
    inline$v3.tcas$0$inline$initialize$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$initialize$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$initialize$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$initialize$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$initialize$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$initialize$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$initialize$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$initialize$0$anon0#2;

  inline$v3.tcas$0$inline$initialize$0$anon0#2:
    inline$v3.tcas$0$inline$initialize$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$initialize$0$start#2;

  inline$v3.tcas$0$inline$initialize$0$start#2:
    goto inline$v3.tcas$0$inline$initialize$0$label_3#2;

  inline$v3.tcas$0$inline$initialize$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 41} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 0) := 400];
    goto inline$v3.tcas$0$inline$initialize$0$label_4#2;

  inline$v3.tcas$0$inline$initialize$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 42} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 1) := 500];
    goto inline$v3.tcas$0$inline$initialize$0$label_5#2;

  inline$v3.tcas$0$inline$initialize$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 43} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 2) := 640];
    goto inline$v3.tcas$0$inline$initialize$0$label_6#2;

  inline$v3.tcas$0$inline$initialize$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 44} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 3) := 740];
    goto inline$v3.tcas$0$inline$initialize$0$label_1#2;

  inline$v3.tcas$0$inline$initialize$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 45} true;
    goto inline$v3.tcas$0$inline$initialize$0$Return;

  inline$v3.tcas$0$inline$initialize$0$Return:
    goto inline$v3.tcas$0$label_3#2$1;

  inline$v3.tcas$0$label_3#2$1:
    goto inline$v3.tcas$0$label_6#2;

  inline$v3.tcas$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 138} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Cur_Vertical_Sep := inline$v3.tcas$0$a1];
    goto inline$v3.tcas$0$label_7#2;

  inline$v3.tcas$0$label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 139} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.High_Confidence := inline$v3.tcas$0$a2];
    goto inline$v3.tcas$0$label_8#2;

  inline$v3.tcas$0$label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 140} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid := inline$v3.tcas$0$a3];
    goto inline$v3.tcas$0$label_9#2;

  inline$v3.tcas$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 141} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt := inline$v3.tcas$0$a4];
    goto inline$v3.tcas$0$label_10#2;

  inline$v3.tcas$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 142} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate := inline$v3.tcas$0$a5];
    goto inline$v3.tcas$0$label_11#2;

  inline$v3.tcas$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 143} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Tracked_Alt := inline$v3.tcas$0$a6];
    goto inline$v3.tcas$0$label_12#2;

  inline$v3.tcas$0$label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 144} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Alt_Layer_Value := inline$v3.tcas$0$a7];
    goto inline$v3.tcas$0$label_13#2;

  inline$v3.tcas$0$label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 145} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Up_Separation := inline$v3.tcas$0$a8];
    goto inline$v3.tcas$0$label_14#2;

  inline$v3.tcas$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 146} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Down_Separation := inline$v3.tcas$0$a9];
    goto inline$v3.tcas$0$label_15#2;

  inline$v3.tcas$0$label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 147} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_RAC := inline$v3.tcas$0$a10];
    goto inline$v3.tcas$0$label_16#2;

  inline$v3.tcas$0$label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 148} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Capability := inline$v3.tcas$0$a11];
    goto inline$v3.tcas$0$label_17#2;

  inline$v3.tcas$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 149} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Climb_Inhibit := inline$v3.tcas$0$a12];
    goto inline$v3.tcas$0$label_18#2;

  inline$v3.tcas$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 151} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$Entry;

  inline$v3.tcas$0$inline$alt_sep_test$0$Entry:
    inline$v3.tcas$0$inline$alt_sep_test$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$alt_sep_test$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$alt_sep_test$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$alt_sep_test$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$alt_sep_test$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$alt_sep_test$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$alt_sep_test$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$anon0#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$anon0#2:
    inline$v3.tcas$0$inline$alt_sep_test$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$start#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$start#2:
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.2$ := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.3$ := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.6$ := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.9$ := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$enabled := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$intent_not_known := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1 := 0;
    inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_3#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_4#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_5#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 105} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_6#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 106} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_7#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 106} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_8#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 107} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_9#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_9_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_9_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_9_false#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_10#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_9_true#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_11#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_11_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_11_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_11_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_10#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_11_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_12#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_12_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_12_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_12_false#2:
    assume !v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_10#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.2$ := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_14#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_12_true#2:
    assume v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_13#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.2$ := 1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_14#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 109} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$enabled := inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.2$;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_15#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 110} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped := v4.LIFT(v4.INT_EQ(v4.Mem_T.INT4[v4.Other_Capability], 1));
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_16#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_16_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_16_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_16_false#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_17#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_16_true#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_18#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_18_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_18_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_18_false#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_19#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.3$ := 1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_20#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_18_true#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_17#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.3$ := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_20#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 111} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$intent_not_known := inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.3$;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_21#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 113} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_22#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_22_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_22_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_22_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$enabled == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_22_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$enabled != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_24#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_24_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_24_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_24_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_25#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_24_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_26#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_26_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_26_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_26_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$intent_not_known == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_25#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 115} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_25_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_25_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_25_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_27#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_25_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_26_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$intent_not_known != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_27#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Entry;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Entry:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$anon0#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$anon0#2:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$start#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$start#2:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_3#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 59} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_4#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 60} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_5#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 61} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Entry;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Entry:
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$start#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$start#2:
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Return;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := inline$v3.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_9#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 63} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2));
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 64} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$0$Entry;

  inline$v3.tcas$0$inline$Own_Above_Threat$0$Entry:
    inline$v3.tcas$0$inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$0$anon0#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$0$anon0#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$0$start#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$0$start#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$0$label_3#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$v3.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Above_Threat$0$label_1#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$0$Return;

  inline$v3.tcas$0$inline$Own_Above_Threat$0$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := inline$v3.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$v3.tcas$0$inline$ALIM$0$Entry;

  inline$v3.tcas$0$inline$ALIM$0$Entry:
    inline$v3.tcas$0$inline$ALIM$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$ALIM$0$anon0#2;

  inline$v3.tcas$0$inline$ALIM$0$anon0#2:
    inline$v3.tcas$0$inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$ALIM$0$start#2;

  inline$v3.tcas$0$inline$ALIM$0$start#2:
    inline$v3.tcas$0$inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$v3.tcas$0$inline$ALIM$0$label_3#2;

  inline$v3.tcas$0$inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v3.tcas$0$inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v3.tcas$0$inline$ALIM$0$label_1#2;

  inline$v3.tcas$0$inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$v3.tcas$0$inline$ALIM$0$Return;

  inline$v3.tcas$0$inline$ALIM$0$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := inline$v3.tcas$0$inline$ALIM$0$result.ALIM$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_false#2:
    assume !v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_true#2:
    assume v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_37#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 70} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result := inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$0$Entry;

  inline$v3.tcas$0$inline$Own_Below_Threat$0$Entry:
    inline$v3.tcas$0$inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$0$anon0#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$0$anon0#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$0$start#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$0$start#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$0$label_3#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$v3.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Below_Threat$0$label_1#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$0$Return;

  inline$v3.tcas$0$inline$Own_Below_Threat$0$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := inline$v3.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$1$Entry;

  inline$v3.tcas$0$inline$Own_Below_Threat$1$Entry:
    inline$v3.tcas$0$inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$1$anon0#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$1$anon0#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$1$start#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$1$start#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$1$label_3#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$v3.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Below_Threat$1$label_1#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$1$Return;

  inline$v3.tcas$0$inline$Own_Below_Threat$1$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := inline$v3.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$v3.tcas$0$inline$ALIM$1$Entry;

  inline$v3.tcas$0$inline$ALIM$1$Entry:
    inline$v3.tcas$0$inline$ALIM$1$alloc := v4.alloc;
    inline$v3.tcas$0$inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$ALIM$1$anon0#2;

  inline$v3.tcas$0$inline$ALIM$1$anon0#2:
    inline$v3.tcas$0$inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$ALIM$1$start#2;

  inline$v3.tcas$0$inline$ALIM$1$start#2:
    inline$v3.tcas$0$inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$v3.tcas$0$inline$ALIM$1$label_3#2;

  inline$v3.tcas$0$inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v3.tcas$0$inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v3.tcas$0$inline$ALIM$1$label_1#2;

  inline$v3.tcas$0$inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$v3.tcas$0$inline$ALIM$1$Return;

  inline$v3.tcas$0$inline$ALIM$1$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := inline$v3.tcas$0$inline$ALIM$1$result.ALIM$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_false#2:
    assume !v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_true#2:
    assume v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 66} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result := inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 72} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_1#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 73} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Return;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$Return:
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := inline$v3.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_27#2$1;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_27#2$1:
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_30#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_30_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_30_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_30_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_31#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_30_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_32#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$2$Entry;

  inline$v3.tcas$0$inline$Own_Below_Threat$2$Entry:
    inline$v3.tcas$0$inline$Own_Below_Threat$2$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$2$anon0#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$2$anon0#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$2$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$2$start#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$2$start#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$2$label_3#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$v3.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Below_Threat$2$label_1#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$2$Return;

  inline$v3.tcas$0$inline$Own_Below_Threat$2$Return:
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 := inline$v3.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_32#2$1;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_32#2$1:
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_35#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_35#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_35_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_35_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_35_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_31#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.6$ := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_37#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_35_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_36#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.6$ := 1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_37#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 117} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA := inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.6$;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_38#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Entry;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Entry:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$anon0#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$anon0#2:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$start#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$start#2:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation := 0;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_3#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 77} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_4#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 78} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_5#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 79} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Entry;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Entry:
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$anon0#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$anon0#2:
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$start#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$start#2:
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := 0;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$ := 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_3#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_true#2, inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_false#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_4#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_5#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 54} true;
    inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_1#2;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 55} true;
    goto inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Return;

  inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := inline$v3.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_9#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 81} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2));
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 82} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$1$Entry;

  inline$v3.tcas$0$inline$Own_Above_Threat$1$Entry:
    inline$v3.tcas$0$inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$1$anon0#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$1$anon0#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$1$start#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$1$start#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$1$label_3#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$v3.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Above_Threat$1$label_1#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$1$Return;

  inline$v3.tcas$0$inline$Own_Above_Threat$1$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := inline$v3.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$2$Entry;

  inline$v3.tcas$0$inline$Own_Above_Threat$2$Entry:
    inline$v3.tcas$0$inline$Own_Above_Threat$2$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$2$anon0#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$2$anon0#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$2$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$2$start#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$2$start#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$2$label_3#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$v3.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Above_Threat$2$label_1#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$2$Return;

  inline$v3.tcas$0$inline$Own_Above_Threat$2$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := inline$v3.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$v3.tcas$0$inline$ALIM$2$Entry;

  inline$v3.tcas$0$inline$ALIM$2$Entry:
    inline$v3.tcas$0$inline$ALIM$2$alloc := v4.alloc;
    inline$v3.tcas$0$inline$ALIM$2$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$ALIM$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$ALIM$2$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$ALIM$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$ALIM$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$ALIM$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$ALIM$2$anon0#2;

  inline$v3.tcas$0$inline$ALIM$2$anon0#2:
    inline$v3.tcas$0$inline$ALIM$2$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$ALIM$2$start#2;

  inline$v3.tcas$0$inline$ALIM$2$start#2:
    inline$v3.tcas$0$inline$ALIM$2$result.ALIM$1 := 0;
    goto inline$v3.tcas$0$inline$ALIM$2$label_3#2;

  inline$v3.tcas$0$inline$ALIM$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v3.tcas$0$inline$ALIM$2$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v3.tcas$0$inline$ALIM$2$label_1#2;

  inline$v3.tcas$0$inline$ALIM$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$v3.tcas$0$inline$ALIM$2$Return;

  inline$v3.tcas$0$inline$ALIM$2$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := inline$v3.tcas$0$inline$ALIM$2$result.ALIM$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_false#2:
    assume !v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_true#2:
    assume v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 88} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result := inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$3$Entry;

  inline$v3.tcas$0$inline$Own_Below_Threat$3$Entry:
    inline$v3.tcas$0$inline$Own_Below_Threat$3$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$3$anon0#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$3$anon0#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$3$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$3$start#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$3$start#2:
    inline$v3.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$3$label_3#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 95} true;
    inline$v3.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Below_Threat$3$label_1#2;

  inline$v3.tcas$0$inline$Own_Below_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 96} true;
    goto inline$v3.tcas$0$inline$Own_Below_Threat$3$Return;

  inline$v3.tcas$0$inline$Own_Below_Threat$3$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := inline$v3.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_false#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 == 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_true#2:
    assume inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 != 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$v3.tcas$0$inline$ALIM$3$Entry;

  inline$v3.tcas$0$inline$ALIM$3$Entry:
    inline$v3.tcas$0$inline$ALIM$3$alloc := v4.alloc;
    inline$v3.tcas$0$inline$ALIM$3$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$ALIM$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$ALIM$3$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$ALIM$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$ALIM$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$ALIM$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$ALIM$3$anon0#2;

  inline$v3.tcas$0$inline$ALIM$3$anon0#2:
    inline$v3.tcas$0$inline$ALIM$3$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$ALIM$3$start#2;

  inline$v3.tcas$0$inline$ALIM$3$start#2:
    inline$v3.tcas$0$inline$ALIM$3$result.ALIM$1 := 0;
    goto inline$v3.tcas$0$inline$ALIM$3$label_3#2;

  inline$v3.tcas$0$inline$ALIM$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v3.tcas$0$inline$ALIM$3$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v3.tcas$0$inline$ALIM$3$label_1#2;

  inline$v3.tcas$0$inline$ALIM$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 50} true;
    goto inline$v3.tcas$0$inline$ALIM$3$Return;

  inline$v3.tcas$0$inline$ALIM$3$Return:
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := inline$v3.tcas$0$inline$ALIM$3$result.ALIM$1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2$1;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2$1:
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_true#2, inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_false#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_false#2:
    assume !v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_true#2:
    assume v4.INT_LEQ(inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_24#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 1;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 84} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result := inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 90} true;
    inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_1#2;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 91} true;
    goto inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Return;

  inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$Return:
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := inline$v3.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_38#2$1;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_38#2$1:
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_41#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_41#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_41_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_41_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_41_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_42#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_41_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_43#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_43#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$3$Entry;

  inline$v3.tcas$0$inline$Own_Above_Threat$3$Entry:
    inline$v3.tcas$0$inline$Own_Above_Threat$3$alloc := v4.alloc;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$3$anon0#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$3$anon0#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$3$havoc_stringTemp := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$3$start#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$3$start#2:
    inline$v3.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := 0;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$3$label_3#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 100} true;
    inline$v3.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v3.tcas$0$inline$Own_Above_Threat$3$label_1#2;

  inline$v3.tcas$0$inline$Own_Above_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 101} true;
    goto inline$v3.tcas$0$inline$Own_Above_Threat$3$Return;

  inline$v3.tcas$0$inline$Own_Above_Threat$3$Return:
    inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 := inline$v3.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_43#2$1;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_43#2$1:
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_46#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_46#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_46_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_46_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_46_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_42#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_42#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.9$ := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_48#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_46_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_47#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_47#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.9$ := 1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_48#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_48#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 118} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA := inline$v3.tcas$0$inline$alt_sep_test$0$$Pred.9$;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_49#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_49#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 119} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_49_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_49_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_49_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_50#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_49_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_51#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_51#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 119} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_51_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_51_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_51_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_50#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_50#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 124} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_50_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_50_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_50_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_53#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_53#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 126} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_53_true#2, inline$v3.tcas$0$inline$alt_sep_test$0$label_53_false#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_53_false#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_55#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_55#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 129} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_53_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_56#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_56#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 127} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep := 2;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_50_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_54#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_54#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 125} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep := 1;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_51_true#2:
    assume inline$v3.tcas$0$inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_52#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_52#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 123} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 132} true;
    inline$v3.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1 := inline$v3.tcas$0$inline$alt_sep_test$0$alt_sep;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$label_1#2;

  inline$v3.tcas$0$inline$alt_sep_test$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 133} true;
    goto inline$v3.tcas$0$inline$alt_sep_test$0$Return;

  inline$v3.tcas$0$inline$alt_sep_test$0$Return:
    inline$v3.tcas$0$result.alt_sep_test$2 := inline$v3.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1;
    goto inline$v3.tcas$0$label_18#2$1;

  inline$v3.tcas$0$label_18#2$1:
    goto inline$v3.tcas$0$label_21#2;

  inline$v3.tcas$0$label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 151} true;
    inline$v3.tcas$0$result.tcas$1 := inline$v3.tcas$0$result.alt_sep_test$2;
    goto inline$v3.tcas$0$label_1#2;

  inline$v3.tcas$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v3\tcas.c"} {:sourceline 152} true;
    goto inline$v3.tcas$0$Return;

  inline$v3.tcas$0$Return:
    assume true;
    assume true;
    result.tcas$1 := inline$v3.tcas$0$result.tcas$1;
    goto AA_INSTR_EQ_BODY$1;

  AA_INSTR_EQ_BODY$1:
    AA_TEMP10 := v4.Mem_T.INT4;
    v4.Mem_T.INT4 := AA_TEMP00;
    AA_TEMP20 := result.tcas$1;
    goto inline$v4.tcas$0$Entry;

  inline$v4.tcas$0$Entry:
    inline$v4.tcas$0$a1_.1 := a1_.1;
    inline$v4.tcas$0$a2_.1 := a2_.1;
    inline$v4.tcas$0$a3_.1 := a3_.1;
    inline$v4.tcas$0$a4_.1 := a4_.1;
    inline$v4.tcas$0$a5_.1 := a5_.1;
    inline$v4.tcas$0$a6_.1 := a6_.1;
    inline$v4.tcas$0$a7_.1 := a7_.1;
    inline$v4.tcas$0$a8_.1 := a8_.1;
    inline$v4.tcas$0$a9_.1 := a9_.1;
    inline$v4.tcas$0$a10_.1 := a10_.1;
    inline$v4.tcas$0$a11_.1 := a11_.1;
    inline$v4.tcas$0$a12_.1 := a12_.1;
    inline$v4.tcas$0$v4.Mem_T.INT4 := v4.Mem_T.INT4;
    goto inline$v4.tcas$0$anon0#2;

  inline$v4.tcas$0$anon0#2:
    inline$v4.tcas$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$start#2;

  inline$v4.tcas$0$start#2:
    inline$v4.tcas$0$a1 := 0;
    inline$v4.tcas$0$a10 := 0;
    inline$v4.tcas$0$a11 := 0;
    inline$v4.tcas$0$a12 := 0;
    inline$v4.tcas$0$a2 := 0;
    inline$v4.tcas$0$a3 := 0;
    inline$v4.tcas$0$a4 := 0;
    inline$v4.tcas$0$a5 := 0;
    inline$v4.tcas$0$a6 := 0;
    inline$v4.tcas$0$a7 := 0;
    inline$v4.tcas$0$a8 := 0;
    inline$v4.tcas$0$a9 := 0;
    inline$v4.tcas$0$result.alt_sep_test$2 := 0;
    inline$v4.tcas$0$result.tcas$1 := 0;
    inline$v4.tcas$0$a1 := inline$v4.tcas$0$a1_.1;
    inline$v4.tcas$0$a2 := inline$v4.tcas$0$a2_.1;
    inline$v4.tcas$0$a3 := inline$v4.tcas$0$a3_.1;
    inline$v4.tcas$0$a4 := inline$v4.tcas$0$a4_.1;
    inline$v4.tcas$0$a5 := inline$v4.tcas$0$a5_.1;
    inline$v4.tcas$0$a6 := inline$v4.tcas$0$a6_.1;
    inline$v4.tcas$0$a7 := inline$v4.tcas$0$a7_.1;
    inline$v4.tcas$0$a8 := inline$v4.tcas$0$a8_.1;
    inline$v4.tcas$0$a9 := inline$v4.tcas$0$a9_.1;
    inline$v4.tcas$0$a10 := inline$v4.tcas$0$a10_.1;
    inline$v4.tcas$0$a11 := inline$v4.tcas$0$a11_.1;
    inline$v4.tcas$0$a12 := inline$v4.tcas$0$a12_.1;
    goto inline$v4.tcas$0$label_3#2;

  inline$v4.tcas$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 137} true;
    goto inline$v4.tcas$0$inline$initialize$0$Entry;

  inline$v4.tcas$0$inline$initialize$0$Entry:
    inline$v4.tcas$0$inline$initialize$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$initialize$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$initialize$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$initialize$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$initialize$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$initialize$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$initialize$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$initialize$0$anon0#2;

  inline$v4.tcas$0$inline$initialize$0$anon0#2:
    inline$v4.tcas$0$inline$initialize$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$initialize$0$start#2;

  inline$v4.tcas$0$inline$initialize$0$start#2:
    goto inline$v4.tcas$0$inline$initialize$0$label_3#2;

  inline$v4.tcas$0$inline$initialize$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 41} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 0) := 400];
    goto inline$v4.tcas$0$inline$initialize$0$label_4#2;

  inline$v4.tcas$0$inline$initialize$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 42} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 1) := 500];
    goto inline$v4.tcas$0$inline$initialize$0$label_5#2;

  inline$v4.tcas$0$inline$initialize$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 43} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 2) := 640];
    goto inline$v4.tcas$0$inline$initialize$0$label_6#2;

  inline$v4.tcas$0$inline$initialize$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 44} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, 3) := 740];
    goto inline$v4.tcas$0$inline$initialize$0$label_1#2;

  inline$v4.tcas$0$inline$initialize$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 45} true;
    goto inline$v4.tcas$0$inline$initialize$0$Return;

  inline$v4.tcas$0$inline$initialize$0$Return:
    goto inline$v4.tcas$0$label_3#2$1;

  inline$v4.tcas$0$label_3#2$1:
    goto inline$v4.tcas$0$label_6#2;

  inline$v4.tcas$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 138} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Cur_Vertical_Sep := inline$v4.tcas$0$a1];
    goto inline$v4.tcas$0$label_7#2;

  inline$v4.tcas$0$label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 139} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.High_Confidence := inline$v4.tcas$0$a2];
    goto inline$v4.tcas$0$label_8#2;

  inline$v4.tcas$0$label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 140} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid := inline$v4.tcas$0$a3];
    goto inline$v4.tcas$0$label_9#2;

  inline$v4.tcas$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 141} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt := inline$v4.tcas$0$a4];
    goto inline$v4.tcas$0$label_10#2;

  inline$v4.tcas$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 142} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate := inline$v4.tcas$0$a5];
    goto inline$v4.tcas$0$label_11#2;

  inline$v4.tcas$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 143} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Tracked_Alt := inline$v4.tcas$0$a6];
    goto inline$v4.tcas$0$label_12#2;

  inline$v4.tcas$0$label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 144} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Alt_Layer_Value := inline$v4.tcas$0$a7];
    goto inline$v4.tcas$0$label_13#2;

  inline$v4.tcas$0$label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 145} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Up_Separation := inline$v4.tcas$0$a8];
    goto inline$v4.tcas$0$label_14#2;

  inline$v4.tcas$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 146} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Down_Separation := inline$v4.tcas$0$a9];
    goto inline$v4.tcas$0$label_15#2;

  inline$v4.tcas$0$label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 147} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_RAC := inline$v4.tcas$0$a10];
    goto inline$v4.tcas$0$label_16#2;

  inline$v4.tcas$0$label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 148} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Other_Capability := inline$v4.tcas$0$a11];
    goto inline$v4.tcas$0$label_17#2;

  inline$v4.tcas$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 149} true;
    v4.Mem_T.INT4 := v4.Mem_T.INT4[v4.Climb_Inhibit := inline$v4.tcas$0$a12];
    goto inline$v4.tcas$0$label_18#2;

  inline$v4.tcas$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 151} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$Entry;

  inline$v4.tcas$0$inline$alt_sep_test$0$Entry:
    inline$v4.tcas$0$inline$alt_sep_test$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$alt_sep_test$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$alt_sep_test$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$alt_sep_test$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$alt_sep_test$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$alt_sep_test$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$alt_sep_test$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$anon0#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$anon0#2:
    inline$v4.tcas$0$inline$alt_sep_test$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$start#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$start#2:
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.2$ := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.3$ := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.6$ := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.9$ := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$enabled := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$intent_not_known := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1 := 0;
    inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_3#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_4#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_5#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 105} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_6#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 106} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_7#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_7#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 106} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_8#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_8#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 107} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_9#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_9_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_9_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_9_false#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_10#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_9_true#2:
    assume v4.Mem_T.INT4[v4.High_Confidence] != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_11#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_11_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_11_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_11_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_10#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_11_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Own_Tracked_Alt_Rate], 600);
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_12#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_12#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_12_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_12_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_12_false#2:
    assume !v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_10#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.2$ := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_14#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_12_true#2:
    assume v4.INT_LT(600, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_13#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_13#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.2$ := 1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_14#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 109} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$enabled := inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.2$;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_15#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_15#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 110} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped := v4.LIFT(v4.INT_EQ(v4.Mem_T.INT4[v4.Other_Capability], 1));
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_16#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_16#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_16_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_16_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_16_false#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_17#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_16_true#2:
    assume v4.Mem_T.INT4[v4.Two_of_Three_Reports_Valid] != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_18#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_18_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_18_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_18_false#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_19#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.3$ := 1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_20#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_18_true#2:
    assume v4.Mem_T.INT4[v4.Other_RAC] != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_17#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.3$ := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_20#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 111} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$intent_not_known := inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.3$;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_21#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 113} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_22#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_22_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_22_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_22_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$enabled == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_22_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$enabled != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_24#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_24_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_24_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_24_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_25#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_24_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_26#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_26_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_26_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_26_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$intent_not_known == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_25#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 115} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_25_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_25_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_25_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_27#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_25_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$tcas_equipped != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_26_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$intent_not_known != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_27#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Entry;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Entry:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$anon0#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$anon0#2:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$start#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$start#2:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_crossing_situation := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_3#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 59} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_4#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 60} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_5#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 61} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Entry;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Entry:
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$anon0#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$anon0#2:
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$start#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$start#2:
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := 0;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$ := 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_3#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_true#2, inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_false#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_4#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_5#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_6#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1 := inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$$result.question.2$;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_1#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Return;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2 := inline$v4.tcas$0$inline$Inhibit_Biased_Climb$0$result.Inhibit_Biased_Climb$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_6#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_9#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 63} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Inhibit_Biased_Climb$2));
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 64} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$0$Entry;

  inline$v4.tcas$0$inline$Own_Above_Threat$0$Entry:
    inline$v4.tcas$0$inline$Own_Above_Threat$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$0$anon0#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$0$anon0#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$0$start#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$0$start#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$0$label_3#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$v4.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Above_Threat$0$label_1#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$0$Return;

  inline$v4.tcas$0$inline$Own_Above_Threat$0$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 := inline$v4.tcas$0$inline$Own_Above_Threat$0$result.Own_Above_Threat$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_11#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_30_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Above_Threat$7 != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_32_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$v4.tcas$0$inline$ALIM$0$Entry;

  inline$v4.tcas$0$inline$ALIM$0$Entry:
    inline$v4.tcas$0$inline$ALIM$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$ALIM$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$ALIM$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$ALIM$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$ALIM$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$ALIM$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$ALIM$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$ALIM$0$anon0#2;

  inline$v4.tcas$0$inline$ALIM$0$anon0#2:
    inline$v4.tcas$0$inline$ALIM$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$ALIM$0$start#2;

  inline$v4.tcas$0$inline$ALIM$0$start#2:
    inline$v4.tcas$0$inline$ALIM$0$result.ALIM$1 := 0;
    goto inline$v4.tcas$0$inline$ALIM$0$label_3#2;

  inline$v4.tcas$0$inline$ALIM$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v4.tcas$0$inline$ALIM$0$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v4.tcas$0$inline$ALIM$0$label_1#2;

  inline$v4.tcas$0$inline$ALIM$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$v4.tcas$0$inline$ALIM$0$Return;

  inline$v4.tcas$0$inline$ALIM$0$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8 := inline$v4.tcas$0$inline$ALIM$0$result.ALIM$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_33#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_false#2:
    assume !v4.INT_LEQ(inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_36_true#2:
    assume v4.INT_LEQ(inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$8, v4.Mem_T.INT4[v4.Up_Separation]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_37#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$ := 1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_38#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 70} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result := inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.9$;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_10_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$upward_preferred != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$0$Entry;

  inline$v4.tcas$0$inline$Own_Below_Threat$0$Entry:
    inline$v4.tcas$0$inline$Own_Below_Threat$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$0$anon0#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$0$anon0#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$0$start#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$0$start#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$0$label_3#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$v4.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Below_Threat$0$label_1#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$0$Return;

  inline$v4.tcas$0$inline$Own_Below_Threat$0$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 := inline$v4.tcas$0$inline$Own_Below_Threat$0$result.Own_Below_Threat$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_14#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_17_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$3 != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$1$Entry;

  inline$v4.tcas$0$inline$Own_Below_Threat$1$Entry:
    inline$v4.tcas$0$inline$Own_Below_Threat$1$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$1$anon0#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$1$anon0#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$1$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$1$start#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$1$start#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$1$label_3#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$v4.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Below_Threat$1$label_1#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$1$Return;

  inline$v4.tcas$0$inline$Own_Below_Threat$1$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 := inline$v4.tcas$0$inline$Own_Below_Threat$1$result.Own_Below_Threat$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_19#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_22_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Own_Below_Threat$4 != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$v4.tcas$0$inline$ALIM$1$Entry;

  inline$v4.tcas$0$inline$ALIM$1$Entry:
    inline$v4.tcas$0$inline$ALIM$1$alloc := v4.alloc;
    inline$v4.tcas$0$inline$ALIM$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$ALIM$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$ALIM$1$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$ALIM$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$ALIM$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$ALIM$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$ALIM$1$anon0#2;

  inline$v4.tcas$0$inline$ALIM$1$anon0#2:
    inline$v4.tcas$0$inline$ALIM$1$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$ALIM$1$start#2;

  inline$v4.tcas$0$inline$ALIM$1$start#2:
    inline$v4.tcas$0$inline$ALIM$1$result.ALIM$1 := 0;
    goto inline$v4.tcas$0$inline$ALIM$1$label_3#2;

  inline$v4.tcas$0$inline$ALIM$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v4.tcas$0$inline$ALIM$1$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v4.tcas$0$inline$ALIM$1$label_1#2;

  inline$v4.tcas$0$inline$ALIM$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$v4.tcas$0$inline$ALIM$1$Return;

  inline$v4.tcas$0$inline$ALIM$1$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5 := inline$v4.tcas$0$inline$ALIM$1$result.ALIM$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_24#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_false#2:
    assume !v4.INT_LEQ(inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_18#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_27_true#2:
    assume v4.INT_LEQ(inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.ALIM$5, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_23#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$ := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_28#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 66} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result := inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$$Pred.6$;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_29#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 72} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1 := inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_1#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 73} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Return;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$Return:
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 := inline$v4.tcas$0$inline$Non_Crossing_Biased_Climb$0$result.Non_Crossing_Biased_Climb$1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_27#2$1;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_27#2$1:
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_30#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_30#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_30_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_30_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_30_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_31#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_30_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Climb$4 != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_32#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$2$Entry;

  inline$v4.tcas$0$inline$Own_Below_Threat$2$Entry:
    inline$v4.tcas$0$inline$Own_Below_Threat$2$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$2$anon0#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$2$anon0#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$2$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$2$start#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$2$start#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$2$label_3#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$v4.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Below_Threat$2$label_1#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$2$Return;

  inline$v4.tcas$0$inline$Own_Below_Threat$2$Return:
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 := inline$v4.tcas$0$inline$Own_Below_Threat$2$result.Own_Below_Threat$1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_32#2$1;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_32#2$1:
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_35#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_35#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_35_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_35_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_35_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_31#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_31#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.6$ := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_37#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_35_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Below_Threat$5 != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_36#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_36#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.6$ := 1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_37#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 117} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA := inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.6$;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_38#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Entry;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Entry:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$anon0#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$anon0#2:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$start#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$start#2:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_crossing_situation := 0;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_3#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 77} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_4#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 78} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_5#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 79} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Entry;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Entry:
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$anon0#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$anon0#2:
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$start#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$start#2:
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := 0;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$ := 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_3#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_true#2, inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_false#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_false#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] == 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_4#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_4#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.Mem_T.INT4[v4.Up_Separation];
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_3_true#2:
    assume v4.Mem_T.INT4[v4.Climb_Inhibit] != 0;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_5#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_5#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$ := v4.INT_PLUS(v4.Mem_T.INT4[v4.Up_Separation], 1, 300);
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_6#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_6#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 54} true;
    inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1 := inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$$result.question.2$;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_1#2;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 55} true;
    goto inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Return;

  inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2 := inline$v4.tcas$0$inline$Inhibit_Biased_Climb$1$result.Inhibit_Biased_Climb$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_6#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_9#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_9#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 81} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Down_Separation], inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Inhibit_Biased_Climb$2));
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 82} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$1$Entry;

  inline$v4.tcas$0$inline$Own_Above_Threat$1$Entry:
    inline$v4.tcas$0$inline$Own_Above_Threat$1$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$1$anon0#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$1$anon0#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$1$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$1$start#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$1$start#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$1$label_3#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$1$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$v4.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Above_Threat$1$label_1#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$1$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$1$Return;

  inline$v4.tcas$0$inline$Own_Above_Threat$1$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 := inline$v4.tcas$0$inline$Own_Above_Threat$1$result.Own_Above_Threat$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_11#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_27_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$6 != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$2$Entry;

  inline$v4.tcas$0$inline$Own_Above_Threat$2$Entry:
    inline$v4.tcas$0$inline$Own_Above_Threat$2$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$2$anon0#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$2$anon0#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$2$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$2$start#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$2$start#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$2$label_3#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$v4.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Above_Threat$2$label_1#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$2$Return;

  inline$v4.tcas$0$inline$Own_Above_Threat$2$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 := inline$v4.tcas$0$inline$Own_Above_Threat$2$result.Own_Above_Threat$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_29#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_32_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Above_Threat$7 != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$v4.tcas$0$inline$ALIM$2$Entry;

  inline$v4.tcas$0$inline$ALIM$2$Entry:
    inline$v4.tcas$0$inline$ALIM$2$alloc := v4.alloc;
    inline$v4.tcas$0$inline$ALIM$2$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$ALIM$2$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$ALIM$2$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$ALIM$2$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$ALIM$2$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$ALIM$2$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$ALIM$2$anon0#2;

  inline$v4.tcas$0$inline$ALIM$2$anon0#2:
    inline$v4.tcas$0$inline$ALIM$2$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$ALIM$2$start#2;

  inline$v4.tcas$0$inline$ALIM$2$start#2:
    inline$v4.tcas$0$inline$ALIM$2$result.ALIM$1 := 0;
    goto inline$v4.tcas$0$inline$ALIM$2$label_3#2;

  inline$v4.tcas$0$inline$ALIM$2$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v4.tcas$0$inline$ALIM$2$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v4.tcas$0$inline$ALIM$2$label_1#2;

  inline$v4.tcas$0$inline$ALIM$2$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$v4.tcas$0$inline$ALIM$2$Return;

  inline$v4.tcas$0$inline$ALIM$2$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8 := inline$v4.tcas$0$inline$ALIM$2$result.ALIM$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_34#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_false#2:
    assume !v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_33#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_33#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_37_true#2:
    assume v4.INT_LEQ(v4.Mem_T.INT4[v4.Up_Separation], inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$8);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_28#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_28#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$ := 1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_38#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_38#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 88} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result := inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.9$;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_10_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$upward_preferred != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$3$Entry;

  inline$v4.tcas$0$inline$Own_Below_Threat$3$Entry:
    inline$v4.tcas$0$inline$Own_Below_Threat$3$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$3$anon0#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$3$anon0#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$3$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$3$start#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$3$start#2:
    inline$v4.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$3$label_3#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 95} true;
    inline$v4.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Own_Tracked_Alt], v4.Mem_T.INT4[v4.Other_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Below_Threat$3$label_1#2;

  inline$v4.tcas$0$inline$Own_Below_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 96} true;
    goto inline$v4.tcas$0$inline$Own_Below_Threat$3$Return;

  inline$v4.tcas$0$inline$Own_Below_Threat$3$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 := inline$v4.tcas$0$inline$Own_Below_Threat$3$result.Own_Below_Threat$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_14#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_false#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 == 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_17_true#2:
    assume inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Own_Below_Threat$3 != 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_false#2:
    assume !v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_19_true#2:
    assume v4.INT_LEQ(300, v4.Mem_T.INT4[v4.Cur_Vertical_Sep]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$v4.tcas$0$inline$ALIM$3$Entry;

  inline$v4.tcas$0$inline$ALIM$3$Entry:
    inline$v4.tcas$0$inline$ALIM$3$alloc := v4.alloc;
    inline$v4.tcas$0$inline$ALIM$3$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$ALIM$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$ALIM$3$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$ALIM$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$ALIM$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$ALIM$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$ALIM$3$anon0#2;

  inline$v4.tcas$0$inline$ALIM$3$anon0#2:
    inline$v4.tcas$0$inline$ALIM$3$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$ALIM$3$start#2;

  inline$v4.tcas$0$inline$ALIM$3$start#2:
    inline$v4.tcas$0$inline$ALIM$3$result.ALIM$1 := 0;
    goto inline$v4.tcas$0$inline$ALIM$3$label_3#2;

  inline$v4.tcas$0$inline$ALIM$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 49} true;
    assume v4.INT_GEQ(v4.Positive_RA_Alt_Thresh, 0);
    
    inline$v4.tcas$0$inline$ALIM$3$result.ALIM$1 := v4.Mem_T.INT4[v4.INT_PLUS(v4.Positive_RA_Alt_Thresh, 4, v4.Mem_T.INT4[v4.Alt_Layer_Value])];
    goto inline$v4.tcas$0$inline$ALIM$3$label_1#2;

  inline$v4.tcas$0$inline$ALIM$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 50} true;
    goto inline$v4.tcas$0$inline$ALIM$3$Return;

  inline$v4.tcas$0$inline$ALIM$3$Return:
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4 := inline$v4.tcas$0$inline$ALIM$3$result.ALIM$1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2$1;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_20#2$1:
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_true#2, inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_false#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_false#2:
    assume !v4.INT_LEQ(inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_18#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 0;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_23_true#2:
    assume v4.INT_LEQ(inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.ALIM$4, v4.Mem_T.INT4[v4.Down_Separation]);
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_24#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_24#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$ := 1;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_25#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_25#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 84} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result := inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$$Pred.5$;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_26#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_26#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 90} true;
    inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1 := inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_1#2;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 91} true;
    goto inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Return;

  inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$Return:
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 := inline$v4.tcas$0$inline$Non_Crossing_Biased_Descend$0$result.Non_Crossing_Biased_Descend$1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_38#2$1;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_38#2$1:
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_41#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_41#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_41_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_41_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_41_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_42#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_41_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Non_Crossing_Biased_Descend$7 != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_43#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_43#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$3$Entry;

  inline$v4.tcas$0$inline$Own_Above_Threat$3$Entry:
    inline$v4.tcas$0$inline$Own_Above_Threat$3$alloc := v4.alloc;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$detChoiceCnt := v4.detChoiceCnt;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$Res_KERNEL_SOURCE := v4.Res_KERNEL_SOURCE;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$Res_PROBED := v4.Res_PROBED;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$Mem_T.A4INT4 := v4.Mem_T.A4INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$Mem_T.INT4 := v4.Mem_T.INT4;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$Mem_T.PINT4 := v4.Mem_T.PINT4;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$3$anon0#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$3$anon0#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$3$havoc_stringTemp := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$3$start#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$3$start#2:
    inline$v4.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := 0;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$3$label_3#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$3$label_3#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 100} true;
    inline$v4.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1 := v4.LIFT(v4.INT_LT(v4.Mem_T.INT4[v4.Other_Tracked_Alt], v4.Mem_T.INT4[v4.Own_Tracked_Alt]));
    goto inline$v4.tcas$0$inline$Own_Above_Threat$3$label_1#2;

  inline$v4.tcas$0$inline$Own_Above_Threat$3$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 101} true;
    goto inline$v4.tcas$0$inline$Own_Above_Threat$3$Return;

  inline$v4.tcas$0$inline$Own_Above_Threat$3$Return:
    inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 := inline$v4.tcas$0$inline$Own_Above_Threat$3$result.Own_Above_Threat$1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_43#2$1;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_43#2$1:
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_46#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_46#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_46_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_46_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_46_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_42#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_42#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.9$ := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_48#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_46_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$result.Own_Above_Threat$8 != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_47#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_47#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.9$ := 1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_48#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_48#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 118} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA := inline$v4.tcas$0$inline$alt_sep_test$0$$Pred.9$;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_49#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_49#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 119} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_49_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_49_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_49_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_50#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_49_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_51#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_51#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 119} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_51_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_51_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_51_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_50#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_50#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 124} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_50_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_50_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_50_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_53#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_53#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 126} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_53_true#2, inline$v4.tcas$0$inline$alt_sep_test$0$label_53_false#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_53_false#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA == 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_55#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_55#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 129} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_53_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_56#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_56#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 127} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep := 2;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_50_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_upward_RA != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_54#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_54#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 125} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep := 1;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_51_true#2:
    assume inline$v4.tcas$0$inline$alt_sep_test$0$need_downward_RA != 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_52#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_52#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 123} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep := 0;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_23#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 132} true;
    inline$v4.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1 := inline$v4.tcas$0$inline$alt_sep_test$0$alt_sep;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$label_1#2;

  inline$v4.tcas$0$inline$alt_sep_test$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 133} true;
    goto inline$v4.tcas$0$inline$alt_sep_test$0$Return;

  inline$v4.tcas$0$inline$alt_sep_test$0$Return:
    inline$v4.tcas$0$result.alt_sep_test$2 := inline$v4.tcas$0$inline$alt_sep_test$0$result.alt_sep_test$1;
    goto inline$v4.tcas$0$label_18#2$1;

  inline$v4.tcas$0$label_18#2$1:
    goto inline$v4.tcas$0$label_21#2;

  inline$v4.tcas$0$label_21#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 151} true;
    inline$v4.tcas$0$result.tcas$1 := inline$v4.tcas$0$result.alt_sep_test$2;
    goto inline$v4.tcas$0$label_1#2;

  inline$v4.tcas$0$label_1#2:
    assert {:sourcefile "c:\users\t-rohsin\research\symdiff\projects\symb_diff\rootcause\examples\cav12_benchmarks\siemens\tcas\scratch\v4\tcas.c"} {:sourceline 152} true;
    goto inline$v4.tcas$0$Return;

  inline$v4.tcas$0$Return:
    assume true;
    assume true;
    result.tcas$1 := inline$v4.tcas$0$result.tcas$1;
    goto AA_INSTR_EQ_BODY$2;

  AA_INSTR_EQ_BODY$2:
    Output_of_v3.tcas_result.tcas$1 := AA_TEMP20;
    Output_of_v4.tcas_result.tcas$1 := result.tcas$1;
    Output_of_v3.tcas_v4.Mem_T.INT4 := AA_TEMP10;
    Output_of_v4.tcas_v4.Mem_T.INT4 := v4.Mem_T.INT4;
    AA_TEMP30, AA_TEMP31 := AA_TEMP20 == result.tcas$1, AA_TEMP10 == v4.Mem_T.INT4 || (forall _x0: int :: AA_TEMP10[_x0] == v4.Mem_T.INT4[_x0]);
    return;
}


