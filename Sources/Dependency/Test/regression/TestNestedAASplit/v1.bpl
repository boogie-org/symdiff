type {:extern} name;
type {:extern} byte;
function {:extern}  OneByteToInt(byte) returns (int);
function {:extern}  TwoBytesToInt(byte, byte) returns (int);
function {:extern}  FourBytesToInt(byte, byte, byte, byte) returns (int);
axiom(forall b0:byte, c0:byte :: {OneByteToInt(b0), OneByteToInt(c0)} OneByteToInt(b0) == OneByteToInt(c0) ==> b0 == c0);
axiom(forall b0:byte, b1: byte, c0:byte, c1:byte :: {TwoBytesToInt(b0, b1), TwoBytesToInt(c0, c1)} TwoBytesToInt(b0, b1) == TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);
axiom(forall b0:byte, b1: byte, b2:byte, b3:byte, c0:byte, c1:byte, c2:byte, c3:byte :: {FourBytesToInt(b0, b1, b2, b3), FourBytesToInt(c0, c1, c2, c3)} FourBytesToInt(b0, b1, b2, b3) == FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

// Memory model

// Mutable
var {:extern} Mem: [name][int]int;
var {:extern} alloc:int;

// Immutable
function {:extern}  Field(int) returns (name);
function {:extern}  Base(int) returns (int);
//axiom(forall x: int :: {Base(x)} Base(x) <= x);
axiom(forall x: int :: {Base(x)} INT_LEQ(Base(x), x));

function {:extern} DT(int) returns(name);
var {:extern} Mem_T.INT4 : [int]int;
var {:extern} Mem_T.PA : [int]int;
var {:extern} Mem_T.PVOID : [int]int;
var {:extern} Mem_T.UINT4 : [int]int;
var {:extern} Mem_T.x_A : [int]int;
function {:extern} Match(a:int, t:name) returns (bool);
function {:extern} MatchBase(b:int, a:int, t:name) returns (bool);
function {:extern} HasType(v:int, t:name) returns (bool);

function {:extern} T.Ptr(t:name) returns (name);
axiom(forall a:int, t:name :: {Match(a, T.Ptr(t))} Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));   //marker for a 
axiom(forall b:int, a:int, t:name :: {MatchBase(b, a, T.Ptr(t))} MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b); // marker for b 
axiom(forall v:int, t:name :: {HasType(v, T.Ptr(t))} HasType(v, T.Ptr(t)) <==> (v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t))));

// Field declarations without typesafety
const {:extern} unique T.x_A:name;

// Type declarations for type safety 

const {:extern} unique T.A:name;
const {:extern} unique T.INT4:name;
const {:extern} unique T.PA:name;
const {:extern} unique T.PINT4:name;
const {:extern} unique T.PPA:name;
const {:extern} unique T.PPPA:name;
const {:extern} unique T.PPVOID:name;
const {:extern} unique T.PVOID:name;
const {:extern} unique T.UINT4:name;
const {:extern} unique T.VOID:name;

// Field offset definitions

function {:extern}  x_A(int) returns (int);        
axiom (forall x:int :: {x_A(x)} x_A(x) == INT_ADD(x, 0));
axiom (forall x:int :: {x_A(x)} x_A(x) == PLUS(x, 1, 0));


///////////////////////////////////
// will be replaced by:
// "//" when using bv mode
// ""   when using int mode
// main reason is to avoid using bv for constants
// or avoid translating lines that are complex or unsound
//////////////////////////////////

////////////////////////////////////////////
/////// function {:extern} s for int type /////////////
// Theorem prover does not see INT_ADD etc.
////////////////////////////////////////////
function {:extern}   INT_EQ(x:int, y:int)  returns  (bool)   {x == y}
function {:extern}   INT_NEQ(x:int, y:int)  returns  (bool)   {x != y}

function {:extern}   INT_ADD(x:int, y:int)  returns  (int)   {x + y}
function {:extern}   INT_SUB(x:int, y:int)  returns  (int)   {x - y}
function {:extern}   INT_MULT(x:int, y:int) returns  (int)   {x * y}
//function {:extern}   INT_DIV(x:int, y:int)  returns  (int)   {x / y}
function {:extern}   INT_LT(x:int, y:int)   returns  (bool)  {x < y}
function {:extern}   INT_ULT(x:int, y:int)   returns  (bool)  {x < y}
function {:extern}   INT_LEQ(x:int, y:int)  returns  (bool)  {x <= y}
function {:extern}   INT_ULEQ(x:int, y:int)  returns  (bool)  {x <= y}
function {:extern}   INT_GT(x:int, y:int)   returns  (bool)  {x > y}
function {:extern}   INT_UGT(x:int, y:int)   returns  (bool)  {x > y}
function {:extern}   INT_GEQ(x:int, y:int)  returns  (bool)  {x >= y}
function {:extern}   INT_UGEQ(x:int, y:int)  returns  (bool)  {x >= y}


////////////////////////////////////////////
/////// function {:extern} s for bv32 type /////////////
// Theorem prover does not see INT_ADD etc.
// we are treating unsigned ops now
////////////////////////////////////////////
function {:extern}   BV32_EQ(x:bv32, y:bv32)  returns  (bool)   {x == y}
function {:extern}   BV32_NEQ(x:bv32, y:bv32)  returns  (bool)  {x != y}

function {:extern}  {:bvbuiltin "bvadd"}  BV32_ADD(x:bv32, y:bv32)  returns  (bv32);
function {:extern}  {:bvbuiltin "bvsub"}  BV32_SUB(x:bv32, y:bv32)  returns  (bv32);
function {:extern}  {:bvbuiltin "bvmul"}  BV32_MULT(x:bv32, y:bv32) returns  (bv32);
function {:extern}  {:bvbuiltin "bvudiv"} BV32_DIV(x:bv32, y:bv32)  returns  (bv32);
function {:extern}  {:bvbuiltin "bvult"}  BV32_ULT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvslt"}  BV32_LT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvule"}  BV32_ULEQ(x:bv32, y:bv32)  returns  (bool);
function {:extern}  {:bvbuiltin "bvsle"}  BV32_LEQ(x:bv32, y:bv32)  returns  (bool);
function {:extern}  {:bvbuiltin "bvugt"}  BV32_UGT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvsgt"}  BV32_GT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvuge"}  BV32_UGEQ(x:bv32, y:bv32)  returns  (bool);
function {:extern}  {:bvbuiltin "bvsge"}  BV32_GEQ(x:bv32, y:bv32)  returns  (bool);

//what about bitwise ops {BIT_AND, BIT_OR, BIT_NOT, ..}
//only enabled with bv theory
// function {:extern}  {:bvbuiltin "bvand"} BIT_BAND(a:int, b:int) returns (x:int);
// function {:extern}  {:bvbuiltin "bvor"}  BIT_BOR(a:int, b:int) returns (x:int);
// function {:extern}  {:bvbuiltin "bvxor"} BIT_BXOR(a:int, b:int) returns (x:int);
// function {:extern}  {:bvbuiltin "bvnot"} BIT_BNOT(a:int) returns (x:int);

//////////////////////////////////
// Generic C Arithmetic operations
/////////////////////////////////

//Is this sound for bv32?
function {:extern}  MINUS_BOTH_PTR_OR_BOTH_INT(a:int, b:int, size:int) returns (int); 
 axiom  (forall a:int, b:int, size:int :: {MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size)} 
//size * MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size) <= a - b && a - b < size * (MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size) + 1));
 INT_LEQ( INT_MULT(size, MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size)),  INT_SUB(a, b)) && INT_LT( INT_SUB(a, b),  INT_MULT(size, (INT_ADD(MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size), 1)))));

//we just keep this axiom for size = 1
axiom  (forall a:int, b:int, size:int :: {MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size)}  MINUS_BOTH_PTR_OR_BOTH_INT(a,b,1) == INT_SUB(a,b));


function {:extern}  MINUS_LEFT_PTR(a:int, a_size:int, b:int) returns (int);
//axiom(forall a:int, a_size:int, b:int :: {MINUS_LEFT_PTR(a,a_size,b)} MINUS_LEFT_PTR(a,a_size,b) == a - a_size * b);
axiom(forall a:int, a_size:int, b:int :: {MINUS_LEFT_PTR(a,a_size,b)} MINUS_LEFT_PTR(a,a_size,b) == INT_SUB(a, INT_MULT(a_size, b)));


function {:extern}  PLUS(a:int, a_size:int, b:int) returns (int);
//axiom (forall a:int, a_size:int, b:int :: {PLUS(a,a_size,b)} PLUS(a,a_size,b) == a + a_size * b);
axiom (forall a:int, a_size:int, b:int :: {PLUS(a,a_size,b)} PLUS(a,a_size,b) == INT_ADD(a, INT_MULT(a_size, b)));
 
function {:extern}  MULT(a:int, b:int) returns (int); // a*b
//axiom(forall a:int, b:int :: {MULT(a,b)} MULT(a,b) == a * b);
axiom(forall a:int, b:int :: {MULT(a,b)} MULT(a,b) == INT_MULT(a, b));
 
function {:extern}  DIV(a:int, b:int) returns (int); // a/b	

function {:extern}  BINARY_UNKNOWN(a:int, b:int) returns (int); //unknown op, should fix it.


// Not sure if these axioms hold for BV too, just commet them for BV 	      
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a >= 0 && b > 0 ==> b * DIV(a,b) <= a && a < b * (DIV(a,b) + 1)
 ); 
 
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a >= 0 && b < 0 ==> b * DIV(a,b) <= a && a < b * (DIV(a,b) - 1)
 ); 
 
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a < 0 && b > 0 ==> b * DIV(a,b) >= a && a > b * (DIV(a,b) - 1)
 ); 
 
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a < 0 && b < 0 ==> b * DIV(a,b) >= a && a > b * (DIV(a,b) + 1)
 ); 
 

//uninterpreted binary op
function {:extern}  BINARY_BOTH_INT(a:int, b:int) returns (int);


//////////////////////////////////////////
//// Bitwise ops (uninterpreted, used with int)
//////////////////////////////////////////
function {:extern}  POW2(a:int) returns (bool);
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

 function {:extern}  BIT_BAND(a:int, b:int) returns (x:int);
 axiom(forall a:int, b:int :: {BIT_BAND(a,b)} a == b ==> BIT_BAND(a,b) == a);
 axiom(forall a:int, b:int :: {BIT_BAND(a,b)} POW2(a) && POW2(b) && a != b ==> BIT_BAND(a,b) == 0);
 axiom(forall a:int, b:int :: {BIT_BAND(a,b)} a == 0 || b == 0 ==> BIT_BAND(a,b) == 0);

 function {:extern}  BIT_BOR(a:int, b:int) returns (x:int);
 function {:extern}  BIT_BXOR(a:int, b:int) returns (x:int);
 function {:extern}  BIT_BNOT(a:int) returns (int);


function {:extern}  choose(a:bool, b:int, c:int) returns (x:int);
axiom(forall a:bool, b:int, c:int :: {choose(a,b,c)} a ==> choose(a,b,c) == b);
axiom(forall a:bool, b:int, c:int :: {choose(a,b,c)} !a ==> choose(a,b,c) == c);

function {:extern}  LIFT(a:bool) returns (int);
axiom(forall a:bool :: {LIFT(a)} a <==> LIFT(a) != 0);

function {:extern}  PTR_NOT(a:int) returns (int);
axiom(forall a:int :: {PTR_NOT(a)} a == 0 ==> PTR_NOT(a) != 0);
axiom(forall a:int :: {PTR_NOT(a)} a != 0 ==> PTR_NOT(a) == 0);

function {:extern}  NULL_CHECK(a:int) returns (int);
axiom(forall a:int :: {NULL_CHECK(a)} a == 0 ==> NULL_CHECK(a) != 0);
axiom(forall a:int :: {NULL_CHECK(a)} a != 0 ==> NULL_CHECK(a) == 0);

procedure {:extern}  havoc_assert(i:int);
requires (i != 0);

procedure {:extern}  havoc_assume(i:int);
ensures (i != 0);

procedure {:extern}  __HAVOC_free(a:int);

function {:extern}  NewAlloc(x:int, y:int) returns (z:int);


procedure {:extern}  __HAVOC_malloc(obj_size:int) returns (new:int);
free requires INT_GEQ(obj_size, 0); //requires obj_size >= 0;
modifies alloc;
ensures new == old(alloc);
ensures INT_GT(alloc, INT_ADD(new, obj_size)); //ensures alloc > new + obj_size;
ensures Base(new) == new;

//deterministic HAVOC_malloc 
procedure {:extern}  __HAVOC_det_malloc(obj_size:int) returns (new:int);
free requires INT_GEQ(obj_size, 0); //requires obj_size >= 0;
modifies alloc;
ensures new == old(alloc);
ensures INT_GT(alloc, INT_ADD(new, obj_size)); //ensures alloc > new + obj_size;
ensures Base(new) == new;
ensures alloc == NewAlloc(old(alloc), obj_size);


//////////////////
// Memset starts
//////////////////
//A quick/dirty version of memset 
//M_T := memset(M_T, p, c, s, n)

// we make a copy for each concrete size
 procedure {:extern}  __HAVOC_memset_split_1(A:[int]int, p:int, c:int, n:int) returns (ret:[int]int);
 ensures (Subset(Empty(), Array(p,1,n)) && (forall i:int:: {ret[i]}  Array(p,1,n)[i] || ret[i] == A[i]));
 ensures (Subset(Empty(), Array(p,1,n)) && (forall i:int:: {ret[i]}  Array(p,1,n)[i] ==> ret[i] == c));


 procedure {:extern}  __HAVOC_memset_split_2(A:[int]int, p:int, c:int, n:int) returns (ret:[int]int);
 ensures (Subset(Empty(), Array(p,2,n)) && (forall i:int:: {ret[i]}  Array(p,2,n)[i] || ret[i] == A[i]));
 ensures (Subset(Empty(), Array(p,2,n)) && (forall i:int:: {ret[i]}  Array(p,2,n)[i] ==> ret[i] == c));



 procedure {:extern}  __HAVOC_memset_split_4(A:[int]int, p:int, c:int, n:int) returns (ret:[int]int);
 ensures (Subset(Empty(), Array(p,4,n)) && (forall i:int:: {ret[i]}  Array(p,4,n)[i] || ret[i] == A[i]));
 ensures (Subset(Empty(), Array(p,4,n)) && (forall i:int:: {ret[i]}  Array(p,4,n)[i] ==> ret[i] == c));

//////////////////
// Memset ends

//////////////////

//a common nondet for all instrinsic returns
procedure {:extern}  nondet_intrinsic() returns (x:int);

procedure {:extern}  nondet_choice() returns (x:int);

//----deterministic (but arbitrary) choice
var {:extern} detChoiceCnt:int;
function {:extern}  DetChoiceFunc(a:int) returns (x:int);

procedure {:extern}  det_choice() returns (x:int);
//ensures detChoiceCnt == old(detChoiceCnt) + 1;
ensures detChoiceCnt == INT_ADD(old(detChoiceCnt),1);
ensures x == DetChoiceFunc(old(detChoiceCnt));
modifies detChoiceCnt;

procedure {:extern}  _strdup(str:int) returns (new:int);

procedure {:extern}  _xstrcasecmp(a0:int, a1:int) returns (ret:int);

procedure {:extern}  _xstrcmp(a0:int, a1:int) returns (ret:int);


/*
//bv function {:extern} s
function {:extern}  bv8ToInt(bv8)   returns (int);
function {:extern}  bv16ToInt(bv16) returns (int);
function {:extern}  bv32ToInt(bv32) returns (int);
function {:extern}  bv64ToInt(bv64) returns (int);

function {:extern}  intToBv8(int)    returns (bv8);
function {:extern}  intToBv16(int)   returns (bv16);
function {:extern}  intToBv32(int)   returns (bv32);
function {:extern}  intToBv64(int)   returns (bv64);

axiom(forall a:int ::  {intToBv8(a)} bv8ToInt(intToBv8(a)) == a);
axiom(forall a:int ::  {intToBv16(a)} bv16ToInt(intToBv16(a)) == a);
axiom(forall a:int ::  {intToBv32(a)} bv32ToInt(intToBv32(a)) == a);
axiom(forall a:int ::  {intToBv64(a)} bv64ToInt(intToBv64(a)) == a);

axiom(forall b:bv8 ::  {bv8ToInt(b)} intToBv8(bv8ToInt(b)) == b);
axiom(forall b:bv16 ::  {bv16ToInt(b)} intToBv16(bv16ToInt(b)) == b);
axiom(forall b:bv32 ::  {bv32ToInt(b)} intToBv32(bv32ToInt(b)) == b);
axiom(forall b:bv64 ::  {bv64ToInt(b)} intToBv64(bv64ToInt(b)) == b);
*/




function {:extern}  Equal([int]bool, [int]bool) returns (bool);
function {:extern}  Subset([int]bool, [int]bool) returns (bool);
function {:extern}  Disjoint([int]bool, [int]bool) returns (bool);

function {:extern}  Empty() returns ([int]bool);
function {:extern}  SetTrue() returns ([int]bool);
function {:extern}  Singleton(int) returns ([int]bool);
function {:extern}  Reachable([int,int]bool, int) returns ([int]bool);
function {:extern}  Union([int]bool, [int]bool) returns ([int]bool);
function {:extern}  Intersection([int]bool, [int]bool) returns ([int]bool);
function {:extern}  Difference([int]bool, [int]bool) returns ([int]bool);
function {:extern}  Dereference([int]bool, [int]int) returns ([int]bool);
function {:extern}  Inverse(f:[int]int, x:int) returns ([int]bool);

function {:extern}  AtLeast(int, int) returns ([int]bool);
function {:extern}  Rep(int, int) returns (int);
//axiom(forall n:int, x:int, y:int :: {AtLeast(n,x)[y]} AtLeast(n,x)[y] ==> x <= y && Rep(n,x) == Rep(n,y));
axiom(forall n:int, x:int, y:int :: {AtLeast(n,x)[y]} AtLeast(n,x)[y] ==> INT_LEQ(x, y) && Rep(n,x) == Rep(n,y));
//axiom(forall n:int, x:int, y:int :: {AtLeast(n,x),Rep(n,x),Rep(n,y)} x <= y && Rep(n,x) == Rep(n,y) ==> AtLeast(n,x)[y]);
axiom(forall n:int, x:int, y:int :: {AtLeast(n,x),Rep(n,x),Rep(n,y)} INT_LEQ(x, y) && Rep(n,x) == Rep(n,y) ==> AtLeast(n,x)[y]);
axiom(forall n:int, x:int :: {AtLeast(n,x)} AtLeast(n,x)[x]);
axiom(forall n:int, x:int, z:int :: {PLUS(x,n,z)} Rep(n,x) == Rep(n,PLUS(x,n,z)));
//axiom(forall n:int, x:int :: {Rep(n,x)} (exists k:int :: Rep(n,x) - x  == n*k));
axiom(forall n:int, x:int :: {Rep(n,x)} (exists k:int :: INT_SUB(Rep(n,x),x)  == INT_MULT(n,k)));

/*
function {:extern}  AtLeast(int, int) returns ([int]bool);
function {:extern}  ModEqual(int, int, int) returns (bool);
axiom(forall n:int, x:int :: ModEqual(n,x,x));
axiom(forall n:int, x:int, y:int :: {ModEqual(n,x,y)} ModEqual(n,x,y) ==> ModEqual(n,y,x));
axiom(forall n:int, x:int, y:int, z:int :: {ModEqual(n,x,y), ModEqual(n,y,z)} ModEqual(n,x,y) && ModEqual(n,y,z) ==> ModEqual(n,x,z));
axiom(forall n:int, x:int, z:int :: {PLUS(x,n,z)} ModEqual(n,x,PLUS(x,n,z)));
axiom(forall n:int, x:int, y:int :: {ModEqual(n,x,y)} ModEqual(n,x,y) ==> (exists k:int :: x - y == n*k));
axiom(forall x:int, n:int, y:int :: {AtLeast(n,x)[y]}{ModEqual(n,x,y)} AtLeast(n,x)[y] <==> x <= y && ModEqual(n,x,y));
axiom(forall x:int, n:int :: {AtLeast(n,x)} AtLeast(n,x)[x]);
*/

function {:extern}  Array(int, int, int) returns ([int]bool);
axiom(forall x:int, n:int, z:int :: {Array(x,n,z)} INT_LEQ(z,0) ==> Equal(Array(x,n,z), Empty()));
axiom(forall x:int, n:int, z:int :: {Array(x,n,z)} INT_GT(z, 0) ==> Equal(Array(x,n,z), Difference(AtLeast(n,x),AtLeast(n,PLUS(x,n,z)))));


axiom(forall x:int :: !Empty()[x]);

axiom(forall x:int :: SetTrue()[x]);

axiom(forall x:int, y:int :: {Singleton(y)[x]} Singleton(y)[x] <==> x == y);
axiom(forall y:int :: {Singleton(y)} Singleton(y)[y]);

axiom(forall x:int, S:[int]bool, T:[int]bool :: {Union(S,T)[x]}{Union(S,T),S[x]}{Union(S,T),T[x]} Union(S,T)[x] <==> S[x] || T[x]);
axiom(forall x:int, S:[int]bool, T:[int]bool :: {Intersection(S,T)[x]}{Intersection(S,T),S[x]}{Intersection(S,T),T[x]} Intersection(S,T)[x] <==>  S[x] && T[x]);
axiom(forall x:int, S:[int]bool, T:[int]bool :: {Difference(S,T)[x]}{Difference(S,T),S[x]}{Difference(S,T),T[x]} Difference(S,T)[x] <==> S[x] && !T[x]);

axiom(forall S:[int]bool, T:[int]bool :: {Equal(S,T)} Equal(S,T) <==> Subset(S,T) && Subset(T,S));
axiom(forall x:int, S:[int]bool, T:[int]bool :: {S[x],Subset(S,T)}{T[x],Subset(S,T)} S[x] && Subset(S,T) ==> T[x]);
axiom(forall S:[int]bool, T:[int]bool :: {Subset(S,T)} Subset(S,T) || (exists x:int :: S[x] && !T[x]));
axiom(forall x:int, S:[int]bool, T:[int]bool :: {S[x],Disjoint(S,T)}{T[x],Disjoint(S,T)} !(S[x] && Disjoint(S,T) && T[x]));
axiom(forall S:[int]bool, T:[int]bool :: {Disjoint(S,T)} Disjoint(S,T) || (exists x:int :: S[x] && T[x]));

axiom(forall f:[int]int, x:int :: {Inverse(f,f[x])} Inverse(f,f[x])[x]);
axiom(forall f:[int]int, x:int, y:int :: {Inverse(f,y), f[x]} Inverse(f,y)[x] ==> f[x] == y);
axiom(forall f:[int]int, x:int, y:int :: {Inverse(f[x := y],y)} Equal(Inverse(f[x := y],y), Union(Inverse(f,y), Singleton(x))));
axiom(forall f:[int]int, x:int, y:int, z:int :: {Inverse(f[x := y],z)} y == z || Equal(Inverse(f[x := y],z), Difference(Inverse(f,z), Singleton(x))));


axiom(forall x:int, S:[int]bool, M:[int]int :: {Dereference(S,M)[x]} Dereference(S,M)[x] ==> (exists y:int :: x == M[y] && S[y]));
axiom(forall x:int, S:[int]bool, M:[int]int :: {M[x], S[x], Dereference(S,M)} S[x] ==> Dereference(S,M)[M[x]]);
axiom(forall x:int, y:int, S:[int]bool, M:[int]int :: {Dereference(S,M[x := y])} !S[x] ==> Equal(Dereference(S,M[x := y]), Dereference(S,M)));
axiom(forall x:int, y:int, S:[int]bool, M:[int]int :: {Dereference(S,M[x := y])} 
     S[x] &&  Equal(Intersection(Inverse(M,M[x]), S), Singleton(x)) ==> Equal(Dereference(S,M[x := y]), Union(Difference(Dereference(S,M), Singleton(M[x])), Singleton(y))));
axiom(forall x:int, y:int, S:[int]bool, M:[int]int :: {Dereference(S,M[x := y])} 
     S[x] && !Equal(Intersection(Inverse(M,M[x]), S), Singleton(x)) ==> Equal(Dereference(S,M[x := y]), Union(Dereference(S,M), Singleton(y))));

function {:extern}  Unified([name][int]int) returns ([int]int);
axiom(forall M:[name][int]int, x:int :: {Unified(M)[x]} Unified(M)[x] == M[Field(x)][x]);
axiom(forall M:[name][int]int, x:int, y:int :: {Unified(M[Field(x) := M[Field(x)][x := y]])} Unified(M[Field(x) := M[Field(x)][x := y]]) == Unified(M)[x := y]);
//CToBplModel constants
function  {:extern} value_is(c:int , e:int) returns (r:bool);
const {:extern} {:model_const "a_ptr"} {:sourceFile "source\foo.c"} {:sourceLine 10} unique __ctobpl_const_5:int;
const {:extern} {:model_const "* a_ptr"} {:sourceFile "source\foo.c"} {:sourceLine 10} unique __ctobpl_const_6:int;
const {:extern} {:model_const "result.malloc"} {:sourceFile "source\foo.c"} {:sourceLine 8} unique __ctobpl_const_2:int;
const {:extern} {:model_const "a_ptr"} {:sourceFile "source\foo.c"} {:sourceLine 17} unique __ctobpl_const_11:int;
const {:extern} {:model_const "* a_ptr"} {:sourceFile "source\foo.c"} {:sourceLine 17} unique __ctobpl_const_12:int;
const {:extern} {:model_const "a_ptr"} {:sourceFile "source\foo.c"} {:sourceLine 16} unique __ctobpl_const_8:int;
const {:extern} {:model_const "new_a->x"} {:sourceFile "source\foo.c"} {:sourceLine 9} unique __ctobpl_const_4:int;
const {:extern} {:model_const "a_ptr"} {:sourceFile "source\foo.c"} {:sourceLine 16} unique __ctobpl_const_9:int;
const {:extern} {:model_const "new_a"} {:sourceFile "source\foo.c"} {:sourceLine 8} unique __ctobpl_const_1:int;
const {:extern} {:model_const "new_a"} {:sourceFile "source\foo.c"} {:sourceLine 9} unique __ctobpl_const_3:int;
const {:extern} {:model_const "new_a"} {:sourceFile "source\foo.c"} {:sourceLine 10} unique __ctobpl_const_7:int;
const {:extern} {:model_const "(* a_ptr)->x"} {:sourceFile "source\foo.c"} {:sourceLine 17} unique __ctobpl_const_13:int;
const {:extern} {:model_const "y"} {:sourceFile "source\foo.c"} {:sourceLine 17} unique __ctobpl_const_10:int;


procedure {:extern}  foo_64__64_YAXPAPAUA_64__64__64_Z(a_ptr.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} a_ptr : int;
var {:extern} new_a : int;
var {:extern} result.malloc$1 : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(a_ptr.__1, alloc);
a_ptr:= 0;//Init locals 
new_a:= 0;//Init locals 
result.malloc$1:= 0;//Init locals 
a_ptr := a_ptr.__1;
goto label_3;


// source\foo.c(8)
label_3:
assert {:sourcefile "source\foo.c"} {:sourceline 8} true;
goto label_4;


// source\foo.c(8)
label_4:
assert {:sourcefile "source\foo.c"} {:sourceline 8} true;
call result.malloc$1 := __HAVOC_det_malloc (1);
goto label_7;


// source\foo.c(8)
label_7:
assert {:sourcefile "source\foo.c"} {:sourceline 8} true;
new_a := result.malloc$1 ;
assume value_is(__ctobpl_const_1, new_a);
assume value_is(__ctobpl_const_2, result.malloc$1);
goto label_8;


// source\foo.c(9)
label_8:
assert {:sourcefile "source\foo.c"} {:sourceline 9} true;
//TAG: Dereferenced object is non-null
assert(new_a != 0);
Mem_T.x_A := Mem_T.x_A[x_A(new_a) := 0];
assume value_is(__ctobpl_const_3, new_a);
assume value_is(__ctobpl_const_4, Mem_T.x_A[x_A(new_a)]);
goto label_9;


// source\foo.c(10)
label_9:
assert {:sourcefile "source\foo.c"} {:sourceline 10} true;
//TAG: Dereferenced object is non-null
assert(a_ptr != 0);
Mem_T.PA := Mem_T.PA[a_ptr := new_a];
assume value_is(__ctobpl_const_5, a_ptr);
assume value_is(__ctobpl_const_6, Mem_T.PA[a_ptr]);
assume value_is(__ctobpl_const_7, new_a);
goto label_1;


// source\foo.c(11)
label_1:
assert {:sourcefile "source\foo.c"} {:sourceline 11} true;
return;


// source\foo.c(11)
label_2:
assert {:sourcefile "source\foo.c"} {:sourceline 11} true;
assume false;
return;

}



procedure {:extern}  goo_64__64_YAXXZ()

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} a_ptr : int;
var {:extern} y : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:
call a_ptr := __HAVOC_det_malloc (1);
//a_ptr:= 0;//Init locals 
y:= 0;//Init locals 
goto label_3;


// source\foo.c(14)
label_3:
assert {:sourcefile "source\foo.c"} {:sourceline 14} true;
goto label_4;


// source\foo.c(15)
label_4:
assert {:sourcefile "source\foo.c"} {:sourceline 15} true;
goto label_5;


// source\foo.c(16)
label_5:
assert {:sourcefile "source\foo.c"} {:sourceline 16} true;
call foo_64__64_YAXPAPAUA_64__64__64_Z (a_ptr);
assume value_is(__ctobpl_const_8, a_ptr);
assume value_is(__ctobpl_const_9, a_ptr);
goto label_8;


// source\foo.c(17)
label_8:
assert {:sourcefile "source\foo.c"} {:sourceline 17} true;
//TAG: Dereferenced object is non-null
assert(a_ptr != 0);
//TAG: Dereferenced object is non-null
assert(Mem_T.PA[a_ptr] != 0);
y := Mem_T.x_A[x_A(Mem_T.PA[a_ptr])] ;
assume value_is(__ctobpl_const_10, y);
assume value_is(__ctobpl_const_11, a_ptr);
assume value_is(__ctobpl_const_12, Mem_T.PA[a_ptr]);
assume value_is(__ctobpl_const_13, Mem_T.x_A[x_A(Mem_T.PA[a_ptr])]);
goto label_1;


// source\foo.c(18)
label_1:
assert {:sourcefile "source\foo.c"} {:sourceline 18} true;
return;


// source\foo.c(18)
label_2:
assert {:sourcefile "source\foo.c"} {:sourceline 18} true;
assume false;
return;

}

