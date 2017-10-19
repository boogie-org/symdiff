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
var {:extern} Mem_T.A10CHAR : [int]int;
var {:extern} Mem_T.A13CHAR : [int]int;
var {:extern} Mem_T.A14CHAR : [int]int;
var {:extern} Mem_T.A16CHAR : [int]int;
var {:extern} Mem_T.A17CHAR : [int]int;
var {:extern} Mem_T.A20CHAR : [int]int;
var {:extern} Mem_T.A28CHAR : [int]int;
var {:extern} Mem_T.A2CHAR : [int]int;
var {:extern} Mem_T.A360INT4 : [int]int;
var {:extern} Mem_T.A3CHAR : [int]int;
var {:extern} Mem_T.A47CHAR : [int]int;
var {:extern} Mem_T.A4CHAR : [int]int;
var {:extern} Mem_T.A60INT4 : [int]int;
var {:extern} Mem_T.A6CHAR : [int]int;
var {:extern} Mem_T.A7CHAR : [int]int;
var {:extern} Mem_T.A80CHAR : [int]int;
var {:extern} Mem_T.A8CHAR : [int]int;
var {:extern} Mem_T.A9CHAR : [int]int;
var {:extern} Mem_T.CHAR : [int]int;
var {:extern} Mem_T.INT4 : [int]int;
var {:extern} Mem_T.PCHAR : [int]int;
var {:extern} Mem_T.PINT4 : [int]int;
var {:extern} Mem_T.P_iobuf : [int]int;
var {:extern} Mem_T.Pstream_type : [int]int;
var {:extern} Mem_T.Ptoken_stream_type : [int]int;
var {:extern} Mem_T.Ptoken_type : [int]int;
var {:extern} Mem_T.UINT4 : [int]int;
var {:extern} Mem_T.ch_stream_token_stream_type : [int]int;
var {:extern} Mem_T.fp_stream_type : [int]int;
var {:extern} Mem_T.stream_ind_stream_type : [int]int;
var {:extern} Mem_T.stream_stream_type : [int]int;
var {:extern} Mem_T.token_id_token_type : [int]int;
var {:extern} Mem_T.token_string_token_type : [int]int;
function {:extern} Match(a:int, t:name) returns (bool);
function {:extern} MatchBase(b:int, a:int, t:name) returns (bool);
function {:extern} HasType(v:int, t:name) returns (bool);

function {:extern} T.Ptr(t:name) returns (name);
axiom(forall a:int, t:name :: {Match(a, T.Ptr(t))} Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));   //marker for a 
axiom(forall b:int, a:int, t:name :: {MatchBase(b, a, T.Ptr(t))} MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b); // marker for b 
axiom(forall v:int, t:name :: {HasType(v, T.Ptr(t))} HasType(v, T.Ptr(t)) <==> (v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t))));

// Field declarations without typesafety
const {:extern} unique T.ch_stream_token_stream_type:name;
const {:extern} unique T.fp_stream_type:name;
const {:extern} unique T.stream_ind_stream_type:name;
const {:extern} unique T.stream_stream_type:name;
const {:extern} unique T.token_id_token_type:name;
const {:extern} unique T.token_string_token_type:name;

// Type declarations for type safety 

const {:extern} unique T.A10CHAR:name;
const {:extern} unique T.A13CHAR:name;
const {:extern} unique T.A14CHAR:name;
const {:extern} unique T.A16CHAR:name;
const {:extern} unique T.A17CHAR:name;
const {:extern} unique T.A20CHAR:name;
const {:extern} unique T.A28CHAR:name;
const {:extern} unique T.A2CHAR:name;
const {:extern} unique T.A360INT4:name;
const {:extern} unique T.A3CHAR:name;
const {:extern} unique T.A47CHAR:name;
const {:extern} unique T.A4CHAR:name;
const {:extern} unique T.A60INT4:name;
const {:extern} unique T.A6CHAR:name;
const {:extern} unique T.A7CHAR:name;
const {:extern} unique T.A80CHAR:name;
const {:extern} unique T.A8CHAR:name;
const {:extern} unique T.A9CHAR:name;
const {:extern} unique T.CHAR:name;
const {:extern} unique T.INT4:name;
const {:extern} unique T.PA10CHAR:name;
const {:extern} unique T.PA13CHAR:name;
const {:extern} unique T.PA14CHAR:name;
const {:extern} unique T.PA16CHAR:name;
const {:extern} unique T.PA17CHAR:name;
const {:extern} unique T.PA20CHAR:name;
const {:extern} unique T.PA28CHAR:name;
const {:extern} unique T.PA2CHAR:name;
const {:extern} unique T.PA360INT4:name;
const {:extern} unique T.PA3CHAR:name;
const {:extern} unique T.PA47CHAR:name;
const {:extern} unique T.PA4CHAR:name;
const {:extern} unique T.PA60INT4:name;
const {:extern} unique T.PA6CHAR:name;
const {:extern} unique T.PA7CHAR:name;
const {:extern} unique T.PA80CHAR:name;
const {:extern} unique T.PA8CHAR:name;
const {:extern} unique T.PA9CHAR:name;
const {:extern} unique T.PCHAR:name;
const {:extern} unique T.PINT4:name;
const {:extern} unique T.PPCHAR:name;
const {:extern} unique T.PPPCHAR:name;
const {:extern} unique T.PP_iobuf:name;
const {:extern} unique T.PPstream_type:name;
const {:extern} unique T.PPtoken_stream_type:name;
const {:extern} unique T.PPtoken_type:name;
const {:extern} unique T.P_iobuf:name;
const {:extern} unique T.Pstream_type:name;
const {:extern} unique T.Ptoken_stream_type:name;
const {:extern} unique T.Ptoken_type:name;
const {:extern} unique T.UINT4:name;
const {:extern} unique T._iobuf:name;
const {:extern} unique T.stream_type:name;
const {:extern} unique T.token_stream_type:name;
const {:extern} unique T.token_type:name;

// Field offset definitions

function {:extern}  ch_stream_token_stream_type(int) returns (int);        
axiom (forall x:int :: {ch_stream_token_stream_type(x)} ch_stream_token_stream_type(x) == INT_ADD(x, 0));
axiom (forall x:int :: {ch_stream_token_stream_type(x)} ch_stream_token_stream_type(x) == PLUS(x, 1, 0));

function {:extern}  fp_stream_type(int) returns (int);        
axiom (forall x:int :: {fp_stream_type(x)} fp_stream_type(x) == INT_ADD(x, 0));
axiom (forall x:int :: {fp_stream_type(x)} fp_stream_type(x) == PLUS(x, 1, 0));

function {:extern}  stream_ind_stream_type(int) returns (int);        
axiom (forall x:int :: {stream_ind_stream_type(x)} stream_ind_stream_type(x) == INT_ADD(x, 4));
axiom (forall x:int :: {stream_ind_stream_type(x)} stream_ind_stream_type(x) == PLUS(x, 1, 4));

function {:extern}  stream_stream_type(int) returns (int);        
axiom (forall x:int :: {stream_stream_type(x)} stream_stream_type(x) == INT_ADD(x, 8));
axiom (forall x:int :: {stream_stream_type(x)} stream_stream_type(x) == PLUS(x, 1, 8));

function {:extern}  token_id_token_type(int) returns (int);        
axiom (forall x:int :: {token_id_token_type(x)} token_id_token_type(x) == INT_ADD(x, 0));
axiom (forall x:int :: {token_id_token_type(x)} token_id_token_type(x) == PLUS(x, 1, 0));

function {:extern}  token_string_token_type(int) returns (int);        
axiom (forall x:int :: {token_string_token_type(x)} token_string_token_type(x) == INT_ADD(x, 4));
axiom (forall x:int :: {token_string_token_type(x)} token_string_token_type(x) == PLUS(x, 1, 4));


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
const {:extern} unique base : int;
axiom(base != 0);
axiom(Base(base) == base);
const {:extern} unique check : int;
axiom(check != 0);
axiom(Base(check) == check);
const {:extern} unique default1 : int;
axiom(default1 != 0);
axiom(Base(default1) == default1);
const {:extern} unique next : int;
axiom(next != 0);
axiom(Base(next) == next);
//CToBplModel constants
function  {:extern} value_is(c:int , e:int) returns (r:bool);
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 195} unique __ctobpl_const_116:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 202} unique __ctobpl_const_117:int;
const {:extern} {:model_const "token_str[token_ind ++]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 197} unique __ctobpl_const_119:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 100} unique __ctobpl_const_98:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 191} unique __ctobpl_const_105:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 197} unique __ctobpl_const_120:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 198} unique __ctobpl_const_121:int;
const {:extern} {:model_const "result.next_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_279:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 191} unique __ctobpl_const_109:int;
const {:extern} {:model_const "token_found"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 193} unique __ctobpl_const_115:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 100} unique __ctobpl_const_100:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 191} unique __ctobpl_const_108:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 197} unique __ctobpl_const_118:int;
const {:extern} {:model_const "token_found"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 192} unique __ctobpl_const_112:int;
const {:extern} {:model_const "result.fgets"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_93:int;
const {:extern} {:model_const "stream_ptr->stream[5]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 97} unique __ctobpl_const_95:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 97} unique __ctobpl_const_94:int;
const {:extern} {:model_const "stream_ptr->stream[stream_ptr->stream_ind ++]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 100} unique __ctobpl_const_101:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 191} unique __ctobpl_const_104:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 191} unique __ctobpl_const_106:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 191} unique __ctobpl_const_107:int;
const {:extern} {:model_const "stream_ptr->fp"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_92:int;
const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 190} unique __ctobpl_const_103:int;
const {:extern} {:model_const "token_found"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 192} unique __ctobpl_const_110:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 192} unique __ctobpl_const_111:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 98} unique __ctobpl_const_96:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 190} unique __ctobpl_const_102:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 192} unique __ctobpl_const_113:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 98} unique __ctobpl_const_97:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 100} unique __ctobpl_const_99:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 192} unique __ctobpl_const_114:int;
const {:extern} {:model_const "result.is_end_of_character_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 418} unique __ctobpl_const_436:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 529} unique __ctobpl_const_416:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 532} unique __ctobpl_const_426:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 527} unique __ctobpl_const_409:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 526} unique __ctobpl_const_407:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 529} unique __ctobpl_const_417:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 528} unique __ctobpl_const_412:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 530} unique __ctobpl_const_419:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 529} unique __ctobpl_const_413:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 532} unique __ctobpl_const_425:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 529} unique __ctobpl_const_415:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 527} unique __ctobpl_const_410:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 529} unique __ctobpl_const_414:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 530} unique __ctobpl_const_418:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 531} unique __ctobpl_const_420:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 531} unique __ctobpl_const_421:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 531} unique __ctobpl_const_424:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 533} unique __ctobpl_const_428:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 417} unique __ctobpl_const_429:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 417} unique __ctobpl_const_431:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 531} unique __ctobpl_const_422:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 417} unique __ctobpl_const_430:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 417} unique __ctobpl_const_432:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 525} unique __ctobpl_const_406:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 533} unique __ctobpl_const_427:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 526} unique __ctobpl_const_408:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 417} unique __ctobpl_const_433:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 418} unique __ctobpl_const_434:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 531} unique __ctobpl_const_423:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 528} unique __ctobpl_const_411:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 418} unique __ctobpl_const_435:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 140} unique __ctobpl_const_447:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 140} unique __ctobpl_const_449:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 386} unique __ctobpl_const_442:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 140} unique __ctobpl_const_448:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 420} unique __ctobpl_const_438:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 420} unique __ctobpl_const_439:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 420} unique __ctobpl_const_440:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 420} unique __ctobpl_const_437:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 137} unique __ctobpl_const_445:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 137} unique __ctobpl_const_446:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 420} unique __ctobpl_const_441:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 396} unique __ctobpl_const_444:int;
const {:extern} {:model_const "stream_ptr->stream[-- stream_ptr->stream_ind]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 140} unique __ctobpl_const_450:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 396} unique __ctobpl_const_443:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 140} unique __ctobpl_const_451:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 437} unique __ctobpl_const_11:int;
const {:extern} {:model_const "result.is_end_of_character_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 314} unique __ctobpl_const_19:int;
const {:extern} {:model_const "result.isalpha"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_5:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_6:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_8:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 320} unique __ctobpl_const_20:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 322} unique __ctobpl_const_22:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 322} unique __ctobpl_const_25:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 322} unique __ctobpl_const_26:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 323} unique __ctobpl_const_27:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 325} unique __ctobpl_const_28:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 325} unique __ctobpl_const_29:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_2:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_9:int;
const {:extern} {:model_const "token_str[token_ind - 2]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 440} unique __ctobpl_const_14:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 314} unique __ctobpl_const_17:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 440} unique __ctobpl_const_13:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 558} unique __ctobpl_const_58:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 314} unique __ctobpl_const_18:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 322} unique __ctobpl_const_23:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_1:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 440} unique __ctobpl_const_12:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_3:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 322} unique __ctobpl_const_21:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_4:int;
const {:extern} {:model_const "result.isdigit"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_10:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 314} unique __ctobpl_const_15:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 314} unique __ctobpl_const_16:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 322} unique __ctobpl_const_24:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 344} unique __ctobpl_const_7:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_207:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 214} unique __ctobpl_const_202:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_210:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_211:int;
const {:extern} {:model_const "result.numeric_case"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_213:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_209:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 245} unique __ctobpl_const_191:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 212} unique __ctobpl_const_199:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 243} unique __ctobpl_const_187:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 213} unique __ctobpl_const_200:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_212:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_214:int;
const {:extern} {:model_const "result.special"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 243} unique __ctobpl_const_188:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_215:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 215} unique __ctobpl_const_203:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_208:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 211} unique __ctobpl_const_192:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_216:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 212} unique __ctobpl_const_197:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 212} unique __ctobpl_const_195:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 214} unique __ctobpl_const_201:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 212} unique __ctobpl_const_196:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 243} unique __ctobpl_const_186:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 216} unique __ctobpl_const_204:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_205:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 208} unique __ctobpl_const_206:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 211} unique __ctobpl_const_193:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 244} unique __ctobpl_const_189:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 212} unique __ctobpl_const_198:int;
const {:extern} {:model_const "token_ptr->token_string[0]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 244} unique __ctobpl_const_190:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 212} unique __ctobpl_const_194:int;
const {:extern} {:model_const "argv"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_236:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 117} unique __ctobpl_const_227:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_222:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_220:int;
const {:extern} {:model_const "result.error_or_eof_case"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_224:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_223:int;
const {:extern} {:model_const "t->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 486} unique __ctobpl_const_230:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 368} unique __ctobpl_const_233:int;
const {:extern} {:model_const "argc"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 34} unique __ctobpl_const_234:int;
const {:extern} {:model_const "argv[1]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_237:int;
const {:extern} {:model_const "open_token_stream.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_238:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_244:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_242:int;
const {:extern} {:model_const "t"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 486} unique __ctobpl_const_229:int;
const {:extern} {:model_const "result.get_token"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_245:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_246:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_243:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_217:int;
const {:extern} {:model_const "open_token_stream.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_235:int;
const {:extern} {:model_const "open_token_stream.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_239:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 117} unique __ctobpl_const_226:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 361} unique __ctobpl_const_231:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_240:int;
const {:extern} {:model_const "FILENAME"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 70} unique __ctobpl_const_342:int;
const {:extern} {:model_const "result.open_token_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 39} unique __ctobpl_const_241:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_247:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_221:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 368} unique __ctobpl_const_232:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_218:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 205} unique __ctobpl_const_219:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 117} unique __ctobpl_const_225:int;
const {:extern} {:model_const "stream_ptr->stream[stream_ptr->stream_ind - 1]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 117} unique __ctobpl_const_228:int;
const {:extern} {:model_const "next_state.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_262:int;
const {:extern} {:model_const "next_state.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_259:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 36} unique __ctobpl_const_253:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_260:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 464} unique __ctobpl_const_269:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 460} unique __ctobpl_const_255:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 464} unique __ctobpl_const_271:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 462} unique __ctobpl_const_258:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_263:int;
const {:extern} {:model_const "base[state]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 464} unique __ctobpl_const_268:int;
const {:extern} {:model_const "base[state]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 462} unique __ctobpl_const_257:int;
const {:extern} {:model_const "next_state.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_264:int;
const {:extern} {:model_const "next_state.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_272:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_273:int;
const {:extern} {:model_const "check[base[state] + (int )ch]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 464} unique __ctobpl_const_270:int;
const {:extern} {:model_const "default1[state]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_274:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 464} unique __ctobpl_const_267:int;
const {:extern} {:model_const "next_state.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_275:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_276:int;
const {:extern} {:model_const "result.next_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_266:int;
const {:extern} {:model_const "default1[state]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_261:int;
const {:extern} {:model_const "next_state.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_277:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 470} unique __ctobpl_const_265:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 43} unique __ctobpl_const_251:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 467} unique __ctobpl_const_278:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 43} unique __ctobpl_const_252:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 42} unique __ctobpl_const_249:int;
const {:extern} {:model_const "result.is_eof_token"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 41} unique __ctobpl_const_248:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 36} unique __ctobpl_const_254:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 42} unique __ctobpl_const_250:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 462} unique __ctobpl_const_256:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 292} unique __ctobpl_const_296:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 290} unique __ctobpl_const_288:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 291} unique __ctobpl_const_293:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 290} unique __ctobpl_const_289:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 291} unique __ctobpl_const_295:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 293} unique __ctobpl_const_299:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 291} unique __ctobpl_const_292:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 525} unique __ctobpl_const_405:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 276} unique __ctobpl_const_285:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 293} unique __ctobpl_const_297:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 294} unique __ctobpl_const_303:int;
const {:extern} {:model_const "next[base[state] + (int )ch]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 465} unique __ctobpl_const_283:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 278} unique __ctobpl_const_306:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 279} unique __ctobpl_const_308:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 294} unique __ctobpl_const_301:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 278} unique __ctobpl_const_305:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 465} unique __ctobpl_const_280:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 465} unique __ctobpl_const_282:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 279} unique __ctobpl_const_307:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 276} unique __ctobpl_const_286:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 291} unique __ctobpl_const_291:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 293} unique __ctobpl_const_298:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 294} unique __ctobpl_const_302:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 295} unique __ctobpl_const_304:int;
const {:extern} {:model_const "result.check_delimiter"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 279} unique __ctobpl_const_309:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 281} unique __ctobpl_const_310:int;
const {:extern} {:model_const "result.check_delimiter"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 276} unique __ctobpl_const_287:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 291} unique __ctobpl_const_294:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 293} unique __ctobpl_const_300:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 291} unique __ctobpl_const_290:int;
const {:extern} {:model_const "base[state]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 465} unique __ctobpl_const_281:int;
const {:extern} {:model_const "state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 461} unique __ctobpl_const_284:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 287} unique __ctobpl_const_334:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 288} unique __ctobpl_const_335:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_320:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_313:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 287} unique __ctobpl_const_333:int;
const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 67} unique __ctobpl_const_337:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 68} unique __ctobpl_const_338:int;
const {:extern} {:model_const "stream_ptr->stream[5]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 69} unique __ctobpl_const_341:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_318:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_316:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 286} unique __ctobpl_const_329:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 284} unique __ctobpl_const_324:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 286} unique __ctobpl_const_331:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 285} unique __ctobpl_const_327:int;
const {:extern} {:model_const "token_str[token_ind ++]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_319:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_314:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 287} unique __ctobpl_const_332:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_315:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 286} unique __ctobpl_const_328:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 67} unique __ctobpl_const_336:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 68} unique __ctobpl_const_339:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 284} unique __ctobpl_const_325:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_312:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_317:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 69} unique __ctobpl_const_340:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 284} unique __ctobpl_const_326:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 284} unique __ctobpl_const_321:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 282} unique __ctobpl_const_311:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 286} unique __ctobpl_const_330:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 284} unique __ctobpl_const_323:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 284} unique __ctobpl_const_322:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 318} unique __ctobpl_const_42:int;
const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_50:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 328} unique __ctobpl_const_37:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 326} unique __ctobpl_const_30:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 316} unique __ctobpl_const_39:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 327} unique __ctobpl_const_34:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 317} unique __ctobpl_const_40:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 327} unique __ctobpl_const_36:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_44:int;
const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_46:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 326} unique __ctobpl_const_33:int;
const {:extern} {:model_const "stream_ptr->fp"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_89:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 327} unique __ctobpl_const_35:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_43:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_47:int;
const {:extern} {:model_const "fgets.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_90:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 557} unique __ctobpl_const_53:int;
const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_51:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_91:int;
const {:extern} {:model_const "token_str[ind]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 557} unique __ctobpl_const_55:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 326} unique __ctobpl_const_31:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 316} unique __ctobpl_const_38:int;
const {:extern} {:model_const "token_ptr->token_string[0]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 317} unique __ctobpl_const_41:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_45:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_48:int;
const {:extern} {:model_const "token_str[ind - 1]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_49:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 557} unique __ctobpl_const_54:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 326} unique __ctobpl_const_32:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 557} unique __ctobpl_const_56:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 557} unique __ctobpl_const_57:int;
const {:extern} {:model_const "result.isspace"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 555} unique __ctobpl_const_52:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 563} unique __ctobpl_const_75:int;
const {:extern} {:model_const "start"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 563} unique __ctobpl_const_72:int;
const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_65:int;
const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_66:int;
const {:extern} {:model_const "start"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 561} unique __ctobpl_const_68:int;
const {:extern} {:model_const "start"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_77:int;
const {:extern} {:model_const "ind"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_80:int;
const {:extern} {:model_const "isspace.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_61:int;
const {:extern} {:model_const "stream_ptr->stream_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 94} unique __ctobpl_const_83:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 563} unique __ctobpl_const_74:int;
const {:extern} {:model_const "token_str[ind]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_64:int;
const {:extern} {:model_const "result.isspace"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_67:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_63:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 563} unique __ctobpl_const_71:int;
const {:extern} {:model_const "token_str[start]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 563} unique __ctobpl_const_73:int;
const {:extern} {:model_const "token_str[ind]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 563} unique __ctobpl_const_76:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 561} unique __ctobpl_const_78:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 198} unique __ctobpl_const_122:int;
const {:extern} {:model_const "stream_ptr->stream[stream_ptr->stream_ind]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 94} unique __ctobpl_const_84:int;
const {:extern} {:model_const "ind"} {:sourceFile "unknown"} {:sourceLine 0} unique __ctobpl_const_79:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 558} unique __ctobpl_const_60:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 561} unique __ctobpl_const_69:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 94} unique __ctobpl_const_81:int;
const {:extern} {:model_const "ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 558} unique __ctobpl_const_59:int;
const {:extern} {:model_const "fgets.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_85:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_86:int;
const {:extern} {:model_const "token_str"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 559} unique __ctobpl_const_62:int;
const {:extern} {:model_const "fgets.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_87:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 561} unique __ctobpl_const_70:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 94} unique __ctobpl_const_82:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 96} unique __ctobpl_const_88:int;
const {:extern} {:model_const "FILENAME"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 163} unique __ctobpl_const_358:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 510} unique __ctobpl_const_368:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 511} unique __ctobpl_const_371:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 511} unique __ctobpl_const_372:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 512} unique __ctobpl_const_373:int;
const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 162} unique __ctobpl_const_357:int;
const {:extern} {:model_const "stream_ptr->fp"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_349:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 163} unique __ctobpl_const_360:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 77} unique __ctobpl_const_355:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 74} unique __ctobpl_const_354:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 165} unique __ctobpl_const_363:int;
const {:extern} {:model_const "result.fopen"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_350:int;
const {:extern} {:model_const "result.open_character_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 163} unique __ctobpl_const_362:int;
const {:extern} {:model_const "FILENAME"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_347:int;
const {:extern} {:model_const "stream_ptr->fp"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 71} unique __ctobpl_const_344:int;
const {:extern} {:model_const "stream_ptr->fp"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_352:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 71} unique __ctobpl_const_343:int;
const {:extern} {:model_const "FILENAME"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_346:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_348:int;
const {:extern} {:model_const "stream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 72} unique __ctobpl_const_351:int;
const {:extern} {:model_const "FILENAME"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 163} unique __ctobpl_const_359:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 74} unique __ctobpl_const_353:int;
const {:extern} {:model_const "token_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 163} unique __ctobpl_const_361:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 162} unique __ctobpl_const_356:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 508} unique __ctobpl_const_364:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 508} unique __ctobpl_const_365:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 510} unique __ctobpl_const_366:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 71} unique __ctobpl_const_345:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 510} unique __ctobpl_const_367:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 510} unique __ctobpl_const_369:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 510} unique __ctobpl_const_370:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 518} unique __ctobpl_const_387:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 516} unique __ctobpl_const_381:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 515} unique __ctobpl_const_380:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 519} unique __ctobpl_const_391:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 520} unique __ctobpl_const_395:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 512} unique __ctobpl_const_374:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 516} unique __ctobpl_const_382:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 513} unique __ctobpl_const_375:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 514} unique __ctobpl_const_378:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 520} unique __ctobpl_const_392:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 517} unique __ctobpl_const_383:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 520} unique __ctobpl_const_396:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 513} unique __ctobpl_const_376:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 518} unique __ctobpl_const_385:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 520} unique __ctobpl_const_393:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 518} unique __ctobpl_const_389:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 519} unique __ctobpl_const_390:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 522} unique __ctobpl_const_399:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 522} unique __ctobpl_const_400:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 523} unique __ctobpl_const_402:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 524} unique __ctobpl_const_403:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 520} unique __ctobpl_const_394:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 521} unique __ctobpl_const_397:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 523} unique __ctobpl_const_401:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 518} unique __ctobpl_const_388:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 524} unique __ctobpl_const_404:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 521} unique __ctobpl_const_398:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 514} unique __ctobpl_const_377:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 515} unique __ctobpl_const_379:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 517} unique __ctobpl_const_384:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 518} unique __ctobpl_const_386:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 219} unique __ctobpl_const_130:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 227} unique __ctobpl_const_138:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 234} unique __ctobpl_const_141:int;
const {:extern} {:model_const "result.next_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 198} unique __ctobpl_const_126:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 198} unique __ctobpl_const_125:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 226} unique __ctobpl_const_133:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 234} unique __ctobpl_const_140:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 226} unique __ctobpl_const_134:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 234} unique __ctobpl_const_145:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 229} unique __ctobpl_const_146:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 229} unique __ctobpl_const_147:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 229} unique __ctobpl_const_148:int;
const {:extern} {:model_const "result.check_delimiter"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 227} unique __ctobpl_const_139:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 234} unique __ctobpl_const_142:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 204} unique __ctobpl_const_127:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 226} unique __ctobpl_const_136:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 226} unique __ctobpl_const_131:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 229} unique __ctobpl_const_149:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 234} unique __ctobpl_const_144:int;
const {:extern} {:model_const "result.keyword"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 229} unique __ctobpl_const_150:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 207} unique __ctobpl_const_128:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 230} unique __ctobpl_const_151:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 230} unique __ctobpl_const_152:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 198} unique __ctobpl_const_123:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 226} unique __ctobpl_const_132:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 234} unique __ctobpl_const_143:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 198} unique __ctobpl_const_124:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 227} unique __ctobpl_const_137:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 230} unique __ctobpl_const_153:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 230} unique __ctobpl_const_154:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 210} unique __ctobpl_const_129:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 226} unique __ctobpl_const_135:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 249} unique __ctobpl_const_169:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 250} unique __ctobpl_const_170:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 230} unique __ctobpl_const_155:int;
const {:extern} {:model_const "token_ptr->token_id"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_165:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 232} unique __ctobpl_const_159:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 252} unique __ctobpl_const_171:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 252} unique __ctobpl_const_173:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 253} unique __ctobpl_const_175:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 257} unique __ctobpl_const_178:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 257} unique __ctobpl_const_179:int;
const {:extern} {:model_const "tstream_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 257} unique __ctobpl_const_180:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 257} unique __ctobpl_const_182:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 248} unique __ctobpl_const_167:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 248} unique __ctobpl_const_168:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 230} unique __ctobpl_const_156:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 257} unique __ctobpl_const_181:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 252} unique __ctobpl_const_174:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 257} unique __ctobpl_const_183:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 231} unique __ctobpl_const_157:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_160:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_163:int;
const {:extern} {:model_const "tstream_ptr->ch_stream"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 252} unique __ctobpl_const_172:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 243} unique __ctobpl_const_184:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 243} unique __ctobpl_const_185:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 256} unique __ctobpl_const_177:int;
const {:extern} {:model_const "token_ptr"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_164:int;
const {:extern} {:model_const "result.constant"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_166:int;
const {:extern} {:model_const "next_st"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_162:int;
const {:extern} {:model_const "cu_state"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 256} unique __ctobpl_const_176:int;
const {:extern} {:model_const "token_ptr->token_string[0]"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 231} unique __ctobpl_const_158:int;
const {:extern} {:model_const "token_ind"} {:sourceFile ".\v4\print_tokens.c"} {:sourceLine 247} unique __ctobpl_const_161:int;


procedure {:extern} __iob_func() returns (__dummy_ret__iob_func:int);

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


procedure {:extern} fopen(__dummy_formal_fopen_0.__1:int, __dummy_formal_fopen_1.__1:int) returns (__dummy_retfopen:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} isalpha(__dummy_formal_isalpha_0.__1:int) returns (__dummy_retisalpha:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} isdigit(__dummy_formal_isdigit_0.__1:int) returns (__dummy_retisdigit:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} isspace(__dummy_formal_isspace_0.__1:int) returns (__dummy_retisspace:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern} strcpy(__dummy_formal_strcpy_0.__1:int, __dummy_formal_strcpy_1.__1:int) returns (__dummy_retstrcpy:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default


procedure {:extern}  check_delimiter(ch.__1:int) returns (result.check_delimiter$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} $isalpha.arg.1$3$_123_$static$ : int;
var {:extern} $isdigit.arg.1$5$_123_$static$ : int;
var {:extern} result.isalpha$2 : int;
var {:extern} result.isdigit$4 : int;
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

ch:= 0;//Init locals 
$isalpha.arg.1$3$_123_$static$:= 0;//Init locals 
$isdigit.arg.1$5$_123_$static$:= 0;//Init locals 
result.check_delimiter$1 := 0;//initialize returns 
result.isalpha$2:= 0;//Init locals 
result.isdigit$4:= 0;//Init locals 
ch := ch.__1;
goto label_3;


// .\v4\print_tokens.c(344)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 344} true;
$isalpha.arg.1$3$_123_$static$ := ch ;
assume value_is(__ctobpl_const_1, $isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_2, ch);
goto label_4;


// .\v4\print_tokens.c(344)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 344} true;
call result.isalpha$2 := isalpha ($isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_3, $isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_4, $isalpha.arg.1$3$_123_$static$);
goto label_7;


// .\v4\print_tokens.c(344)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 344} true;
goto label_7_true , label_7_false ;


label_7_true :
assume (result.isalpha$2 != 0);
assume value_is(__ctobpl_const_5, result.isalpha$2);
goto label_9;


label_7_false :
assume (result.isalpha$2 == 0);
assume value_is(__ctobpl_const_5, result.isalpha$2);
goto label_8;


// .\v4\print_tokens.c(344)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 344} true;
$isdigit.arg.1$5$_123_$static$ := ch ;
assume value_is(__ctobpl_const_6, $isdigit.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_7, ch);
goto label_10;


// .\v4\print_tokens.c(344)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 344} true;
call result.isdigit$4 := isdigit ($isdigit.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_8, $isdigit.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_9, $isdigit.arg.1$5$_123_$static$);
goto label_13;


// .\v4\print_tokens.c(344)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 344} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (result.isdigit$4 != 0);
assume value_is(__ctobpl_const_10, result.isdigit$4);
goto label_9;


label_13_false :
assume (result.isdigit$4 == 0);
assume value_is(__ctobpl_const_10, result.isdigit$4);
goto label_14;


// .\v4\print_tokens.c(345)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 345} true;
result.check_delimiter$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(346)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 346} true;
result.check_delimiter$1 := 0 ;
goto label_1;


// .\v4\print_tokens.c(347)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 347} true;
return;


// .\v4\print_tokens.c(347)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 347} true;
assume false;
return;

}



procedure {:extern}  constant(state.__1:int, token_str.__1:int, token_ind.__1:int) returns (result.constant$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} state : int;
var {:extern} token_ind : int;
var {:extern} token_str : int;
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

assume INT_LT(token_str.__1, alloc);
result.constant$1 := 0;//initialize returns 
state:= 0;//Init locals 
token_ind:= 0;//Init locals 
token_str:= 0;//Init locals 
state := state.__1;
token_str := token_str.__1;
token_ind := token_ind.__1;
goto label_3;


// .\v4\print_tokens.c(437)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 437} true;

goto label_3_case_0, label_3_case_1, label_3_case_2;




label_3_case_0 :
assume(INT_NEQ(state, 27));
assume(INT_NEQ(state, 29));
assume value_is(__ctobpl_const_11, state);
goto label_4;



label_3_case_1 :
assume(INT_EQ(state, 27));
assume value_is(__ctobpl_const_11, state);
goto label_5;



label_3_case_2 :
assume(INT_EQ(state, 29));
assume value_is(__ctobpl_const_11, state);
goto label_6;


// .\v4\print_tokens.c(441)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 441} true;
goto label_1;


// .\v4\print_tokens.c(439)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 439} true;
result.constant$1 := 27 ;
goto label_1;


// .\v4\print_tokens.c(440)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 440} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(token_str, 1, MINUS_BOTH_PTR_OR_BOTH_INT( token_ind, 2, 1)) := 32];
assume value_is(__ctobpl_const_12, token_str);
assume value_is(__ctobpl_const_13, token_ind);
assume value_is(__ctobpl_const_14, Mem_T.CHAR[PLUS(token_str, 1, MINUS_BOTH_PTR_OR_BOTH_INT( token_ind, 2, 1))]);
goto label_7;


// .\v4\print_tokens.c(440)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 440} true;
result.constant$1 := 29 ;
goto label_1;


// .\v4\print_tokens.c(443)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 443} true;
return;

}



procedure {:extern}  error_or_eof_case(tstream_ptr.__1:int, token_ptr.__1:int, cu_state.__1:int, token_str.__1:int, token_ind.__1:int, ch.__1:int) returns (result.error_or_eof_case$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} cu_state : int;
var {:extern} result.get_actual_token$4 : int;
var {:extern} result.is_end_of_character_stream$2 : int;
var {:extern} result.strcpy$5 : int;
var {:extern} result.unget_char$3 : int;
var {:extern} $strcpy.arg.1$6$_123_$static$ : int;
var {:extern} token_ind : int;
var {:extern} token_ptr : int;
var {:extern} token_str : int;
var {:extern} tstream_ptr : int;
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

assume INT_LT(tstream_ptr.__1, alloc);
assume INT_LT(token_ptr.__1, alloc);
assume INT_LT(token_str.__1, alloc);
ch:= 0;//Init locals 
cu_state:= 0;//Init locals 
result.error_or_eof_case$1 := 0;//initialize returns 
result.get_actual_token$4:= 0;//Init locals 
result.is_end_of_character_stream$2:= 0;//Init locals 
result.strcpy$5:= 0;//Init locals 
result.unget_char$3:= 0;//Init locals 
$strcpy.arg.1$6$_123_$static$:= 0;//Init locals 
token_ind:= 0;//Init locals 
token_ptr:= 0;//Init locals 
token_str:= 0;//Init locals 
tstream_ptr:= 0;//Init locals 
tstream_ptr := tstream_ptr.__1;
token_ptr := token_ptr.__1;
cu_state := cu_state.__1;
token_str := token_str.__1;
token_ind := token_ind.__1;
ch := ch.__1;
goto label_3;


// .\v4\print_tokens.c(314)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 314} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.is_end_of_character_stream$2 := is_end_of_character_stream (Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_15, tstream_ptr);
assume value_is(__ctobpl_const_16, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_17, tstream_ptr);
assume value_is(__ctobpl_const_18, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_6;


// .\v4\print_tokens.c(314)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 314} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (result.is_end_of_character_stream$2 != 0);
assume value_is(__ctobpl_const_19, result.is_end_of_character_stream$2);
goto label_8;


label_6_false :
assume (result.is_end_of_character_stream$2 == 0);
assume value_is(__ctobpl_const_19, result.is_end_of_character_stream$2);
goto label_7;


// .\v4\print_tokens.c(320)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 320} true;
goto label_7_true , label_7_false ;


label_7_true :
assume (cu_state != 0);
assume value_is(__ctobpl_const_20, cu_state);
goto label_12;


label_7_false :
assume (cu_state == 0);
assume value_is(__ctobpl_const_20, cu_state);
goto label_11;


// .\v4\print_tokens.c(322)
label_12:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 322} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.unget_char$3 := unget_char (ch, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_21, ch);
assume value_is(__ctobpl_const_22, tstream_ptr);
assume value_is(__ctobpl_const_23, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_24, ch);
assume value_is(__ctobpl_const_25, tstream_ptr);
assume value_is(__ctobpl_const_26, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_15;


// .\v4\print_tokens.c(323)
label_15:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 323} true;
assume value_is(__ctobpl_const_27, token_ind);
token_ind := MINUS_BOTH_PTR_OR_BOTH_INT( token_ind, 1, 1) ;
goto label_11;


// .\v4\print_tokens.c(325)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 325} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := -1];
assume value_is(__ctobpl_const_28, token_ptr);
assume value_is(__ctobpl_const_29, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_16;


// .\v4\print_tokens.c(326)
label_16:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 326} true;
call result.get_actual_token$4 := get_actual_token (token_str, token_ind);
assume value_is(__ctobpl_const_30, token_str);
assume value_is(__ctobpl_const_31, token_ind);
assume value_is(__ctobpl_const_32, token_str);
assume value_is(__ctobpl_const_33, token_ind);
goto label_19;


// .\v4\print_tokens.c(327)
label_19:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 327} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_34, token_ptr);
goto label_20;


// .\v4\print_tokens.c(327)
label_20:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 327} true;
call result.strcpy$5 := strcpy ($strcpy.arg.1$6$_123_$static$, token_str);
assume value_is(__ctobpl_const_35, token_str);
assume value_is(__ctobpl_const_36, token_str);
goto label_23;


// .\v4\print_tokens.c(328)
label_23:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 328} true;
result.error_or_eof_case$1 := token_ptr ;
assume value_is(__ctobpl_const_37, token_ptr);
goto label_1;


// .\v4\print_tokens.c(316)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 316} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := 0];
assume value_is(__ctobpl_const_38, token_ptr);
assume value_is(__ctobpl_const_39, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_9;


// .\v4\print_tokens.c(317)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 317} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
//TAG: Dereferenced object is non-null
assert(token_string_token_type(token_ptr) != 0);
Mem_T.token_string_token_type := Mem_T.token_string_token_type[PLUS(token_string_token_type(token_ptr), 1, 0) := 0];
assume value_is(__ctobpl_const_40, token_ptr);
assume value_is(__ctobpl_const_41, Mem_T.token_string_token_type[PLUS(token_string_token_type(token_ptr), 1, 0)]);
goto label_10;


// .\v4\print_tokens.c(318)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 318} true;
result.error_or_eof_case$1 := token_ptr ;
assume value_is(__ctobpl_const_42, token_ptr);
goto label_1;


// .\v4\print_tokens.c(329)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 329} true;
return;


// .\v4\print_tokens.c(329)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 329} true;
assume false;
return;

}



procedure {:extern}  get_actual_token(token_str.__1:int, token_ind.__1:int) returns (result.get_actual_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ind : int;
var {:extern} $isspace.arg.1$3$_123_$static$ : int;
var {:extern} $isspace.arg.1$5$_123_$static$ : int;
var {:extern} result.isspace$2 : int;
var {:extern} result.isspace$4 : int;
var {:extern} start : int;
var {:extern} token_ind : int;
var {:extern} token_str : int;
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

assume INT_LT(token_str.__1, alloc);
ind:= 0;//Init locals 
$isspace.arg.1$3$_123_$static$:= 0;//Init locals 
$isspace.arg.1$5$_123_$static$:= 0;//Init locals 
result.get_actual_token$1 := 0;//initialize returns 
result.isspace$2:= 0;//Init locals 
result.isspace$4:= 0;//Init locals 
start:= 0;//Init locals 
token_ind:= 0;//Init locals 
token_str:= 0;//Init locals 
token_str := token_str.__1;
token_ind := token_ind.__1;
goto label_3;


// .\v4\print_tokens.c(553)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 553} true;
goto label_4;


// .\v4\print_tokens.c(553)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 553} true;
goto label_5;


// .\v4\print_tokens.c(555)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 555} true;
ind := token_ind ;
assume value_is(__ctobpl_const_43, ind);
assume value_is(__ctobpl_const_44, token_ind);
goto label_6;


// .\v4\print_tokens.c(555)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 555} true;
// loop entry initialization...
goto label_6_head;


label_6_head:
// loop head assertions...

// end loop head assertions

goto label_6_true , label_6_false ;


label_6_true :
assume (INT_LT(0, ind));
assume value_is(__ctobpl_const_45, ind);
goto label_8;


label_6_false :
assume !(INT_LT(0, ind));
assume value_is(__ctobpl_const_45, ind);
goto label_7;


// .\v4\print_tokens.c(555)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 555} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
$isspace.arg.1$3$_123_$static$ := Mem_T.CHAR[PLUS(token_str, 1, MINUS_BOTH_PTR_OR_BOTH_INT( ind, 1, 1))] ;
assume value_is(__ctobpl_const_46, $isspace.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_47, token_str);
assume value_is(__ctobpl_const_48, ind);
assume value_is(__ctobpl_const_49, Mem_T.CHAR[PLUS(token_str, 1, MINUS_BOTH_PTR_OR_BOTH_INT( ind, 1, 1))]);
goto label_9;


// .\v4\print_tokens.c(555)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 555} true;
call result.isspace$2 := isspace ($isspace.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_50, $isspace.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_51, $isspace.arg.1$3$_123_$static$);
goto label_12;


// .\v4\print_tokens.c(555)
label_12:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 555} true;
goto label_12_true , label_12_false ;


label_12_true :
assume (result.isspace$2 != 0);
assume value_is(__ctobpl_const_52, result.isspace$2);
goto label_13;


label_12_false :
assume (result.isspace$2 == 0);
assume value_is(__ctobpl_const_52, result.isspace$2);
goto label_7;


// .\v4\print_tokens.c(557)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 557} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(token_str, 1, ind) := 0];
assume value_is(__ctobpl_const_53, token_str);
assume value_is(__ctobpl_const_54, ind);
assume value_is(__ctobpl_const_55, Mem_T.CHAR[PLUS(token_str, 1, ind)]);
goto label_14;


// .\v4\print_tokens.c(557)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 557} true;
token_ind := ind ;
assume value_is(__ctobpl_const_56, token_ind);
assume value_is(__ctobpl_const_57, ind);
goto label_15;


// .\v4\print_tokens.c(558)
label_15:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 558} true;
ind := 0 ;
assume value_is(__ctobpl_const_58, ind);
goto label_16;


// .\v4\print_tokens.c(558)
label_16:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 558} true;
// loop entry initialization...
goto label_16_head;


label_16_head:
// loop head assertions...

// end loop head assertions

goto label_16_true , label_16_false ;


label_16_true :
assume (INT_LT(ind, token_ind));
assume value_is(__ctobpl_const_59, ind);
assume value_is(__ctobpl_const_60, token_ind);
goto label_18;


label_16_false :
assume !(INT_LT(ind, token_ind));
assume value_is(__ctobpl_const_59, ind);
assume value_is(__ctobpl_const_60, token_ind);
goto label_17;


// .\v4\print_tokens.c(559)
label_18:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 559} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
$isspace.arg.1$5$_123_$static$ := Mem_T.CHAR[PLUS(token_str, 1, ind)] ;
assume value_is(__ctobpl_const_61, $isspace.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_62, token_str);
assume value_is(__ctobpl_const_63, ind);
assume value_is(__ctobpl_const_64, Mem_T.CHAR[PLUS(token_str, 1, ind)]);
goto label_19;


// .\v4\print_tokens.c(559)
label_19:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 559} true;
call result.isspace$4 := isspace ($isspace.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_65, $isspace.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_66, $isspace.arg.1$5$_123_$static$);
goto label_22;


// .\v4\print_tokens.c(559)
label_22:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 559} true;
goto label_22_true , label_22_false ;


label_22_true :
assume (result.isspace$4 != 0);
assume value_is(__ctobpl_const_67, result.isspace$4);
goto label_24;


label_22_false :
assume (result.isspace$4 == 0);
assume value_is(__ctobpl_const_67, result.isspace$4);
goto label_23;


// .\v4\print_tokens.c(560)
label_23:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 560} true;
goto label_17;


// .\v4\print_tokens.c(561)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 561} true;
start := 0 ;
assume value_is(__ctobpl_const_68, start);
goto label_25;


// .\v4\print_tokens.c(561)
label_25:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 561} true;
// loop entry initialization...
goto label_25_head;


label_25_head:
// loop head assertions...

// end loop head assertions

goto label_25_true , label_25_false ;


label_25_true :
assume (INT_LEQ(ind, token_ind));
assume value_is(__ctobpl_const_69, ind);
assume value_is(__ctobpl_const_70, token_ind);
goto label_27;


label_25_false :
assume !(INT_LEQ(ind, token_ind));
assume value_is(__ctobpl_const_69, ind);
assume value_is(__ctobpl_const_70, token_ind);
goto label_26;


// .\v4\print_tokens.c(564)
label_26:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 564} true;
goto label_1;


// .\v4\print_tokens.c(565)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 565} true;
return;


// .\v4\print_tokens.c(563)
label_27:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 563} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
//TAG: Dereferenced object is non-null
assert(token_str != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(token_str, 1, start) := Mem_T.CHAR[PLUS(token_str, 1, ind)]];
assume value_is(__ctobpl_const_71, token_str);
assume value_is(__ctobpl_const_72, start);
assume value_is(__ctobpl_const_73, Mem_T.CHAR[PLUS(token_str, 1, start)]);
assume value_is(__ctobpl_const_74, token_str);
assume value_is(__ctobpl_const_75, ind);
assume value_is(__ctobpl_const_76, Mem_T.CHAR[PLUS(token_str, 1, ind)]);
goto label_28;


// unknown(0)
label_28:
assert {:sourcefile "unknown"} {:sourceline 0} true;
start := PLUS(start, 1, 1) ;
assume value_is(__ctobpl_const_77, start);
goto label_29;


// .\v4\print_tokens.c(561)
label_29:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 561} true;
ind := PLUS(ind, 1, 1) ;
assume value_is(__ctobpl_const_78, ind);
goto label_25_head;


// unknown(0)
label_24:
assert {:sourcefile "unknown"} {:sourceline 0} true;
ind := PLUS(ind, 1, 1) ;
assume value_is(__ctobpl_const_79, ind);
goto label_16_head;


// unknown(0)
label_13:
assert {:sourcefile "unknown"} {:sourceline 0} true;
ind := MINUS_BOTH_PTR_OR_BOTH_INT( ind, 1, 1) ;
assume value_is(__ctobpl_const_80, ind);
goto label_6_head;


// .\v4\print_tokens.c(565)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 565} true;
assume false;
return;

}



procedure {:extern}  get_char(stream_ptr.__1:int) returns (result.get_char$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fgets.arg.1$3$ : int;
var {:extern} result.fgets$2 : int;
var {:extern} stream_ptr : int;
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

assume INT_LT(stream_ptr.__1, alloc);
$fgets.arg.1$3$:= 0;//Init locals 
result.fgets$2:= 0;//Init locals 
result.get_char$1 := 0;//initialize returns 
stream_ptr:= 0;//Init locals 
stream_ptr := stream_ptr.__1;
goto label_3;


// .\v4\print_tokens.c(94)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 94} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_stream_type(stream_ptr) != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])] != 0);
assume value_is(__ctobpl_const_81, stream_ptr);
assume value_is(__ctobpl_const_82, stream_ptr);
assume value_is(__ctobpl_const_83, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_84, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])]);
goto label_5;


label_3_false :
assume (Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])] == 0);
assume value_is(__ctobpl_const_81, stream_ptr);
assume value_is(__ctobpl_const_82, stream_ptr);
assume value_is(__ctobpl_const_83, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_84, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])]);
goto label_4;


// .\v4\print_tokens.c(96)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 96} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
$fgets.arg.1$3$ := PLUS(stream_stream_type(stream_ptr), 1, 5) ;
assume value_is(__ctobpl_const_85, $fgets.arg.1$3$);
assume value_is(__ctobpl_const_86, stream_ptr);
goto label_6;


// .\v4\print_tokens.c(96)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 96} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
call result.fgets$2 := fgets ($fgets.arg.1$3$, 75, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_87, $fgets.arg.1$3$);
assume value_is(__ctobpl_const_88, stream_ptr);
assume value_is(__ctobpl_const_89, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_90, $fgets.arg.1$3$);
assume value_is(__ctobpl_const_91, stream_ptr);
assume value_is(__ctobpl_const_92, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
goto label_9;


// .\v4\print_tokens.c(96)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 96} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (result.fgets$2 != 0);
assume value_is(__ctobpl_const_93, result.fgets$2);
goto label_11;


label_9_false :
assume (result.fgets$2 == 0);
assume value_is(__ctobpl_const_93, result.fgets$2);
goto label_10;


// .\v4\print_tokens.c(97)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 97} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_stream_type(stream_ptr) != 0);
Mem_T.stream_stream_type := Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, 5) := -1];
assume value_is(__ctobpl_const_94, stream_ptr);
assume value_is(__ctobpl_const_95, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, 5)]);
goto label_11;


// .\v4\print_tokens.c(98)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 98} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
Mem_T.stream_ind_stream_type := Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr) := 5];
assume value_is(__ctobpl_const_96, stream_ptr);
assume value_is(__ctobpl_const_97, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
goto label_5;


// .\v4\print_tokens.c(101)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 101} true;
assume false;
return;


// .\v4\print_tokens.c(100)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 100} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_stream_type(stream_ptr) != 0);
result.get_char$1 := Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])] ;
assume value_is(__ctobpl_const_98, stream_ptr);
assume value_is(__ctobpl_const_99, stream_ptr);
assume value_is(__ctobpl_const_100, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
tempBoogie0 := PLUS(Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)], 1, 1) ;
Mem_T.stream_ind_stream_type := Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr) := tempBoogie0];
assume value_is(__ctobpl_const_101, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])]);
goto label_1;


// .\v4\print_tokens.c(101)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 101} true;
return;

}



procedure {:extern}  get_token(tstream_ptr.__1:int) returns (result.get_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} cu_state : int;
var {:extern} next_st : int;
var {:extern} result.check_delimiter$13 : int;
var {:extern} result.constant$18 : int;
var {:extern} result.error_or_eof_case$5 : int;
var {:extern} result.get_actual_token$8 : int;
var {:extern} result.get_actual_token$19 : int;
var {:extern} result.get_char$3 : int;
var {:extern} result.get_char$12 : int;
var {:extern} result.get_char$24 : int;
var {:extern} result.keyword$14 : int;
var {:extern} result.malloc$2 : int;
var {:extern} result.next_state$4 : int;
var {:extern} result.numeric_case$6 : int;
var {:extern} result.skip$23 : int;
var {:extern} result.special$17 : int;
var {:extern} result.strcpy$9 : int;
var {:extern} result.strcpy$20 : int;
var {:extern} result.unget_char$7 : int;
var {:extern} result.unget_char$15 : int;
var {:extern} result.unget_char$16 : int;
var {:extern} $strcpy.arg.1$11$ : int;
var {:extern} $strcpy.arg.1$22$ : int;
var {:extern} $strcpy.arg.2$10$ : int;
var {:extern} $strcpy.arg.2$21$ : int;
var {:extern} token_found : int;
var {:extern} token_ind : int;
var {:extern} token_ptr : int;
var {:extern} token_str : int;
var {:extern} tstream_ptr : int;
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

assume INT_LT(tstream_ptr.__1, alloc);
ch:= 0;//Init locals 
cu_state:= 0;//Init locals 
next_st:= 0;//Init locals 
result.check_delimiter$13:= 0;//Init locals 
result.constant$18:= 0;//Init locals 
result.error_or_eof_case$5:= 0;//Init locals 
result.get_actual_token$8:= 0;//Init locals 
result.get_actual_token$19:= 0;//Init locals 
result.get_char$3:= 0;//Init locals 
result.get_char$12:= 0;//Init locals 
result.get_char$24:= 0;//Init locals 
result.get_token$1 := 0;//initialize returns 
result.keyword$14:= 0;//Init locals 
result.malloc$2:= 0;//Init locals 
result.next_state$4:= 0;//Init locals 
result.numeric_case$6:= 0;//Init locals 
result.skip$23:= 0;//Init locals 
result.special$17:= 0;//Init locals 
result.strcpy$9:= 0;//Init locals 
result.strcpy$20:= 0;//Init locals 
result.unget_char$7:= 0;//Init locals 
result.unget_char$15:= 0;//Init locals 
result.unget_char$16:= 0;//Init locals 
$strcpy.arg.1$11$:= 0;//Init locals 
$strcpy.arg.1$22$:= 0;//Init locals 
$strcpy.arg.2$10$:= 0;//Init locals 
$strcpy.arg.2$21$:= 0;//Init locals 
token_found:= 0;//Init locals 
token_ind:= 0;//Init locals 
token_ptr:= 0;//Init locals 
call token_str := __HAVOC_det_malloc(80);
tstream_ptr:= 0;//Init locals 
tstream_ptr := tstream_ptr.__1;
goto label_3;


// .\v4\print_tokens.c(184)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 184} true;
goto label_4;


// .\v4\print_tokens.c(185)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 185} true;
goto label_5;


// .\v4\print_tokens.c(186)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 186} true;
goto label_6;


// .\v4\print_tokens.c(187)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 187} true;
goto label_7;


// .\v4\print_tokens.c(188)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 188} true;
goto label_8;


// .\v4\print_tokens.c(188)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 188} true;
goto label_9;


// .\v4\print_tokens.c(188)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 188} true;
goto label_10;


// .\v4\print_tokens.c(190)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 190} true;
call result.malloc$2 := __HAVOC_det_malloc (84);
goto label_13;


// .\v4\print_tokens.c(190)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 190} true;
token_ptr := result.malloc$2 ;
assume value_is(__ctobpl_const_102, token_ptr);
assume value_is(__ctobpl_const_103, result.malloc$2);
goto label_14;


// .\v4\print_tokens.c(191)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 191} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.get_char$3 := get_char (Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_104, tstream_ptr);
assume value_is(__ctobpl_const_105, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_106, tstream_ptr);
assume value_is(__ctobpl_const_107, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_17;


// .\v4\print_tokens.c(191)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 191} true;
ch := result.get_char$3 ;
assume value_is(__ctobpl_const_108, ch);
assume value_is(__ctobpl_const_109, result.get_char$3);
goto label_18;


// .\v4\print_tokens.c(192)
label_18:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 192} true;
token_found := 0 ;
assume value_is(__ctobpl_const_110, token_found);
goto label_19;


// .\v4\print_tokens.c(192)
label_19:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 192} true;
token_ind := token_found ;
assume value_is(__ctobpl_const_111, token_ind);
assume value_is(__ctobpl_const_112, token_found);
goto label_20;


// .\v4\print_tokens.c(192)
label_20:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 192} true;
cu_state := token_ind ;
assume value_is(__ctobpl_const_113, cu_state);
assume value_is(__ctobpl_const_114, token_ind);
goto label_21;


// .\v4\print_tokens.c(193)
label_21:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 193} true;
// loop entry initialization...
goto label_21_head;


label_21_head:
// loop head assertions...

// end loop head assertions

goto label_21_true , label_21_false ;


label_21_true :
assume (token_found != 0);
assume value_is(__ctobpl_const_115, token_found);
goto label_1;


label_21_false :
assume (token_found == 0);
assume value_is(__ctobpl_const_115, token_found);
goto label_22;


// .\v4\print_tokens.c(195)
label_22:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 195} true;
goto label_22_true , label_22_false ;


label_22_true :
assume (INT_LT(token_ind, 80));
assume value_is(__ctobpl_const_116, token_ind);
goto label_24;


label_22_false :
assume !(INT_LT(token_ind, 80));
assume value_is(__ctobpl_const_116, token_ind);
goto label_23;


// .\v4\print_tokens.c(202)
label_23:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 202} true;
next_st := -1 ;
assume value_is(__ctobpl_const_117, next_st);
goto label_29;


// .\v4\print_tokens.c(197)
label_24:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 197} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(token_str, 1, token_ind) := ch];
assume value_is(__ctobpl_const_118, token_ind);
token_ind := PLUS(token_ind, 1, 1) ;
assume value_is(__ctobpl_const_119, Mem_T.CHAR[PLUS(token_str, 1, token_ind)]);
assume value_is(__ctobpl_const_120, ch);
goto label_25;


// .\v4\print_tokens.c(198)
label_25:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 198} true;
call result.next_state$4 := next_state (cu_state, ch);
assume value_is(__ctobpl_const_121, cu_state);
assume value_is(__ctobpl_const_122, ch);
assume value_is(__ctobpl_const_123, cu_state);
assume value_is(__ctobpl_const_124, ch);
goto label_28;


// .\v4\print_tokens.c(198)
label_28:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 198} true;
next_st := result.next_state$4 ;
assume value_is(__ctobpl_const_125, next_st);
assume value_is(__ctobpl_const_126, result.next_state$4);
goto label_29;


// .\v4\print_tokens.c(204)
label_29:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 204} true;
goto label_29_true , label_29_false ;


label_29_true :
assume (INT_EQ(next_st, -1));
assume value_is(__ctobpl_const_127, next_st);
goto label_31;


label_29_false :
assume !(INT_EQ(next_st, -1));
assume value_is(__ctobpl_const_127, next_st);
goto label_30;


// .\v4\print_tokens.c(207)
label_30:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 207} true;
goto label_30_true , label_30_false ;


label_30_true :
assume (INT_EQ(next_st, -2));
assume value_is(__ctobpl_const_128, next_st);
goto label_36;


label_30_false :
assume !(INT_EQ(next_st, -2));
assume value_is(__ctobpl_const_128, next_st);
goto label_35;


// .\v4\print_tokens.c(210)
label_35:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 210} true;
goto label_35_true , label_35_false ;


label_35_true :
assume (INT_EQ(next_st, -3));
assume value_is(__ctobpl_const_129, next_st);
goto label_41;


label_35_false :
assume !(INT_EQ(next_st, -3));
assume value_is(__ctobpl_const_129, next_st);
goto label_40;


// .\v4\print_tokens.c(219)
label_40:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 219} true;

goto label_40_case_0, label_40_case_1, label_40_case_2, label_40_case_3, label_40_case_4, label_40_case_5, label_40_case_6, label_40_case_7, label_40_case_8, label_40_case_9, label_40_case_10, label_40_case_11, label_40_case_12, label_40_case_13, label_40_case_14, label_40_case_15, label_40_case_16;




label_40_case_0 :
assume(INT_NEQ(next_st, 6));
assume(INT_NEQ(next_st, 9));
assume(INT_NEQ(next_st, 11));
assume(INT_NEQ(next_st, 13));
assume(INT_NEQ(next_st, 16));
assume(INT_NEQ(next_st, 19));
assume(INT_NEQ(next_st, 20));
assume(INT_NEQ(next_st, 21));
assume(INT_NEQ(next_st, 22));
assume(INT_NEQ(next_st, 23));
assume(INT_NEQ(next_st, 24));
assume(INT_NEQ(next_st, 25));
assume(INT_NEQ(next_st, 27));
assume(INT_NEQ(next_st, 29));
assume(INT_NEQ(next_st, 30));
assume(INT_NEQ(next_st, 32));
assume value_is(__ctobpl_const_130, next_st);
goto label_55;



label_40_case_1 :
assume(INT_EQ(next_st, 6));
assume value_is(__ctobpl_const_130, next_st);
goto label_56;



label_40_case_2 :
assume(INT_EQ(next_st, 9));
assume value_is(__ctobpl_const_130, next_st);
goto label_56;



label_40_case_3 :
assume(INT_EQ(next_st, 11));
assume value_is(__ctobpl_const_130, next_st);
goto label_56;



label_40_case_4 :
assume(INT_EQ(next_st, 13));
assume value_is(__ctobpl_const_130, next_st);
goto label_56;



label_40_case_5 :
assume(INT_EQ(next_st, 16));
assume value_is(__ctobpl_const_130, next_st);
goto label_56;



label_40_case_6 :
assume(INT_EQ(next_st, 19));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_7 :
assume(INT_EQ(next_st, 20));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_8 :
assume(INT_EQ(next_st, 21));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_9 :
assume(INT_EQ(next_st, 22));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_10 :
assume(INT_EQ(next_st, 23));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_11 :
assume(INT_EQ(next_st, 24));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_12 :
assume(INT_EQ(next_st, 25));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;



label_40_case_13 :
assume(INT_EQ(next_st, 27));
assume value_is(__ctobpl_const_130, next_st);
goto label_62;



label_40_case_14 :
assume(INT_EQ(next_st, 29));
assume value_is(__ctobpl_const_130, next_st);
goto label_62;



label_40_case_15 :
assume(INT_EQ(next_st, 30));
assume value_is(__ctobpl_const_130, next_st);
goto label_65;



label_40_case_16 :
assume(INT_EQ(next_st, 32));
assume value_is(__ctobpl_const_130, next_st);
goto label_59;


// .\v4\print_tokens.c(221)
label_55:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 221} true;
goto label_70;


// .\v4\print_tokens.c(226)
label_56:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 226} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.get_char$12 := get_char (Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_131, tstream_ptr);
assume value_is(__ctobpl_const_132, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_133, tstream_ptr);
assume value_is(__ctobpl_const_134, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_88;


// .\v4\print_tokens.c(226)
label_88:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 226} true;
ch := result.get_char$12 ;
assume value_is(__ctobpl_const_135, ch);
assume value_is(__ctobpl_const_136, result.get_char$12);
goto label_89;


// .\v4\print_tokens.c(227)
label_89:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 227} true;
call result.check_delimiter$13 := check_delimiter (ch);
assume value_is(__ctobpl_const_137, ch);
assume value_is(__ctobpl_const_138, ch);
goto label_92;


// .\v4\print_tokens.c(227)
label_92:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 227} true;
goto label_92_true , label_92_false ;


label_92_true :
assume (INT_EQ(result.check_delimiter$13, 1));
assume value_is(__ctobpl_const_139, result.check_delimiter$13);
goto label_96;


label_92_false :
assume !(INT_EQ(result.check_delimiter$13, 1));
assume value_is(__ctobpl_const_139, result.check_delimiter$13);
goto label_93;


// .\v4\print_tokens.c(234)
label_93:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 234} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.unget_char$16 := unget_char (ch, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_140, ch);
assume value_is(__ctobpl_const_141, tstream_ptr);
assume value_is(__ctobpl_const_142, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_143, ch);
assume value_is(__ctobpl_const_144, tstream_ptr);
assume value_is(__ctobpl_const_145, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_105;


// .\v4\print_tokens.c(235)
label_105:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 235} true;
goto label_70;


// .\v4\print_tokens.c(229)
label_96:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 229} true;
call result.keyword$14 := keyword (next_st);
assume value_is(__ctobpl_const_146, next_st);
assume value_is(__ctobpl_const_147, next_st);
goto label_99;


// .\v4\print_tokens.c(229)
label_99:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 229} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := result.keyword$14];
assume value_is(__ctobpl_const_148, token_ptr);
assume value_is(__ctobpl_const_149, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
assume value_is(__ctobpl_const_150, result.keyword$14);
goto label_100;


// .\v4\print_tokens.c(230)
label_100:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 230} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.unget_char$15 := unget_char (ch, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_151, ch);
assume value_is(__ctobpl_const_152, tstream_ptr);
assume value_is(__ctobpl_const_153, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_154, ch);
assume value_is(__ctobpl_const_155, tstream_ptr);
assume value_is(__ctobpl_const_156, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_103;


// .\v4\print_tokens.c(231)
label_103:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 231} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
//TAG: Dereferenced object is non-null
assert(token_string_token_type(token_ptr) != 0);
Mem_T.token_string_token_type := Mem_T.token_string_token_type[PLUS(token_string_token_type(token_ptr), 1, 0) := 0];
assume value_is(__ctobpl_const_157, token_ptr);
assume value_is(__ctobpl_const_158, Mem_T.token_string_token_type[PLUS(token_string_token_type(token_ptr), 1, 0)]);
goto label_104;


// .\v4\print_tokens.c(232)
label_104:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 232} true;
result.get_token$1 := token_ptr ;
assume value_is(__ctobpl_const_159, token_ptr);
goto label_1;


// .\v4\print_tokens.c(247)
label_62:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 247} true;
call result.constant$18 := constant (next_st, token_str, token_ind);
assume value_is(__ctobpl_const_160, next_st);
assume value_is(__ctobpl_const_161, token_ind);
assume value_is(__ctobpl_const_162, next_st);
assume value_is(__ctobpl_const_163, token_ind);
goto label_75;


// .\v4\print_tokens.c(247)
label_75:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 247} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := result.constant$18];
assume value_is(__ctobpl_const_164, token_ptr);
assume value_is(__ctobpl_const_165, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
assume value_is(__ctobpl_const_166, result.constant$18);
goto label_76;


// .\v4\print_tokens.c(248)
label_76:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 248} true;
call result.get_actual_token$19 := get_actual_token (token_str, token_ind);
assume value_is(__ctobpl_const_167, token_ind);
assume value_is(__ctobpl_const_168, token_ind);
goto label_79;


// .\v4\print_tokens.c(249)
label_79:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 249} true;
// skipped OP_UNARY assignment to array
goto label_80;


// .\v4\print_tokens.c(249)
label_80:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 249} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_169, token_ptr);
goto label_81;


// .\v4\print_tokens.c(249)
label_81:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 249} true;
call result.strcpy$20 := strcpy ($strcpy.arg.1$22$, $strcpy.arg.2$21$);
goto label_84;


// .\v4\print_tokens.c(250)
label_84:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 250} true;
result.get_token$1 := token_ptr ;
assume value_is(__ctobpl_const_170, token_ptr);
goto label_1;


// .\v4\print_tokens.c(252)
label_65:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 252} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.skip$23 := skip (Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_171, tstream_ptr);
assume value_is(__ctobpl_const_172, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_173, tstream_ptr);
assume value_is(__ctobpl_const_174, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_68;


// .\v4\print_tokens.c(253)
label_68:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 253} true;
next_st := 0 ;
assume value_is(__ctobpl_const_175, next_st);
goto label_69;


// .\v4\print_tokens.c(254)
label_69:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 254} true;
goto label_70;


// .\v4\print_tokens.c(256)
label_70:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 256} true;
cu_state := next_st ;
assume value_is(__ctobpl_const_176, cu_state);
assume value_is(__ctobpl_const_177, next_st);
goto label_71;


// .\v4\print_tokens.c(257)
label_71:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 257} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.get_char$24 := get_char (Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_178, tstream_ptr);
assume value_is(__ctobpl_const_179, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_180, tstream_ptr);
assume value_is(__ctobpl_const_181, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_74;


// .\v4\print_tokens.c(257)
label_74:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 257} true;
ch := result.get_char$24 ;
assume value_is(__ctobpl_const_182, ch);
assume value_is(__ctobpl_const_183, result.get_char$24);
goto label_21_head;


// .\v4\print_tokens.c(243)
label_59:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 243} true;
call result.special$17 := special (next_st);
assume value_is(__ctobpl_const_184, next_st);
assume value_is(__ctobpl_const_185, next_st);
goto label_85;


// .\v4\print_tokens.c(243)
label_85:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 243} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := result.special$17];
assume value_is(__ctobpl_const_186, token_ptr);
assume value_is(__ctobpl_const_187, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
assume value_is(__ctobpl_const_188, result.special$17);
goto label_86;


// .\v4\print_tokens.c(244)
label_86:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 244} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
//TAG: Dereferenced object is non-null
assert(token_string_token_type(token_ptr) != 0);
Mem_T.token_string_token_type := Mem_T.token_string_token_type[PLUS(token_string_token_type(token_ptr), 1, 0) := 0];
assume value_is(__ctobpl_const_189, token_ptr);
assume value_is(__ctobpl_const_190, Mem_T.token_string_token_type[PLUS(token_string_token_type(token_ptr), 1, 0)]);
goto label_87;


// .\v4\print_tokens.c(245)
label_87:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 245} true;
result.get_token$1 := token_ptr ;
assume value_is(__ctobpl_const_191, token_ptr);
goto label_1;


// .\v4\print_tokens.c(211)
label_41:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 211} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := 17];
assume value_is(__ctobpl_const_192, token_ptr);
assume value_is(__ctobpl_const_193, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_42;


// .\v4\print_tokens.c(212)
label_42:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 212} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.unget_char$7 := unget_char (ch, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_194, ch);
assume value_is(__ctobpl_const_195, tstream_ptr);
assume value_is(__ctobpl_const_196, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_197, ch);
assume value_is(__ctobpl_const_198, tstream_ptr);
assume value_is(__ctobpl_const_199, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_45;


// .\v4\print_tokens.c(213)
label_45:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 213} true;
assume value_is(__ctobpl_const_200, token_ind);
token_ind := MINUS_BOTH_PTR_OR_BOTH_INT( token_ind, 1, 1) ;
goto label_46;


// .\v4\print_tokens.c(214)
label_46:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 214} true;
call result.get_actual_token$8 := get_actual_token (token_str, token_ind);
assume value_is(__ctobpl_const_201, token_ind);
assume value_is(__ctobpl_const_202, token_ind);
goto label_49;


// .\v4\print_tokens.c(215)
label_49:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 215} true;
// skipped OP_UNARY assignment to array
goto label_50;


// .\v4\print_tokens.c(215)
label_50:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 215} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_203, token_ptr);
goto label_51;


// .\v4\print_tokens.c(215)
label_51:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 215} true;
call result.strcpy$9 := strcpy ($strcpy.arg.1$11$, $strcpy.arg.2$10$);
goto label_54;


// .\v4\print_tokens.c(216)
label_54:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 216} true;
result.get_token$1 := token_ptr ;
assume value_is(__ctobpl_const_204, token_ptr);
goto label_1;


// .\v4\print_tokens.c(208)
label_36:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 208} true;
call result.numeric_case$6 := numeric_case (tstream_ptr, token_ptr, ch, token_str, token_ind);
assume value_is(__ctobpl_const_205, tstream_ptr);
assume value_is(__ctobpl_const_206, token_ptr);
assume value_is(__ctobpl_const_207, ch);
assume value_is(__ctobpl_const_208, token_ind);
assume value_is(__ctobpl_const_209, tstream_ptr);
assume value_is(__ctobpl_const_210, token_ptr);
assume value_is(__ctobpl_const_211, ch);
assume value_is(__ctobpl_const_212, token_ind);
goto label_39;


// .\v4\print_tokens.c(208)
label_39:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 208} true;
result.get_token$1 := result.numeric_case$6 ;
assume value_is(__ctobpl_const_213, result.numeric_case$6);
goto label_1;


// .\v4\print_tokens.c(205)
label_31:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 205} true;
call result.error_or_eof_case$5 := error_or_eof_case (tstream_ptr, token_ptr, cu_state, token_str, token_ind, ch);
assume value_is(__ctobpl_const_214, tstream_ptr);
assume value_is(__ctobpl_const_215, token_ptr);
assume value_is(__ctobpl_const_216, cu_state);
assume value_is(__ctobpl_const_217, token_ind);
assume value_is(__ctobpl_const_218, ch);
assume value_is(__ctobpl_const_219, tstream_ptr);
assume value_is(__ctobpl_const_220, token_ptr);
assume value_is(__ctobpl_const_221, cu_state);
assume value_is(__ctobpl_const_222, token_ind);
assume value_is(__ctobpl_const_223, ch);
goto label_34;


// .\v4\print_tokens.c(205)
label_34:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 205} true;
result.get_token$1 := result.error_or_eof_case$5 ;
assume value_is(__ctobpl_const_224, result.error_or_eof_case$5);
goto label_1;


// .\v4\print_tokens.c(259)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 259} true;
call __HAVOC_free(token_str);
return;


// .\v4\print_tokens.c(259)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 259} true;
assume false;
return;

}



procedure {:extern}  is_end_of_character_stream(stream_ptr.__1:int) returns (result.is_end_of_character_stream$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} stream_ptr : int;
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

assume INT_LT(stream_ptr.__1, alloc);
result.is_end_of_character_stream$1 := 0;//initialize returns 
stream_ptr:= 0;//Init locals 
stream_ptr := stream_ptr.__1;
goto label_3;


// .\v4\print_tokens.c(117)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 117} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_stream_type(stream_ptr) != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_EQ(Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)], 1, 1))], -1));
assume value_is(__ctobpl_const_225, stream_ptr);
assume value_is(__ctobpl_const_226, stream_ptr);
assume value_is(__ctobpl_const_227, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_228, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)], 1, 1))]);
goto label_5;


label_3_false :
assume !(INT_EQ(Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)], 1, 1))], -1));
assume value_is(__ctobpl_const_225, stream_ptr);
assume value_is(__ctobpl_const_226, stream_ptr);
assume value_is(__ctobpl_const_227, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_228, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)], 1, 1))]);
goto label_4;


// .\v4\print_tokens.c(120)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 120} true;
result.is_end_of_character_stream$1 := 0 ;
goto label_1;


// .\v4\print_tokens.c(118)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 118} true;
result.is_end_of_character_stream$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(121)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 121} true;
return;

}



procedure {:extern}  is_eof_token(t.__1:int) returns (result.is_eof_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} t : int;
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

assume INT_LT(t.__1, alloc);
result.is_eof_token$1 := 0;//initialize returns 
t:= 0;//Init locals 
t := t.__1;
goto label_3;


// .\v4\print_tokens.c(486)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 486} true;
//TAG: Dereferenced object is non-null
assert(t != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (Mem_T.token_id_token_type[token_id_token_type(t)] != 0);
assume value_is(__ctobpl_const_229, t);
assume value_is(__ctobpl_const_230, Mem_T.token_id_token_type[token_id_token_type(t)]);
goto label_5;


label_3_false :
assume (Mem_T.token_id_token_type[token_id_token_type(t)] == 0);
assume value_is(__ctobpl_const_229, t);
assume value_is(__ctobpl_const_230, Mem_T.token_id_token_type[token_id_token_type(t)]);
goto label_4;


// .\v4\print_tokens.c(487)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 487} true;
result.is_eof_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(488)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 488} true;
result.is_eof_token$1 := 0 ;
goto label_1;


// .\v4\print_tokens.c(489)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 489} true;
return;

}



procedure {:extern}  keyword(state.__1:int) returns (result.keyword$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fprintf.arg.1$4$_123_$static$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.exit$5 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} state : int;
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

$fprintf.arg.1$4$_123_$static$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.exit$5:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.keyword$1 := 0;//initialize returns 
state:= 0;//Init locals 
state := state.__1;
goto label_3;


// .\v4\print_tokens.c(361)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 361} true;

goto label_3_case_0, label_3_case_1, label_3_case_2, label_3_case_3, label_3_case_4, label_3_case_5;




label_3_case_0 :
assume(INT_NEQ(state, 6));
assume(INT_NEQ(state, 9));
assume(INT_NEQ(state, 11));
assume(INT_NEQ(state, 13));
assume(INT_NEQ(state, 16));
assume value_is(__ctobpl_const_231, state);
goto label_4;



label_3_case_1 :
assume(INT_EQ(state, 6));
assume value_is(__ctobpl_const_231, state);
goto label_7;



label_3_case_2 :
assume(INT_EQ(state, 9));
assume value_is(__ctobpl_const_231, state);
goto label_8;



label_3_case_3 :
assume(INT_EQ(state, 11));
assume value_is(__ctobpl_const_231, state);
goto label_9;



label_3_case_4 :
assume(INT_EQ(state, 13));
assume value_is(__ctobpl_const_231, state);
goto label_10;



label_3_case_5 :
assume(INT_EQ(state, 16));
assume value_is(__ctobpl_const_231, state);
goto label_11;


// .\v4\print_tokens.c(368)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 368} true;
call result.__iob_func$3 := __iob_func ();
goto label_12;


// .\v4\print_tokens.c(368)
label_12:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 368} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$_123_$static$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_232, $fprintf.arg.1$4$_123_$static$);
assume value_is(__ctobpl_const_233, result.__iob_func$3);
goto label_13;


// .\v4\print_tokens.c(368)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 368} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_16;


// .\v4\print_tokens.c(368)
label_16:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 368} true;
goto label_17;


// .\v4\print_tokens.c(370)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 370} true;
call result.exit$5 := det_choice(); // havoc result.exit$5;
// skip exit
return;


// .\v4\print_tokens.c(371)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 371} true;
assume false;
return;


// .\v4\print_tokens.c(363)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 363} true;
result.keyword$1 := 6 ;
goto label_1;


// .\v4\print_tokens.c(364)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 364} true;
result.keyword$1 := 9 ;
goto label_1;


// .\v4\print_tokens.c(365)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 365} true;
result.keyword$1 := 11 ;
goto label_1;


// .\v4\print_tokens.c(366)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 366} true;
result.keyword$1 := 13 ;
goto label_1;


// .\v4\print_tokens.c(367)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 367} true;
result.keyword$1 := 16 ;
goto label_1;


// .\v4\print_tokens.c(371)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 371} true;
return;

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
var {:extern} $fprintf.arg.1$4$ : int;
var {:extern} $open_token_stream.arg.1$7$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.exit$5 : int;
var {:extern} result.exit$12 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} result.get_token$9 : int;
var {:extern} result.is_eof_token$8 : int;
var {:extern} result.open_token_stream$6 : int;
var {:extern} result.print_token$10 : int;
var {:extern} result.print_token$11 : int;
var {:extern} stream_ptr : int;
var {:extern} token_ptr : int;
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
$fprintf.arg.1$4$:= 0;//Init locals 
$open_token_stream.arg.1$7$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.exit$5:= 0;//Init locals 
result.exit$12:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.get_token$9:= 0;//Init locals 
result.is_eof_token$8:= 0;//Init locals 
result.main$1 := 0;//initialize returns 
result.open_token_stream$6:= 0;//Init locals 
result.print_token$10:= 0;//Init locals 
result.print_token$11:= 0;//Init locals 
stream_ptr:= 0;//Init locals 
token_ptr:= 0;//Init locals 
argc := argc.__1;
argv := argv.__1;
goto label_3;


// .\v4\print_tokens.c(31)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 31} true;
goto label_4;


// .\v4\print_tokens.c(32)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 32} true;
goto label_5;


// .\v4\print_tokens.c(34)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 34} true;
goto label_5_true , label_5_false ;


label_5_true :
assume (INT_LT(2, argc));
assume value_is(__ctobpl_const_234, argc);
goto label_7;


label_5_false :
assume !(INT_LT(2, argc));
assume value_is(__ctobpl_const_234, argc);
goto label_6;


// .\v4\print_tokens.c(39)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 39} true;
//TAG: Dereferenced object is non-null
assert(argv != 0);
$open_token_stream.arg.1$7$ := Mem_T.PCHAR[PLUS(argv, 4, 1)] ;
assume value_is(__ctobpl_const_235, $open_token_stream.arg.1$7$);
assume value_is(__ctobpl_const_236, argv);
assume value_is(__ctobpl_const_237, Mem_T.PCHAR[PLUS(argv, 4, 1)]);
goto label_17;


// .\v4\print_tokens.c(39)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 39} true;
call result.open_token_stream$6 := open_token_stream ($open_token_stream.arg.1$7$);
assume value_is(__ctobpl_const_238, $open_token_stream.arg.1$7$);
assume value_is(__ctobpl_const_239, $open_token_stream.arg.1$7$);
goto label_20;


// .\v4\print_tokens.c(39)
label_20:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 39} true;
stream_ptr := result.open_token_stream$6 ;
assume value_is(__ctobpl_const_240, stream_ptr);
assume value_is(__ctobpl_const_241, result.open_token_stream$6);
goto label_21;


// .\v4\print_tokens.c(41)
label_21:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 41} true;
// loop entry initialization...
goto label_21_head;


label_21_head:
// loop head assertions...

// end loop head assertions

call result.get_token$9 := get_token (stream_ptr);
assume value_is(__ctobpl_const_242, stream_ptr);
assume value_is(__ctobpl_const_243, stream_ptr);
goto label_24;


// .\v4\print_tokens.c(41)
label_24:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 41} true;
token_ptr := result.get_token$9 ;
assume value_is(__ctobpl_const_244, token_ptr);
assume value_is(__ctobpl_const_245, result.get_token$9);
goto label_25;


// .\v4\print_tokens.c(41)
label_25:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 41} true;
call result.is_eof_token$8 := is_eof_token (token_ptr);
assume value_is(__ctobpl_const_246, token_ptr);
assume value_is(__ctobpl_const_247, token_ptr);
goto label_28;


// .\v4\print_tokens.c(41)
label_28:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 41} true;
goto label_28_true , label_28_false ;


label_28_true :
assume (result.is_eof_token$8 != 0);
assume value_is(__ctobpl_const_248, result.is_eof_token$8);
goto label_32;


label_28_false :
assume (result.is_eof_token$8 == 0);
assume value_is(__ctobpl_const_248, result.is_eof_token$8);
goto label_29;


// .\v4\print_tokens.c(42)
label_29:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 42} true;
call result.print_token$10 := print_token (token_ptr);
assume value_is(__ctobpl_const_249, token_ptr);
assume value_is(__ctobpl_const_250, token_ptr);
goto label_21_head;


// .\v4\print_tokens.c(43)
label_32:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 43} true;
call result.print_token$11 := print_token (token_ptr);
assume value_is(__ctobpl_const_251, token_ptr);
assume value_is(__ctobpl_const_252, token_ptr);
goto label_35;


// .\v4\print_tokens.c(44)
label_35:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 44} true;
call result.exit$12 := det_choice(); // havoc result.exit$12;
// skip exit
return;


// .\v4\print_tokens.c(36)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 36} true;
call result.__iob_func$3 := __iob_func ();
goto label_10;


// .\v4\print_tokens.c(36)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 36} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_253, $fprintf.arg.1$4$);
assume value_is(__ctobpl_const_254, result.__iob_func$3);
goto label_11;


// .\v4\print_tokens.c(36)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 36} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_14;


// .\v4\print_tokens.c(37)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 37} true;
call result.exit$5 := det_choice(); // havoc result.exit$5;
// skip exit
return;


// .\v4\print_tokens.c(45)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 45} true;
assume false;
return;

}



procedure {:extern}  next_state(state.__1:int, ch.__1:int) returns (result.next_state$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} $next_state.arg.1$3$_123_$static$ : int;
var {:extern} $next_state.arg.1$5$_123_$static$ : int;
var {:extern} result.next_state$2 : int;
var {:extern} result.next_state$4 : int;
var {:extern} state : int;
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

ch:= 0;//Init locals 
$next_state.arg.1$3$_123_$static$:= 0;//Init locals 
$next_state.arg.1$5$_123_$static$:= 0;//Init locals 
result.next_state$1 := 0;//initialize returns 
result.next_state$2:= 0;//Init locals 
result.next_state$4:= 0;//Init locals 
state:= 0;//Init locals 
state := state.__1;
ch := ch.__1;
goto label_3;


// .\v4\print_tokens.c(460)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 460} true;
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_LT(state, 0));
assume value_is(__ctobpl_const_255, state);
goto label_5;


label_3_false :
assume !(INT_LT(state, 0));
assume value_is(__ctobpl_const_255, state);
goto label_4;


// .\v4\print_tokens.c(462)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 462} true;
//TAG: Dereferenced object is non-null
assert(base != 0);
goto label_4_true , label_4_false ;


label_4_true :
assume (INT_LEQ(0, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch)));
assume value_is(__ctobpl_const_256, state);
assume value_is(__ctobpl_const_257, Mem_T.INT4[PLUS(base, 4, state)]);
assume value_is(__ctobpl_const_258, ch);
goto label_7;


label_4_false :
assume !(INT_LEQ(0, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch)));
assume value_is(__ctobpl_const_256, state);
assume value_is(__ctobpl_const_257, Mem_T.INT4[PLUS(base, 4, state)]);
assume value_is(__ctobpl_const_258, ch);
goto label_6;


// .\v4\print_tokens.c(470)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 470} true;
//TAG: Dereferenced object is non-null
assert(default1 != 0);
$next_state.arg.1$5$_123_$static$ := Mem_T.INT4[PLUS(default1, 4, state)] ;
assume value_is(__ctobpl_const_259, $next_state.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_260, state);
assume value_is(__ctobpl_const_261, Mem_T.INT4[PLUS(default1, 4, state)]);
goto label_14;


// .\v4\print_tokens.c(470)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 470} true;
call result.next_state$4 := next_state ($next_state.arg.1$5$_123_$static$, ch);
assume value_is(__ctobpl_const_262, $next_state.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_263, ch);
assume value_is(__ctobpl_const_264, $next_state.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_265, ch);
goto label_17;


// .\v4\print_tokens.c(470)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 470} true;
result.next_state$1 := result.next_state$4 ;
assume value_is(__ctobpl_const_266, result.next_state$4);
goto label_1;


// .\v4\print_tokens.c(464)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 464} true;
//TAG: Dereferenced object is non-null
assert(base != 0);
//TAG: Dereferenced object is non-null
assert(check != 0);
goto label_7_true , label_7_false ;


label_7_true :
assume (INT_EQ(Mem_T.INT4[PLUS(check, 4, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch))], state));
assume value_is(__ctobpl_const_267, state);
assume value_is(__ctobpl_const_268, Mem_T.INT4[PLUS(base, 4, state)]);
assume value_is(__ctobpl_const_269, ch);
assume value_is(__ctobpl_const_270, Mem_T.INT4[PLUS(check, 4, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch))]);
assume value_is(__ctobpl_const_271, state);
goto label_9;


label_7_false :
assume !(INT_EQ(Mem_T.INT4[PLUS(check, 4, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch))], state));
assume value_is(__ctobpl_const_267, state);
assume value_is(__ctobpl_const_268, Mem_T.INT4[PLUS(base, 4, state)]);
assume value_is(__ctobpl_const_269, ch);
assume value_is(__ctobpl_const_270, Mem_T.INT4[PLUS(check, 4, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch))]);
assume value_is(__ctobpl_const_271, state);
goto label_8;


// .\v4\print_tokens.c(467)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 467} true;
//TAG: Dereferenced object is non-null
assert(default1 != 0);
$next_state.arg.1$3$_123_$static$ := Mem_T.INT4[PLUS(default1, 4, state)] ;
assume value_is(__ctobpl_const_272, $next_state.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_273, state);
assume value_is(__ctobpl_const_274, Mem_T.INT4[PLUS(default1, 4, state)]);
goto label_10;


// .\v4\print_tokens.c(467)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 467} true;
call result.next_state$2 := next_state ($next_state.arg.1$3$_123_$static$, ch);
assume value_is(__ctobpl_const_275, $next_state.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_276, ch);
assume value_is(__ctobpl_const_277, $next_state.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_278, ch);
goto label_13;


// .\v4\print_tokens.c(467)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 467} true;
result.next_state$1 := result.next_state$2 ;
assume value_is(__ctobpl_const_279, result.next_state$2);
goto label_1;


// .\v4\print_tokens.c(471)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 471} true;
assume false;
return;


// .\v4\print_tokens.c(465)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 465} true;
//TAG: Dereferenced object is non-null
assert(base != 0);
//TAG: Dereferenced object is non-null
assert(next != 0);
result.next_state$1 := Mem_T.INT4[PLUS(next, 4, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch))] ;
assume value_is(__ctobpl_const_280, state);
assume value_is(__ctobpl_const_281, Mem_T.INT4[PLUS(base, 4, state)]);
assume value_is(__ctobpl_const_282, ch);
assume value_is(__ctobpl_const_283, Mem_T.INT4[PLUS(next, 4, PLUS(Mem_T.INT4[PLUS(base, 4, state)], 1, ch))]);
goto label_1;


// .\v4\print_tokens.c(461)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 461} true;
result.next_state$1 := state ;
assume value_is(__ctobpl_const_284, state);
goto label_1;


// .\v4\print_tokens.c(471)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 471} true;
return;

}



procedure {:extern}  numeric_case(tstream_ptr.__1:int, token_ptr.__1:int, ch.__1:int, token_str.__1:int, token_ind.__1:int) returns (result.numeric_case$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} result.check_delimiter$2 : int;
var {:extern} result.check_delimiter$3 : int;
var {:extern} result.get_actual_token$6 : int;
var {:extern} result.get_actual_token$10 : int;
var {:extern} result.get_char$4 : int;
var {:extern} result.strcpy$7 : int;
var {:extern} result.strcpy$11 : int;
var {:extern} result.unget_char$5 : int;
var {:extern} result.unget_char$9 : int;
var {:extern} $strcpy.arg.1$12$_123_$static$ : int;
var {:extern} $strcpy.arg.1$8$_123_$static$ : int;
var {:extern} token_ind : int;
var {:extern} token_ptr : int;
var {:extern} token_str : int;
var {:extern} tstream_ptr : int;
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

assume INT_LT(tstream_ptr.__1, alloc);
assume INT_LT(token_ptr.__1, alloc);
assume INT_LT(token_str.__1, alloc);
ch:= 0;//Init locals 
result.check_delimiter$2:= 0;//Init locals 
result.check_delimiter$3:= 0;//Init locals 
result.get_actual_token$6:= 0;//Init locals 
result.get_actual_token$10:= 0;//Init locals 
result.get_char$4:= 0;//Init locals 
result.numeric_case$1 := 0;//initialize returns 
result.strcpy$7:= 0;//Init locals 
result.strcpy$11:= 0;//Init locals 
result.unget_char$5:= 0;//Init locals 
result.unget_char$9:= 0;//Init locals 
$strcpy.arg.1$12$_123_$static$:= 0;//Init locals 
$strcpy.arg.1$8$_123_$static$:= 0;//Init locals 
token_ind:= 0;//Init locals 
token_ptr:= 0;//Init locals 
token_str:= 0;//Init locals 
tstream_ptr:= 0;//Init locals 
tstream_ptr := tstream_ptr.__1;
token_ptr := token_ptr.__1;
ch := ch.__1;
token_str := token_str.__1;
token_ind := token_ind.__1;
goto label_3;


// .\v4\print_tokens.c(276)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 276} true;
call result.check_delimiter$2 := check_delimiter (ch);
assume value_is(__ctobpl_const_285, ch);
assume value_is(__ctobpl_const_286, ch);
goto label_6;


// .\v4\print_tokens.c(276)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 276} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (INT_NEQ(result.check_delimiter$2, 1));
assume value_is(__ctobpl_const_287, result.check_delimiter$2);
goto label_8;


label_6_false :
assume !(INT_NEQ(result.check_delimiter$2, 1));
assume value_is(__ctobpl_const_287, result.check_delimiter$2);
goto label_7;


// .\v4\print_tokens.c(290)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 290} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := 18];
assume value_is(__ctobpl_const_288, token_ptr);
assume value_is(__ctobpl_const_289, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_32;


// .\v4\print_tokens.c(291)
label_32:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 291} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.unget_char$9 := unget_char (ch, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_290, ch);
assume value_is(__ctobpl_const_291, tstream_ptr);
assume value_is(__ctobpl_const_292, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_293, ch);
assume value_is(__ctobpl_const_294, tstream_ptr);
assume value_is(__ctobpl_const_295, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_35;


// .\v4\print_tokens.c(292)
label_35:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 292} true;
assume value_is(__ctobpl_const_296, token_ind);
token_ind := MINUS_BOTH_PTR_OR_BOTH_INT( token_ind, 1, 1) ;
goto label_36;


// .\v4\print_tokens.c(293)
label_36:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 293} true;
call result.get_actual_token$10 := get_actual_token (token_str, token_ind);
assume value_is(__ctobpl_const_297, token_str);
assume value_is(__ctobpl_const_298, token_ind);
assume value_is(__ctobpl_const_299, token_str);
assume value_is(__ctobpl_const_300, token_ind);
goto label_39;


// .\v4\print_tokens.c(294)
label_39:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 294} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_301, token_ptr);
goto label_40;


// .\v4\print_tokens.c(294)
label_40:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 294} true;
call result.strcpy$11 := strcpy ($strcpy.arg.1$12$_123_$static$, token_str);
assume value_is(__ctobpl_const_302, token_str);
assume value_is(__ctobpl_const_303, token_str);
goto label_43;


// .\v4\print_tokens.c(295)
label_43:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 295} true;
result.numeric_case$1 := token_ptr ;
assume value_is(__ctobpl_const_304, token_ptr);
goto label_1;


// .\v4\print_tokens.c(278)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 278} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.token_id_token_type := Mem_T.token_id_token_type[token_id_token_type(token_ptr) := -1];
assume value_is(__ctobpl_const_305, token_ptr);
assume value_is(__ctobpl_const_306, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_9;


// .\v4\print_tokens.c(279)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 279} true;
// loop entry initialization...
goto label_9_head;


label_9_head:
// loop head assertions...

// end loop head assertions

call result.check_delimiter$3 := check_delimiter (ch);
assume value_is(__ctobpl_const_307, ch);
assume value_is(__ctobpl_const_308, ch);
goto label_12;


// .\v4\print_tokens.c(279)
label_12:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 279} true;
goto label_12_true , label_12_false ;


label_12_true :
assume (result.check_delimiter$3 != 0);
assume value_is(__ctobpl_const_309, result.check_delimiter$3);
goto label_14;


label_12_false :
assume (result.check_delimiter$3 == 0);
assume value_is(__ctobpl_const_309, result.check_delimiter$3);
goto label_13;


// .\v4\print_tokens.c(281)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 281} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (INT_LEQ(80, token_ind));
assume value_is(__ctobpl_const_310, token_ind);
goto label_29;


label_13_false :
assume !(INT_LEQ(80, token_ind));
assume value_is(__ctobpl_const_310, token_ind);
goto label_26;


// .\v4\print_tokens.c(282)
label_26:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 282} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.get_char$4 := get_char (Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_311, tstream_ptr);
assume value_is(__ctobpl_const_312, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_313, tstream_ptr);
assume value_is(__ctobpl_const_314, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_30;


// .\v4\print_tokens.c(282)
label_30:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 282} true;
ch := result.get_char$4 ;
assume value_is(__ctobpl_const_315, ch);
assume value_is(__ctobpl_const_316, result.get_char$4);
goto label_31;


// .\v4\print_tokens.c(282)
label_31:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 282} true;
//TAG: Dereferenced object is non-null
assert(token_str != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(token_str, 1, token_ind) := ch];
assume value_is(__ctobpl_const_317, token_str);
assume value_is(__ctobpl_const_318, token_ind);
token_ind := PLUS(token_ind, 1, 1) ;
assume value_is(__ctobpl_const_319, Mem_T.CHAR[PLUS(token_str, 1, token_ind)]);
assume value_is(__ctobpl_const_320, ch);
goto label_9_head;


// .\v4\print_tokens.c(281)
label_29:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 281} true;
goto label_14;


// .\v4\print_tokens.c(284)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 284} true;
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(tstream_ptr != 0);
call result.unget_char$5 := unget_char (ch, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_321, ch);
assume value_is(__ctobpl_const_322, tstream_ptr);
assume value_is(__ctobpl_const_323, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
assume value_is(__ctobpl_const_324, ch);
assume value_is(__ctobpl_const_325, tstream_ptr);
assume value_is(__ctobpl_const_326, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(tstream_ptr)]);
goto label_17;


// .\v4\print_tokens.c(285)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 285} true;
assume value_is(__ctobpl_const_327, token_ind);
token_ind := MINUS_BOTH_PTR_OR_BOTH_INT( token_ind, 1, 1) ;
goto label_18;


// .\v4\print_tokens.c(286)
label_18:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 286} true;
call result.get_actual_token$6 := get_actual_token (token_str, token_ind);
assume value_is(__ctobpl_const_328, token_str);
assume value_is(__ctobpl_const_329, token_ind);
assume value_is(__ctobpl_const_330, token_str);
assume value_is(__ctobpl_const_331, token_ind);
goto label_21;


// .\v4\print_tokens.c(287)
label_21:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 287} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_332, token_ptr);
goto label_22;


// .\v4\print_tokens.c(287)
label_22:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 287} true;
call result.strcpy$7 := strcpy ($strcpy.arg.1$8$_123_$static$, token_str);
assume value_is(__ctobpl_const_333, token_str);
assume value_is(__ctobpl_const_334, token_str);
goto label_25;


// .\v4\print_tokens.c(288)
label_25:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 288} true;
result.numeric_case$1 := token_ptr ;
assume value_is(__ctobpl_const_335, token_ptr);
goto label_1;


// .\v4\print_tokens.c(296)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 296} true;
return;


// .\v4\print_tokens.c(296)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 296} true;
assume false;
return;

}



procedure {:extern}  open_character_stream(FILENAME.__1:int) returns (result.open_character_stream$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} FILENAME : int;
var {:extern} $fprintf.arg.1$7$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.__iob_func$6 : int;
var {:extern} result.exit$8 : int;
var {:extern} result.fopen$4 : int;
var {:extern} result.fprintf$5 : int;
var {:extern} result.malloc$2 : int;
var {:extern} stream_ptr : int;
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

assume INT_LT(FILENAME.__1, alloc);
FILENAME:= 0;//Init locals 
$fprintf.arg.1$7$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.__iob_func$6:= 0;//Init locals 
result.exit$8:= 0;//Init locals 
result.fopen$4:= 0;//Init locals 
result.fprintf$5:= 0;//Init locals 
result.malloc$2:= 0;//Init locals 
result.open_character_stream$1 := 0;//initialize returns 
stream_ptr:= 0;//Init locals 
FILENAME := FILENAME.__1;
goto label_3;


// .\v4\print_tokens.c(65)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 65} true;
goto label_4;


// .\v4\print_tokens.c(67)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 67} true;
call result.malloc$2 := __HAVOC_det_malloc (88);
goto label_7;


// .\v4\print_tokens.c(67)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 67} true;
stream_ptr := result.malloc$2 ;
assume value_is(__ctobpl_const_336, stream_ptr);
assume value_is(__ctobpl_const_337, result.malloc$2);
goto label_8;


// .\v4\print_tokens.c(68)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 68} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
Mem_T.stream_ind_stream_type := Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr) := 5];
assume value_is(__ctobpl_const_338, stream_ptr);
assume value_is(__ctobpl_const_339, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
goto label_9;


// .\v4\print_tokens.c(69)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 69} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_stream_type(stream_ptr) != 0);
Mem_T.stream_stream_type := Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, 5) := 0];
assume value_is(__ctobpl_const_340, stream_ptr);
assume value_is(__ctobpl_const_341, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, 5)]);
goto label_10;


// .\v4\print_tokens.c(70)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 70} true;
goto label_10_true , label_10_false ;


label_10_true :
assume (FILENAME != 0);
assume value_is(__ctobpl_const_342, FILENAME);
goto label_14;


label_10_false :
assume (FILENAME == 0);
assume value_is(__ctobpl_const_342, FILENAME);
goto label_11;


// .\v4\print_tokens.c(71)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 71} true;
call result.__iob_func$3 := __iob_func ();
goto label_30;


// .\v4\print_tokens.c(71)
label_30:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 71} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
Mem_T.fp_stream_type := Mem_T.fp_stream_type[fp_stream_type(stream_ptr) := PLUS(result.__iob_func$3, 32, 0)];
assume value_is(__ctobpl_const_343, stream_ptr);
assume value_is(__ctobpl_const_344, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_345, result.__iob_func$3);
goto label_22;


// .\v4\print_tokens.c(72)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 72} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.fopen$4 := fopen (FILENAME, havoc_stringTemp);
assume value_is(__ctobpl_const_346, FILENAME);
assume value_is(__ctobpl_const_347, FILENAME);
goto label_17;


// .\v4\print_tokens.c(72)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 72} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
Mem_T.fp_stream_type := Mem_T.fp_stream_type[fp_stream_type(stream_ptr) := result.fopen$4];
assume value_is(__ctobpl_const_348, stream_ptr);
assume value_is(__ctobpl_const_349, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_350, result.fopen$4);
goto label_18;


// .\v4\print_tokens.c(72)
label_18:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 72} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
goto label_18_true , label_18_false ;


label_18_true :
assume (Mem_T.fp_stream_type[fp_stream_type(stream_ptr)] != 0);
assume value_is(__ctobpl_const_351, stream_ptr);
assume value_is(__ctobpl_const_352, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
goto label_22;


label_18_false :
assume (Mem_T.fp_stream_type[fp_stream_type(stream_ptr)] == 0);
assume value_is(__ctobpl_const_351, stream_ptr);
assume value_is(__ctobpl_const_352, Mem_T.fp_stream_type[fp_stream_type(stream_ptr)]);
goto label_19;


// .\v4\print_tokens.c(74)
label_19:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 74} true;
call result.__iob_func$6 := __iob_func ();
goto label_23;


// .\v4\print_tokens.c(74)
label_23:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 74} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$6 != 0);
$fprintf.arg.1$7$ := PLUS(result.__iob_func$6, 32, 1) ;
assume value_is(__ctobpl_const_353, $fprintf.arg.1$7$);
assume value_is(__ctobpl_const_354, result.__iob_func$6);
goto label_24;


// .\v4\print_tokens.c(74)
label_24:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 74} true;
call result.fprintf$5 := det_choice(); // havoc result.fprintf$5;
// skip fprintf
goto label_27;


// .\v4\print_tokens.c(75)
label_27:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 75} true;
call result.exit$8 := det_choice(); // havoc result.exit$8;
// skip exit
return;


// .\v4\print_tokens.c(77)
label_22:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 77} true;
result.open_character_stream$1 := stream_ptr ;
assume value_is(__ctobpl_const_355, stream_ptr);
goto label_1;


// .\v4\print_tokens.c(78)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 78} true;
return;


// .\v4\print_tokens.c(78)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 78} true;
assume false;
return;

}



procedure {:extern}  open_token_stream(FILENAME.__1:int) returns (result.open_token_stream$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} FILENAME : int;
var {:extern} result.malloc$2 : int;
var {:extern} result.open_character_stream$3 : int;
var {:extern} token_ptr : int;
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

assume INT_LT(FILENAME.__1, alloc);
FILENAME:= 0;//Init locals 
result.malloc$2:= 0;//Init locals 
result.open_character_stream$3:= 0;//Init locals 
result.open_token_stream$1 := 0;//initialize returns 
token_ptr:= 0;//Init locals 
FILENAME := FILENAME.__1;
goto label_3;


// .\v4\print_tokens.c(160)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 160} true;
goto label_4;


// .\v4\print_tokens.c(162)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 162} true;
call result.malloc$2 := __HAVOC_det_malloc (4);
goto label_7;


// .\v4\print_tokens.c(162)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 162} true;
token_ptr := result.malloc$2 ;
assume value_is(__ctobpl_const_356, token_ptr);
assume value_is(__ctobpl_const_357, result.malloc$2);
goto label_8;


// .\v4\print_tokens.c(163)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 163} true;
call result.open_character_stream$3 := open_character_stream (FILENAME);
assume value_is(__ctobpl_const_358, FILENAME);
assume value_is(__ctobpl_const_359, FILENAME);
goto label_11;


// .\v4\print_tokens.c(163)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 163} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
Mem_T.ch_stream_token_stream_type := Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(token_ptr) := result.open_character_stream$3];
assume value_is(__ctobpl_const_360, token_ptr);
assume value_is(__ctobpl_const_361, Mem_T.ch_stream_token_stream_type[ch_stream_token_stream_type(token_ptr)]);
assume value_is(__ctobpl_const_362, result.open_character_stream$3);
goto label_12;


// .\v4\print_tokens.c(165)
label_12:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 165} true;
result.open_token_stream$1 := token_ptr ;
assume value_is(__ctobpl_const_363, token_ptr);
goto label_1;


// .\v4\print_tokens.c(166)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 166} true;
return;


// .\v4\print_tokens.c(166)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 166} true;
assume false;
return;

}



procedure {:extern}  print_token(token_ptr.__1:int) returns (result.print_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fprintf.arg.1$11$ : int;
var {:extern} $fprintf.arg.1$14$ : int;
var {:extern} $fprintf.arg.1$17$ : int;
var {:extern} $fprintf.arg.1$20$ : int;
var {:extern} $fprintf.arg.1$23$ : int;
var {:extern} $fprintf.arg.1$26$ : int;
var {:extern} $fprintf.arg.1$29$ : int;
var {:extern} $fprintf.arg.1$32$ : int;
var {:extern} $fprintf.arg.1$36$ : int;
var {:extern} $fprintf.arg.1$39$ : int;
var {:extern} $fprintf.arg.1$4$ : int;
var {:extern} $fprintf.arg.1$42$ : int;
var {:extern} $fprintf.arg.1$46$ : int;
var {:extern} $fprintf.arg.1$49$ : int;
var {:extern} $fprintf.arg.1$52$ : int;
var {:extern} $fprintf.arg.1$55$ : int;
var {:extern} $fprintf.arg.1$58$ : int;
var {:extern} $fprintf.arg.1$61$ : int;
var {:extern} $fprintf.arg.1$64$ : int;
var {:extern} $fprintf.arg.1$67$ : int;
var {:extern} $fprintf.arg.1$70$ : int;
var {:extern} $fprintf.arg.1$73$ : int;
var {:extern} $fprintf.arg.1$77$ : int;
var {:extern} $fprintf.arg.1$8$ : int;
var {:extern} $fprintf.arg.1$80$ : int;
var {:extern} $fprintf.arg.1$83$ : int;
var {:extern} $fprintf.arg.1$87$ : int;
var {:extern} $fprintf.arg.1$90$ : int;
var {:extern} $fprintf.arg.1$93$ : int;
var {:extern} $fprintf.arg.3$34$ : int;
var {:extern} $fprintf.arg.3$44$ : int;
var {:extern} $fprintf.arg.3$6$ : int;
var {:extern} $fprintf.arg.3$75$ : int;
var {:extern} $fprintf.arg.3$85$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.__iob_func$7 : int;
var {:extern} result.__iob_func$10 : int;
var {:extern} result.__iob_func$13 : int;
var {:extern} result.__iob_func$16 : int;
var {:extern} result.__iob_func$19 : int;
var {:extern} result.__iob_func$22 : int;
var {:extern} result.__iob_func$25 : int;
var {:extern} result.__iob_func$28 : int;
var {:extern} result.__iob_func$31 : int;
var {:extern} result.__iob_func$35 : int;
var {:extern} result.__iob_func$38 : int;
var {:extern} result.__iob_func$41 : int;
var {:extern} result.__iob_func$45 : int;
var {:extern} result.__iob_func$48 : int;
var {:extern} result.__iob_func$51 : int;
var {:extern} result.__iob_func$54 : int;
var {:extern} result.__iob_func$57 : int;
var {:extern} result.__iob_func$60 : int;
var {:extern} result.__iob_func$63 : int;
var {:extern} result.__iob_func$66 : int;
var {:extern} result.__iob_func$69 : int;
var {:extern} result.__iob_func$72 : int;
var {:extern} result.__iob_func$76 : int;
var {:extern} result.__iob_func$79 : int;
var {:extern} result.__iob_func$82 : int;
var {:extern} result.__iob_func$86 : int;
var {:extern} result.__iob_func$89 : int;
var {:extern} result.__iob_func$92 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} result.fprintf$5 : int;
var {:extern} result.fprintf$9 : int;
var {:extern} result.fprintf$12 : int;
var {:extern} result.fprintf$15 : int;
var {:extern} result.fprintf$18 : int;
var {:extern} result.fprintf$21 : int;
var {:extern} result.fprintf$24 : int;
var {:extern} result.fprintf$27 : int;
var {:extern} result.fprintf$30 : int;
var {:extern} result.fprintf$33 : int;
var {:extern} result.fprintf$37 : int;
var {:extern} result.fprintf$40 : int;
var {:extern} result.fprintf$43 : int;
var {:extern} result.fprintf$47 : int;
var {:extern} result.fprintf$50 : int;
var {:extern} result.fprintf$53 : int;
var {:extern} result.fprintf$56 : int;
var {:extern} result.fprintf$59 : int;
var {:extern} result.fprintf$62 : int;
var {:extern} result.fprintf$65 : int;
var {:extern} result.fprintf$68 : int;
var {:extern} result.fprintf$71 : int;
var {:extern} result.fprintf$74 : int;
var {:extern} result.fprintf$78 : int;
var {:extern} result.fprintf$81 : int;
var {:extern} result.fprintf$84 : int;
var {:extern} result.fprintf$88 : int;
var {:extern} result.fprintf$91 : int;
var {:extern} token_ptr : int;
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

assume INT_LT(token_ptr.__1, alloc);
$fprintf.arg.1$11$:= 0;//Init locals 
$fprintf.arg.1$14$:= 0;//Init locals 
$fprintf.arg.1$17$:= 0;//Init locals 
$fprintf.arg.1$20$:= 0;//Init locals 
$fprintf.arg.1$23$:= 0;//Init locals 
$fprintf.arg.1$26$:= 0;//Init locals 
$fprintf.arg.1$29$:= 0;//Init locals 
$fprintf.arg.1$32$:= 0;//Init locals 
$fprintf.arg.1$36$:= 0;//Init locals 
$fprintf.arg.1$39$:= 0;//Init locals 
$fprintf.arg.1$4$:= 0;//Init locals 
$fprintf.arg.1$42$:= 0;//Init locals 
$fprintf.arg.1$46$:= 0;//Init locals 
$fprintf.arg.1$49$:= 0;//Init locals 
$fprintf.arg.1$52$:= 0;//Init locals 
$fprintf.arg.1$55$:= 0;//Init locals 
$fprintf.arg.1$58$:= 0;//Init locals 
$fprintf.arg.1$61$:= 0;//Init locals 
$fprintf.arg.1$64$:= 0;//Init locals 
$fprintf.arg.1$67$:= 0;//Init locals 
$fprintf.arg.1$70$:= 0;//Init locals 
$fprintf.arg.1$73$:= 0;//Init locals 
$fprintf.arg.1$77$:= 0;//Init locals 
$fprintf.arg.1$8$:= 0;//Init locals 
$fprintf.arg.1$80$:= 0;//Init locals 
$fprintf.arg.1$83$:= 0;//Init locals 
$fprintf.arg.1$87$:= 0;//Init locals 
$fprintf.arg.1$90$:= 0;//Init locals 
$fprintf.arg.1$93$:= 0;//Init locals 
$fprintf.arg.3$34$:= 0;//Init locals 
$fprintf.arg.3$44$:= 0;//Init locals 
$fprintf.arg.3$6$:= 0;//Init locals 
$fprintf.arg.3$75$:= 0;//Init locals 
$fprintf.arg.3$85$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.__iob_func$7:= 0;//Init locals 
result.__iob_func$10:= 0;//Init locals 
result.__iob_func$13:= 0;//Init locals 
result.__iob_func$16:= 0;//Init locals 
result.__iob_func$19:= 0;//Init locals 
result.__iob_func$22:= 0;//Init locals 
result.__iob_func$25:= 0;//Init locals 
result.__iob_func$28:= 0;//Init locals 
result.__iob_func$31:= 0;//Init locals 
result.__iob_func$35:= 0;//Init locals 
result.__iob_func$38:= 0;//Init locals 
result.__iob_func$41:= 0;//Init locals 
result.__iob_func$45:= 0;//Init locals 
result.__iob_func$48:= 0;//Init locals 
result.__iob_func$51:= 0;//Init locals 
result.__iob_func$54:= 0;//Init locals 
result.__iob_func$57:= 0;//Init locals 
result.__iob_func$60:= 0;//Init locals 
result.__iob_func$63:= 0;//Init locals 
result.__iob_func$66:= 0;//Init locals 
result.__iob_func$69:= 0;//Init locals 
result.__iob_func$72:= 0;//Init locals 
result.__iob_func$76:= 0;//Init locals 
result.__iob_func$79:= 0;//Init locals 
result.__iob_func$82:= 0;//Init locals 
result.__iob_func$86:= 0;//Init locals 
result.__iob_func$89:= 0;//Init locals 
result.__iob_func$92:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.fprintf$5:= 0;//Init locals 
result.fprintf$9:= 0;//Init locals 
result.fprintf$12:= 0;//Init locals 
result.fprintf$15:= 0;//Init locals 
result.fprintf$18:= 0;//Init locals 
result.fprintf$21:= 0;//Init locals 
result.fprintf$24:= 0;//Init locals 
result.fprintf$27:= 0;//Init locals 
result.fprintf$30:= 0;//Init locals 
result.fprintf$33:= 0;//Init locals 
result.fprintf$37:= 0;//Init locals 
result.fprintf$40:= 0;//Init locals 
result.fprintf$43:= 0;//Init locals 
result.fprintf$47:= 0;//Init locals 
result.fprintf$50:= 0;//Init locals 
result.fprintf$53:= 0;//Init locals 
result.fprintf$56:= 0;//Init locals 
result.fprintf$59:= 0;//Init locals 
result.fprintf$62:= 0;//Init locals 
result.fprintf$65:= 0;//Init locals 
result.fprintf$68:= 0;//Init locals 
result.fprintf$71:= 0;//Init locals 
result.fprintf$74:= 0;//Init locals 
result.fprintf$78:= 0;//Init locals 
result.fprintf$81:= 0;//Init locals 
result.fprintf$84:= 0;//Init locals 
result.fprintf$88:= 0;//Init locals 
result.fprintf$91:= 0;//Init locals 
result.print_token$1 := 0;//initialize returns 
token_ptr:= 0;//Init locals 
token_ptr := token_ptr.__1;
goto label_3;


// .\v4\print_tokens.c(508)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 508} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);

goto label_3_case_0, label_3_case_1, label_3_case_2, label_3_case_3, label_3_case_4, label_3_case_5, label_3_case_6, label_3_case_7, label_3_case_8, label_3_case_9, label_3_case_10, label_3_case_11, label_3_case_12, label_3_case_13, label_3_case_14, label_3_case_15, label_3_case_16, label_3_case_17, label_3_case_18, label_3_case_19;




label_3_case_0 :
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], -1));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 0));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 6));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 9));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 11));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 13));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 16));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 17));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 18));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 19));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 20));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 21));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 22));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 23));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 24));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 25));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 27));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 29));
assume(INT_NEQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 32));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_4;



label_3_case_1 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], -1));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_5;



label_3_case_2 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 0));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_8;



label_3_case_3 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 6));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_11;



label_3_case_4 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 9));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_14;



label_3_case_5 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 11));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_17;



label_3_case_6 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 13));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_20;



label_3_case_7 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 16));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_23;



label_3_case_8 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 17));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_26;



label_3_case_9 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 18));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_29;



label_3_case_10 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 19));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_32;



label_3_case_11 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 20));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_35;



label_3_case_12 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 21));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_38;



label_3_case_13 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 22));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_41;



label_3_case_14 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 23));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_44;



label_3_case_15 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 24));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_47;



label_3_case_16 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 25));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_50;



label_3_case_17 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 27));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_53;



label_3_case_18 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 29));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_56;



label_3_case_19 :
assume(INT_EQ(Mem_T.token_id_token_type[token_id_token_type(token_ptr)], 32));
assume value_is(__ctobpl_const_364, token_ptr);
assume value_is(__ctobpl_const_365, Mem_T.token_id_token_type[token_id_token_type(token_ptr)]);
goto label_59;


// .\v4\print_tokens.c(534)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 534} true;
goto label_232;


// .\v4\print_tokens.c(536)
label_232:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 536} true;
result.print_token$1 := 0 ;
goto label_1;


// .\v4\print_tokens.c(510)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
call result.__iob_func$3 := __iob_func ();
goto label_212;


// .\v4\print_tokens.c(510)
label_212:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_366, $fprintf.arg.1$4$);
assume value_is(__ctobpl_const_367, result.__iob_func$3);
goto label_213;


// .\v4\print_tokens.c(510)
label_213:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_216;


// .\v4\print_tokens.c(510)
label_216:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_368, token_ptr);
goto label_217;


// .\v4\print_tokens.c(510)
label_217:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
call result.__iob_func$7 := __iob_func ();
goto label_220;


// .\v4\print_tokens.c(510)
label_220:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$7 != 0);
$fprintf.arg.1$8$ := PLUS(result.__iob_func$7, 32, 1) ;
assume value_is(__ctobpl_const_369, $fprintf.arg.1$8$);
assume value_is(__ctobpl_const_370, result.__iob_func$7);
goto label_221;


// .\v4\print_tokens.c(510)
label_221:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 510} true;
call result.fprintf$5 := det_choice(); // havoc result.fprintf$5;
// skip fprintf
goto label_224;


// .\v4\print_tokens.c(511)
label_224:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 511} true;
call result.__iob_func$10 := __iob_func ();
goto label_227;


// .\v4\print_tokens.c(511)
label_227:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 511} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$10 != 0);
$fprintf.arg.1$11$ := PLUS(result.__iob_func$10, 32, 1) ;
assume value_is(__ctobpl_const_371, $fprintf.arg.1$11$);
assume value_is(__ctobpl_const_372, result.__iob_func$10);
goto label_228;


// .\v4\print_tokens.c(511)
label_228:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 511} true;
call result.fprintf$9 := det_choice(); // havoc result.fprintf$9;
// skip fprintf
goto label_231;


// .\v4\print_tokens.c(511)
label_231:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 511} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(512)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 512} true;
call result.__iob_func$13 := __iob_func ();
goto label_207;


// .\v4\print_tokens.c(512)
label_207:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 512} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$13 != 0);
$fprintf.arg.1$14$ := PLUS(result.__iob_func$13, 32, 1) ;
assume value_is(__ctobpl_const_373, $fprintf.arg.1$14$);
assume value_is(__ctobpl_const_374, result.__iob_func$13);
goto label_208;


// .\v4\print_tokens.c(512)
label_208:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 512} true;
call result.fprintf$12 := det_choice(); // havoc result.fprintf$12;
// skip fprintf
goto label_211;


// .\v4\print_tokens.c(512)
label_211:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 512} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(513)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 513} true;
call result.__iob_func$16 := __iob_func ();
goto label_202;


// .\v4\print_tokens.c(513)
label_202:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 513} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$16 != 0);
$fprintf.arg.1$17$ := PLUS(result.__iob_func$16, 32, 1) ;
assume value_is(__ctobpl_const_375, $fprintf.arg.1$17$);
assume value_is(__ctobpl_const_376, result.__iob_func$16);
goto label_203;


// .\v4\print_tokens.c(513)
label_203:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 513} true;
call result.fprintf$15 := det_choice(); // havoc result.fprintf$15;
// skip fprintf
goto label_206;


// .\v4\print_tokens.c(513)
label_206:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 513} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(514)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 514} true;
call result.__iob_func$19 := __iob_func ();
goto label_197;


// .\v4\print_tokens.c(514)
label_197:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 514} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$19 != 0);
$fprintf.arg.1$20$ := PLUS(result.__iob_func$19, 32, 1) ;
assume value_is(__ctobpl_const_377, $fprintf.arg.1$20$);
assume value_is(__ctobpl_const_378, result.__iob_func$19);
goto label_198;


// .\v4\print_tokens.c(514)
label_198:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 514} true;
call result.fprintf$18 := det_choice(); // havoc result.fprintf$18;
// skip fprintf
goto label_201;


// .\v4\print_tokens.c(514)
label_201:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 514} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(515)
label_17:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 515} true;
call result.__iob_func$22 := __iob_func ();
goto label_192;


// .\v4\print_tokens.c(515)
label_192:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 515} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$22 != 0);
$fprintf.arg.1$23$ := PLUS(result.__iob_func$22, 32, 1) ;
assume value_is(__ctobpl_const_379, $fprintf.arg.1$23$);
assume value_is(__ctobpl_const_380, result.__iob_func$22);
goto label_193;


// .\v4\print_tokens.c(515)
label_193:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 515} true;
call result.fprintf$21 := det_choice(); // havoc result.fprintf$21;
// skip fprintf
goto label_196;


// .\v4\print_tokens.c(515)
label_196:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 515} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(516)
label_20:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 516} true;
call result.__iob_func$25 := __iob_func ();
goto label_187;


// .\v4\print_tokens.c(516)
label_187:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 516} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$25 != 0);
$fprintf.arg.1$26$ := PLUS(result.__iob_func$25, 32, 1) ;
assume value_is(__ctobpl_const_381, $fprintf.arg.1$26$);
assume value_is(__ctobpl_const_382, result.__iob_func$25);
goto label_188;


// .\v4\print_tokens.c(516)
label_188:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 516} true;
call result.fprintf$24 := det_choice(); // havoc result.fprintf$24;
// skip fprintf
goto label_191;


// .\v4\print_tokens.c(516)
label_191:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 516} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(517)
label_23:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 517} true;
call result.__iob_func$28 := __iob_func ();
goto label_182;


// .\v4\print_tokens.c(517)
label_182:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 517} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$28 != 0);
$fprintf.arg.1$29$ := PLUS(result.__iob_func$28, 32, 1) ;
assume value_is(__ctobpl_const_383, $fprintf.arg.1$29$);
assume value_is(__ctobpl_const_384, result.__iob_func$28);
goto label_183;


// .\v4\print_tokens.c(517)
label_183:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 517} true;
call result.fprintf$27 := det_choice(); // havoc result.fprintf$27;
// skip fprintf
goto label_186;


// .\v4\print_tokens.c(517)
label_186:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 517} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(518)
label_26:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
call result.__iob_func$31 := __iob_func ();
goto label_162;


// .\v4\print_tokens.c(518)
label_162:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$31 != 0);
$fprintf.arg.1$32$ := PLUS(result.__iob_func$31, 32, 1) ;
assume value_is(__ctobpl_const_385, $fprintf.arg.1$32$);
assume value_is(__ctobpl_const_386, result.__iob_func$31);
goto label_163;


// .\v4\print_tokens.c(518)
label_163:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
call result.fprintf$30 := det_choice(); // havoc result.fprintf$30;
// skip fprintf
goto label_166;


// .\v4\print_tokens.c(518)
label_166:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_387, token_ptr);
goto label_167;


// .\v4\print_tokens.c(518)
label_167:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
call result.__iob_func$35 := __iob_func ();
goto label_170;


// .\v4\print_tokens.c(518)
label_170:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$35 != 0);
$fprintf.arg.1$36$ := PLUS(result.__iob_func$35, 32, 1) ;
assume value_is(__ctobpl_const_388, $fprintf.arg.1$36$);
assume value_is(__ctobpl_const_389, result.__iob_func$35);
goto label_171;


// .\v4\print_tokens.c(518)
label_171:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 518} true;
call result.fprintf$33 := det_choice(); // havoc result.fprintf$33;
// skip fprintf
goto label_174;


// .\v4\print_tokens.c(519)
label_174:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 519} true;
call result.__iob_func$38 := __iob_func ();
goto label_177;


// .\v4\print_tokens.c(519)
label_177:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 519} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$38 != 0);
$fprintf.arg.1$39$ := PLUS(result.__iob_func$38, 32, 1) ;
assume value_is(__ctobpl_const_390, $fprintf.arg.1$39$);
assume value_is(__ctobpl_const_391, result.__iob_func$38);
goto label_178;


// .\v4\print_tokens.c(519)
label_178:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 519} true;
call result.fprintf$37 := det_choice(); // havoc result.fprintf$37;
// skip fprintf
goto label_181;


// .\v4\print_tokens.c(519)
label_181:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 519} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(520)
label_29:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
call result.__iob_func$41 := __iob_func ();
goto label_142;


// .\v4\print_tokens.c(520)
label_142:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$41 != 0);
$fprintf.arg.1$42$ := PLUS(result.__iob_func$41, 32, 1) ;
assume value_is(__ctobpl_const_392, $fprintf.arg.1$42$);
assume value_is(__ctobpl_const_393, result.__iob_func$41);
goto label_143;


// .\v4\print_tokens.c(520)
label_143:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
call result.fprintf$40 := det_choice(); // havoc result.fprintf$40;
// skip fprintf
goto label_146;


// .\v4\print_tokens.c(520)
label_146:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_394, token_ptr);
goto label_147;


// .\v4\print_tokens.c(520)
label_147:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
call result.__iob_func$45 := __iob_func ();
goto label_150;


// .\v4\print_tokens.c(520)
label_150:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$45 != 0);
$fprintf.arg.1$46$ := PLUS(result.__iob_func$45, 32, 1) ;
assume value_is(__ctobpl_const_395, $fprintf.arg.1$46$);
assume value_is(__ctobpl_const_396, result.__iob_func$45);
goto label_151;


// .\v4\print_tokens.c(520)
label_151:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 520} true;
call result.fprintf$43 := det_choice(); // havoc result.fprintf$43;
// skip fprintf
goto label_154;


// .\v4\print_tokens.c(521)
label_154:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 521} true;
call result.__iob_func$48 := __iob_func ();
goto label_157;


// .\v4\print_tokens.c(521)
label_157:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 521} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$48 != 0);
$fprintf.arg.1$49$ := PLUS(result.__iob_func$48, 32, 1) ;
assume value_is(__ctobpl_const_397, $fprintf.arg.1$49$);
assume value_is(__ctobpl_const_398, result.__iob_func$48);
goto label_158;


// .\v4\print_tokens.c(521)
label_158:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 521} true;
call result.fprintf$47 := det_choice(); // havoc result.fprintf$47;
// skip fprintf
goto label_161;


// .\v4\print_tokens.c(521)
label_161:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 521} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(522)
label_32:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 522} true;
call result.__iob_func$51 := __iob_func ();
goto label_137;


// .\v4\print_tokens.c(522)
label_137:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 522} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$51 != 0);
$fprintf.arg.1$52$ := PLUS(result.__iob_func$51, 32, 1) ;
assume value_is(__ctobpl_const_399, $fprintf.arg.1$52$);
assume value_is(__ctobpl_const_400, result.__iob_func$51);
goto label_138;


// .\v4\print_tokens.c(522)
label_138:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 522} true;
call result.fprintf$50 := det_choice(); // havoc result.fprintf$50;
// skip fprintf
goto label_141;


// .\v4\print_tokens.c(522)
label_141:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 522} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(523)
label_35:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 523} true;
call result.__iob_func$54 := __iob_func ();
goto label_132;


// .\v4\print_tokens.c(523)
label_132:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 523} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$54 != 0);
$fprintf.arg.1$55$ := PLUS(result.__iob_func$54, 32, 1) ;
assume value_is(__ctobpl_const_401, $fprintf.arg.1$55$);
assume value_is(__ctobpl_const_402, result.__iob_func$54);
goto label_133;


// .\v4\print_tokens.c(523)
label_133:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 523} true;
call result.fprintf$53 := det_choice(); // havoc result.fprintf$53;
// skip fprintf
goto label_136;


// .\v4\print_tokens.c(523)
label_136:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 523} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(524)
label_38:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 524} true;
call result.__iob_func$57 := __iob_func ();
goto label_127;


// .\v4\print_tokens.c(524)
label_127:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 524} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$57 != 0);
$fprintf.arg.1$58$ := PLUS(result.__iob_func$57, 32, 1) ;
assume value_is(__ctobpl_const_403, $fprintf.arg.1$58$);
assume value_is(__ctobpl_const_404, result.__iob_func$57);
goto label_128;


// .\v4\print_tokens.c(524)
label_128:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 524} true;
call result.fprintf$56 := det_choice(); // havoc result.fprintf$56;
// skip fprintf
goto label_131;


// .\v4\print_tokens.c(524)
label_131:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 524} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(525)
label_41:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 525} true;
call result.__iob_func$60 := __iob_func ();
goto label_122;


// .\v4\print_tokens.c(525)
label_122:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 525} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$60 != 0);
$fprintf.arg.1$61$ := PLUS(result.__iob_func$60, 32, 1) ;
assume value_is(__ctobpl_const_405, $fprintf.arg.1$61$);
assume value_is(__ctobpl_const_406, result.__iob_func$60);
goto label_123;


// .\v4\print_tokens.c(525)
label_123:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 525} true;
call result.fprintf$59 := det_choice(); // havoc result.fprintf$59;
// skip fprintf
goto label_126;


// .\v4\print_tokens.c(525)
label_126:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 525} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(526)
label_44:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 526} true;
call result.__iob_func$63 := __iob_func ();
goto label_117;


// .\v4\print_tokens.c(526)
label_117:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 526} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$63 != 0);
$fprintf.arg.1$64$ := PLUS(result.__iob_func$63, 32, 1) ;
assume value_is(__ctobpl_const_407, $fprintf.arg.1$64$);
assume value_is(__ctobpl_const_408, result.__iob_func$63);
goto label_118;


// .\v4\print_tokens.c(526)
label_118:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 526} true;
call result.fprintf$62 := det_choice(); // havoc result.fprintf$62;
// skip fprintf
goto label_121;


// .\v4\print_tokens.c(526)
label_121:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 526} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(527)
label_47:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 527} true;
call result.__iob_func$66 := __iob_func ();
goto label_112;


// .\v4\print_tokens.c(527)
label_112:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 527} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$66 != 0);
$fprintf.arg.1$67$ := PLUS(result.__iob_func$66, 32, 1) ;
assume value_is(__ctobpl_const_409, $fprintf.arg.1$67$);
assume value_is(__ctobpl_const_410, result.__iob_func$66);
goto label_113;


// .\v4\print_tokens.c(527)
label_113:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 527} true;
call result.fprintf$65 := det_choice(); // havoc result.fprintf$65;
// skip fprintf
goto label_116;


// .\v4\print_tokens.c(527)
label_116:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 527} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(528)
label_50:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 528} true;
call result.__iob_func$69 := __iob_func ();
goto label_107;


// .\v4\print_tokens.c(528)
label_107:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 528} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$69 != 0);
$fprintf.arg.1$70$ := PLUS(result.__iob_func$69, 32, 1) ;
assume value_is(__ctobpl_const_411, $fprintf.arg.1$70$);
assume value_is(__ctobpl_const_412, result.__iob_func$69);
goto label_108;


// .\v4\print_tokens.c(528)
label_108:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 528} true;
call result.fprintf$68 := det_choice(); // havoc result.fprintf$68;
// skip fprintf
goto label_111;


// .\v4\print_tokens.c(528)
label_111:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 528} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(529)
label_53:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
call result.__iob_func$72 := __iob_func ();
goto label_87;


// .\v4\print_tokens.c(529)
label_87:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$72 != 0);
$fprintf.arg.1$73$ := PLUS(result.__iob_func$72, 32, 1) ;
assume value_is(__ctobpl_const_413, $fprintf.arg.1$73$);
assume value_is(__ctobpl_const_414, result.__iob_func$72);
goto label_88;


// .\v4\print_tokens.c(529)
label_88:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
call result.fprintf$71 := det_choice(); // havoc result.fprintf$71;
// skip fprintf
goto label_91;


// .\v4\print_tokens.c(529)
label_91:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_415, token_ptr);
goto label_92;


// .\v4\print_tokens.c(529)
label_92:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
call result.__iob_func$76 := __iob_func ();
goto label_95;


// .\v4\print_tokens.c(529)
label_95:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$76 != 0);
$fprintf.arg.1$77$ := PLUS(result.__iob_func$76, 32, 1) ;
assume value_is(__ctobpl_const_416, $fprintf.arg.1$77$);
assume value_is(__ctobpl_const_417, result.__iob_func$76);
goto label_96;


// .\v4\print_tokens.c(529)
label_96:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 529} true;
call result.fprintf$74 := det_choice(); // havoc result.fprintf$74;
// skip fprintf
goto label_99;


// .\v4\print_tokens.c(530)
label_99:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 530} true;
call result.__iob_func$79 := __iob_func ();
goto label_102;


// .\v4\print_tokens.c(530)
label_102:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 530} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$79 != 0);
$fprintf.arg.1$80$ := PLUS(result.__iob_func$79, 32, 1) ;
assume value_is(__ctobpl_const_418, $fprintf.arg.1$80$);
assume value_is(__ctobpl_const_419, result.__iob_func$79);
goto label_103;


// .\v4\print_tokens.c(530)
label_103:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 530} true;
call result.fprintf$78 := det_choice(); // havoc result.fprintf$78;
// skip fprintf
goto label_106;


// .\v4\print_tokens.c(530)
label_106:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 530} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(531)
label_56:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
call result.__iob_func$82 := __iob_func ();
goto label_67;


// .\v4\print_tokens.c(531)
label_67:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$82 != 0);
$fprintf.arg.1$83$ := PLUS(result.__iob_func$82, 32, 1) ;
assume value_is(__ctobpl_const_420, $fprintf.arg.1$83$);
assume value_is(__ctobpl_const_421, result.__iob_func$82);
goto label_68;


// .\v4\print_tokens.c(531)
label_68:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
call result.fprintf$81 := det_choice(); // havoc result.fprintf$81;
// skip fprintf
goto label_71;


// .\v4\print_tokens.c(531)
label_71:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
//TAG: Dereferenced object is non-null
assert(token_ptr != 0);
// skipped OP_UNARY assignment to array
assume value_is(__ctobpl_const_422, token_ptr);
goto label_72;


// .\v4\print_tokens.c(531)
label_72:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
call result.__iob_func$86 := __iob_func ();
goto label_75;


// .\v4\print_tokens.c(531)
label_75:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$86 != 0);
$fprintf.arg.1$87$ := PLUS(result.__iob_func$86, 32, 1) ;
assume value_is(__ctobpl_const_423, $fprintf.arg.1$87$);
assume value_is(__ctobpl_const_424, result.__iob_func$86);
goto label_76;


// .\v4\print_tokens.c(531)
label_76:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 531} true;
call result.fprintf$84 := det_choice(); // havoc result.fprintf$84;
// skip fprintf
goto label_79;


// .\v4\print_tokens.c(532)
label_79:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 532} true;
call result.__iob_func$89 := __iob_func ();
goto label_82;


// .\v4\print_tokens.c(532)
label_82:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 532} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$89 != 0);
$fprintf.arg.1$90$ := PLUS(result.__iob_func$89, 32, 1) ;
assume value_is(__ctobpl_const_425, $fprintf.arg.1$90$);
assume value_is(__ctobpl_const_426, result.__iob_func$89);
goto label_83;


// .\v4\print_tokens.c(532)
label_83:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 532} true;
call result.fprintf$88 := det_choice(); // havoc result.fprintf$88;
// skip fprintf
goto label_86;


// .\v4\print_tokens.c(532)
label_86:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 532} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(533)
label_59:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 533} true;
call result.__iob_func$92 := __iob_func ();
goto label_62;


// .\v4\print_tokens.c(533)
label_62:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 533} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$92 != 0);
$fprintf.arg.1$93$ := PLUS(result.__iob_func$92, 32, 1) ;
assume value_is(__ctobpl_const_427, $fprintf.arg.1$93$);
assume value_is(__ctobpl_const_428, result.__iob_func$92);
goto label_63;


// .\v4\print_tokens.c(533)
label_63:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 533} true;
call result.fprintf$91 := det_choice(); // havoc result.fprintf$91;
// skip fprintf
goto label_66;


// .\v4\print_tokens.c(533)
label_66:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 533} true;
result.print_token$1 := 1 ;
goto label_1;


// .\v4\print_tokens.c(537)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 537} true;
return;


// .\v4\print_tokens.c(537)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 537} true;
assume false;
return;

}



procedure {:extern}  skip(stream_ptr.__1:int) returns (result.skip$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} c : int;
var {:extern} result.get_char$2 : int;
var {:extern} result.is_end_of_character_stream$3 : int;
var {:extern} result.unget_char$4 : int;
var {:extern} stream_ptr : int;
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

assume INT_LT(stream_ptr.__1, alloc);
c:= 0;//Init locals 
result.get_char$2:= 0;//Init locals 
result.is_end_of_character_stream$3:= 0;//Init locals 
result.skip$1 := 0;//initialize returns 
result.unget_char$4:= 0;//Init locals 
stream_ptr:= 0;//Init locals 
stream_ptr := stream_ptr.__1;
goto label_3;


// .\v4\print_tokens.c(415)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 415} true;
goto label_4;


// .\v4\print_tokens.c(417)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 417} true;
// loop entry initialization...
goto label_4_head;


label_4_head:
// loop head assertions...

// end loop head assertions

call result.get_char$2 := get_char (stream_ptr);
assume value_is(__ctobpl_const_429, stream_ptr);
assume value_is(__ctobpl_const_430, stream_ptr);
goto label_7;


// .\v4\print_tokens.c(417)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 417} true;
c := result.get_char$2 ;
assume value_is(__ctobpl_const_431, c);
assume value_is(__ctobpl_const_432, result.get_char$2);
goto label_8;


// .\v4\print_tokens.c(417)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 417} true;
goto label_8_true , label_8_false ;


label_8_true :
assume (INT_NEQ(c, 10));
assume value_is(__ctobpl_const_433, c);
goto label_10;


label_8_false :
assume !(INT_NEQ(c, 10));
assume value_is(__ctobpl_const_433, c);
goto label_9;


// .\v4\print_tokens.c(418)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 418} true;
call result.is_end_of_character_stream$3 := is_end_of_character_stream (stream_ptr);
assume value_is(__ctobpl_const_434, stream_ptr);
assume value_is(__ctobpl_const_435, stream_ptr);
goto label_13;


// .\v4\print_tokens.c(418)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 418} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (result.is_end_of_character_stream$3 != 0);
assume value_is(__ctobpl_const_436, result.is_end_of_character_stream$3);
goto label_9;


label_13_false :
assume (result.is_end_of_character_stream$3 == 0);
assume value_is(__ctobpl_const_436, result.is_end_of_character_stream$3);
goto label_4_head;


// .\v4\print_tokens.c(420)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 420} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (INT_EQ(c, -1));
assume value_is(__ctobpl_const_437, c);
goto label_15;


label_9_false :
assume !(INT_EQ(c, -1));
assume value_is(__ctobpl_const_437, c);
goto label_14;


// .\v4\print_tokens.c(420)
label_15:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 420} true;
call result.unget_char$4 := unget_char (c, stream_ptr);
assume value_is(__ctobpl_const_438, c);
assume value_is(__ctobpl_const_439, stream_ptr);
assume value_is(__ctobpl_const_440, c);
assume value_is(__ctobpl_const_441, stream_ptr);
goto label_14;


// .\v4\print_tokens.c(421)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 421} true;
goto label_1;


// .\v4\print_tokens.c(422)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 422} true;
return;


// .\v4\print_tokens.c(422)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 422} true;
assume false;
return;

}



procedure {:extern}  special(state.__1:int) returns (result.special$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fprintf.arg.1$4$_123_$static$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.exit$5 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} state : int;
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

$fprintf.arg.1$4$_123_$static$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.exit$5:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.special$1 := 0;//initialize returns 
state:= 0;//Init locals 
state := state.__1;
goto label_3;


// .\v4\print_tokens.c(386)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 386} true;

goto label_3_case_0, label_3_case_1, label_3_case_2, label_3_case_3, label_3_case_4, label_3_case_5, label_3_case_6, label_3_case_7, label_3_case_8;




label_3_case_0 :
assume(INT_NEQ(state, 19));
assume(INT_NEQ(state, 20));
assume(INT_NEQ(state, 21));
assume(INT_NEQ(state, 22));
assume(INT_NEQ(state, 23));
assume(INT_NEQ(state, 24));
assume(INT_NEQ(state, 25));
assume(INT_NEQ(state, 32));
assume value_is(__ctobpl_const_442, state);
goto label_4;



label_3_case_1 :
assume(INT_EQ(state, 19));
assume value_is(__ctobpl_const_442, state);
goto label_7;



label_3_case_2 :
assume(INT_EQ(state, 20));
assume value_is(__ctobpl_const_442, state);
goto label_8;



label_3_case_3 :
assume(INT_EQ(state, 21));
assume value_is(__ctobpl_const_442, state);
goto label_9;



label_3_case_4 :
assume(INT_EQ(state, 22));
assume value_is(__ctobpl_const_442, state);
goto label_10;



label_3_case_5 :
assume(INT_EQ(state, 23));
assume value_is(__ctobpl_const_442, state);
goto label_11;



label_3_case_6 :
assume(INT_EQ(state, 24));
assume value_is(__ctobpl_const_442, state);
goto label_12;



label_3_case_7 :
assume(INT_EQ(state, 25));
assume value_is(__ctobpl_const_442, state);
goto label_13;



label_3_case_8 :
assume(INT_EQ(state, 32));
assume value_is(__ctobpl_const_442, state);
goto label_14;


// .\v4\print_tokens.c(396)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 396} true;
call result.__iob_func$3 := __iob_func ();
goto label_15;


// .\v4\print_tokens.c(396)
label_15:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 396} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$_123_$static$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_443, $fprintf.arg.1$4$_123_$static$);
assume value_is(__ctobpl_const_444, result.__iob_func$3);
goto label_16;


// .\v4\print_tokens.c(396)
label_16:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 396} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_19;


// .\v4\print_tokens.c(396)
label_19:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 396} true;
goto label_20;


// .\v4\print_tokens.c(398)
label_20:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 398} true;
call result.exit$5 := det_choice(); // havoc result.exit$5;
// skip exit
return;


// .\v4\print_tokens.c(399)
label_2:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 399} true;
assume false;
return;


// .\v4\print_tokens.c(388)
label_7:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 388} true;
result.special$1 := 19 ;
goto label_1;


// .\v4\print_tokens.c(389)
label_8:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 389} true;
result.special$1 := 20 ;
goto label_1;


// .\v4\print_tokens.c(390)
label_9:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 390} true;
result.special$1 := 21 ;
goto label_1;


// .\v4\print_tokens.c(391)
label_10:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 391} true;
result.special$1 := 22 ;
goto label_1;


// .\v4\print_tokens.c(392)
label_11:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 392} true;
result.special$1 := 23 ;
goto label_1;


// .\v4\print_tokens.c(393)
label_12:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 393} true;
result.special$1 := 24 ;
goto label_1;


// .\v4\print_tokens.c(394)
label_13:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 394} true;
result.special$1 := 25 ;
goto label_1;


// .\v4\print_tokens.c(395)
label_14:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 395} true;
result.special$1 := 32 ;
goto label_1;


// .\v4\print_tokens.c(399)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 399} true;
return;

}



procedure {:extern}  unget_char(ch.__1:int, stream_ptr.__1:int) returns (result.unget_char$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} stream_ptr : int;
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

assume INT_LT(stream_ptr.__1, alloc);
ch:= 0;//Init locals 
result.unget_char$1 := 0;//initialize returns 
stream_ptr:= 0;//Init locals 
ch := ch.__1;
stream_ptr := stream_ptr.__1;
goto label_3;


// .\v4\print_tokens.c(137)
label_3:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 137} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)] != 0);
assume value_is(__ctobpl_const_445, stream_ptr);
assume value_is(__ctobpl_const_446, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
goto label_5;


label_3_false :
assume (Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)] == 0);
assume value_is(__ctobpl_const_445, stream_ptr);
assume value_is(__ctobpl_const_446, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
goto label_4;


// .\v4\print_tokens.c(138)
label_4:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 138} true;
goto label_1;


// .\v4\print_tokens.c(140)
label_5:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 140} true;
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
//TAG: Dereferenced object is non-null
assert(stream_ptr != 0);
tempBoogie0 := MINUS_BOTH_PTR_OR_BOTH_INT( Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)], 1, 1) ;
Mem_T.stream_ind_stream_type := Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr) := tempBoogie0];
//TAG: Dereferenced object is non-null
assert(stream_stream_type(stream_ptr) != 0);
Mem_T.stream_stream_type := Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]) := ch];
assume value_is(__ctobpl_const_447, stream_ptr);
assume value_is(__ctobpl_const_448, stream_ptr);
assume value_is(__ctobpl_const_449, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)]);
assume value_is(__ctobpl_const_450, Mem_T.stream_stream_type[PLUS(stream_stream_type(stream_ptr), 1, Mem_T.stream_ind_stream_type[stream_ind_stream_type(stream_ptr)])]);
assume value_is(__ctobpl_const_451, ch);
goto label_6;


// .\v4\print_tokens.c(141)
label_6:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 141} true;
goto label_1;


// .\v4\print_tokens.c(142)
label_1:
assert {:sourcefile ".\v4\print_tokens.c"} {:sourceline 142} true;
return;

}

