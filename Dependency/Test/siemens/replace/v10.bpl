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
var {:extern} Mem_T.A100CHAR : [int]int;
var {:extern} Mem_T.A25CHAR : [int]int;
var {:extern} Mem_T.A26CHAR : [int]int;
var {:extern} Mem_T.A28CHAR : [int]int;
var {:extern} Mem_T.A29CHAR : [int]int;
var {:extern} Mem_T.A32CHAR : [int]int;
var {:extern} Mem_T.CHAR : [int]int;
var {:extern} Mem_T.INT4 : [int]int;
var {:extern} Mem_T.PCHAR : [int]int;
var {:extern} Mem_T.PINT4 : [int]int;
var {:extern} Mem_T.P_iobuf : [int]int;
var {:extern} Mem_T.UINT4 : [int]int;
function {:extern} Match(a:int, t:name) returns (bool);
function {:extern} MatchBase(b:int, a:int, t:name) returns (bool);
function {:extern} HasType(v:int, t:name) returns (bool);

function {:extern} T.Ptr(t:name) returns (name);
axiom(forall a:int, t:name :: {Match(a, T.Ptr(t))} Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));   //marker for a 
axiom(forall b:int, a:int, t:name :: {MatchBase(b, a, T.Ptr(t))} MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b); // marker for b 
axiom(forall v:int, t:name :: {HasType(v, T.Ptr(t))} HasType(v, T.Ptr(t)) <==> (v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t))));

// Field declarations without typesafety

// Type declarations for type safety 

const {:extern} unique T.A100CHAR:name;
const {:extern} unique T.A25CHAR:name;
const {:extern} unique T.A26CHAR:name;
const {:extern} unique T.A28CHAR:name;
const {:extern} unique T.A29CHAR:name;
const {:extern} unique T.A32CHAR:name;
const {:extern} unique T.CHAR:name;
const {:extern} unique T.INT4:name;
const {:extern} unique T.PA100CHAR:name;
const {:extern} unique T.PA25CHAR:name;
const {:extern} unique T.PA26CHAR:name;
const {:extern} unique T.PA28CHAR:name;
const {:extern} unique T.PA29CHAR:name;
const {:extern} unique T.PA32CHAR:name;
const {:extern} unique T.PCHAR:name;
const {:extern} unique T.PINT4:name;
const {:extern} unique T.PPCHAR:name;
const {:extern} unique T.PPINT4:name;
const {:extern} unique T.PPPCHAR:name;
const {:extern} unique T.PP_iobuf:name;
const {:extern} unique T.P_iobuf:name;
const {:extern} unique T.UINT4:name;
const {:extern} unique T._iobuf:name;

// Field offset definitions


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
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 55} unique __ctobpl_const_5:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 58} unique __ctobpl_const_7:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 58} unique __ctobpl_const_8:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 55} unique __ctobpl_const_4:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 58} unique __ctobpl_const_10:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 59} unique __ctobpl_const_13:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 514} unique __ctobpl_const_100:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_28:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 62} unique __ctobpl_const_17:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_29:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_33:int;
const {:extern} {:model_const "outset[* j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 58} unique __ctobpl_const_9:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 428} unique __ctobpl_const_21:int;
const {:extern} {:model_const "pat[j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 428} unique __ctobpl_const_22:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 427} unique __ctobpl_const_18:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 428} unique __ctobpl_const_20:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 59} unique __ctobpl_const_12:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_34:int;
const {:extern} {:model_const "result.getline"} {:sourceFile ".\v10\replace.c"} {:sourceLine 514} unique __ctobpl_const_101:int;
const {:extern} {:model_const "result.omatch"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_35:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_31:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 59} unique __ctobpl_const_14:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 428} unique __ctobpl_const_19:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_26:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_30:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 59} unique __ctobpl_const_11:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_32:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 449} unique __ctobpl_const_36:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 450} unique __ctobpl_const_37:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 429} unique __ctobpl_const_24:int;
const {:extern} {:model_const "pat[j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 429} unique __ctobpl_const_25:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 429} unique __ctobpl_const_23:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 56} unique __ctobpl_const_16:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 60} unique __ctobpl_const_15:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 448} unique __ctobpl_const_27:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 562} unique __ctobpl_const_1:int;
const {:extern} {:model_const "outset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 58} unique __ctobpl_const_6:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_86:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 434} unique __ctobpl_const_69:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 438} unique __ctobpl_const_74:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_82:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_87:int;
const {:extern} {:model_const "amatch.arg.4"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_89:int;
const {:extern} {:model_const "result.amatch"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_91:int;
const {:extern} {:model_const "result.patsize"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_81:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 445} unique __ctobpl_const_97:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 446} unique __ctobpl_const_98:int;
const {:extern} {:model_const "amatch.arg.4"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_85:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 437} unique __ctobpl_const_71:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 438} unique __ctobpl_const_73:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 440} unique __ctobpl_const_92:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 455} unique __ctobpl_const_99:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_77:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 443} unique __ctobpl_const_93:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 443} unique __ctobpl_const_94:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 435} unique __ctobpl_const_70:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_164:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_75:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 445} unique __ctobpl_const_96:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_78:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_83:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_80:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_84:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_88:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_90:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 441} unique __ctobpl_const_95:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 438} unique __ctobpl_const_72:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_76:int;
const {:extern} {:model_const "amatch.arg.4"} {:sourceFile ".\v10\replace.c"} {:sourceLine 439} unique __ctobpl_const_79:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_59:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_65:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_67:int;
const {:extern} {:model_const "result.omatch"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_68:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_66:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 431} unique __ctobpl_const_53:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_42:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 432} unique __ctobpl_const_57:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_64:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_39:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_61:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 451} unique __ctobpl_const_38:int;
const {:extern} {:model_const "result.patsize"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_45:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_46:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 432} unique __ctobpl_const_55:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_44:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_43:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_40:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_48:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 431} unique __ctobpl_const_54:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_60:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_63:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_50:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 453} unique __ctobpl_const_41:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_47:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_51:int;
const {:extern} {:model_const "result.patsize"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_52:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 432} unique __ctobpl_const_56:int;
const {:extern} {:model_const "lin[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 432} unique __ctobpl_const_58:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 433} unique __ctobpl_const_62:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 430} unique __ctobpl_const_49:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 55} unique __ctobpl_const_3:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 562} unique __ctobpl_const_2:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 515} unique __ctobpl_const_102:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 107} unique __ctobpl_const_119:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 113} unique __ctobpl_const_127:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 516} unique __ctobpl_const_104:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 516} unique __ctobpl_const_106:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_110:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_114:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_111:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_115:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_116:int;
const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 107} unique __ctobpl_const_121:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 111} unique __ctobpl_const_122:int;
const {:extern} {:model_const "src[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_117:int;
const {:extern} {:model_const "src[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_112:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 111} unique __ctobpl_const_124:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 111} unique __ctobpl_const_123:int;
const {:extern} {:model_const "src[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 111} unique __ctobpl_const_125:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_109:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 107} unique __ctobpl_const_118:int;
const {:extern} {:model_const "s[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 71} unique __ctobpl_const_227:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 517} unique __ctobpl_const_107:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 107} unique __ctobpl_const_120:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 516} unique __ctobpl_const_105:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 113} unique __ctobpl_const_126:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 113} unique __ctobpl_const_128:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 113} unique __ctobpl_const_129:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 113} unique __ctobpl_const_130:int;
const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 113} unique __ctobpl_const_131:int;
const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_132:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 516} unique __ctobpl_const_103:int;
const {:extern} {:model_const "result.getline"} {:sourceFile ".\v10\replace.c"} {:sourceLine 517} unique __ctobpl_const_108:int;
const {:extern} {:model_const "delim"} {:sourceFile ".\v10\replace.c"} {:sourceLine 105} unique __ctobpl_const_113:int;
const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_137:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_140:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_157:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_159:int;
const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_160:int;
const {:extern} {:model_const "result.isalnum"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_139:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_156:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_161:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_162:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_163:int;
const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_147:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_141:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_145:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_142:int;
const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_143:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_146:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_153:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_135:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_133:int;
const {:extern} {:model_const "isalnum.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_138:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_155:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_158:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_152:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_154:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_151:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_148:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_149:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_134:int;
const {:extern} {:model_const "src[* i - 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 115} unique __ctobpl_const_136:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 126} unique __ctobpl_const_150:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 117} unique __ctobpl_const_144:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 79} unique __ctobpl_const_237:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 72} unique __ctobpl_const_254:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 72} unique __ctobpl_const_255:int;
const {:extern} {:model_const "s[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 72} unique __ctobpl_const_256:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 87} unique __ctobpl_const_257:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 79} unique __ctobpl_const_239:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 79} unique __ctobpl_const_238:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 253} unique __ctobpl_const_321:int;
const {:extern} {:model_const "s[* i + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 74} unique __ctobpl_const_231:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 78} unique __ctobpl_const_234:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 75} unique __ctobpl_const_232:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 74} unique __ctobpl_const_229:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 74} unique __ctobpl_const_230:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 82} unique __ctobpl_const_241:int;
const {:extern} {:model_const "s[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 82} unique __ctobpl_const_244:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 74} unique __ctobpl_const_228:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 82} unique __ctobpl_const_243:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 78} unique __ctobpl_const_235:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 85} unique __ctobpl_const_245:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 85} unique __ctobpl_const_246:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 85} unique __ctobpl_const_247:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 78} unique __ctobpl_const_233:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 78} unique __ctobpl_const_236:int;
const {:extern} {:model_const "s[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 85} unique __ctobpl_const_249:int;
const {:extern} {:model_const "s[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 79} unique __ctobpl_const_240:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 82} unique __ctobpl_const_242:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 85} unique __ctobpl_const_248:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 83} unique __ctobpl_const_250:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 80} unique __ctobpl_const_251:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 72} unique __ctobpl_const_252:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 72} unique __ctobpl_const_253:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_174:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_178:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_183:int;
const {:extern} {:model_const "src[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_193:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_185:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_175:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_176:int;
const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_189:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 123} unique __ctobpl_const_168:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_173:int;
const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_194:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_195:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_196:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_170:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_181:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 123} unique __ctobpl_const_169:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_184:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_179:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_182:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_186:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_188:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_172:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 114} unique __ctobpl_const_187:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_177:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_190:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 121} unique __ctobpl_const_171:int;
const {:extern} {:model_const "k"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_180:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_191:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_192:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 123} unique __ctobpl_const_166:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 123} unique __ctobpl_const_167:int;
const {:extern} {:model_const "src[* i + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 119} unique __ctobpl_const_165:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_201:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 108} unique __ctobpl_const_205:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_210:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_199:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_200:int;
const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_198:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_216:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 108} unique __ctobpl_const_204:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_218:int;
const {:extern} {:model_const "src"} {:sourceFile ".\v10\replace.c"} {:sourceLine 108} unique __ctobpl_const_206:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 108} unique __ctobpl_const_208:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_213:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_202:int;
const {:extern} {:model_const "result.esc"} {:sourceFile ".\v10\replace.c"} {:sourceLine 108} unique __ctobpl_const_209:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_197:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_214:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 108} unique __ctobpl_const_207:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_215:int;
const {:extern} {:model_const "dest"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_211:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_212:int;
const {:extern} {:model_const "maxset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_217:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 109} unique __ctobpl_const_219:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 127} unique __ctobpl_const_221:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 127} unique __ctobpl_const_220:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 127} unique __ctobpl_const_222:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 127} unique __ctobpl_const_223:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 141} unique __ctobpl_const_258:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 71} unique __ctobpl_const_224:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 71} unique __ctobpl_const_225:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 71} unique __ctobpl_const_226:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 112} unique __ctobpl_const_203:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 146} unique __ctobpl_const_270:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 143} unique __ctobpl_const_273:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 143} unique __ctobpl_const_277:int;
const {:extern} {:model_const "jstart"} {:sourceFile ".\v10\replace.c"} {:sourceLine 147} unique __ctobpl_const_282:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 142} unique __ctobpl_const_262:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 141} unique __ctobpl_const_261:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 142} unique __ctobpl_const_263:int;
const {:extern} {:model_const "arg[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 142} unique __ctobpl_const_265:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 143} unique __ctobpl_const_275:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 143} unique __ctobpl_const_272:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 144} unique __ctobpl_const_279:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 147} unique __ctobpl_const_283:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 147} unique __ctobpl_const_284:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 146} unique __ctobpl_const_266:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 148} unique __ctobpl_const_285:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 148} unique __ctobpl_const_286:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 144} unique __ctobpl_const_280:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 143} unique __ctobpl_const_276:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 146} unique __ctobpl_const_269:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 148} unique __ctobpl_const_287:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 148} unique __ctobpl_const_288:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 143} unique __ctobpl_const_274:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 144} unique __ctobpl_const_278:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 144} unique __ctobpl_const_281:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 148} unique __ctobpl_const_289:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 146} unique __ctobpl_const_267:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 148} unique __ctobpl_const_290:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 146} unique __ctobpl_const_271:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 141} unique __ctobpl_const_260:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 142} unique __ctobpl_const_264:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 141} unique __ctobpl_const_259:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 146} unique __ctobpl_const_268:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_293:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 150} unique __ctobpl_const_299:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_317:int;
const {:extern} {:model_const "result.fgets"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_318:int;
const {:extern} {:model_const "argv[2]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_383:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_310:int;
const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_316:int;
const {:extern} {:model_const "maxsize"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_315:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 45} unique __ctobpl_const_319:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 151} unique __ctobpl_const_307:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_297:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 150} unique __ctobpl_const_302:int;
const {:extern} {:model_const "jstart"} {:sourceFile ".\v10\replace.c"} {:sourceLine 150} unique __ctobpl_const_304:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_292:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_296:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_298:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 151} unique __ctobpl_const_305:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 253} unique __ctobpl_const_320:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 151} unique __ctobpl_const_306:int;
const {:extern} {:model_const "jstart"} {:sourceFile ".\v10\replace.c"} {:sourceLine 150} unique __ctobpl_const_300:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 150} unique __ctobpl_const_303:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_295:int;
const {:extern} {:model_const "maxsize"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_312:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_294:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_311:int;
const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_313:int;
const {:extern} {:model_const "arg[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 151} unique __ctobpl_const_308:int;
const {:extern} {:model_const "s"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_314:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 149} unique __ctobpl_const_291:int;
const {:extern} {:model_const "pat[jstart]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 150} unique __ctobpl_const_301:int;
const {:extern} {:model_const "fgets.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 44} unique __ctobpl_const_309:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 183} unique __ctobpl_const_335:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 315} unique __ctobpl_const_351:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 177} unique __ctobpl_const_345:int;
const {:extern} {:model_const "flag"} {:sourceFile ".\v10\replace.c"} {:sourceLine 314} unique __ctobpl_const_350:int;
const {:extern} {:model_const "makeres"} {:sourceFile ".\v10\replace.c"} {:sourceLine 253} unique __ctobpl_const_324:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 253} unique __ctobpl_const_323:int;
const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 177} unique __ctobpl_const_349:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 299} unique __ctobpl_const_328:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 253} unique __ctobpl_const_322:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 299} unique __ctobpl_const_330:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 315} unique __ctobpl_const_352:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 184} unique __ctobpl_const_338:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 184} unique __ctobpl_const_339:int;
const {:extern} {:model_const "makeres"} {:sourceFile ".\v10\replace.c"} {:sourceLine 300} unique __ctobpl_const_333:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 183} unique __ctobpl_const_334:int;
const {:extern} {:model_const "result.makesub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 299} unique __ctobpl_const_332:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 299} unique __ctobpl_const_329:int;
const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 184} unique __ctobpl_const_342:int;
const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 183} unique __ctobpl_const_343:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 177} unique __ctobpl_const_344:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 183} unique __ctobpl_const_336:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 183} unique __ctobpl_const_337:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 177} unique __ctobpl_const_346:int;
const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 177} unique __ctobpl_const_347:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 299} unique __ctobpl_const_327:int;
const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 177} unique __ctobpl_const_348:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_447:int;
const {:extern} {:model_const "makeres"} {:sourceFile ".\v10\replace.c"} {:sourceLine 299} unique __ctobpl_const_331:int;
const {:extern} {:model_const "result.makepat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 253} unique __ctobpl_const_325:int;
const {:extern} {:model_const "makeres"} {:sourceFile ".\v10\replace.c"} {:sourceLine 254} unique __ctobpl_const_326:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 184} unique __ctobpl_const_340:int;
const {:extern} {:model_const "Pred.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 184} unique __ctobpl_const_341:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v10\replace.c"} {:sourceLine 318} unique __ctobpl_const_359:int;
const {:extern} {:model_const "argv"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_370:int;
const {:extern} {:model_const "getpat.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_373:int;
const {:extern} {:model_const "pat[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 318} unique __ctobpl_const_362:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 316} unique __ctobpl_const_357:int;
const {:extern} {:model_const "argc"} {:sourceFile ".\v10\replace.c"} {:sourceLine 541} unique __ctobpl_const_379:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 315} unique __ctobpl_const_353:int;
const {:extern} {:model_const "argv[1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_371:int;
const {:extern} {:model_const "getsub.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_381:int;
const {:extern} {:model_const "argc"} {:sourceFile ".\v10\replace.c"} {:sourceLine 528} unique __ctobpl_const_368:int;
const {:extern} {:model_const "argv"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_382:int;
const {:extern} {:model_const "flag"} {:sourceFile ".\v10\replace.c"} {:sourceLine 319} unique __ctobpl_const_365:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 322} unique __ctobpl_const_364:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 320} unique __ctobpl_const_366:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_374:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 322} unique __ctobpl_const_363:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 315} unique __ctobpl_const_354:int;
const {:extern} {:model_const "flag"} {:sourceFile ".\v10\replace.c"} {:sourceLine 324} unique __ctobpl_const_358:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_446:int;
const {:extern} {:model_const "result.getpat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_375:int;
const {:extern} {:model_const "pat[offset]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 315} unique __ctobpl_const_355:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 318} unique __ctobpl_const_361:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 535} unique __ctobpl_const_376:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 537} unique __ctobpl_const_377:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 318} unique __ctobpl_const_360:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 316} unique __ctobpl_const_356:int;
const {:extern} {:model_const "getpat.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_372:int;
const {:extern} {:model_const "offset"} {:sourceFile ".\v10\replace.c"} {:sourceLine 320} unique __ctobpl_const_367:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 537} unique __ctobpl_const_378:int;
const {:extern} {:model_const "sub[0]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 551} unique __ctobpl_const_380:int;
const {:extern} {:model_const "getpat.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 534} unique __ctobpl_const_369:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_472:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_450:int;
const {:extern} {:model_const "pat[lj]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_456:int;
const {:extern} {:model_const "in_set_2.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_453:int;
const {:extern} {:model_const "in_set_2.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_457:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 219} unique __ctobpl_const_452:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_467:int;
const {:extern} {:model_const "result.in_set_2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_459:int;
const {:extern} {:model_const "lj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 219} unique __ctobpl_const_451:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 223} unique __ctobpl_const_461:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_468:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_469:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_473:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_474:int;
const {:extern} {:model_const "getres"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_475:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_454:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 223} unique __ctobpl_const_462:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 223} unique __ctobpl_const_463:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 223} unique __ctobpl_const_465:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_470:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_471:int;
const {:extern} {:model_const "lj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_455:int;
const {:extern} {:model_const "result.getccl"} {:sourceFile ".\v10\replace.c"} {:sourceLine 214} unique __ctobpl_const_476:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 215} unique __ctobpl_const_477:int;
const {:extern} {:model_const "getres"} {:sourceFile ".\v10\replace.c"} {:sourceLine 215} unique __ctobpl_const_478:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_449:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 211} unique __ctobpl_const_479:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 223} unique __ctobpl_const_460:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_448:int;
const {:extern} {:model_const "in_set_2.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 220} unique __ctobpl_const_458:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 223} unique __ctobpl_const_464:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 221} unique __ctobpl_const_466:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 207} unique __ctobpl_const_491:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 211} unique __ctobpl_const_482:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 207} unique __ctobpl_const_492:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 231} unique __ctobpl_const_497:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 235} unique __ctobpl_const_505:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 235} unique __ctobpl_const_506:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 235} unique __ctobpl_const_507:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 207} unique __ctobpl_const_496:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 236} unique __ctobpl_const_508:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 236} unique __ctobpl_const_509:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 233} unique __ctobpl_const_501:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 236} unique __ctobpl_const_510:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 211} unique __ctobpl_const_480:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 232} unique __ctobpl_const_499:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 209} unique __ctobpl_const_490:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 207} unique __ctobpl_const_493:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 209} unique __ctobpl_const_488:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 233} unique __ctobpl_const_500:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 235} unique __ctobpl_const_502:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 209} unique __ctobpl_const_486:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 209} unique __ctobpl_const_487:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 209} unique __ctobpl_const_489:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 211} unique __ctobpl_const_481:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 211} unique __ctobpl_const_483:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 209} unique __ctobpl_const_485:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 207} unique __ctobpl_const_495:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 207} unique __ctobpl_const_494:int;
const {:extern} {:model_const "lj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 231} unique __ctobpl_const_498:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 235} unique __ctobpl_const_503:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 235} unique __ctobpl_const_504:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 211} unique __ctobpl_const_484:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 492} unique __ctobpl_const_749:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_735:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_752:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_739:int;
const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_738:int;
const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_734:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_742:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_756:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_757:int;
const {:extern} {:model_const "addstr.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_741:int;
const {:extern} {:model_const "jp"} {:sourceFile ".\v10\replace.c"} {:sourceLine 165} unique __ctobpl_const_746:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_744:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_755:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_758:int;
const {:extern} {:model_const "result.amatch"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_759:int;
const {:extern} {:model_const "pat[jp]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_737:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 495} unique __ctobpl_const_760:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 492} unique __ctobpl_const_750:int;
const {:extern} {:model_const "pat[lastj]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 171} unique __ctobpl_const_731:int;
const {:extern} {:model_const "jp"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_736:int;
const {:extern} {:model_const "jt"} {:sourceFile ".\v10\replace.c"} {:sourceLine 167} unique __ctobpl_const_732:int;
const {:extern} {:model_const "lin[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 492} unique __ctobpl_const_751:int;
const {:extern} {:model_const "lastm"} {:sourceFile ".\v10\replace.c"} {:sourceLine 495} unique __ctobpl_const_761:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 495} unique __ctobpl_const_762:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_754:int;
const {:extern} {:model_const "jp"} {:sourceFile ".\v10\replace.c"} {:sourceLine 167} unique __ctobpl_const_733:int;
const {:extern} {:model_const "lastm"} {:sourceFile ".\v10\replace.c"} {:sourceLine 490} unique __ctobpl_const_747:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 494} unique __ctobpl_const_753:int;
const {:extern} {:model_const "jt"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_740:int;
const {:extern} {:model_const "jt"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_743:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 168} unique __ctobpl_const_745:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 491} unique __ctobpl_const_748:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 165} unique __ctobpl_const_723:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 170} unique __ctobpl_const_725:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_711:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 170} unique __ctobpl_const_726:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 170} unique __ctobpl_const_727:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_713:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 170} unique __ctobpl_const_728:int;
const {:extern} {:model_const "s2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 470} unique __ctobpl_const_706:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_718:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 470} unique __ctobpl_const_705:int;
const {:extern} {:model_const "jp"} {:sourceFile ".\v10\replace.c"} {:sourceLine 165} unique __ctobpl_const_724:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 171} unique __ctobpl_const_729:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_715:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 171} unique __ctobpl_const_730:int;
const {:extern} {:model_const "s1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 470} unique __ctobpl_const_704:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_702:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_710:int;
const {:extern} {:model_const "lin[j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_714:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_716:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 470} unique __ctobpl_const_719:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 165} unique __ctobpl_const_721:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 470} unique __ctobpl_const_703:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 478} unique __ctobpl_const_708:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_709:int;
const {:extern} {:model_const "* j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 165} unique __ctobpl_const_722:int;
const {:extern} {:model_const "jp"} {:sourceFile ".\v10\replace.c"} {:sourceLine 165} unique __ctobpl_const_720:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 478} unique __ctobpl_const_707:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_701:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_712:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 472} unique __ctobpl_const_717:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 228} unique __ctobpl_const_438:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_443:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_444:int;
const {:extern} {:model_const "arg[i + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_421:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 212} unique __ctobpl_const_423:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 227} unique __ctobpl_const_432:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 229} unique __ctobpl_const_445:int;
const {:extern} {:model_const "result.esc"} {:sourceFile ".\v10\replace.c"} {:sourceLine 228} unique __ctobpl_const_442:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 217} unique __ctobpl_const_430:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 212} unique __ctobpl_const_425:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 227} unique __ctobpl_const_431:int;
const {:extern} {:model_const "delim"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_422:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 217} unique __ctobpl_const_426:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_417:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_419:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 217} unique __ctobpl_const_428:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 227} unique __ctobpl_const_434:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 227} unique __ctobpl_const_435:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 227} unique __ctobpl_const_436:int;
const {:extern} {:model_const "start"} {:sourceFile ".\v10\replace.c"} {:sourceLine 208} unique __ctobpl_const_415:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 217} unique __ctobpl_const_427:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 228} unique __ctobpl_const_437:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_416:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 227} unique __ctobpl_const_433:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 228} unique __ctobpl_const_439:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 228} unique __ctobpl_const_440:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_418:int;
const {:extern} {:model_const "start"} {:sourceFile ".\v10\replace.c"} {:sourceLine 217} unique __ctobpl_const_429:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 208} unique __ctobpl_const_414:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 210} unique __ctobpl_const_420:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 212} unique __ctobpl_const_424:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 228} unique __ctobpl_const_441:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 530} unique __ctobpl_const_392:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 208} unique __ctobpl_const_411:int;
const {:extern} {:model_const "getsub.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_384:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_399:int;
const {:extern} {:model_const "delim"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_402:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 206} unique __ctobpl_const_409:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 208} unique __ctobpl_const_413:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 530} unique __ctobpl_const_391:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 544} unique __ctobpl_const_388:int;
const {:extern} {:model_const "start"} {:sourceFile ".\v10\replace.c"} {:sourceLine 201} unique __ctobpl_const_395:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_403:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 203} unique __ctobpl_const_397:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_404:int;
const {:extern} {:model_const "getsub.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_385:int;
const {:extern} {:model_const "result.getsub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_387:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_400:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 543} unique __ctobpl_const_386:int;
const {:extern} {:model_const "done"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_398:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_405:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 546} unique __ctobpl_const_389:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 205} unique __ctobpl_const_407:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 206} unique __ctobpl_const_408:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 208} unique __ctobpl_const_412:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 546} unique __ctobpl_const_390:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 200} unique __ctobpl_const_393:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 201} unique __ctobpl_const_394:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 338} unique __ctobpl_const_573:int;
const {:extern} {:model_const "lastj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 202} unique __ctobpl_const_396:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 206} unique __ctobpl_const_410:int;
const {:extern} {:model_const "lj"} {:sourceFile ".\v10\replace.c"} {:sourceLine 205} unique __ctobpl_const_406:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 204} unique __ctobpl_const_401:int;
const {:extern} {:model_const "delim"} {:sourceFile ".\v10\replace.c"} {:sourceLine 280} unique __ctobpl_const_532:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 243} unique __ctobpl_const_518:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_527:int;
const {:extern} {:model_const "delim"} {:sourceFile ".\v10\replace.c"} {:sourceLine 236} unique __ctobpl_const_512:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 240} unique __ctobpl_const_514:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_522:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 280} unique __ctobpl_const_531:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_535:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 242} unique __ctobpl_const_516:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 237} unique __ctobpl_const_517:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 236} unique __ctobpl_const_511:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 269} unique __ctobpl_const_519:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 270} unique __ctobpl_const_520:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_524:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 280} unique __ctobpl_const_529:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_528:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 280} unique __ctobpl_const_530:int;
const {:extern} {:model_const "delim"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_525:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_533:int;
const {:extern} {:model_const "from"} {:sourceFile ".\v10\replace.c"} {:sourceLine 270} unique __ctobpl_const_521:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_523:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_538:int;
const {:extern} {:model_const "* sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_537:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_700:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 242} unique __ctobpl_const_515:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_539:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_540:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 284} unique __ctobpl_const_541:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_536:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 271} unique __ctobpl_const_526:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 239} unique __ctobpl_const_513:int;
const {:extern} {:model_const "* sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 283} unique __ctobpl_const_534:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 337} unique __ctobpl_const_572:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_562:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_558:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 273} unique __ctobpl_const_564:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 273} unique __ctobpl_const_566:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 273} unique __ctobpl_const_567:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_557:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_560:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 281} unique __ctobpl_const_545:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 275} unique __ctobpl_const_553:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 273} unique __ctobpl_const_565:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_561:int;
const {:extern} {:model_const "junk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 273} unique __ctobpl_const_568:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 287} unique __ctobpl_const_543:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 272} unique __ctobpl_const_548:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 275} unique __ctobpl_const_551:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 272} unique __ctobpl_const_547:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 287} unique __ctobpl_const_544:int;
const {:extern} {:model_const "arg[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 272} unique __ctobpl_const_549:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_563:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 278} unique __ctobpl_const_571:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_556:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 276} unique __ctobpl_const_559:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 275} unique __ctobpl_const_550:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 278} unique __ctobpl_const_570:int;
const {:extern} {:model_const "escjunk"} {:sourceFile ".\v10\replace.c"} {:sourceLine 275} unique __ctobpl_const_554:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 285} unique __ctobpl_const_542:int;
const {:extern} {:model_const "arg"} {:sourceFile ".\v10\replace.c"} {:sourceLine 275} unique __ctobpl_const_552:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 289} unique __ctobpl_const_546:int;
const {:extern} {:model_const "result.esc"} {:sourceFile ".\v10\replace.c"} {:sourceLine 275} unique __ctobpl_const_555:int;
const {:extern} {:model_const "result.addstr"} {:sourceFile ".\v10\replace.c"} {:sourceLine 273} unique __ctobpl_const_569:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_629:int;
const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_630:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 372} unique __ctobpl_const_614:int;
const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_610:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_631:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_632:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 360} unique __ctobpl_const_627:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 355} unique __ctobpl_const_620:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_611:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_606:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_633:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 363} unique __ctobpl_const_616:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_634:int;
const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_635:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 355} unique __ctobpl_const_621:int;
const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_607:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 356} unique __ctobpl_const_622:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_636:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 359} unique __ctobpl_const_625:int;
const {:extern} {:model_const "result.locate"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_613:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 363} unique __ctobpl_const_615:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 363} unique __ctobpl_const_617:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 359} unique __ctobpl_const_624:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 359} unique __ctobpl_const_626:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_608:int;
const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_612:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 364} unique __ctobpl_const_619:int;
const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_609:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_605:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 363} unique __ctobpl_const_618:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 359} unique __ctobpl_const_623:int;
const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_628:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 381} unique __ctobpl_const_653:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 381} unique __ctobpl_const_656:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 382} unique __ctobpl_const_658:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 381} unique __ctobpl_const_654:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_644:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_647:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 385} unique __ctobpl_const_659:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_639:int;
const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_665:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 395} unique __ctobpl_const_667:int;
const {:extern} {:model_const "result.locate"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_641:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_763:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_646:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_648:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 352} unique __ctobpl_const_650:int;
const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_640:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 379} unique __ctobpl_const_651:int;
const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_660:int;
const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_637:int;
const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 367} unique __ctobpl_const_638:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 368} unique __ctobpl_const_642:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 384} unique __ctobpl_const_652:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_661:int;
const {:extern} {:model_const "pat[n]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_663:int;
const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_664:int;
const {:extern} {:model_const "result.in_pat_set"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_666:int;
const {:extern} {:model_const "n"} {:sourceFile ".\v10\replace.c"} {:sourceLine 394} unique __ctobpl_const_662:int;
const {:extern} {:model_const "pat[j + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_649:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_643:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 381} unique __ctobpl_const_655:int;
const {:extern} {:model_const "advance"} {:sourceFile ".\v10\replace.c"} {:sourceLine 381} unique __ctobpl_const_657:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 351} unique __ctobpl_const_645:int;
const {:extern} {:model_const "n"} {:sourceFile ".\v10\replace.c"} {:sourceLine 406} unique __ctobpl_const_682:int;
const {:extern} {:model_const "size"} {:sourceFile ".\v10\replace.c"} {:sourceLine 400} unique __ctobpl_const_684:int;
const {:extern} {:model_const "sub[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 469} unique __ctobpl_const_692:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 395} unique __ctobpl_const_668:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 412} unique __ctobpl_const_673:int;
const {:extern} {:model_const "size"} {:sourceFile ".\v10\replace.c"} {:sourceLine 409} unique __ctobpl_const_678:int;
const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 412} unique __ctobpl_const_672:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 406} unique __ctobpl_const_681:int;
const {:extern} {:model_const "pat[n + 1]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 406} unique __ctobpl_const_683:int;
const {:extern} {:model_const "pat[n]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 412} unique __ctobpl_const_675:int;
const {:extern} {:model_const "n"} {:sourceFile ".\v10\replace.c"} {:sourceLine 412} unique __ctobpl_const_674:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 468} unique __ctobpl_const_687:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 468} unique __ctobpl_const_688:int;
const {:extern} {:model_const "n"} {:sourceFile ".\v10\replace.c"} {:sourceLine 398} unique __ctobpl_const_670:int;
const {:extern} {:model_const "size"} {:sourceFile ".\v10\replace.c"} {:sourceLine 403} unique __ctobpl_const_679:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 467} unique __ctobpl_const_686:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 469} unique __ctobpl_const_691:int;
const {:extern} {:model_const "sub[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 468} unique __ctobpl_const_689:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 469} unique __ctobpl_const_690:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_693:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_695:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_697:int;
const {:extern} {:model_const "sub[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_698:int;
const {:extern} {:model_const "size"} {:sourceFile ".\v10\replace.c"} {:sourceLine 406} unique __ctobpl_const_680:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_699:int;
const {:extern} {:model_const "pat[n]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 398} unique __ctobpl_const_671:int;
const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 412} unique __ctobpl_const_676:int;
const {:extern} {:model_const "size"} {:sourceFile ".\v10\replace.c"} {:sourceLine 414} unique __ctobpl_const_685:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_694:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 398} unique __ctobpl_const_669:int;
const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 412} unique __ctobpl_const_677:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 476} unique __ctobpl_const_696:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 344} unique __ctobpl_const_586:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 338} unique __ctobpl_const_576:int;
const {:extern} {:model_const "pat[j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_581:int;
const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 375} unique __ctobpl_const_590:int;
const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 375} unique __ctobpl_const_594:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 348} unique __ctobpl_const_588:int;
const {:extern} {:model_const "result"} {:sourceFile ".\v10\replace.c"} {:sourceLine 339} unique __ctobpl_const_577:int;
const {:extern} {:model_const "pat[j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 375} unique __ctobpl_const_593:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 338} unique __ctobpl_const_575:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 344} unique __ctobpl_const_585:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 375} unique __ctobpl_const_591:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 348} unique __ctobpl_const_587:int;
const {:extern} {:model_const "Caseerror.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 375} unique __ctobpl_const_595:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_596:int;
const {:extern} {:model_const "pat[j]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 348} unique __ctobpl_const_589:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_597:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 338} unique __ctobpl_const_574:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 375} unique __ctobpl_const_592:int;
const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_582:int;
const {:extern} {:model_const "* i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_598:int;
const {:extern} {:model_const "lin[* i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_599:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_601:int;
const {:extern} {:model_const "locate.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_602:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_603:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_604:int;
const {:extern} {:model_const "pat"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_579:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_580:int;
const {:extern} {:model_const "result.in_pat_set"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_584:int;
const {:extern} {:model_const "locate.arg.3"} {:sourceFile ".\v10\replace.c"} {:sourceLine 371} unique __ctobpl_const_600:int;
const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_578:int;
const {:extern} {:model_const "in_pat_set.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 342} unique __ctobpl_const_583:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_765:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_768:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 497} unique __ctobpl_const_772:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 503} unique __ctobpl_const_776:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_769:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_781:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_785:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_778:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_784:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_786:int;
const {:extern} {:model_const "fputc.arg.2"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_787:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_782:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 499} unique __ctobpl_const_774:int;
const {:extern} {:model_const "lastm"} {:sourceFile ".\v10\replace.c"} {:sourceLine 497} unique __ctobpl_const_771:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_770:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_779:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 499} unique __ctobpl_const_775:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 503} unique __ctobpl_const_777:int;
const {:extern} {:model_const "lin"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_767:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 501} unique __ctobpl_const_788:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 501} unique __ctobpl_const_789:int;
const {:extern} {:model_const "lin[i]"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_783:int;
const {:extern} {:model_const "m"} {:sourceFile ".\v10\replace.c"} {:sourceLine 499} unique __ctobpl_const_773:int;
const {:extern} {:model_const "sub"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_766:int;
const {:extern} {:model_const "fputc.arg.1"} {:sourceFile ".\v10\replace.c"} {:sourceLine 500} unique __ctobpl_const_780:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v10\replace.c"} {:sourceLine 496} unique __ctobpl_const_764:int;


procedure {:extern} __iob_func() returns (__dummy_ret__iob_func:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} abort() returns (__dummy_retabort:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} fgets(__dummy_formal_fgets_0.__1:int, __dummy_formal_fgets_1.__1:int, __dummy_formal_fgets_2.__1:int) returns (__dummy_retfgets:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} fputc(__dummy_formal_fputc_0.__1:int, __dummy_formal_fputc_1.__1:int) returns (__dummy_retfputc:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} isalnum(__dummy_formal_isalnum_0.__1:int) returns (__dummy_retisalnum:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern}  Caseerror(n.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fprintf.arg.1$3$ : int;
var {:extern} n : int;
var {:extern} result.__iob_func$2 : int;
var {:extern} result.fprintf$1 : int;
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

$fprintf.arg.1$3$:= 0;//Init locals 
n:= 0;//Init locals 
result.__iob_func$2:= 0;//Init locals 
result.fprintf$1:= 0;//Init locals 
n := n.__1;
goto label_3;


// .\v10\replace.c(562)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 562} true;
call result.__iob_func$2 := __iob_func ();
goto label_6;


// .\v10\replace.c(562)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 562} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$2 != 0);
$fprintf.arg.1$3$ := PLUS(result.__iob_func$2, 32, 1) ;
assume value_is(__ctobpl_const_1, $fprintf.arg.1$3$);
assume value_is(__ctobpl_const_2, result.__iob_func$2);
goto label_7;


// .\v10\replace.c(562)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 562} true;
call result.fprintf$1 := det_choice(); // havoc result.fprintf$1;
// skip fprintf
goto label_10;


// .\v10\replace.c(563)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 563} true;
// skip exit
return;


// .\v10\replace.c(564)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 564} true;
assume false;
return;

}



procedure {:extern}  addstr(c.__1:int, outset.__1:int, j.__1:int, maxset.__1:int) returns (result.addstr$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} c : int;
var {:extern} j : int;
var {:extern} maxset : int;
var {:extern} outset : int;
var {:extern} result : int;
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

assume INT_LT(outset.__1, alloc);
assume INT_LT(j.__1, alloc);
c:= 0;//Init locals 
j:= 0;//Init locals 
maxset:= 0;//Init locals 
outset:= 0;//Init locals 
result:= 0;//Init locals 
result.addstr$1 := 0;//initialize returns 
c := c.__1;
outset := outset.__1;
j := j.__1;
maxset := maxset.__1;
goto label_3;


// .\v10\replace.c(54)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 54} true;
goto label_4;


// .\v10\replace.c(55)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 55} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
goto label_4_true , label_4_false ;


label_4_true :
assume (INT_LEQ(maxset, Mem_T.INT4[j]));
assume value_is(__ctobpl_const_3, maxset);
assume value_is(__ctobpl_const_4, j);
assume value_is(__ctobpl_const_5, Mem_T.INT4[j]);
goto label_6;


label_4_false :
assume !(INT_LEQ(maxset, Mem_T.INT4[j]));
assume value_is(__ctobpl_const_3, maxset);
assume value_is(__ctobpl_const_4, j);
assume value_is(__ctobpl_const_5, Mem_T.INT4[j]);
goto label_5;


// .\v10\replace.c(58)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 58} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
//TAG: Dereferenced object is non-null
assert(outset != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(outset, 1, Mem_T.INT4[j]) := c];
assume value_is(__ctobpl_const_6, outset);
assume value_is(__ctobpl_const_7, j);
assume value_is(__ctobpl_const_8, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_9, Mem_T.CHAR[PLUS(outset, 1, Mem_T.INT4[j])]);
assume value_is(__ctobpl_const_10, c);
goto label_8;


// .\v10\replace.c(59)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 59} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
//TAG: Dereferenced object is non-null
assert(j != 0);
Mem_T.INT4 := Mem_T.INT4[j := PLUS(Mem_T.INT4[j], 1, 1)];
assume value_is(__ctobpl_const_11, j);
assume value_is(__ctobpl_const_12, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_13, j);
assume value_is(__ctobpl_const_14, Mem_T.INT4[j]);
goto label_9;


// .\v10\replace.c(60)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 60} true;
result := 1 ;
assume value_is(__ctobpl_const_15, result);
goto label_7;


// .\v10\replace.c(56)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 56} true;
result := 0 ;
assume value_is(__ctobpl_const_16, result);
goto label_7;


// .\v10\replace.c(62)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 62} true;
result.addstr$1 := result ;
assume value_is(__ctobpl_const_17, result);
goto label_1;


// .\v10\replace.c(63)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 63} true;
return;

}



procedure {:extern}  amatch(lin.__1:int, offset.__1:int, pat.__1:int, j.__1:int) returns (result.amatch$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $amatch.arg.4$6$ : int;
var {:extern} done : int;
var {:extern} i : int;
var {:extern} j : int;
var {:extern} k : int;
var {:extern} lin : int;
var {:extern} offset : int;
var {:extern} pat : int;
var {:extern} result : int;
var {:extern} result.amatch$4 : int;
var {:extern} result.omatch$3 : int;
var {:extern} result.omatch$7 : int;
var {:extern} result.patsize$2 : int;
var {:extern} result.patsize$5 : int;
var {:extern} result.patsize$8 : int;
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

assume INT_LT(lin.__1, alloc);
assume INT_LT(pat.__1, alloc);
$amatch.arg.4$6$:= 0;//Init locals 
done:= 0;//Init locals 
call i := __HAVOC_det_malloc(4);
j:= 0;//Init locals 
k:= 0;//Init locals 
lin:= 0;//Init locals 
call offset := __HAVOC_det_malloc(4);
pat:= 0;//Init locals 
result:= 0;//Init locals 
result.amatch$1 := 0;//initialize returns 
result.amatch$4:= 0;//Init locals 
result.omatch$3:= 0;//Init locals 
result.omatch$7:= 0;//Init locals 
result.patsize$2:= 0;//Init locals 
result.patsize$5:= 0;//Init locals 
result.patsize$8:= 0;//Init locals 
lin := lin.__1;
Mem_T.INT4 := Mem_T.INT4[offset := offset.__1];
pat := pat.__1;
j := j.__1;
goto label_3;


// .\v10\replace.c(424)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 424} true;
goto label_4;


// .\v10\replace.c(424)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 424} true;
goto label_5;


// .\v10\replace.c(425)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 425} true;
goto label_6;


// .\v10\replace.c(425)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 425} true;
goto label_7;


// .\v10\replace.c(427)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 427} true;
done := 0 ;
assume value_is(__ctobpl_const_18, done);
goto label_8;


// .\v10\replace.c(428)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 428} true;
// loop entry initialization...
goto label_8_head;


label_8_head:
// loop head assertions...

// end loop head assertions

goto label_8_true , label_8_false ;


label_8_true :
assume (done != 0);
assume value_is(__ctobpl_const_19, done);
goto label_10;


label_8_false :
assume (done == 0);
assume value_is(__ctobpl_const_19, done);
goto label_9;


// .\v10\replace.c(428)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 428} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
goto label_9_true , label_9_false ;


label_9_true :
assume (Mem_T.CHAR[PLUS(pat, 1, j)] != 0);
assume value_is(__ctobpl_const_20, pat);
assume value_is(__ctobpl_const_21, j);
assume value_is(__ctobpl_const_22, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_11;


label_9_false :
assume (Mem_T.CHAR[PLUS(pat, 1, j)] == 0);
assume value_is(__ctobpl_const_20, pat);
assume value_is(__ctobpl_const_21, j);
assume value_is(__ctobpl_const_22, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_10;


// .\v10\replace.c(429)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 429} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
goto label_11_true , label_11_false ;


label_11_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 42));
assume value_is(__ctobpl_const_23, pat);
assume value_is(__ctobpl_const_24, j);
assume value_is(__ctobpl_const_25, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_15;


label_11_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 42));
assume value_is(__ctobpl_const_23, pat);
assume value_is(__ctobpl_const_24, j);
assume value_is(__ctobpl_const_25, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_12;


// .\v10\replace.c(448)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 448} true;
call result.omatch$7 := omatch (lin, offset, pat, j);
assume value_is(__ctobpl_const_26, lin);
assume value_is(__ctobpl_const_27, Mem_T.INT4[offset]);
assume value_is(__ctobpl_const_28, pat);
assume value_is(__ctobpl_const_29, j);
assume value_is(__ctobpl_const_30, lin);
assume value_is(__ctobpl_const_31, Mem_T.INT4[offset]);
assume value_is(__ctobpl_const_32, pat);
assume value_is(__ctobpl_const_33, j);
goto label_44;


// .\v10\replace.c(448)
label_44:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 448} true;
result := result.omatch$7 ;
assume value_is(__ctobpl_const_34, result);
assume value_is(__ctobpl_const_35, result.omatch$7);
goto label_45;


// .\v10\replace.c(449)
label_45:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 449} true;
goto label_45_true , label_45_false ;


label_45_true :
assume (result != 0);
assume value_is(__ctobpl_const_36, result);
goto label_47;


label_45_false :
assume (result == 0);
assume value_is(__ctobpl_const_36, result);
goto label_46;


// .\v10\replace.c(450)
label_46:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 450} true;
Mem_T.INT4 := Mem_T.INT4[offset := -1];
assume value_is(__ctobpl_const_37, Mem_T.INT4[offset]);
goto label_51;


// .\v10\replace.c(451)
label_51:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 451} true;
done := 1 ;
assume value_is(__ctobpl_const_38, done);
goto label_8_head;


// .\v10\replace.c(453)
label_47:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 453} true;
call result.patsize$8 := patsize (pat, j);
assume value_is(__ctobpl_const_39, pat);
assume value_is(__ctobpl_const_40, j);
assume value_is(__ctobpl_const_41, pat);
assume value_is(__ctobpl_const_42, j);
goto label_50;


// .\v10\replace.c(453)
label_50:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 453} true;
j := PLUS(j, 1, result.patsize$8) ;
assume value_is(__ctobpl_const_43, j);
assume value_is(__ctobpl_const_44, j);
assume value_is(__ctobpl_const_45, result.patsize$8);
goto label_8_head;


// .\v10\replace.c(430)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 430} true;
call result.patsize$2 := patsize (pat, j);
assume value_is(__ctobpl_const_46, pat);
assume value_is(__ctobpl_const_47, j);
assume value_is(__ctobpl_const_48, pat);
assume value_is(__ctobpl_const_49, j);
goto label_18;


// .\v10\replace.c(430)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 430} true;
j := PLUS(j, 1, result.patsize$2) ;
assume value_is(__ctobpl_const_50, j);
assume value_is(__ctobpl_const_51, j);
assume value_is(__ctobpl_const_52, result.patsize$2);
goto label_19;


// .\v10\replace.c(431)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 431} true;
Mem_T.INT4 := Mem_T.INT4[i := Mem_T.INT4[offset]];
assume value_is(__ctobpl_const_53, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_54, Mem_T.INT4[offset]);
goto label_20;


// .\v10\replace.c(432)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 432} true;
// loop entry initialization...
goto label_20_head;


label_20_head:
// loop head assertions...

// end loop head assertions

goto label_20_true , label_20_false ;


label_20_true :
assume (done != 0);
assume value_is(__ctobpl_const_55, done);
goto label_22;


label_20_false :
assume (done == 0);
assume value_is(__ctobpl_const_55, done);
goto label_21;


// .\v10\replace.c(432)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 432} true;
//TAG: Dereferenced object is non-null
assert(lin != 0);
goto label_21_true , label_21_false ;


label_21_true :
assume (Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] != 0);
assume value_is(__ctobpl_const_56, lin);
assume value_is(__ctobpl_const_57, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_38;


label_21_false :
assume (Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] == 0);
assume value_is(__ctobpl_const_56, lin);
assume value_is(__ctobpl_const_57, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_58, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_22;


// .\v10\replace.c(433)
label_38:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 433} true;
call result.omatch$3 := omatch (lin, i, pat, j);
assume value_is(__ctobpl_const_59, lin);
assume value_is(__ctobpl_const_60, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_61, pat);
assume value_is(__ctobpl_const_62, j);
assume value_is(__ctobpl_const_63, lin);
assume value_is(__ctobpl_const_64, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_65, pat);
assume value_is(__ctobpl_const_66, j);
goto label_41;


// .\v10\replace.c(433)
label_41:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 433} true;
result := result.omatch$3 ;
assume value_is(__ctobpl_const_67, result);
assume value_is(__ctobpl_const_68, result.omatch$3);
goto label_42;


// .\v10\replace.c(434)
label_42:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 434} true;
goto label_42_true , label_42_false ;


label_42_true :
assume (result != 0);
assume value_is(__ctobpl_const_69, result);
goto label_20_head;


label_42_false :
assume (result == 0);
assume value_is(__ctobpl_const_69, result);
goto label_43;


// .\v10\replace.c(435)
label_43:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 435} true;
done := 1 ;
assume value_is(__ctobpl_const_70, done);
goto label_20_head;


// .\v10\replace.c(437)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 437} true;
done := 0 ;
assume value_is(__ctobpl_const_71, done);
goto label_23;


// .\v10\replace.c(438)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 438} true;
// loop entry initialization...
goto label_23_head;


label_23_head:
// loop head assertions...

// end loop head assertions

goto label_23_true , label_23_false ;


label_23_true :
assume (done != 0);
assume value_is(__ctobpl_const_72, done);
goto label_25;


label_23_false :
assume (done == 0);
assume value_is(__ctobpl_const_72, done);
goto label_24;


// .\v10\replace.c(438)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 438} true;
goto label_24_true , label_24_false ;


label_24_true :
assume (INT_LEQ(Mem_T.INT4[offset], Mem_T.INT4[i]));
assume value_is(__ctobpl_const_73, Mem_T.INT4[offset]);
assume value_is(__ctobpl_const_74, Mem_T.INT4[i]);
goto label_27;


label_24_false :
assume !(INT_LEQ(Mem_T.INT4[offset], Mem_T.INT4[i]));
assume value_is(__ctobpl_const_73, Mem_T.INT4[offset]);
assume value_is(__ctobpl_const_74, Mem_T.INT4[i]);
goto label_25;


// .\v10\replace.c(439)
label_27:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 439} true;
call result.patsize$5 := patsize (pat, j);
assume value_is(__ctobpl_const_75, pat);
assume value_is(__ctobpl_const_76, j);
assume value_is(__ctobpl_const_77, pat);
assume value_is(__ctobpl_const_78, j);
goto label_30;


// .\v10\replace.c(439)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 439} true;
$amatch.arg.4$6$ := PLUS(j, 1, result.patsize$5) ;
assume value_is(__ctobpl_const_79, $amatch.arg.4$6$);
assume value_is(__ctobpl_const_80, j);
assume value_is(__ctobpl_const_81, result.patsize$5);
goto label_31;


// .\v10\replace.c(439)
label_31:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 439} true;
call result.amatch$4 := amatch (lin, Mem_T.INT4[i], pat, $amatch.arg.4$6$);
assume value_is(__ctobpl_const_82, lin);
assume value_is(__ctobpl_const_83, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_84, pat);
assume value_is(__ctobpl_const_85, $amatch.arg.4$6$);
assume value_is(__ctobpl_const_86, lin);
assume value_is(__ctobpl_const_87, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_88, pat);
assume value_is(__ctobpl_const_89, $amatch.arg.4$6$);
goto label_34;


// .\v10\replace.c(439)
label_34:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 439} true;
k := result.amatch$4 ;
assume value_is(__ctobpl_const_90, k);
assume value_is(__ctobpl_const_91, result.amatch$4);
goto label_35;


// .\v10\replace.c(440)
label_35:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 440} true;
goto label_35_true , label_35_false ;


label_35_true :
assume (INT_LEQ(0, k));
assume value_is(__ctobpl_const_92, k);
goto label_37;


label_35_false :
assume !(INT_LEQ(0, k));
assume value_is(__ctobpl_const_92, k);
goto label_36;


// .\v10\replace.c(443)
label_36:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 443} true;
Mem_T.INT4 := Mem_T.INT4[i := MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_93, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_94, Mem_T.INT4[i]);
goto label_23_head;


// .\v10\replace.c(441)
label_37:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 441} true;
done := 1 ;
assume value_is(__ctobpl_const_95, done);
goto label_23_head;


// .\v10\replace.c(445)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 445} true;
Mem_T.INT4 := Mem_T.INT4[offset := k];
assume value_is(__ctobpl_const_96, Mem_T.INT4[offset]);
assume value_is(__ctobpl_const_97, k);
goto label_26;


// .\v10\replace.c(446)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 446} true;
done := 1 ;
assume value_is(__ctobpl_const_98, done);
goto label_8_head;


// .\v10\replace.c(456)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 456} true;
assume false;
return;


// .\v10\replace.c(455)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 455} true;
result.amatch$1 := Mem_T.INT4[offset] ;
assume value_is(__ctobpl_const_99, Mem_T.INT4[offset]);
goto label_1;


// .\v10\replace.c(456)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 456} true;
call __HAVOC_free(i);
call __HAVOC_free(offset);
return;

}



procedure {:extern}  change(pat.__1:int, sub.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $getline.arg.1$2$ : int;
var {:extern} $getline.arg.1$5$ : int;
var {:extern} line : int;
var {:extern} pat : int;
var {:extern} result : int;
var {:extern} result.getline$1 : int;
var {:extern} result.getline$4 : int;
var {:extern} sub : int;
var {:extern} $subline.arg.1$3$ : int;
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

assume INT_LT(pat.__1, alloc);
assume INT_LT(sub.__1, alloc);
$getline.arg.1$2$:= 0;//Init locals 
$getline.arg.1$5$:= 0;//Init locals 
line:= 0;//Init locals 
pat:= 0;//Init locals 
result:= 0;//Init locals 
result.getline$1:= 0;//Init locals 
result.getline$4:= 0;//Init locals 
sub:= 0;//Init locals 
$subline.arg.1$3$:= 0;//Init locals 
pat := pat.__1;
sub := sub.__1;
goto label_3;


// .\v10\replace.c(511)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 511} true;
goto label_4;


// .\v10\replace.c(512)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 512} true;
goto label_5;


// .\v10\replace.c(514)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 514} true;
// skipped OP_UNARY assignment to array
goto label_6;


// .\v10\replace.c(514)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 514} true;
call result.getline$1 := getline ($getline.arg.1$2$, 100);
goto label_9;


// .\v10\replace.c(514)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 514} true;
result := result.getline$1 ;
assume value_is(__ctobpl_const_100, result);
assume value_is(__ctobpl_const_101, result.getline$1);
goto label_10;


// .\v10\replace.c(515)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 515} true;
// loop entry initialization...
goto label_10_head;


label_10_head:
// loop head assertions...

// end loop head assertions

goto label_10_true , label_10_false ;


label_10_true :
assume (result != 0);
assume value_is(__ctobpl_const_102, result);
goto label_11;


label_10_false :
assume (result == 0);
assume value_is(__ctobpl_const_102, result);
goto label_1;


// .\v10\replace.c(519)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 519} true;
return;


// .\v10\replace.c(516)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 516} true;
// skipped OP_UNARY assignment to array
goto label_12;


// .\v10\replace.c(516)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 516} true;
call subline ($subline.arg.1$3$, pat, sub);
assume value_is(__ctobpl_const_103, pat);
assume value_is(__ctobpl_const_104, sub);
assume value_is(__ctobpl_const_105, pat);
assume value_is(__ctobpl_const_106, sub);
goto label_15;


// .\v10\replace.c(517)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 517} true;
// skipped OP_UNARY assignment to array
goto label_16;


// .\v10\replace.c(517)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 517} true;
call result.getline$4 := getline ($getline.arg.1$5$, 100);
goto label_19;


// .\v10\replace.c(517)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 517} true;
result := result.getline$4 ;
assume value_is(__ctobpl_const_107, result);
assume value_is(__ctobpl_const_108, result.getline$4);
goto label_10_head;


// .\v10\replace.c(519)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 519} true;
assume false;
return;

}



procedure {:extern}  dodash(delim.__1:int, src.__1:int, i.__1:int, dest.__1:int, j.__1:int, maxset.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $addstr.arg.1$4$ : int;
var {:extern} delim : int;
var {:extern} dest : int;
var {:extern} escjunk : int;
var {:extern} i : int;
var {:extern} $isalnum.arg.1$7$ : int;
var {:extern} j : int;
var {:extern} junk : int;
var {:extern} k : int;
var {:extern} maxset : int;
var {:extern} result.addstr$2 : int;
var {:extern} result.addstr$3 : int;
var {:extern} result.addstr$5 : int;
var {:extern} result.addstr$8 : int;
var {:extern} result.addstr$9 : int;
var {:extern} result.esc$1 : int;
var {:extern} result.isalnum$6 : int;
var {:extern} src : int;
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

assume INT_LT(src.__1, alloc);
assume INT_LT(i.__1, alloc);
assume INT_LT(dest.__1, alloc);
assume INT_LT(j.__1, alloc);
$addstr.arg.1$4$:= 0;//Init locals 
delim:= 0;//Init locals 
dest:= 0;//Init locals 
escjunk:= 0;//Init locals 
i:= 0;//Init locals 
$isalnum.arg.1$7$:= 0;//Init locals 
j:= 0;//Init locals 
junk:= 0;//Init locals 
k:= 0;//Init locals 
maxset:= 0;//Init locals 
result.addstr$2:= 0;//Init locals 
result.addstr$3:= 0;//Init locals 
result.addstr$5:= 0;//Init locals 
result.addstr$8:= 0;//Init locals 
result.addstr$9:= 0;//Init locals 
result.esc$1:= 0;//Init locals 
result.isalnum$6:= 0;//Init locals 
src:= 0;//Init locals 
delim := delim.__1;
src := src.__1;
i := i.__1;
dest := dest.__1;
j := j.__1;
maxset := maxset.__1;
goto label_3;


// .\v10\replace.c(101)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 101} true;
goto label_4;


// .\v10\replace.c(102)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 102} true;
goto label_5;


// .\v10\replace.c(103)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 103} true;
goto label_6;


// .\v10\replace.c(105)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 105} true;
// loop entry initialization...
goto label_6_head;


label_6_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_6_true , label_6_false ;


label_6_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_109, src);
assume value_is(__ctobpl_const_110, i);
assume value_is(__ctobpl_const_111, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_112, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_113, delim);
goto label_7;


label_6_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_109, src);
assume value_is(__ctobpl_const_110, i);
assume value_is(__ctobpl_const_111, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_112, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_113, delim);
goto label_1;


// .\v10\replace.c(105)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 105} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_7_true , label_7_false ;


label_7_true :
assume (Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])] != 0);
assume value_is(__ctobpl_const_114, src);
assume value_is(__ctobpl_const_115, i);
assume value_is(__ctobpl_const_116, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_117, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
goto label_8;


label_7_false :
assume (Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])] == 0);
assume value_is(__ctobpl_const_114, src);
assume value_is(__ctobpl_const_115, i);
assume value_is(__ctobpl_const_116, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_117, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
goto label_1;


// .\v10\replace.c(129)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 129} true;
return;


// .\v10\replace.c(107)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 107} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_8_true , label_8_false ;


label_8_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))], 64));
assume value_is(__ctobpl_const_118, src);
assume value_is(__ctobpl_const_119, i);
assume value_is(__ctobpl_const_120, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_121, Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))]);
goto label_10;


label_8_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))], 64));
assume value_is(__ctobpl_const_118, src);
assume value_is(__ctobpl_const_119, i);
assume value_is(__ctobpl_const_120, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_121, Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))]);
goto label_9;


// .\v10\replace.c(111)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 111} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_9_true , label_9_false ;


label_9_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], 45));
assume value_is(__ctobpl_const_122, src);
assume value_is(__ctobpl_const_123, i);
assume value_is(__ctobpl_const_124, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_125, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
goto label_20;


label_9_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])], 45));
assume value_is(__ctobpl_const_122, src);
assume value_is(__ctobpl_const_123, i);
assume value_is(__ctobpl_const_124, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_125, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
goto label_19;


// .\v10\replace.c(113)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 113} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
goto label_19_true , label_19_false ;


label_19_true :
assume (INT_LEQ(Mem_T.INT4[j], 1));
assume value_is(__ctobpl_const_126, j);
assume value_is(__ctobpl_const_127, Mem_T.INT4[j]);
goto label_26;


label_19_false :
assume !(INT_LEQ(Mem_T.INT4[j], 1));
assume value_is(__ctobpl_const_126, j);
assume value_is(__ctobpl_const_127, Mem_T.INT4[j]);
goto label_25;


// .\v10\replace.c(113)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 113} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_25_true , label_25_false ;


label_25_true :
assume (Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))] != 0);
assume value_is(__ctobpl_const_128, src);
assume value_is(__ctobpl_const_129, i);
assume value_is(__ctobpl_const_130, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_131, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_30;


label_25_false :
assume (Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))] == 0);
assume value_is(__ctobpl_const_128, src);
assume value_is(__ctobpl_const_129, i);
assume value_is(__ctobpl_const_130, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_131, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_26;


// .\v10\replace.c(115)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 115} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
$isalnum.arg.1$7$ := Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))] ;
assume value_is(__ctobpl_const_132, $isalnum.arg.1$7$);
assume value_is(__ctobpl_const_133, src);
assume value_is(__ctobpl_const_134, i);
assume value_is(__ctobpl_const_135, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_136, Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))]);
goto label_31;


// .\v10\replace.c(115)
label_31:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 115} true;
call result.isalnum$6 := isalnum ($isalnum.arg.1$7$);
assume value_is(__ctobpl_const_137, $isalnum.arg.1$7$);
assume value_is(__ctobpl_const_138, $isalnum.arg.1$7$);
goto label_34;


// .\v10\replace.c(115)
label_34:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 115} true;
goto label_34_true , label_34_false ;


label_34_true :
assume (result.isalnum$6 != 0);
assume value_is(__ctobpl_const_139, result.isalnum$6);
goto label_38;


label_34_false :
assume (result.isalnum$6 == 0);
assume value_is(__ctobpl_const_139, result.isalnum$6);
goto label_35;


// .\v10\replace.c(117)
label_38:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 117} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_38_true , label_38_false ;


label_38_true :
assume (INT_LEQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))], Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]));
assume value_is(__ctobpl_const_140, src);
assume value_is(__ctobpl_const_141, i);
assume value_is(__ctobpl_const_142, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_143, Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))]);
assume value_is(__ctobpl_const_144, src);
assume value_is(__ctobpl_const_145, i);
assume value_is(__ctobpl_const_146, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_147, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_39;


label_38_false :
assume !(INT_LEQ(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))], Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]));
assume value_is(__ctobpl_const_140, src);
assume value_is(__ctobpl_const_141, i);
assume value_is(__ctobpl_const_142, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_143, Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))]);
assume value_is(__ctobpl_const_144, src);
assume value_is(__ctobpl_const_145, i);
assume value_is(__ctobpl_const_146, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_147, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_35;


// .\v10\replace.c(126)
label_35:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 126} true;
call result.addstr$9 := addstr (45, dest, j, maxset);
assume value_is(__ctobpl_const_148, dest);
assume value_is(__ctobpl_const_149, j);
assume value_is(__ctobpl_const_150, maxset);
assume value_is(__ctobpl_const_151, dest);
assume value_is(__ctobpl_const_152, j);
assume value_is(__ctobpl_const_153, maxset);
goto label_47;


// .\v10\replace.c(126)
label_47:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 126} true;
junk := result.addstr$9 ;
assume value_is(__ctobpl_const_154, junk);
assume value_is(__ctobpl_const_155, result.addstr$9);
goto label_18;


// .\v10\replace.c(119)
label_39:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 119} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
k := PLUS(Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))], 1, 1) ;
assume value_is(__ctobpl_const_156, k);
assume value_is(__ctobpl_const_157, src);
assume value_is(__ctobpl_const_158, i);
assume value_is(__ctobpl_const_159, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_160, Mem_T.CHAR[PLUS(src, 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[i], 1, 1))]);
goto label_40;


// .\v10\replace.c(119)
label_40:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 119} true;
// loop entry initialization...
goto label_40_head;


label_40_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
goto label_40_true , label_40_false ;


label_40_true :
assume (INT_LEQ(k, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]));
assume value_is(__ctobpl_const_161, k);
assume value_is(__ctobpl_const_162, src);
assume value_is(__ctobpl_const_163, i);
assume value_is(__ctobpl_const_164, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_165, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_42;


label_40_false :
assume !(INT_LEQ(k, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]));
assume value_is(__ctobpl_const_161, k);
assume value_is(__ctobpl_const_162, src);
assume value_is(__ctobpl_const_163, i);
assume value_is(__ctobpl_const_164, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_165, Mem_T.CHAR[PLUS(src, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_41;


// .\v10\replace.c(123)
label_41:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 123} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_166, i);
assume value_is(__ctobpl_const_167, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_168, i);
assume value_is(__ctobpl_const_169, Mem_T.INT4[i]);
goto label_18;


// .\v10\replace.c(121)
label_42:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 121} true;
call result.addstr$8 := addstr (k, dest, j, maxset);
assume value_is(__ctobpl_const_170, k);
assume value_is(__ctobpl_const_171, dest);
assume value_is(__ctobpl_const_172, j);
assume value_is(__ctobpl_const_173, maxset);
assume value_is(__ctobpl_const_174, k);
assume value_is(__ctobpl_const_175, dest);
assume value_is(__ctobpl_const_176, j);
assume value_is(__ctobpl_const_177, maxset);
goto label_45;


// .\v10\replace.c(121)
label_45:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 121} true;
junk := result.addstr$8 ;
assume value_is(__ctobpl_const_178, junk);
assume value_is(__ctobpl_const_179, result.addstr$8);
goto label_46;


// .\v10\replace.c(119)
label_46:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 119} true;
assume value_is(__ctobpl_const_180, k);
k := PLUS(k, 1, 1) ;
goto label_40_head;


// .\v10\replace.c(114)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 114} true;
call result.addstr$5 := addstr (45, dest, j, maxset);
assume value_is(__ctobpl_const_181, dest);
assume value_is(__ctobpl_const_182, j);
assume value_is(__ctobpl_const_183, maxset);
assume value_is(__ctobpl_const_184, dest);
assume value_is(__ctobpl_const_185, j);
assume value_is(__ctobpl_const_186, maxset);
goto label_29;


// .\v10\replace.c(114)
label_29:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 114} true;
junk := result.addstr$5 ;
assume value_is(__ctobpl_const_187, junk);
assume value_is(__ctobpl_const_188, result.addstr$5);
goto label_18;


// .\v10\replace.c(112)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 112} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(src != 0);
$addstr.arg.1$4$ := Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])] ;
assume value_is(__ctobpl_const_189, $addstr.arg.1$4$);
assume value_is(__ctobpl_const_190, src);
assume value_is(__ctobpl_const_191, i);
assume value_is(__ctobpl_const_192, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_193, Mem_T.CHAR[PLUS(src, 1, Mem_T.INT4[i])]);
goto label_21;


// .\v10\replace.c(112)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 112} true;
call result.addstr$3 := addstr ($addstr.arg.1$4$, dest, j, maxset);
assume value_is(__ctobpl_const_194, $addstr.arg.1$4$);
assume value_is(__ctobpl_const_195, dest);
assume value_is(__ctobpl_const_196, j);
assume value_is(__ctobpl_const_197, maxset);
assume value_is(__ctobpl_const_198, $addstr.arg.1$4$);
assume value_is(__ctobpl_const_199, dest);
assume value_is(__ctobpl_const_200, j);
assume value_is(__ctobpl_const_201, maxset);
goto label_24;


// .\v10\replace.c(112)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 112} true;
junk := result.addstr$3 ;
assume value_is(__ctobpl_const_202, junk);
assume value_is(__ctobpl_const_203, result.addstr$3);
goto label_18;


// .\v10\replace.c(108)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 108} true;
call result.esc$1 := esc (src, i);
assume value_is(__ctobpl_const_204, src);
assume value_is(__ctobpl_const_205, i);
assume value_is(__ctobpl_const_206, src);
assume value_is(__ctobpl_const_207, i);
goto label_13;


// .\v10\replace.c(108)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 108} true;
escjunk := result.esc$1 ;
assume value_is(__ctobpl_const_208, escjunk);
assume value_is(__ctobpl_const_209, result.esc$1);
goto label_14;


// .\v10\replace.c(109)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 109} true;
call result.addstr$2 := addstr (escjunk, dest, j, maxset);
assume value_is(__ctobpl_const_210, escjunk);
assume value_is(__ctobpl_const_211, dest);
assume value_is(__ctobpl_const_212, j);
assume value_is(__ctobpl_const_213, maxset);
assume value_is(__ctobpl_const_214, escjunk);
assume value_is(__ctobpl_const_215, dest);
assume value_is(__ctobpl_const_216, j);
assume value_is(__ctobpl_const_217, maxset);
goto label_17;


// .\v10\replace.c(109)
label_17:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 109} true;
junk := result.addstr$2 ;
assume value_is(__ctobpl_const_218, junk);
assume value_is(__ctobpl_const_219, result.addstr$2);
goto label_18;


// .\v10\replace.c(127)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 127} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_220, i);
assume value_is(__ctobpl_const_221, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_222, i);
assume value_is(__ctobpl_const_223, Mem_T.INT4[i]);
goto label_6_head;


// .\v10\replace.c(129)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 129} true;
assume false;
return;

}



procedure {:extern}  esc(s.__1:int, i.__1:int) returns (result.esc$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} i : int;
var {:extern} result : int;
var {:extern} s : int;
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

assume INT_LT(s.__1, alloc);
assume INT_LT(i.__1, alloc);
i:= 0;//Init locals 
result:= 0;//Init locals 
result.esc$1 := 0;//initialize returns 
s:= 0;//Init locals 
s := s.__1;
i := i.__1;
goto label_3;


// .\v10\replace.c(70)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 70} true;
goto label_4;


// .\v10\replace.c(71)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 71} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(s != 0);
goto label_4_true , label_4_false ;


label_4_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 64));
assume value_is(__ctobpl_const_224, s);
assume value_is(__ctobpl_const_225, i);
assume value_is(__ctobpl_const_226, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_227, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_6;


label_4_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 64));
assume value_is(__ctobpl_const_224, s);
assume value_is(__ctobpl_const_225, i);
assume value_is(__ctobpl_const_226, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_227, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_5;


// .\v10\replace.c(74)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 74} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(s != 0);
goto label_5_true , label_5_false ;


label_5_true :
assume (Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))] != 0);
assume value_is(__ctobpl_const_228, s);
assume value_is(__ctobpl_const_229, i);
assume value_is(__ctobpl_const_230, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_231, Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_9;


label_5_false :
assume (Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))] == 0);
assume value_is(__ctobpl_const_228, s);
assume value_is(__ctobpl_const_229, i);
assume value_is(__ctobpl_const_230, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_231, Mem_T.CHAR[PLUS(s, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
goto label_8;


// .\v10\replace.c(75)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 75} true;
result := 64 ;
assume value_is(__ctobpl_const_232, result);
goto label_7;


// .\v10\replace.c(78)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 78} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_233, i);
assume value_is(__ctobpl_const_234, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_235, i);
assume value_is(__ctobpl_const_236, Mem_T.INT4[i]);
goto label_10;


// .\v10\replace.c(79)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 79} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(s != 0);
goto label_10_true , label_10_false ;


label_10_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 110));
assume value_is(__ctobpl_const_237, s);
assume value_is(__ctobpl_const_238, i);
assume value_is(__ctobpl_const_239, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_240, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_12;


label_10_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 110));
assume value_is(__ctobpl_const_237, s);
assume value_is(__ctobpl_const_238, i);
assume value_is(__ctobpl_const_239, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_240, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_11;


// .\v10\replace.c(82)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 82} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(s != 0);
goto label_11_true , label_11_false ;


label_11_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 116));
assume value_is(__ctobpl_const_241, s);
assume value_is(__ctobpl_const_242, i);
assume value_is(__ctobpl_const_243, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_244, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_14;


label_11_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])], 116));
assume value_is(__ctobpl_const_241, s);
assume value_is(__ctobpl_const_242, i);
assume value_is(__ctobpl_const_243, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_244, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_13;


// .\v10\replace.c(85)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 85} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(s != 0);
result := Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])] ;
assume value_is(__ctobpl_const_245, result);
assume value_is(__ctobpl_const_246, s);
assume value_is(__ctobpl_const_247, i);
assume value_is(__ctobpl_const_248, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_249, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_7;


// .\v10\replace.c(83)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 83} true;
result := 9 ;
assume value_is(__ctobpl_const_250, result);
goto label_7;


// .\v10\replace.c(80)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 80} true;
result := 10 ;
assume value_is(__ctobpl_const_251, result);
goto label_7;


// .\v10\replace.c(72)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 72} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(s != 0);
result := Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])] ;
assume value_is(__ctobpl_const_252, result);
assume value_is(__ctobpl_const_253, s);
assume value_is(__ctobpl_const_254, i);
assume value_is(__ctobpl_const_255, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_256, Mem_T.CHAR[PLUS(s, 1, Mem_T.INT4[i])]);
goto label_7;


// .\v10\replace.c(87)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 87} true;
result.esc$1 := result ;
assume value_is(__ctobpl_const_257, result);
goto label_1;


// .\v10\replace.c(88)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 88} true;
return;

}



procedure {:extern}  getccl(arg.__1:int, i.__1:int, pat.__1:int, j.__1:int) returns (result.getccl$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} arg : int;
var {:extern} i : int;
var {:extern} j : int;
var {:extern} jstart : int;
var {:extern} junk : int;
var {:extern} pat : int;
var {:extern} result.addstr$2 : int;
var {:extern} result.addstr$3 : int;
var {:extern} result.addstr$4 : int;
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

assume INT_LT(arg.__1, alloc);
assume INT_LT(i.__1, alloc);
assume INT_LT(pat.__1, alloc);
assume INT_LT(j.__1, alloc);
arg:= 0;//Init locals 
i:= 0;//Init locals 
j:= 0;//Init locals 
jstart:= 0;//Init locals 
junk:= 0;//Init locals 
pat:= 0;//Init locals 
result.addstr$2:= 0;//Init locals 
result.addstr$3:= 0;//Init locals 
result.addstr$4:= 0;//Init locals 
result.getccl$1 := 0;//initialize returns 
arg := arg.__1;
i := i.__1;
pat := pat.__1;
j := j.__1;
goto label_3;


// .\v10\replace.c(138)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 138} true;
goto label_4;


// .\v10\replace.c(139)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 139} true;
goto label_5;


// .\v10\replace.c(141)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 141} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_258, i);
assume value_is(__ctobpl_const_259, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_260, i);
assume value_is(__ctobpl_const_261, Mem_T.INT4[i]);
goto label_6;


// .\v10\replace.c(142)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 142} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_6_true , label_6_false ;


label_6_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 94));
assume value_is(__ctobpl_const_262, arg);
assume value_is(__ctobpl_const_263, i);
assume value_is(__ctobpl_const_264, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_265, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_10;


label_6_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 94));
assume value_is(__ctobpl_const_262, arg);
assume value_is(__ctobpl_const_263, i);
assume value_is(__ctobpl_const_264, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_265, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_7;


// .\v10\replace.c(146)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 146} true;
call result.addstr$3 := addstr (91, pat, j, 100);
assume value_is(__ctobpl_const_266, pat);
assume value_is(__ctobpl_const_267, j);
assume value_is(__ctobpl_const_268, pat);
assume value_is(__ctobpl_const_269, j);
goto label_25;


// .\v10\replace.c(146)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 146} true;
junk := result.addstr$3 ;
assume value_is(__ctobpl_const_270, junk);
assume value_is(__ctobpl_const_271, result.addstr$3);
goto label_15;


// .\v10\replace.c(143)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 143} true;
call result.addstr$2 := addstr (33, pat, j, 100);
assume value_is(__ctobpl_const_272, pat);
assume value_is(__ctobpl_const_273, j);
assume value_is(__ctobpl_const_274, pat);
assume value_is(__ctobpl_const_275, j);
goto label_13;


// .\v10\replace.c(143)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 143} true;
junk := result.addstr$2 ;
assume value_is(__ctobpl_const_276, junk);
assume value_is(__ctobpl_const_277, result.addstr$2);
goto label_14;


// .\v10\replace.c(144)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 144} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_278, i);
assume value_is(__ctobpl_const_279, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_280, i);
assume value_is(__ctobpl_const_281, Mem_T.INT4[i]);
goto label_15;


// .\v10\replace.c(147)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 147} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
jstart := Mem_T.INT4[j] ;
assume value_is(__ctobpl_const_282, jstart);
assume value_is(__ctobpl_const_283, j);
assume value_is(__ctobpl_const_284, Mem_T.INT4[j]);
goto label_16;


// .\v10\replace.c(148)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 148} true;
call result.addstr$4 := addstr (0, pat, j, 100);
assume value_is(__ctobpl_const_285, pat);
assume value_is(__ctobpl_const_286, j);
assume value_is(__ctobpl_const_287, pat);
assume value_is(__ctobpl_const_288, j);
goto label_19;


// .\v10\replace.c(148)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 148} true;
junk := result.addstr$4 ;
assume value_is(__ctobpl_const_289, junk);
assume value_is(__ctobpl_const_290, result.addstr$4);
goto label_20;


// .\v10\replace.c(149)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 149} true;
call dodash (93, arg, i, pat, j, 100);
assume value_is(__ctobpl_const_291, arg);
assume value_is(__ctobpl_const_292, i);
assume value_is(__ctobpl_const_293, pat);
assume value_is(__ctobpl_const_294, j);
assume value_is(__ctobpl_const_295, arg);
assume value_is(__ctobpl_const_296, i);
assume value_is(__ctobpl_const_297, pat);
assume value_is(__ctobpl_const_298, j);
goto label_23;


// .\v10\replace.c(150)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 150} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
//TAG: Dereferenced object is non-null
assert(j != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(pat, 1, jstart) := MINUS_BOTH_PTR_OR_BOTH_INT( MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[j], jstart, 1), 1, 1)];
assume value_is(__ctobpl_const_299, pat);
assume value_is(__ctobpl_const_300, jstart);
assume value_is(__ctobpl_const_301, Mem_T.CHAR[PLUS(pat, 1, jstart)]);
assume value_is(__ctobpl_const_302, j);
assume value_is(__ctobpl_const_303, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_304, jstart);
goto label_24;


// .\v10\replace.c(151)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 151} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(arg != 0);
result.getccl$1 := LIFT(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 93)) ;
assume value_is(__ctobpl_const_305, arg);
assume value_is(__ctobpl_const_306, i);
assume value_is(__ctobpl_const_307, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_308, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_1;


// .\v10\replace.c(152)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 152} true;
return;


// .\v10\replace.c(152)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 152} true;
assume false;
return;

}



procedure {:extern}  getline(s.__1:int, maxsize.__1:int) returns (result.getline$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fgets.arg.3$4$ : int;
var {:extern} maxsize : int;
var {:extern} result : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.fgets$2 : int;
var {:extern} s : int;
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

assume INT_LT(s.__1, alloc);
$fgets.arg.3$4$:= 0;//Init locals 
maxsize:= 0;//Init locals 
result:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.fgets$2:= 0;//Init locals 
result.getline$1 := 0;//initialize returns 
s:= 0;//Init locals 
s := s.__1;
maxsize := maxsize.__1;
goto label_3;


// .\v10\replace.c(43)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 43} true;
goto label_4;


// .\v10\replace.c(44)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 44} true;
call result.__iob_func$3 := __iob_func ();
goto label_7;


// .\v10\replace.c(44)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 44} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fgets.arg.3$4$ := PLUS(result.__iob_func$3, 32, 0) ;
assume value_is(__ctobpl_const_309, $fgets.arg.3$4$);
assume value_is(__ctobpl_const_310, result.__iob_func$3);
goto label_8;


// .\v10\replace.c(44)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 44} true;
call result.fgets$2 := fgets (s, maxsize, $fgets.arg.3$4$);
assume value_is(__ctobpl_const_311, s);
assume value_is(__ctobpl_const_312, maxsize);
assume value_is(__ctobpl_const_313, $fgets.arg.3$4$);
assume value_is(__ctobpl_const_314, s);
assume value_is(__ctobpl_const_315, maxsize);
assume value_is(__ctobpl_const_316, $fgets.arg.3$4$);
goto label_11;


// .\v10\replace.c(44)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 44} true;
result := result.fgets$2 ;
assume value_is(__ctobpl_const_317, result);
assume value_is(__ctobpl_const_318, result.fgets$2);
goto label_12;


// .\v10\replace.c(45)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 45} true;
result.getline$1 := LIFT(INT_NEQ(result, 0)) ;
assume value_is(__ctobpl_const_319, result);
goto label_1;


// .\v10\replace.c(46)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 46} true;
return;


// .\v10\replace.c(46)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 46} true;
assume false;
return;

}



procedure {:extern}  getpat(arg.__1:int, pat.__1:int) returns (result.getpat$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} arg : int;
var {:extern} makeres : int;
var {:extern} pat : int;
var {:extern} result.makepat$2 : int;
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

assume INT_LT(arg.__1, alloc);
assume INT_LT(pat.__1, alloc);
arg:= 0;//Init locals 
makeres:= 0;//Init locals 
pat:= 0;//Init locals 
result.getpat$1 := 0;//initialize returns 
result.makepat$2:= 0;//Init locals 
arg := arg.__1;
pat := pat.__1;
goto label_3;


// .\v10\replace.c(251)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 251} true;
goto label_4;


// .\v10\replace.c(253)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 253} true;
call result.makepat$2 := makepat (arg, 0, 0, pat);
assume value_is(__ctobpl_const_320, arg);
assume value_is(__ctobpl_const_321, pat);
assume value_is(__ctobpl_const_322, arg);
assume value_is(__ctobpl_const_323, pat);
goto label_7;


// .\v10\replace.c(253)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 253} true;
makeres := result.makepat$2 ;
assume value_is(__ctobpl_const_324, makeres);
assume value_is(__ctobpl_const_325, result.makepat$2);
goto label_8;


// .\v10\replace.c(254)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 254} true;
result.getpat$1 := LIFT(INT_LT(0, makeres)) ;
assume value_is(__ctobpl_const_326, makeres);
goto label_1;


// .\v10\replace.c(255)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 255} true;
return;


// .\v10\replace.c(255)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 255} true;
assume false;
return;

}



procedure {:extern}  getsub(arg.__1:int, sub.__1:int) returns (result.getsub$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} arg : int;
var {:extern} makeres : int;
var {:extern} result.makesub$2 : int;
var {:extern} sub : int;
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

assume INT_LT(arg.__1, alloc);
assume INT_LT(sub.__1, alloc);
arg:= 0;//Init locals 
makeres:= 0;//Init locals 
result.getsub$1 := 0;//initialize returns 
result.makesub$2:= 0;//Init locals 
sub:= 0;//Init locals 
arg := arg.__1;
sub := sub.__1;
goto label_3;


// .\v10\replace.c(297)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 297} true;
goto label_4;


// .\v10\replace.c(299)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 299} true;
call result.makesub$2 := makesub (arg, 0, 0, sub);
assume value_is(__ctobpl_const_327, arg);
assume value_is(__ctobpl_const_328, sub);
assume value_is(__ctobpl_const_329, arg);
assume value_is(__ctobpl_const_330, sub);
goto label_7;


// .\v10\replace.c(299)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 299} true;
makeres := result.makesub$2 ;
assume value_is(__ctobpl_const_331, makeres);
assume value_is(__ctobpl_const_332, result.makesub$2);
goto label_8;


// .\v10\replace.c(300)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 300} true;
result.getsub$1 := LIFT(INT_LT(0, makeres)) ;
assume value_is(__ctobpl_const_333, makeres);
goto label_1;


// .\v10\replace.c(301)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 301} true;
return;


// .\v10\replace.c(301)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 301} true;
assume false;
return;

}



procedure {:extern}  in_pat_set(c.__1:int) returns (result.in_pat_set$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $Pred.2$ : int;
var {:extern} c : int;
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

$Pred.2$:= 0;//Init locals 
c:= 0;//Init locals 
result.in_pat_set$1 := 0;//initialize returns 
c := c.__1;
goto label_3;


// .\v10\replace.c(183)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 183} true;
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_EQ(c, 99));
assume value_is(__ctobpl_const_334, c);
goto label_5;


label_3_false :
assume !(INT_EQ(c, 99));
assume value_is(__ctobpl_const_334, c);
goto label_4;


// .\v10\replace.c(183)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 183} true;
goto label_4_true , label_4_false ;


label_4_true :
assume (INT_EQ(c, 37));
assume value_is(__ctobpl_const_335, c);
goto label_5;


label_4_false :
assume !(INT_EQ(c, 37));
assume value_is(__ctobpl_const_335, c);
goto label_7;


// .\v10\replace.c(183)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 183} true;
goto label_7_true , label_7_false ;


label_7_true :
assume (INT_EQ(c, 36));
assume value_is(__ctobpl_const_336, c);
goto label_5;


label_7_false :
assume !(INT_EQ(c, 36));
assume value_is(__ctobpl_const_336, c);
goto label_8;


// .\v10\replace.c(183)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 183} true;
goto label_8_true , label_8_false ;


label_8_true :
assume (INT_EQ(c, 63));
assume value_is(__ctobpl_const_337, c);
goto label_5;


label_8_false :
assume !(INT_EQ(c, 63));
assume value_is(__ctobpl_const_337, c);
goto label_9;


// .\v10\replace.c(184)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 184} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (INT_EQ(c, 91));
assume value_is(__ctobpl_const_338, c);
goto label_5;


label_9_false :
assume !(INT_EQ(c, 91));
assume value_is(__ctobpl_const_338, c);
goto label_10;


// .\v10\replace.c(184)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 184} true;
goto label_10_true , label_10_false ;


label_10_true :
assume (INT_EQ(c, 33));
assume value_is(__ctobpl_const_339, c);
goto label_5;


label_10_false :
assume !(INT_EQ(c, 33));
assume value_is(__ctobpl_const_339, c);
goto label_11;


// .\v10\replace.c(184)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 184} true;
goto label_11_true , label_11_false ;


label_11_true :
assume (INT_EQ(c, 42));
assume value_is(__ctobpl_const_340, c);
goto label_5;


label_11_false :
assume !(INT_EQ(c, 42));
assume value_is(__ctobpl_const_340, c);
goto label_12;


// .\v10\replace.c(184)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 184} true;
$Pred.2$ := 0 ;
assume value_is(__ctobpl_const_341, $Pred.2$);
goto label_6;


// .\v10\replace.c(184)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 184} true;
$Pred.2$ := 1 ;
assume value_is(__ctobpl_const_342, $Pred.2$);
goto label_6;


// .\v10\replace.c(183)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 183} true;
result.in_pat_set$1 := $Pred.2$ ;
assume value_is(__ctobpl_const_343, $Pred.2$);
goto label_1;


// .\v10\replace.c(185)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 185} true;
return;

}



procedure {:extern}  in_set_2(c.__1:int) returns (result.in_set_2$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $Pred.2$ : int;
var {:extern} c : int;
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

$Pred.2$:= 0;//Init locals 
c:= 0;//Init locals 
result.in_set_2$1 := 0;//initialize returns 
c := c.__1;
goto label_3;


// .\v10\replace.c(177)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 177} true;
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_EQ(c, 37));
assume value_is(__ctobpl_const_344, c);
goto label_5;


label_3_false :
assume !(INT_EQ(c, 37));
assume value_is(__ctobpl_const_344, c);
goto label_4;


// .\v10\replace.c(177)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 177} true;
goto label_4_true , label_4_false ;


label_4_true :
assume (INT_EQ(c, 36));
assume value_is(__ctobpl_const_345, c);
goto label_5;


label_4_false :
assume !(INT_EQ(c, 36));
assume value_is(__ctobpl_const_345, c);
goto label_7;


// .\v10\replace.c(177)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 177} true;
goto label_7_true , label_7_false ;


label_7_true :
assume (INT_EQ(c, 42));
assume value_is(__ctobpl_const_346, c);
goto label_5;


label_7_false :
assume !(INT_EQ(c, 42));
assume value_is(__ctobpl_const_346, c);
goto label_8;


// .\v10\replace.c(177)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 177} true;
$Pred.2$ := 0 ;
assume value_is(__ctobpl_const_347, $Pred.2$);
goto label_6;


// .\v10\replace.c(177)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 177} true;
$Pred.2$ := 1 ;
assume value_is(__ctobpl_const_348, $Pred.2$);
goto label_6;


// .\v10\replace.c(177)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 177} true;
result.in_set_2$1 := $Pred.2$ ;
assume value_is(__ctobpl_const_349, $Pred.2$);
goto label_1;


// .\v10\replace.c(178)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 178} true;
return;

}



procedure {:extern}  locate(c.__1:int, pat.__1:int, offset.__1:int) returns (result.locate$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} c : int;
var {:extern} flag : int;
var {:extern} i : int;
var {:extern} offset : int;
var {:extern} pat : int;
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

assume INT_LT(pat.__1, alloc);
c:= 0;//Init locals 
flag:= 0;//Init locals 
i:= 0;//Init locals 
offset:= 0;//Init locals 
pat:= 0;//Init locals 
result.locate$1 := 0;//initialize returns 
c := c.__1;
pat := pat.__1;
offset := offset.__1;
goto label_3;


// .\v10\replace.c(311)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 311} true;
goto label_4;


// .\v10\replace.c(312)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 312} true;
goto label_5;


// .\v10\replace.c(314)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 314} true;
flag := 0 ;
assume value_is(__ctobpl_const_350, flag);
goto label_6;


// .\v10\replace.c(315)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 315} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
i := PLUS(offset, 1, Mem_T.CHAR[PLUS(pat, 1, offset)]) ;
assume value_is(__ctobpl_const_351, i);
assume value_is(__ctobpl_const_352, offset);
assume value_is(__ctobpl_const_353, pat);
assume value_is(__ctobpl_const_354, offset);
assume value_is(__ctobpl_const_355, Mem_T.CHAR[PLUS(pat, 1, offset)]);
goto label_7;


// .\v10\replace.c(316)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 316} true;
// loop entry initialization...
goto label_7_head;


label_7_head:
// loop head assertions...

// end loop head assertions

goto label_7_true , label_7_false ;


label_7_true :
assume (INT_LT(offset, i));
assume value_is(__ctobpl_const_356, offset);
assume value_is(__ctobpl_const_357, i);
goto label_9;


label_7_false :
assume !(INT_LT(offset, i));
assume value_is(__ctobpl_const_356, offset);
assume value_is(__ctobpl_const_357, i);
goto label_8;


// .\v10\replace.c(324)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 324} true;
result.locate$1 := flag ;
assume value_is(__ctobpl_const_358, flag);
goto label_1;


// .\v10\replace.c(325)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 325} true;
return;


// .\v10\replace.c(318)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 318} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
goto label_9_true , label_9_false ;


label_9_true :
assume (INT_EQ(c, Mem_T.CHAR[PLUS(pat, 1, i)]));
assume value_is(__ctobpl_const_359, c);
assume value_is(__ctobpl_const_360, pat);
assume value_is(__ctobpl_const_361, i);
assume value_is(__ctobpl_const_362, Mem_T.CHAR[PLUS(pat, 1, i)]);
goto label_11;


label_9_false :
assume !(INT_EQ(c, Mem_T.CHAR[PLUS(pat, 1, i)]));
assume value_is(__ctobpl_const_359, c);
assume value_is(__ctobpl_const_360, pat);
assume value_is(__ctobpl_const_361, i);
assume value_is(__ctobpl_const_362, Mem_T.CHAR[PLUS(pat, 1, i)]);
goto label_10;


// .\v10\replace.c(322)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 322} true;
i := MINUS_BOTH_PTR_OR_BOTH_INT( i, 1, 1) ;
assume value_is(__ctobpl_const_363, i);
assume value_is(__ctobpl_const_364, i);
goto label_7_head;


// .\v10\replace.c(319)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 319} true;
flag := 1 ;
assume value_is(__ctobpl_const_365, flag);
goto label_12;


// .\v10\replace.c(320)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 320} true;
i := offset ;
assume value_is(__ctobpl_const_366, i);
assume value_is(__ctobpl_const_367, offset);
goto label_7_head;

}



procedure {:extern}  main(argc.__1:int, argv.__1:int) returns (result.main$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} argc : int;
var {:extern} argv : int;
var {:extern} $change.arg.1$18$ : int;
var {:extern} $change.arg.2$17$ : int;
var {:extern} $fprintf.arg.1$10$ : int;
var {:extern} $fprintf.arg.1$16$ : int;
var {:extern} $fprintf.arg.1$4$ : int;
var {:extern} $getpat.arg.1$7$ : int;
var {:extern} $getpat.arg.2$6$ : int;
var {:extern} $getsub.arg.1$13$ : int;
var {:extern} $getsub.arg.2$12$ : int;
var {:extern} pat : int;
var {:extern} result : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.__iob_func$9 : int;
var {:extern} result.__iob_func$15 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} result.fprintf$8 : int;
var {:extern} result.fprintf$14 : int;
var {:extern} result.getpat$5 : int;
var {:extern} result.getsub$11 : int;
var {:extern} sub : int;
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

assume INT_LT(argv.__1, alloc);
argc:= 0;//Init locals 
argv:= 0;//Init locals 
$change.arg.1$18$:= 0;//Init locals 
$change.arg.2$17$:= 0;//Init locals 
$fprintf.arg.1$10$:= 0;//Init locals 
$fprintf.arg.1$16$:= 0;//Init locals 
$fprintf.arg.1$4$:= 0;//Init locals 
$getpat.arg.1$7$:= 0;//Init locals 
$getpat.arg.2$6$:= 0;//Init locals 
$getsub.arg.1$13$:= 0;//Init locals 
$getsub.arg.2$12$:= 0;//Init locals 
pat:= 0;//Init locals 
result:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.__iob_func$9:= 0;//Init locals 
result.__iob_func$15:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.fprintf$8:= 0;//Init locals 
result.fprintf$14:= 0;//Init locals 
result.getpat$5:= 0;//Init locals 
result.getsub$11:= 0;//Init locals 
result.main$1 := 0;//initialize returns 
call sub := __HAVOC_det_malloc(100);
argc := argc.__1;
argv := argv.__1;
goto label_3;


// .\v10\replace.c(525)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 525} true;
goto label_4;


// .\v10\replace.c(525)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 525} true;
goto label_5;


// .\v10\replace.c(526)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 526} true;
goto label_6;


// .\v10\replace.c(528)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 528} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (INT_LT(argc, 2));
assume value_is(__ctobpl_const_368, argc);
goto label_8;


label_6_false :
assume !(INT_LT(argc, 2));
assume value_is(__ctobpl_const_368, argc);
goto label_7;


// .\v10\replace.c(534)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 534} true;
// skipped OP_UNARY assignment to array
goto label_18;


// .\v10\replace.c(534)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 534} true;
//TAG: Dereferenced object is non-null
assert(argv != 0);
$getpat.arg.1$7$ := Mem_T.PCHAR[PLUS(argv, 4, 1)] ;
assume value_is(__ctobpl_const_369, $getpat.arg.1$7$);
assume value_is(__ctobpl_const_370, argv);
assume value_is(__ctobpl_const_371, Mem_T.PCHAR[PLUS(argv, 4, 1)]);
goto label_19;


// .\v10\replace.c(534)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 534} true;
call result.getpat$5 := getpat ($getpat.arg.1$7$, $getpat.arg.2$6$);
assume value_is(__ctobpl_const_372, $getpat.arg.1$7$);
assume value_is(__ctobpl_const_373, $getpat.arg.1$7$);
goto label_22;


// .\v10\replace.c(534)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 534} true;
result := result.getpat$5 ;
assume value_is(__ctobpl_const_374, result);
assume value_is(__ctobpl_const_375, result.getpat$5);
goto label_23;


// .\v10\replace.c(535)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 535} true;
goto label_23_true , label_23_false ;


label_23_true :
assume (result != 0);
assume value_is(__ctobpl_const_376, result);
goto label_27;


label_23_false :
assume (result == 0);
assume value_is(__ctobpl_const_376, result);
goto label_24;


// .\v10\replace.c(537)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 537} true;
call result.__iob_func$9 := __iob_func ();
goto label_52;


// .\v10\replace.c(537)
label_52:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 537} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$9 != 0);
$fprintf.arg.1$10$ := PLUS(result.__iob_func$9, 32, 1) ;
assume value_is(__ctobpl_const_377, $fprintf.arg.1$10$);
assume value_is(__ctobpl_const_378, result.__iob_func$9);
goto label_53;


// .\v10\replace.c(537)
label_53:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 537} true;
call result.fprintf$8 := det_choice(); // havoc result.fprintf$8;
// skip fprintf
goto label_56;


// .\v10\replace.c(538)
label_56:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 538} true;
// skip exit
return;


// .\v10\replace.c(541)
label_27:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 541} true;
goto label_27_true , label_27_false ;


label_27_true :
assume (INT_LEQ(3, argc));
assume value_is(__ctobpl_const_379, argc);
goto label_29;


label_27_false :
assume !(INT_LEQ(3, argc));
assume value_is(__ctobpl_const_379, argc);
goto label_28;


// .\v10\replace.c(551)
label_28:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 551} true;
//TAG: Dereferenced object is non-null
assert(sub != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(sub, 1, 0) := 0];
assume value_is(__ctobpl_const_380, Mem_T.CHAR[PLUS(sub, 1, 0)]);
goto label_39;


// .\v10\replace.c(543)
label_29:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 543} true;
// skipped OP_UNARY assignment to array
goto label_30;


// .\v10\replace.c(543)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 543} true;
//TAG: Dereferenced object is non-null
assert(argv != 0);
$getsub.arg.1$13$ := Mem_T.PCHAR[PLUS(argv, 4, 2)] ;
assume value_is(__ctobpl_const_381, $getsub.arg.1$13$);
assume value_is(__ctobpl_const_382, argv);
assume value_is(__ctobpl_const_383, Mem_T.PCHAR[PLUS(argv, 4, 2)]);
goto label_31;


// .\v10\replace.c(543)
label_31:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 543} true;
call result.getsub$11 := getsub ($getsub.arg.1$13$, $getsub.arg.2$12$);
assume value_is(__ctobpl_const_384, $getsub.arg.1$13$);
assume value_is(__ctobpl_const_385, $getsub.arg.1$13$);
goto label_34;


// .\v10\replace.c(543)
label_34:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 543} true;
result := result.getsub$11 ;
assume value_is(__ctobpl_const_386, result);
assume value_is(__ctobpl_const_387, result.getsub$11);
goto label_35;


// .\v10\replace.c(544)
label_35:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 544} true;
goto label_35_true , label_35_false ;


label_35_true :
assume (result != 0);
assume value_is(__ctobpl_const_388, result);
goto label_39;


label_35_false :
assume (result == 0);
assume value_is(__ctobpl_const_388, result);
goto label_36;


// .\v10\replace.c(546)
label_36:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 546} true;
call result.__iob_func$15 := __iob_func ();
goto label_45;


// .\v10\replace.c(546)
label_45:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 546} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$15 != 0);
$fprintf.arg.1$16$ := PLUS(result.__iob_func$15, 32, 1) ;
assume value_is(__ctobpl_const_389, $fprintf.arg.1$16$);
assume value_is(__ctobpl_const_390, result.__iob_func$15);
goto label_46;


// .\v10\replace.c(546)
label_46:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 546} true;
call result.fprintf$14 := det_choice(); // havoc result.fprintf$14;
// skip fprintf
goto label_49;


// .\v10\replace.c(547)
label_49:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 547} true;
// skip exit
return;


// .\v10\replace.c(554)
label_39:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 554} true;
// skipped OP_UNARY assignment to array
goto label_40;


// .\v10\replace.c(554)
label_40:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 554} true;
// skipped OP_UNARY assignment to array
goto label_41;


// .\v10\replace.c(554)
label_41:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 554} true;
call change ($change.arg.1$18$, $change.arg.2$17$);
goto label_44;


// .\v10\replace.c(555)
label_44:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 555} true;
result.main$1 := 0 ;
goto label_1;


// .\v10\replace.c(556)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 556} true;
call __HAVOC_free(sub);
return;


// .\v10\replace.c(530)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 530} true;
call result.__iob_func$3 := __iob_func ();
goto label_11;


// .\v10\replace.c(530)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 530} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_391, $fprintf.arg.1$4$);
assume value_is(__ctobpl_const_392, result.__iob_func$3);
goto label_12;


// .\v10\replace.c(530)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 530} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_15;


// .\v10\replace.c(531)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 531} true;
// skip exit
return;


// .\v10\replace.c(556)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 556} true;
assume false;
return;

}



procedure {:extern}  makepat(arg.__1:int, start.__1:int, delim.__1:int, pat.__1:int) returns (result.makepat$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} arg : int;
var {:extern} delim : int;
var {:extern} done : int;
var {:extern} escjunk : int;
var {:extern} getres : int;
var {:extern} i : int;
var {:extern} $in_set_2.arg.1$7$ : int;
var {:extern} j : int;
var {:extern} junk : int;
var {:extern} lastj : int;
var {:extern} lj : int;
var {:extern} pat : int;
var {:extern} result : int;
var {:extern} result.addstr$2 : int;
var {:extern} result.addstr$3 : int;
var {:extern} result.addstr$4 : int;
var {:extern} result.addstr$8 : int;
var {:extern} result.addstr$10 : int;
var {:extern} result.addstr$11 : int;
var {:extern} result.esc$9 : int;
var {:extern} result.getccl$5 : int;
var {:extern} result.in_set_2$6 : int;
var {:extern} start : int;
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

assume INT_LT(arg.__1, alloc);
assume INT_LT(pat.__1, alloc);
arg:= 0;//Init locals 
delim:= 0;//Init locals 
done:= 0;//Init locals 
escjunk:= 0;//Init locals 
getres:= 0;//Init locals 
call i := __HAVOC_det_malloc(4);
$in_set_2.arg.1$7$:= 0;//Init locals 
call j := __HAVOC_det_malloc(4);
junk:= 0;//Init locals 
lastj:= 0;//Init locals 
lj:= 0;//Init locals 
pat:= 0;//Init locals 
result:= 0;//Init locals 
result.addstr$2:= 0;//Init locals 
result.addstr$3:= 0;//Init locals 
result.addstr$4:= 0;//Init locals 
result.addstr$8:= 0;//Init locals 
result.addstr$10:= 0;//Init locals 
result.addstr$11:= 0;//Init locals 
result.esc$9:= 0;//Init locals 
result.getccl$5:= 0;//Init locals 
result.in_set_2$6:= 0;//Init locals 
result.makepat$1 := 0;//initialize returns 
start:= 0;//Init locals 
arg := arg.__1;
start := start.__1;
delim := delim.__1;
pat := pat.__1;
goto label_3;


// .\v10\replace.c(194)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 194} true;
goto label_4;


// .\v10\replace.c(195)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 195} true;
goto label_5;


// .\v10\replace.c(195)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 195} true;
goto label_6;


// .\v10\replace.c(195)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 195} true;
goto label_7;


// .\v10\replace.c(195)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 195} true;
goto label_8;


// .\v10\replace.c(196)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 196} true;
goto label_9;


// .\v10\replace.c(196)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 196} true;
goto label_10;


// .\v10\replace.c(197)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 197} true;
goto label_11;


// .\v10\replace.c(198)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 198} true;
goto label_12;


// .\v10\replace.c(200)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 200} true;
Mem_T.INT4 := Mem_T.INT4[j := 0];
assume value_is(__ctobpl_const_393, Mem_T.INT4[j]);
goto label_13;


// .\v10\replace.c(201)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 201} true;
Mem_T.INT4 := Mem_T.INT4[i := start];
assume value_is(__ctobpl_const_394, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_395, start);
goto label_14;


// .\v10\replace.c(202)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 202} true;
lastj := 0 ;
assume value_is(__ctobpl_const_396, lastj);
goto label_15;


// .\v10\replace.c(203)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 203} true;
done := 0 ;
assume value_is(__ctobpl_const_397, done);
goto label_16;


// .\v10\replace.c(204)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 204} true;
// loop entry initialization...
goto label_16_head;


label_16_head:
// loop head assertions...

// end loop head assertions

goto label_16_true , label_16_false ;


label_16_true :
assume (done != 0);
assume value_is(__ctobpl_const_398, done);
goto label_18;


label_16_false :
assume (done == 0);
assume value_is(__ctobpl_const_398, done);
goto label_17;


// .\v10\replace.c(204)
label_17:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 204} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_17_true , label_17_false ;


label_17_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_399, arg);
assume value_is(__ctobpl_const_400, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_401, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_402, delim);
goto label_29;


label_17_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_399, arg);
assume value_is(__ctobpl_const_400, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_401, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_402, delim);
goto label_18;


// .\v10\replace.c(204)
label_29:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 204} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_29_true , label_29_false ;


label_29_true :
assume (Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] != 0);
assume value_is(__ctobpl_const_403, arg);
assume value_is(__ctobpl_const_404, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_405, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_30;


label_29_false :
assume (Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] == 0);
assume value_is(__ctobpl_const_403, arg);
assume value_is(__ctobpl_const_404, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_405, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_18;


// .\v10\replace.c(205)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 205} true;
lj := Mem_T.INT4[j] ;
assume value_is(__ctobpl_const_406, lj);
assume value_is(__ctobpl_const_407, Mem_T.INT4[j]);
goto label_31;


// .\v10\replace.c(206)
label_31:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 206} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_31_true , label_31_false ;


label_31_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 63));
assume value_is(__ctobpl_const_408, arg);
assume value_is(__ctobpl_const_409, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_410, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_33;


label_31_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 63));
assume value_is(__ctobpl_const_408, arg);
assume value_is(__ctobpl_const_409, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_410, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_32;


// .\v10\replace.c(208)
label_32:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 208} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_32_true , label_32_false ;


label_32_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 37));
assume value_is(__ctobpl_const_411, arg);
assume value_is(__ctobpl_const_412, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_413, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_41;


label_32_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 37));
assume value_is(__ctobpl_const_411, arg);
assume value_is(__ctobpl_const_412, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_413, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_40;


// .\v10\replace.c(208)
label_41:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 208} true;
goto label_41_true , label_41_false ;


label_41_true :
assume (INT_EQ(Mem_T.INT4[i], start));
assume value_is(__ctobpl_const_414, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_415, start);
goto label_42;


label_41_false :
assume !(INT_EQ(Mem_T.INT4[i], start));
assume value_is(__ctobpl_const_414, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_415, start);
goto label_40;


// .\v10\replace.c(210)
label_40:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 210} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_40_true , label_40_false ;


label_40_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 36));
assume value_is(__ctobpl_const_416, arg);
assume value_is(__ctobpl_const_417, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_418, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_47;


label_40_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 36));
assume value_is(__ctobpl_const_416, arg);
assume value_is(__ctobpl_const_417, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_418, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_46;


// .\v10\replace.c(210)
label_47:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 210} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_47_true , label_47_false ;


label_47_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))], delim));
assume value_is(__ctobpl_const_419, arg);
assume value_is(__ctobpl_const_420, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_421, Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
assume value_is(__ctobpl_const_422, delim);
goto label_48;


label_47_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))], delim));
assume value_is(__ctobpl_const_419, arg);
assume value_is(__ctobpl_const_420, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_421, Mem_T.CHAR[PLUS(arg, 1, PLUS(Mem_T.INT4[i], 1, 1))]);
assume value_is(__ctobpl_const_422, delim);
goto label_46;


// .\v10\replace.c(212)
label_46:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 212} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_46_true , label_46_false ;


label_46_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 91));
assume value_is(__ctobpl_const_423, arg);
assume value_is(__ctobpl_const_424, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_425, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_53;


label_46_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 91));
assume value_is(__ctobpl_const_423, arg);
assume value_is(__ctobpl_const_424, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_425, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_52;


// .\v10\replace.c(217)
label_52:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 217} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_52_true , label_52_false ;


label_52_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 42));
assume value_is(__ctobpl_const_426, arg);
assume value_is(__ctobpl_const_427, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_428, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_61;


label_52_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 42));
assume value_is(__ctobpl_const_426, arg);
assume value_is(__ctobpl_const_427, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_428, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_58;


// .\v10\replace.c(217)
label_61:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 217} true;
goto label_61_true , label_61_false ;


label_61_true :
assume (INT_LT(start, Mem_T.INT4[i]));
assume value_is(__ctobpl_const_429, start);
assume value_is(__ctobpl_const_430, Mem_T.INT4[i]);
goto label_62;


label_61_false :
assume !(INT_LT(start, Mem_T.INT4[i]));
assume value_is(__ctobpl_const_429, start);
assume value_is(__ctobpl_const_430, Mem_T.INT4[i]);
goto label_58;


// .\v10\replace.c(227)
label_58:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 227} true;
call result.addstr$8 := addstr (99, pat, j, 100);
assume value_is(__ctobpl_const_431, pat);
assume value_is(__ctobpl_const_432, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_433, pat);
assume value_is(__ctobpl_const_434, Mem_T.INT4[j]);
goto label_72;


// .\v10\replace.c(227)
label_72:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 227} true;
junk := result.addstr$8 ;
assume value_is(__ctobpl_const_435, junk);
assume value_is(__ctobpl_const_436, result.addstr$8);
goto label_73;


// .\v10\replace.c(228)
label_73:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 228} true;
call result.esc$9 := esc (arg, i);
assume value_is(__ctobpl_const_437, arg);
assume value_is(__ctobpl_const_438, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_439, arg);
assume value_is(__ctobpl_const_440, Mem_T.INT4[i]);
goto label_76;


// .\v10\replace.c(228)
label_76:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 228} true;
escjunk := result.esc$9 ;
assume value_is(__ctobpl_const_441, escjunk);
assume value_is(__ctobpl_const_442, result.esc$9);
goto label_77;


// .\v10\replace.c(229)
label_77:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 229} true;
call result.addstr$10 := addstr (escjunk, pat, j, 100);
assume value_is(__ctobpl_const_443, escjunk);
assume value_is(__ctobpl_const_444, pat);
assume value_is(__ctobpl_const_445, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_446, escjunk);
assume value_is(__ctobpl_const_447, pat);
assume value_is(__ctobpl_const_448, Mem_T.INT4[j]);
goto label_80;


// .\v10\replace.c(229)
label_80:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 229} true;
junk := result.addstr$10 ;
assume value_is(__ctobpl_const_449, junk);
assume value_is(__ctobpl_const_450, result.addstr$10);
goto label_37;


// .\v10\replace.c(219)
label_62:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 219} true;
lj := lastj ;
assume value_is(__ctobpl_const_451, lj);
assume value_is(__ctobpl_const_452, lastj);
goto label_63;


// .\v10\replace.c(220)
label_63:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 220} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
$in_set_2.arg.1$7$ := Mem_T.CHAR[PLUS(pat, 1, lj)] ;
assume value_is(__ctobpl_const_453, $in_set_2.arg.1$7$);
assume value_is(__ctobpl_const_454, pat);
assume value_is(__ctobpl_const_455, lj);
assume value_is(__ctobpl_const_456, Mem_T.CHAR[PLUS(pat, 1, lj)]);
goto label_64;


// .\v10\replace.c(220)
label_64:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 220} true;
call result.in_set_2$6 := in_set_2 ($in_set_2.arg.1$7$);
assume value_is(__ctobpl_const_457, $in_set_2.arg.1$7$);
assume value_is(__ctobpl_const_458, $in_set_2.arg.1$7$);
goto label_67;


// .\v10\replace.c(220)
label_67:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 220} true;
goto label_67_true , label_67_false ;


label_67_true :
assume (result.in_set_2$6 != 0);
assume value_is(__ctobpl_const_459, result.in_set_2$6);
goto label_71;


label_67_false :
assume (result.in_set_2$6 == 0);
assume value_is(__ctobpl_const_459, result.in_set_2$6);
goto label_68;


// .\v10\replace.c(223)
label_68:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 223} true;
call stclose (pat, j, lastj);
assume value_is(__ctobpl_const_460, pat);
assume value_is(__ctobpl_const_461, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_462, lastj);
assume value_is(__ctobpl_const_463, pat);
assume value_is(__ctobpl_const_464, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_465, lastj);
goto label_37;


// .\v10\replace.c(221)
label_71:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 221} true;
done := 1 ;
assume value_is(__ctobpl_const_466, done);
goto label_37;


// .\v10\replace.c(214)
label_53:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 214} true;
call result.getccl$5 := getccl (arg, i, pat, j);
assume value_is(__ctobpl_const_467, arg);
assume value_is(__ctobpl_const_468, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_469, pat);
assume value_is(__ctobpl_const_470, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_471, arg);
assume value_is(__ctobpl_const_472, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_473, pat);
assume value_is(__ctobpl_const_474, Mem_T.INT4[j]);
goto label_56;


// .\v10\replace.c(214)
label_56:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 214} true;
getres := result.getccl$5 ;
assume value_is(__ctobpl_const_475, getres);
assume value_is(__ctobpl_const_476, result.getccl$5);
goto label_57;


// .\v10\replace.c(215)
label_57:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 215} true;
done := LIFT(INT_EQ(getres, 0)) ;
assume value_is(__ctobpl_const_477, done);
assume value_is(__ctobpl_const_478, getres);
goto label_37;


// .\v10\replace.c(211)
label_48:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 211} true;
call result.addstr$4 := addstr (36, pat, j, 100);
assume value_is(__ctobpl_const_479, pat);
assume value_is(__ctobpl_const_480, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_481, pat);
assume value_is(__ctobpl_const_482, Mem_T.INT4[j]);
goto label_51;


// .\v10\replace.c(211)
label_51:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 211} true;
junk := result.addstr$4 ;
assume value_is(__ctobpl_const_483, junk);
assume value_is(__ctobpl_const_484, result.addstr$4);
goto label_37;


// .\v10\replace.c(209)
label_42:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 209} true;
call result.addstr$3 := addstr (37, pat, j, 100);
assume value_is(__ctobpl_const_485, pat);
assume value_is(__ctobpl_const_486, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_487, pat);
assume value_is(__ctobpl_const_488, Mem_T.INT4[j]);
goto label_45;


// .\v10\replace.c(209)
label_45:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 209} true;
junk := result.addstr$3 ;
assume value_is(__ctobpl_const_489, junk);
assume value_is(__ctobpl_const_490, result.addstr$3);
goto label_37;


// .\v10\replace.c(207)
label_33:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 207} true;
call result.addstr$2 := addstr (63, pat, j, 100);
assume value_is(__ctobpl_const_491, pat);
assume value_is(__ctobpl_const_492, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_493, pat);
assume value_is(__ctobpl_const_494, Mem_T.INT4[j]);
goto label_36;


// .\v10\replace.c(207)
label_36:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 207} true;
junk := result.addstr$2 ;
assume value_is(__ctobpl_const_495, junk);
assume value_is(__ctobpl_const_496, result.addstr$2);
goto label_37;


// .\v10\replace.c(231)
label_37:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 231} true;
lastj := lj ;
assume value_is(__ctobpl_const_497, lastj);
assume value_is(__ctobpl_const_498, lj);
goto label_38;


// .\v10\replace.c(232)
label_38:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 232} true;
goto label_38_true , label_38_false ;


label_38_true :
assume (done != 0);
assume value_is(__ctobpl_const_499, done);
goto label_16_head;


label_38_false :
assume (done == 0);
assume value_is(__ctobpl_const_499, done);
goto label_39;


// .\v10\replace.c(233)
label_39:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 233} true;
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_500, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_501, Mem_T.INT4[i]);
goto label_16_head;


// .\v10\replace.c(235)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 235} true;
call result.addstr$11 := addstr (0, pat, j, 100);
assume value_is(__ctobpl_const_502, pat);
assume value_is(__ctobpl_const_503, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_504, pat);
assume value_is(__ctobpl_const_505, Mem_T.INT4[j]);
goto label_21;


// .\v10\replace.c(235)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 235} true;
junk := result.addstr$11 ;
assume value_is(__ctobpl_const_506, junk);
assume value_is(__ctobpl_const_507, result.addstr$11);
goto label_22;


// .\v10\replace.c(236)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 236} true;
goto label_22_true , label_22_false ;


label_22_true :
assume (done != 0);
assume value_is(__ctobpl_const_508, done);
goto label_24;


label_22_false :
assume (done == 0);
assume value_is(__ctobpl_const_508, done);
goto label_23;


// .\v10\replace.c(236)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 236} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_23_true , label_23_false ;


label_23_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_509, arg);
assume value_is(__ctobpl_const_510, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_511, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_512, delim);
goto label_24;


label_23_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_509, arg);
assume value_is(__ctobpl_const_510, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_511, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_512, delim);
goto label_26;


// .\v10\replace.c(239)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 239} true;
goto label_26_true , label_26_false ;


label_26_true :
assume (junk != 0);
assume value_is(__ctobpl_const_513, junk);
goto label_28;


label_26_false :
assume (junk == 0);
assume value_is(__ctobpl_const_513, junk);
goto label_27;


// .\v10\replace.c(240)
label_27:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 240} true;
result := 0 ;
assume value_is(__ctobpl_const_514, result);
goto label_25;


// .\v10\replace.c(242)
label_28:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 242} true;
result := Mem_T.INT4[i] ;
assume value_is(__ctobpl_const_515, result);
assume value_is(__ctobpl_const_516, Mem_T.INT4[i]);
goto label_25;


// .\v10\replace.c(237)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 237} true;
result := 0 ;
assume value_is(__ctobpl_const_517, result);
goto label_25;


// .\v10\replace.c(243)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 243} true;
result.makepat$1 := result ;
assume value_is(__ctobpl_const_518, result);
goto label_1;


// .\v10\replace.c(244)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 244} true;
call __HAVOC_free(i);
call __HAVOC_free(j);
return;


// .\v10\replace.c(244)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 244} true;
assume false;
return;

}



procedure {:extern}  makesub(arg.__1:int, from.__1:int, delim.__1:int, sub.__1:int) returns (result.makesub$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} arg : int;
var {:extern} delim : int;
var {:extern} escjunk : int;
var {:extern} from : int;
var {:extern} i : int;
var {:extern} j : int;
var {:extern} junk : int;
var {:extern} result : int;
var {:extern} result.addstr$2 : int;
var {:extern} result.addstr$4 : int;
var {:extern} result.addstr$5 : int;
var {:extern} result.esc$3 : int;
var {:extern} sub : int;
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

assume INT_LT(arg.__1, alloc);
assume INT_LT(sub.__1, alloc);
arg:= 0;//Init locals 
delim:= 0;//Init locals 
escjunk:= 0;//Init locals 
from:= 0;//Init locals 
call i := __HAVOC_det_malloc(4);
call j := __HAVOC_det_malloc(4);
junk:= 0;//Init locals 
result:= 0;//Init locals 
result.addstr$2:= 0;//Init locals 
result.addstr$4:= 0;//Init locals 
result.addstr$5:= 0;//Init locals 
result.esc$3:= 0;//Init locals 
result.makesub$1 := 0;//initialize returns 
sub:= 0;//Init locals 
arg := arg.__1;
from := from.__1;
delim := delim.__1;
sub := sub.__1;
goto label_3;


// .\v10\replace.c(264)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 264} true;
goto label_4;


// .\v10\replace.c(265)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 265} true;
goto label_5;


// .\v10\replace.c(265)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 265} true;
goto label_6;


// .\v10\replace.c(266)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 266} true;
goto label_7;


// .\v10\replace.c(267)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 267} true;
goto label_8;


// .\v10\replace.c(269)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 269} true;
Mem_T.INT4 := Mem_T.INT4[j := 0];
assume value_is(__ctobpl_const_519, Mem_T.INT4[j]);
goto label_9;


// .\v10\replace.c(270)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 270} true;
Mem_T.INT4 := Mem_T.INT4[i := from];
assume value_is(__ctobpl_const_520, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_521, from);
goto label_10;


// .\v10\replace.c(271)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 271} true;
// loop entry initialization...
goto label_10_head;


label_10_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_10_true , label_10_false ;


label_10_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_522, arg);
assume value_is(__ctobpl_const_523, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_524, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_525, delim);
goto label_12;


label_10_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_522, arg);
assume value_is(__ctobpl_const_523, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_524, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_525, delim);
goto label_11;


// .\v10\replace.c(271)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 271} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_12_true , label_12_false ;


label_12_true :
assume (Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] != 0);
assume value_is(__ctobpl_const_526, arg);
assume value_is(__ctobpl_const_527, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_528, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_13;


label_12_false :
assume (Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])] == 0);
assume value_is(__ctobpl_const_526, arg);
assume value_is(__ctobpl_const_527, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_528, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_11;


// .\v10\replace.c(280)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 280} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_11_true , label_11_false ;


label_11_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_529, arg);
assume value_is(__ctobpl_const_530, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_531, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_532, delim);
goto label_30;


label_11_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], delim));
assume value_is(__ctobpl_const_529, arg);
assume value_is(__ctobpl_const_530, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_531, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_532, delim);
goto label_27;


// .\v10\replace.c(283)
label_27:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 283} true;
//TAG: Dereferenced object is non-null
assert(sub != 0);
//TAG: Dereferenced object is non-null
assert(sub != 0);
call result.addstr$5 := addstr (0, sub, j, 100);
assume value_is(__ctobpl_const_533, sub);
assume value_is(__ctobpl_const_534, Mem_T.CHAR[sub]);
assume value_is(__ctobpl_const_535, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_536, sub);
assume value_is(__ctobpl_const_537, Mem_T.CHAR[sub]);
assume value_is(__ctobpl_const_538, Mem_T.INT4[j]);
goto label_32;


// .\v10\replace.c(283)
label_32:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 283} true;
junk := result.addstr$5 ;
assume value_is(__ctobpl_const_539, junk);
assume value_is(__ctobpl_const_540, result.addstr$5);
goto label_33;


// .\v10\replace.c(284)
label_33:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 284} true;
goto label_33_true , label_33_false ;


label_33_true :
assume (junk != 0);
assume value_is(__ctobpl_const_541, junk);
goto label_35;


label_33_false :
assume (junk == 0);
assume value_is(__ctobpl_const_541, junk);
goto label_34;


// .\v10\replace.c(285)
label_34:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 285} true;
result := 0 ;
assume value_is(__ctobpl_const_542, result);
goto label_31;


// .\v10\replace.c(287)
label_35:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 287} true;
result := Mem_T.INT4[i] ;
assume value_is(__ctobpl_const_543, result);
assume value_is(__ctobpl_const_544, Mem_T.INT4[i]);
goto label_31;


// .\v10\replace.c(281)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 281} true;
result := 0 ;
assume value_is(__ctobpl_const_545, result);
goto label_31;


// .\v10\replace.c(289)
label_31:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 289} true;
result.makesub$1 := result ;
assume value_is(__ctobpl_const_546, result);
goto label_1;


// .\v10\replace.c(290)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 290} true;
call __HAVOC_free(i);
call __HAVOC_free(j);
return;


// .\v10\replace.c(272)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 272} true;
//TAG: Dereferenced object is non-null
assert(arg != 0);
goto label_13_true , label_13_false ;


label_13_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 38));
assume value_is(__ctobpl_const_547, arg);
assume value_is(__ctobpl_const_548, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_549, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_17;


label_13_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])], 38));
assume value_is(__ctobpl_const_547, arg);
assume value_is(__ctobpl_const_548, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_549, Mem_T.CHAR[PLUS(arg, 1, Mem_T.INT4[i])]);
goto label_14;


// .\v10\replace.c(275)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 275} true;
call result.esc$3 := esc (arg, i);
assume value_is(__ctobpl_const_550, arg);
assume value_is(__ctobpl_const_551, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_552, arg);
assume value_is(__ctobpl_const_553, Mem_T.INT4[i]);
goto label_22;


// .\v10\replace.c(275)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 275} true;
escjunk := result.esc$3 ;
assume value_is(__ctobpl_const_554, escjunk);
assume value_is(__ctobpl_const_555, result.esc$3);
goto label_23;


// .\v10\replace.c(276)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 276} true;
call result.addstr$4 := addstr (escjunk, sub, j, 100);
assume value_is(__ctobpl_const_556, escjunk);
assume value_is(__ctobpl_const_557, sub);
assume value_is(__ctobpl_const_558, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_559, escjunk);
assume value_is(__ctobpl_const_560, sub);
assume value_is(__ctobpl_const_561, Mem_T.INT4[j]);
goto label_26;


// .\v10\replace.c(276)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 276} true;
junk := result.addstr$4 ;
assume value_is(__ctobpl_const_562, junk);
assume value_is(__ctobpl_const_563, result.addstr$4);
goto label_21;


// .\v10\replace.c(273)
label_17:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 273} true;
call result.addstr$2 := addstr (-1, sub, j, 100);
assume value_is(__ctobpl_const_564, sub);
assume value_is(__ctobpl_const_565, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_566, sub);
assume value_is(__ctobpl_const_567, Mem_T.INT4[j]);
goto label_20;


// .\v10\replace.c(273)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 273} true;
junk := result.addstr$2 ;
assume value_is(__ctobpl_const_568, junk);
assume value_is(__ctobpl_const_569, result.addstr$2);
goto label_21;


// .\v10\replace.c(278)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 278} true;
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, 1)];
assume value_is(__ctobpl_const_570, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_571, Mem_T.INT4[i]);
goto label_10_head;


// .\v10\replace.c(290)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 290} true;
assume false;
return;

}



procedure {:extern}  omatch(lin.__1:int, i.__1:int, pat.__1:int, j.__1:int) returns (result.omatch$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $Caseerror.arg.1$14$ : int;
var {:extern} advance : int;
var {:extern} $fprintf.arg.1$6$ : int;
var {:extern} i : int;
var {:extern} $in_pat_set.arg.1$3$ : int;
var {:extern} j : int;
var {:extern} lin : int;
var {:extern} $locate.arg.1$10$ : int;
var {:extern} $locate.arg.1$13$ : int;
var {:extern} $locate.arg.3$12$ : int;
var {:extern} $locate.arg.3$9$ : int;
var {:extern} pat : int;
var {:extern} result : int;
var {:extern} result.__iob_func$5 : int;
var {:extern} result.abort$7 : int;
var {:extern} result.fprintf$4 : int;
var {:extern} result.in_pat_set$2 : int;
var {:extern} result.locate$8 : int;
var {:extern} result.locate$11 : int;
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

assume INT_LT(lin.__1, alloc);
assume INT_LT(i.__1, alloc);
assume INT_LT(pat.__1, alloc);
$Caseerror.arg.1$14$:= 0;//Init locals 
advance:= 0;//Init locals 
$fprintf.arg.1$6$:= 0;//Init locals 
i:= 0;//Init locals 
$in_pat_set.arg.1$3$:= 0;//Init locals 
j:= 0;//Init locals 
lin:= 0;//Init locals 
$locate.arg.1$10$:= 0;//Init locals 
$locate.arg.1$13$:= 0;//Init locals 
$locate.arg.3$12$:= 0;//Init locals 
$locate.arg.3$9$:= 0;//Init locals 
pat:= 0;//Init locals 
result:= 0;//Init locals 
result.__iob_func$5:= 0;//Init locals 
result.abort$7:= 0;//Init locals 
result.fprintf$4:= 0;//Init locals 
result.in_pat_set$2:= 0;//Init locals 
result.locate$8:= 0;//Init locals 
result.locate$11:= 0;//Init locals 
result.omatch$1 := 0;//initialize returns 
lin := lin.__1;
i := i.__1;
pat := pat.__1;
j := j.__1;
goto label_3;


// .\v10\replace.c(334)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 334} true;
goto label_4;


// .\v10\replace.c(335)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 335} true;
goto label_5;


// .\v10\replace.c(337)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 337} true;
advance := -1 ;
assume value_is(__ctobpl_const_572, advance);
goto label_6;


// .\v10\replace.c(338)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 338} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
goto label_6_true , label_6_false ;


label_6_true :
assume (Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] != 0);
assume value_is(__ctobpl_const_573, lin);
assume value_is(__ctobpl_const_574, i);
assume value_is(__ctobpl_const_575, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_576, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_8;


label_6_false :
assume (Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] == 0);
assume value_is(__ctobpl_const_573, lin);
assume value_is(__ctobpl_const_574, i);
assume value_is(__ctobpl_const_575, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_576, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_7;


// .\v10\replace.c(339)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 339} true;
result := 0 ;
assume value_is(__ctobpl_const_577, result);
goto label_26;


// .\v10\replace.c(342)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 342} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
$in_pat_set.arg.1$3$ := Mem_T.CHAR[PLUS(pat, 1, j)] ;
assume value_is(__ctobpl_const_578, $in_pat_set.arg.1$3$);
assume value_is(__ctobpl_const_579, pat);
assume value_is(__ctobpl_const_580, j);
assume value_is(__ctobpl_const_581, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_9;


// .\v10\replace.c(342)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 342} true;
call result.in_pat_set$2 := in_pat_set ($in_pat_set.arg.1$3$);
assume value_is(__ctobpl_const_582, $in_pat_set.arg.1$3$);
assume value_is(__ctobpl_const_583, $in_pat_set.arg.1$3$);
goto label_12;


// .\v10\replace.c(342)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 342} true;
goto label_12_true , label_12_false ;


label_12_true :
assume (result.in_pat_set$2 != 0);
assume value_is(__ctobpl_const_584, result.in_pat_set$2);
goto label_16;


label_12_false :
assume (result.in_pat_set$2 == 0);
assume value_is(__ctobpl_const_584, result.in_pat_set$2);
goto label_13;


// .\v10\replace.c(344)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 344} true;
call result.__iob_func$5 := __iob_func ();
goto label_55;


// .\v10\replace.c(344)
label_55:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 344} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$5 != 0);
$fprintf.arg.1$6$ := PLUS(result.__iob_func$5, 32, 1) ;
assume value_is(__ctobpl_const_585, $fprintf.arg.1$6$);
assume value_is(__ctobpl_const_586, result.__iob_func$5);
goto label_56;


// .\v10\replace.c(344)
label_56:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 344} true;
call result.fprintf$4 := det_choice(); // havoc result.fprintf$4;
// skip fprintf
goto label_59;


// .\v10\replace.c(345)
label_59:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 345} true;
call result.abort$7 := abort ();
return;


// .\v10\replace.c(348)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 348} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);

goto label_16_case_0, label_16_case_1, label_16_case_2, label_16_case_3, label_16_case_4, label_16_case_5, label_16_case_6;




label_16_case_0 :
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 33));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 36));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 37));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 63));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 91));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, j)], 99));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_17;



label_16_case_1 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 33));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_18;



label_16_case_2 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 36));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_19;



label_16_case_3 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 37));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_20;



label_16_case_4 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 63));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_21;



label_16_case_5 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 91));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_22;



label_16_case_6 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, j)], 99));
assume value_is(__ctobpl_const_587, pat);
assume value_is(__ctobpl_const_588, j);
assume value_is(__ctobpl_const_589, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_23;


// .\v10\replace.c(375)
label_17:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 375} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
$Caseerror.arg.1$14$ := Mem_T.CHAR[PLUS(pat, 1, j)] ;
assume value_is(__ctobpl_const_590, $Caseerror.arg.1$14$);
assume value_is(__ctobpl_const_591, pat);
assume value_is(__ctobpl_const_592, j);
assume value_is(__ctobpl_const_593, Mem_T.CHAR[PLUS(pat, 1, j)]);
goto label_52;


// .\v10\replace.c(375)
label_52:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 375} true;
call Caseerror ($Caseerror.arg.1$14$);
assume value_is(__ctobpl_const_594, $Caseerror.arg.1$14$);
assume value_is(__ctobpl_const_595, $Caseerror.arg.1$14$);
goto label_26;


// .\v10\replace.c(371)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 371} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
goto label_18_true , label_18_false ;


label_18_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10));
assume value_is(__ctobpl_const_596, lin);
assume value_is(__ctobpl_const_597, i);
assume value_is(__ctobpl_const_598, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_599, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_45;


label_18_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10));
assume value_is(__ctobpl_const_596, lin);
assume value_is(__ctobpl_const_597, i);
assume value_is(__ctobpl_const_598, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_599, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_44;


// .\v10\replace.c(371)
label_45:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 371} true;
$locate.arg.3$12$ := PLUS(j, 1, 1) ;
assume value_is(__ctobpl_const_600, $locate.arg.3$12$);
assume value_is(__ctobpl_const_601, j);
goto label_46;


// .\v10\replace.c(371)
label_46:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 371} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
$locate.arg.1$13$ := Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] ;
assume value_is(__ctobpl_const_602, $locate.arg.1$13$);
assume value_is(__ctobpl_const_603, lin);
assume value_is(__ctobpl_const_604, i);
assume value_is(__ctobpl_const_605, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_606, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_47;


// .\v10\replace.c(371)
label_47:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 371} true;
call result.locate$11 := locate ($locate.arg.1$13$, pat, $locate.arg.3$12$);
assume value_is(__ctobpl_const_607, $locate.arg.1$13$);
assume value_is(__ctobpl_const_608, pat);
assume value_is(__ctobpl_const_609, $locate.arg.3$12$);
assume value_is(__ctobpl_const_610, $locate.arg.1$13$);
assume value_is(__ctobpl_const_611, pat);
assume value_is(__ctobpl_const_612, $locate.arg.3$12$);
goto label_50;


// .\v10\replace.c(371)
label_50:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 371} true;
goto label_50_true , label_50_false ;


label_50_true :
assume (result.locate$11 != 0);
assume value_is(__ctobpl_const_613, result.locate$11);
goto label_44;


label_50_false :
assume (result.locate$11 == 0);
assume value_is(__ctobpl_const_613, result.locate$11);
goto label_51;


// .\v10\replace.c(372)
label_51:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 372} true;
advance := 1 ;
assume value_is(__ctobpl_const_614, advance);
goto label_44;


// .\v10\replace.c(373)
label_44:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 373} true;
goto label_26;


// .\v10\replace.c(363)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 363} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
goto label_19_true , label_19_false ;


label_19_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10));
assume value_is(__ctobpl_const_615, lin);
assume value_is(__ctobpl_const_616, i);
assume value_is(__ctobpl_const_617, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_618, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_43;


label_19_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10));
assume value_is(__ctobpl_const_615, lin);
assume value_is(__ctobpl_const_616, i);
assume value_is(__ctobpl_const_617, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_618, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_42;


// .\v10\replace.c(364)
label_43:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 364} true;
advance := 0 ;
assume value_is(__ctobpl_const_619, advance);
goto label_42;


// .\v10\replace.c(365)
label_42:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 365} true;
goto label_26;


// .\v10\replace.c(355)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 355} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
goto label_20_true , label_20_false ;


label_20_true :
assume (Mem_T.INT4[i] != 0);
assume value_is(__ctobpl_const_620, i);
assume value_is(__ctobpl_const_621, Mem_T.INT4[i]);
goto label_41;


label_20_false :
assume (Mem_T.INT4[i] == 0);
assume value_is(__ctobpl_const_620, i);
assume value_is(__ctobpl_const_621, Mem_T.INT4[i]);
goto label_40;


// .\v10\replace.c(356)
label_40:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 356} true;
advance := 0 ;
assume value_is(__ctobpl_const_622, advance);
goto label_41;


// .\v10\replace.c(357)
label_41:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 357} true;
goto label_26;


// .\v10\replace.c(359)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 359} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
goto label_21_true , label_21_false ;


label_21_true :
assume (INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10));
assume value_is(__ctobpl_const_623, lin);
assume value_is(__ctobpl_const_624, i);
assume value_is(__ctobpl_const_625, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_626, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_39;


label_21_false :
assume !(INT_NEQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], 10));
assume value_is(__ctobpl_const_623, lin);
assume value_is(__ctobpl_const_624, i);
assume value_is(__ctobpl_const_625, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_626, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_38;


// .\v10\replace.c(360)
label_39:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 360} true;
advance := 1 ;
assume value_is(__ctobpl_const_627, advance);
goto label_38;


// .\v10\replace.c(361)
label_38:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 361} true;
goto label_26;


// .\v10\replace.c(367)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 367} true;
$locate.arg.3$9$ := PLUS(j, 1, 1) ;
assume value_is(__ctobpl_const_628, $locate.arg.3$9$);
assume value_is(__ctobpl_const_629, j);
goto label_31;


// .\v10\replace.c(367)
label_31:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 367} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
$locate.arg.1$10$ := Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])] ;
assume value_is(__ctobpl_const_630, $locate.arg.1$10$);
assume value_is(__ctobpl_const_631, lin);
assume value_is(__ctobpl_const_632, i);
assume value_is(__ctobpl_const_633, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_634, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
goto label_32;


// .\v10\replace.c(367)
label_32:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 367} true;
call result.locate$8 := locate ($locate.arg.1$10$, pat, $locate.arg.3$9$);
assume value_is(__ctobpl_const_635, $locate.arg.1$10$);
assume value_is(__ctobpl_const_636, pat);
assume value_is(__ctobpl_const_637, $locate.arg.3$9$);
assume value_is(__ctobpl_const_638, $locate.arg.1$10$);
assume value_is(__ctobpl_const_639, pat);
assume value_is(__ctobpl_const_640, $locate.arg.3$9$);
goto label_35;


// .\v10\replace.c(367)
label_35:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 367} true;
goto label_35_true , label_35_false ;


label_35_true :
assume (result.locate$8 != 0);
assume value_is(__ctobpl_const_641, result.locate$8);
goto label_37;


label_35_false :
assume (result.locate$8 == 0);
assume value_is(__ctobpl_const_641, result.locate$8);
goto label_36;


// .\v10\replace.c(368)
label_37:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 368} true;
advance := 1 ;
assume value_is(__ctobpl_const_642, advance);
goto label_36;


// .\v10\replace.c(369)
label_36:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 369} true;
goto label_26;


// .\v10\replace.c(351)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 351} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(lin != 0);
//TAG: Dereferenced object is non-null
assert(pat != 0);
goto label_23_true , label_23_false ;


label_23_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]));
assume value_is(__ctobpl_const_643, lin);
assume value_is(__ctobpl_const_644, i);
assume value_is(__ctobpl_const_645, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_646, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_647, pat);
assume value_is(__ctobpl_const_648, j);
assume value_is(__ctobpl_const_649, Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]);
goto label_25;


label_23_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])], Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]));
assume value_is(__ctobpl_const_643, lin);
assume value_is(__ctobpl_const_644, i);
assume value_is(__ctobpl_const_645, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_646, Mem_T.CHAR[PLUS(lin, 1, Mem_T.INT4[i])]);
assume value_is(__ctobpl_const_647, pat);
assume value_is(__ctobpl_const_648, j);
assume value_is(__ctobpl_const_649, Mem_T.CHAR[PLUS(pat, 1, PLUS(j, 1, 1))]);
goto label_24;


// .\v10\replace.c(352)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 352} true;
advance := 1 ;
assume value_is(__ctobpl_const_650, advance);
goto label_24;


// .\v10\replace.c(353)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 353} true;
goto label_26;


// .\v10\replace.c(379)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 379} true;
goto label_26_true , label_26_false ;


label_26_true :
assume (INT_LEQ(0, advance));
assume value_is(__ctobpl_const_651, advance);
goto label_28;


label_26_false :
assume !(INT_LEQ(0, advance));
assume value_is(__ctobpl_const_651, advance);
goto label_27;


// .\v10\replace.c(384)
label_27:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 384} true;
result := 0 ;
assume value_is(__ctobpl_const_652, result);
goto label_30;


// .\v10\replace.c(381)
label_28:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 381} true;
//TAG: Dereferenced object is non-null
assert(i != 0);
//TAG: Dereferenced object is non-null
assert(i != 0);
Mem_T.INT4 := Mem_T.INT4[i := PLUS(Mem_T.INT4[i], 1, advance)];
assume value_is(__ctobpl_const_653, i);
assume value_is(__ctobpl_const_654, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_655, i);
assume value_is(__ctobpl_const_656, Mem_T.INT4[i]);
assume value_is(__ctobpl_const_657, advance);
goto label_29;


// .\v10\replace.c(382)
label_29:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 382} true;
result := 1 ;
assume value_is(__ctobpl_const_658, result);
goto label_30;


// .\v10\replace.c(385)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 385} true;
result.omatch$1 := result ;
assume value_is(__ctobpl_const_659, result);
goto label_1;


// .\v10\replace.c(386)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 386} true;
return;


// .\v10\replace.c(386)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 386} true;
assume false;
return;

}



procedure {:extern}  patsize(pat.__1:int, n.__1:int) returns (result.patsize$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $Caseerror.arg.1$8$ : int;
var {:extern} $fprintf.arg.1$6$ : int;
var {:extern} $in_pat_set.arg.1$3$ : int;
var {:extern} n : int;
var {:extern} pat : int;
var {:extern} result.__iob_func$5 : int;
var {:extern} result.abort$7 : int;
var {:extern} result.fprintf$4 : int;
var {:extern} result.in_pat_set$2 : int;
var {:extern} size : int;
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

assume INT_LT(pat.__1, alloc);
$Caseerror.arg.1$8$:= 0;//Init locals 
$fprintf.arg.1$6$:= 0;//Init locals 
$in_pat_set.arg.1$3$:= 0;//Init locals 
n:= 0;//Init locals 
pat:= 0;//Init locals 
result.__iob_func$5:= 0;//Init locals 
result.abort$7:= 0;//Init locals 
result.fprintf$4:= 0;//Init locals 
result.in_pat_set$2:= 0;//Init locals 
result.patsize$1 := 0;//initialize returns 
size:= 0;//Init locals 
pat := pat.__1;
n := n.__1;
goto label_3;


// .\v10\replace.c(393)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 393} true;
goto label_4;


// .\v10\replace.c(394)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 394} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
$in_pat_set.arg.1$3$ := Mem_T.CHAR[PLUS(pat, 1, n)] ;
assume value_is(__ctobpl_const_660, $in_pat_set.arg.1$3$);
assume value_is(__ctobpl_const_661, pat);
assume value_is(__ctobpl_const_662, n);
assume value_is(__ctobpl_const_663, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_5;


// .\v10\replace.c(394)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 394} true;
call result.in_pat_set$2 := in_pat_set ($in_pat_set.arg.1$3$);
assume value_is(__ctobpl_const_664, $in_pat_set.arg.1$3$);
assume value_is(__ctobpl_const_665, $in_pat_set.arg.1$3$);
goto label_8;


// .\v10\replace.c(394)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 394} true;
goto label_8_true , label_8_false ;


label_8_true :
assume (result.in_pat_set$2 != 0);
assume value_is(__ctobpl_const_666, result.in_pat_set$2);
goto label_12;


label_8_false :
assume (result.in_pat_set$2 == 0);
assume value_is(__ctobpl_const_666, result.in_pat_set$2);
goto label_9;


// .\v10\replace.c(395)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 395} true;
call result.__iob_func$5 := __iob_func ();
goto label_26;


// .\v10\replace.c(395)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 395} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$5 != 0);
$fprintf.arg.1$6$ := PLUS(result.__iob_func$5, 32, 1) ;
assume value_is(__ctobpl_const_667, $fprintf.arg.1$6$);
assume value_is(__ctobpl_const_668, result.__iob_func$5);
goto label_27;


// .\v10\replace.c(395)
label_27:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 395} true;
call result.fprintf$4 := det_choice(); // havoc result.fprintf$4;
// skip fprintf
goto label_30;


// .\v10\replace.c(396)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 396} true;
call result.abort$7 := abort ();
return;


// .\v10\replace.c(398)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 398} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);

goto label_12_case_0, label_12_case_1, label_12_case_2, label_12_case_3, label_12_case_4, label_12_case_5, label_12_case_6, label_12_case_7;




label_12_case_0 :
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 33));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 36));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 37));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 42));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 63));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 91));
assume(INT_NEQ(Mem_T.CHAR[PLUS(pat, 1, n)], 99));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_13;



label_12_case_1 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 33));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_14;



label_12_case_2 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 36));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_15;



label_12_case_3 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 37));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_15;



label_12_case_4 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 42));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_16;



label_12_case_5 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 63));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_15;



label_12_case_6 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 91));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_14;



label_12_case_7 :
assume(INT_EQ(Mem_T.CHAR[PLUS(pat, 1, n)], 99));
assume value_is(__ctobpl_const_669, pat);
assume value_is(__ctobpl_const_670, n);
assume value_is(__ctobpl_const_671, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_17;


// .\v10\replace.c(412)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 412} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
$Caseerror.arg.1$8$ := Mem_T.CHAR[PLUS(pat, 1, n)] ;
assume value_is(__ctobpl_const_672, $Caseerror.arg.1$8$);
assume value_is(__ctobpl_const_673, pat);
assume value_is(__ctobpl_const_674, n);
assume value_is(__ctobpl_const_675, Mem_T.CHAR[PLUS(pat, 1, n)]);
goto label_23;


// .\v10\replace.c(412)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 412} true;
call Caseerror ($Caseerror.arg.1$8$);
assume value_is(__ctobpl_const_676, $Caseerror.arg.1$8$);
assume value_is(__ctobpl_const_677, $Caseerror.arg.1$8$);
goto label_19;


// .\v10\replace.c(409)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 409} true;
size := 1 ;
assume value_is(__ctobpl_const_678, size);
goto label_20;


// .\v10\replace.c(410)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 410} true;
goto label_19;


// .\v10\replace.c(403)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 403} true;
size := 1 ;
assume value_is(__ctobpl_const_679, size);
goto label_21;


// .\v10\replace.c(404)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 404} true;
goto label_19;


// .\v10\replace.c(406)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 406} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
size := PLUS(Mem_T.CHAR[PLUS(pat, 1, PLUS(n, 1, 1))], 1, 2) ;
assume value_is(__ctobpl_const_680, size);
assume value_is(__ctobpl_const_681, pat);
assume value_is(__ctobpl_const_682, n);
assume value_is(__ctobpl_const_683, Mem_T.CHAR[PLUS(pat, 1, PLUS(n, 1, 1))]);
goto label_22;


// .\v10\replace.c(407)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 407} true;
goto label_19;


// .\v10\replace.c(400)
label_17:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 400} true;
size := 2 ;
assume value_is(__ctobpl_const_684, size);
goto label_18;


// .\v10\replace.c(400)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 400} true;
goto label_19;


// .\v10\replace.c(414)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 414} true;
result.patsize$1 := size ;
assume value_is(__ctobpl_const_685, size);
goto label_1;


// .\v10\replace.c(415)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 415} true;
return;


// .\v10\replace.c(415)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 415} true;
assume false;
return;

}



procedure {:extern}  putsub(lin.__1:int, s1.__1:int, s2.__1:int, sub.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fputc.arg.1$4$ : int;
var {:extern} $fputc.arg.1$8$ : int;
var {:extern} $fputc.arg.2$3$ : int;
var {:extern} $fputc.arg.2$7$ : int;
var {:extern} i : int;
var {:extern} j : int;
var {:extern} lin : int;
var {:extern} result.__iob_func$2 : int;
var {:extern} result.__iob_func$6 : int;
var {:extern} result.fputc$1 : int;
var {:extern} result.fputc$5 : int;
var {:extern} s1 : int;
var {:extern} s2 : int;
var {:extern} sub : int;
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

assume INT_LT(lin.__1, alloc);
assume INT_LT(sub.__1, alloc);
$fputc.arg.1$4$:= 0;//Init locals 
$fputc.arg.1$8$:= 0;//Init locals 
$fputc.arg.2$3$:= 0;//Init locals 
$fputc.arg.2$7$:= 0;//Init locals 
i:= 0;//Init locals 
j:= 0;//Init locals 
lin:= 0;//Init locals 
result.__iob_func$2:= 0;//Init locals 
result.__iob_func$6:= 0;//Init locals 
result.fputc$1:= 0;//Init locals 
result.fputc$5:= 0;//Init locals 
s1:= 0;//Init locals 
s2:= 0;//Init locals 
sub:= 0;//Init locals 
lin := lin.__1;
s1 := s1.__1;
s2 := s2.__1;
sub := sub.__1;
goto label_3;


// .\v10\replace.c(464)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 464} true;
goto label_4;


// .\v10\replace.c(465)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 465} true;
goto label_5;


// .\v10\replace.c(467)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 467} true;
i := 0 ;
assume value_is(__ctobpl_const_686, i);
goto label_6;


// .\v10\replace.c(468)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 468} true;
// loop entry initialization...
goto label_6_head;


label_6_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(sub != 0);
goto label_6_true , label_6_false ;


label_6_true :
assume (Mem_T.CHAR[PLUS(sub, 1, i)] != 0);
assume value_is(__ctobpl_const_687, sub);
assume value_is(__ctobpl_const_688, i);
assume value_is(__ctobpl_const_689, Mem_T.CHAR[PLUS(sub, 1, i)]);
goto label_7;


label_6_false :
assume (Mem_T.CHAR[PLUS(sub, 1, i)] == 0);
assume value_is(__ctobpl_const_687, sub);
assume value_is(__ctobpl_const_688, i);
assume value_is(__ctobpl_const_689, Mem_T.CHAR[PLUS(sub, 1, i)]);
goto label_1;


// .\v10\replace.c(480)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 480} true;
return;


// .\v10\replace.c(469)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 469} true;
//TAG: Dereferenced object is non-null
assert(sub != 0);
goto label_7_true , label_7_false ;


label_7_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(sub, 1, i)], -1));
assume value_is(__ctobpl_const_690, sub);
assume value_is(__ctobpl_const_691, i);
assume value_is(__ctobpl_const_692, Mem_T.CHAR[PLUS(sub, 1, i)]);
goto label_11;


label_7_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(sub, 1, i)], -1));
assume value_is(__ctobpl_const_690, sub);
assume value_is(__ctobpl_const_691, i);
assume value_is(__ctobpl_const_692, Mem_T.CHAR[PLUS(sub, 1, i)]);
goto label_8;


// .\v10\replace.c(476)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 476} true;
call result.__iob_func$6 := __iob_func ();
goto label_23;


// .\v10\replace.c(476)
label_23:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 476} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$6 != 0);
$fputc.arg.2$7$ := PLUS(result.__iob_func$6, 32, 1) ;
assume value_is(__ctobpl_const_693, $fputc.arg.2$7$);
assume value_is(__ctobpl_const_694, result.__iob_func$6);
goto label_24;


// .\v10\replace.c(476)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 476} true;
//TAG: Dereferenced object is non-null
assert(sub != 0);
$fputc.arg.1$8$ := Mem_T.CHAR[PLUS(sub, 1, i)] ;
assume value_is(__ctobpl_const_695, $fputc.arg.1$8$);
assume value_is(__ctobpl_const_696, sub);
assume value_is(__ctobpl_const_697, i);
assume value_is(__ctobpl_const_698, Mem_T.CHAR[PLUS(sub, 1, i)]);
goto label_25;


// .\v10\replace.c(476)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 476} true;
call result.fputc$5 := fputc ($fputc.arg.1$8$, $fputc.arg.2$7$);
assume value_is(__ctobpl_const_699, $fputc.arg.1$8$);
assume value_is(__ctobpl_const_700, $fputc.arg.2$7$);
assume value_is(__ctobpl_const_701, $fputc.arg.1$8$);
assume value_is(__ctobpl_const_702, $fputc.arg.2$7$);
goto label_13;


// .\v10\replace.c(470)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 470} true;
j := s1 ;
assume value_is(__ctobpl_const_703, j);
assume value_is(__ctobpl_const_704, s1);
goto label_12;


// .\v10\replace.c(470)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 470} true;
// loop entry initialization...
goto label_12_head;


label_12_head:
// loop head assertions...

// end loop head assertions

goto label_12_true , label_12_false ;


label_12_true :
assume (INT_LT(j, s2));
assume value_is(__ctobpl_const_705, j);
assume value_is(__ctobpl_const_706, s2);
goto label_14;


label_12_false :
assume !(INT_LT(j, s2));
assume value_is(__ctobpl_const_705, j);
assume value_is(__ctobpl_const_706, s2);
goto label_13;


// .\v10\replace.c(478)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 478} true;
i := PLUS(i, 1, 1) ;
assume value_is(__ctobpl_const_707, i);
assume value_is(__ctobpl_const_708, i);
goto label_6_head;


// .\v10\replace.c(472)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 472} true;
call result.__iob_func$2 := __iob_func ();
goto label_17;


// .\v10\replace.c(472)
label_17:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 472} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$2 != 0);
$fputc.arg.2$3$ := PLUS(result.__iob_func$2, 32, 1) ;
assume value_is(__ctobpl_const_709, $fputc.arg.2$3$);
assume value_is(__ctobpl_const_710, result.__iob_func$2);
goto label_18;


// .\v10\replace.c(472)
label_18:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 472} true;
//TAG: Dereferenced object is non-null
assert(lin != 0);
$fputc.arg.1$4$ := Mem_T.CHAR[PLUS(lin, 1, j)] ;
assume value_is(__ctobpl_const_711, $fputc.arg.1$4$);
assume value_is(__ctobpl_const_712, lin);
assume value_is(__ctobpl_const_713, j);
assume value_is(__ctobpl_const_714, Mem_T.CHAR[PLUS(lin, 1, j)]);
goto label_19;


// .\v10\replace.c(472)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 472} true;
call result.fputc$1 := fputc ($fputc.arg.1$4$, $fputc.arg.2$3$);
assume value_is(__ctobpl_const_715, $fputc.arg.1$4$);
assume value_is(__ctobpl_const_716, $fputc.arg.2$3$);
assume value_is(__ctobpl_const_717, $fputc.arg.1$4$);
assume value_is(__ctobpl_const_718, $fputc.arg.2$3$);
goto label_22;


// .\v10\replace.c(470)
label_22:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 470} true;
assume value_is(__ctobpl_const_719, j);
j := PLUS(j, 1, 1) ;
goto label_12_head;


// .\v10\replace.c(480)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 480} true;
assume false;
return;

}



procedure {:extern}  stclose(pat.__1:int, j.__1:int, lastj.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $addstr.arg.1$2$ : int;
var {:extern} j : int;
var {:extern} jp : int;
var {:extern} jt : int;
var {:extern} junk : int;
var {:extern} lastj : int;
var {:extern} pat : int;
var {:extern} result.addstr$1 : int;
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

assume INT_LT(pat.__1, alloc);
assume INT_LT(j.__1, alloc);
$addstr.arg.1$2$:= 0;//Init locals 
j:= 0;//Init locals 
jp:= 0;//Init locals 
call jt := __HAVOC_det_malloc(4);
junk:= 0;//Init locals 
lastj:= 0;//Init locals 
pat:= 0;//Init locals 
result.addstr$1:= 0;//Init locals 
pat := pat.__1;
j := j.__1;
lastj := lastj.__1;
goto label_3;


// .\v10\replace.c(160)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 160} true;
goto label_4;


// .\v10\replace.c(161)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 161} true;
goto label_5;


// .\v10\replace.c(162)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 162} true;
goto label_6;


// .\v10\replace.c(165)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 165} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
jp := MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.INT4[j], 1, 1) ;
assume value_is(__ctobpl_const_720, jp);
assume value_is(__ctobpl_const_721, j);
assume value_is(__ctobpl_const_722, Mem_T.INT4[j]);
goto label_7;


// .\v10\replace.c(165)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 165} true;
// loop entry initialization...
goto label_7_head;


label_7_head:
// loop head assertions...

// end loop head assertions

goto label_7_true , label_7_false ;


label_7_true :
assume (INT_LEQ(lastj, jp));
assume value_is(__ctobpl_const_723, lastj);
assume value_is(__ctobpl_const_724, jp);
goto label_9;


label_7_false :
assume !(INT_LEQ(lastj, jp));
assume value_is(__ctobpl_const_723, lastj);
assume value_is(__ctobpl_const_724, jp);
goto label_8;


// .\v10\replace.c(170)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 170} true;
//TAG: Dereferenced object is non-null
assert(j != 0);
//TAG: Dereferenced object is non-null
assert(j != 0);
Mem_T.INT4 := Mem_T.INT4[j := PLUS(Mem_T.INT4[j], 1, 1)];
assume value_is(__ctobpl_const_725, j);
assume value_is(__ctobpl_const_726, Mem_T.INT4[j]);
assume value_is(__ctobpl_const_727, j);
assume value_is(__ctobpl_const_728, Mem_T.INT4[j]);
goto label_16;


// .\v10\replace.c(171)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 171} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(pat, 1, lastj) := 42];
assume value_is(__ctobpl_const_729, pat);
assume value_is(__ctobpl_const_730, lastj);
assume value_is(__ctobpl_const_731, Mem_T.CHAR[PLUS(pat, 1, lastj)]);
goto label_1;


// .\v10\replace.c(172)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 172} true;
call __HAVOC_free(jt);
return;


// .\v10\replace.c(167)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 167} true;
Mem_T.INT4 := Mem_T.INT4[jt := PLUS(jp, 1, 1)];
assume value_is(__ctobpl_const_732, Mem_T.INT4[jt]);
assume value_is(__ctobpl_const_733, jp);
goto label_10;


// .\v10\replace.c(168)
label_10:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 168} true;
//TAG: Dereferenced object is non-null
assert(pat != 0);
$addstr.arg.1$2$ := Mem_T.CHAR[PLUS(pat, 1, jp)] ;
assume value_is(__ctobpl_const_734, $addstr.arg.1$2$);
assume value_is(__ctobpl_const_735, pat);
assume value_is(__ctobpl_const_736, jp);
assume value_is(__ctobpl_const_737, Mem_T.CHAR[PLUS(pat, 1, jp)]);
goto label_11;


// .\v10\replace.c(168)
label_11:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 168} true;
call result.addstr$1 := addstr ($addstr.arg.1$2$, pat, jt, 100);
assume value_is(__ctobpl_const_738, $addstr.arg.1$2$);
assume value_is(__ctobpl_const_739, pat);
assume value_is(__ctobpl_const_740, Mem_T.INT4[jt]);
assume value_is(__ctobpl_const_741, $addstr.arg.1$2$);
assume value_is(__ctobpl_const_742, pat);
assume value_is(__ctobpl_const_743, Mem_T.INT4[jt]);
goto label_14;


// .\v10\replace.c(168)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 168} true;
junk := result.addstr$1 ;
assume value_is(__ctobpl_const_744, junk);
assume value_is(__ctobpl_const_745, result.addstr$1);
goto label_15;


// .\v10\replace.c(165)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 165} true;
assume value_is(__ctobpl_const_746, jp);
jp := MINUS_BOTH_PTR_OR_BOTH_INT( jp, 1, 1) ;
goto label_7_head;


// .\v10\replace.c(172)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 172} true;
assume false;
return;

}



procedure {:extern}  subline(lin.__1:int, pat.__1:int, sub.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fputc.arg.1$5$ : int;
var {:extern} $fputc.arg.2$4$ : int;
var {:extern} i : int;
var {:extern} lastm : int;
var {:extern} lin : int;
var {:extern} m : int;
var {:extern} pat : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.amatch$1 : int;
var {:extern} result.fputc$2 : int;
var {:extern} sub : int;
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

assume INT_LT(lin.__1, alloc);
assume INT_LT(pat.__1, alloc);
assume INT_LT(sub.__1, alloc);
$fputc.arg.1$5$:= 0;//Init locals 
$fputc.arg.2$4$:= 0;//Init locals 
i:= 0;//Init locals 
lastm:= 0;//Init locals 
lin:= 0;//Init locals 
m:= 0;//Init locals 
pat:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.amatch$1:= 0;//Init locals 
result.fputc$2:= 0;//Init locals 
sub:= 0;//Init locals 
lin := lin.__1;
pat := pat.__1;
sub := sub.__1;
goto label_3;


// .\v10\replace.c(488)
label_3:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 488} true;
goto label_4;


// .\v10\replace.c(488)
label_4:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 488} true;
goto label_5;


// .\v10\replace.c(488)
label_5:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 488} true;
goto label_6;


// .\v10\replace.c(490)
label_6:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 490} true;
lastm := -1 ;
assume value_is(__ctobpl_const_747, lastm);
goto label_7;


// .\v10\replace.c(491)
label_7:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 491} true;
i := 0 ;
assume value_is(__ctobpl_const_748, i);
goto label_8;


// .\v10\replace.c(492)
label_8:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 492} true;
// loop entry initialization...
goto label_8_head;


label_8_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(lin != 0);
goto label_8_true , label_8_false ;


label_8_true :
assume (Mem_T.CHAR[PLUS(lin, 1, i)] != 0);
assume value_is(__ctobpl_const_749, lin);
assume value_is(__ctobpl_const_750, i);
assume value_is(__ctobpl_const_751, Mem_T.CHAR[PLUS(lin, 1, i)]);
goto label_9;


label_8_false :
assume (Mem_T.CHAR[PLUS(lin, 1, i)] == 0);
assume value_is(__ctobpl_const_749, lin);
assume value_is(__ctobpl_const_750, i);
assume value_is(__ctobpl_const_751, Mem_T.CHAR[PLUS(lin, 1, i)]);
goto label_1;


// .\v10\replace.c(505)
label_1:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 505} true;
return;


// .\v10\replace.c(494)
label_9:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 494} true;
call result.amatch$1 := amatch (lin, i, pat, 0);
assume value_is(__ctobpl_const_752, lin);
assume value_is(__ctobpl_const_753, i);
assume value_is(__ctobpl_const_754, pat);
assume value_is(__ctobpl_const_755, lin);
assume value_is(__ctobpl_const_756, i);
assume value_is(__ctobpl_const_757, pat);
goto label_12;


// .\v10\replace.c(494)
label_12:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 494} true;
m := result.amatch$1 ;
assume value_is(__ctobpl_const_758, m);
assume value_is(__ctobpl_const_759, result.amatch$1);
goto label_13;


// .\v10\replace.c(495)
label_13:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 495} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (INT_LEQ(0, m));
assume value_is(__ctobpl_const_760, m);
goto label_15;


label_13_false :
assume !(INT_LEQ(0, m));
assume value_is(__ctobpl_const_760, m);
goto label_14;


// .\v10\replace.c(495)
label_15:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 495} true;
goto label_15_true , label_15_false ;


label_15_true :
assume (INT_NEQ(lastm, m));
assume value_is(__ctobpl_const_761, lastm);
assume value_is(__ctobpl_const_762, m);
goto label_16;


label_15_false :
assume !(INT_NEQ(lastm, m));
assume value_is(__ctobpl_const_761, lastm);
assume value_is(__ctobpl_const_762, m);
goto label_14;


// .\v10\replace.c(496)
label_16:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 496} true;
call putsub (lin, i, m, sub);
assume value_is(__ctobpl_const_763, lin);
assume value_is(__ctobpl_const_764, i);
assume value_is(__ctobpl_const_765, m);
assume value_is(__ctobpl_const_766, sub);
assume value_is(__ctobpl_const_767, lin);
assume value_is(__ctobpl_const_768, i);
assume value_is(__ctobpl_const_769, m);
assume value_is(__ctobpl_const_770, sub);
goto label_19;


// .\v10\replace.c(497)
label_19:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 497} true;
lastm := m ;
assume value_is(__ctobpl_const_771, lastm);
assume value_is(__ctobpl_const_772, m);
goto label_14;


// .\v10\replace.c(499)
label_14:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 499} true;
goto label_14_true , label_14_false ;


label_14_true :
assume (INT_EQ(m, -1));
assume value_is(__ctobpl_const_773, m);
goto label_21;


label_14_false :
assume !(INT_EQ(m, -1));
assume value_is(__ctobpl_const_773, m);
goto label_20;


// .\v10\replace.c(499)
label_20:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 499} true;
goto label_20_true , label_20_false ;


label_20_true :
assume (INT_EQ(m, i));
assume value_is(__ctobpl_const_774, m);
assume value_is(__ctobpl_const_775, i);
goto label_21;


label_20_false :
assume !(INT_EQ(m, i));
assume value_is(__ctobpl_const_774, m);
assume value_is(__ctobpl_const_775, i);
goto label_30;


// .\v10\replace.c(503)
label_30:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 503} true;
i := m ;
assume value_is(__ctobpl_const_776, i);
assume value_is(__ctobpl_const_777, m);
goto label_8_head;


// .\v10\replace.c(500)
label_21:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 500} true;
call result.__iob_func$3 := __iob_func ();
goto label_24;


// .\v10\replace.c(500)
label_24:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 500} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fputc.arg.2$4$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_778, $fputc.arg.2$4$);
assume value_is(__ctobpl_const_779, result.__iob_func$3);
goto label_25;


// .\v10\replace.c(500)
label_25:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 500} true;
//TAG: Dereferenced object is non-null
assert(lin != 0);
$fputc.arg.1$5$ := Mem_T.CHAR[PLUS(lin, 1, i)] ;
assume value_is(__ctobpl_const_780, $fputc.arg.1$5$);
assume value_is(__ctobpl_const_781, lin);
assume value_is(__ctobpl_const_782, i);
assume value_is(__ctobpl_const_783, Mem_T.CHAR[PLUS(lin, 1, i)]);
goto label_26;


// .\v10\replace.c(500)
label_26:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 500} true;
call result.fputc$2 := fputc ($fputc.arg.1$5$, $fputc.arg.2$4$);
assume value_is(__ctobpl_const_784, $fputc.arg.1$5$);
assume value_is(__ctobpl_const_785, $fputc.arg.2$4$);
assume value_is(__ctobpl_const_786, $fputc.arg.1$5$);
assume value_is(__ctobpl_const_787, $fputc.arg.2$4$);
goto label_29;


// .\v10\replace.c(501)
label_29:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 501} true;
i := PLUS(i, 1, 1) ;
assume value_is(__ctobpl_const_788, i);
assume value_is(__ctobpl_const_789, i);
goto label_8_head;


// .\v10\replace.c(505)
label_2:
assert {:sourcefile ".\v10\replace.c"} {:sourceline 505} true;
assume false;
return;

}

