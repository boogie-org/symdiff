type i1 = int;

type i8 = int;

type i16 = int;

type i32 = int;

type i64 = int;

type i96 = int;

type i128 = int;

type ref = i64;

const $0: i32;

axiom $0 == 0;

const $0.ref: ref;

const $1.ref: ref;

const $2.ref: ref;

const $3.ref: ref;

const $4.ref: ref;

const $5.ref: ref;

const $6.ref: ref;

const $7.ref: ref;

const $8.ref: ref;

const $9.ref: ref;

const $10.ref: ref;

const $11.ref: ref;

const $12.ref: ref;

const $13.ref: ref;

const $14.ref: ref;

axiom $0.ref == 0;

axiom $1.ref == 1;

axiom $2.ref == 2;

axiom $3.ref == 3;

axiom $4.ref == 4;

axiom $5.ref == 5;

axiom $6.ref == 6;

axiom $7.ref == 7;

var $M.0: [ref]i8;

axiom $GLOBALS_BOTTOM == $sub.ref(0, 184);

axiom $EXTERNS_BOTTOM == $sub.ref(0, 32768);

axiom $MALLOC_TOP == 2136997887;

function {:builtin "bv2int"} $bv2int.64(i: bv64) : i64;

function {:builtin "(_ int2bv 64)"} $int2bv.64(i: i64) : bv64;

function {:inline} $p2i.ref.i8(p: ref) : i8
{
  $trunc.i64.i8(p)
}

function {:inline} $i2p.i8.ref(i: i8) : ref
{
  $zext.i8.i64(i)
}

function {:inline} $p2i.ref.i16(p: ref) : i16
{
  $trunc.i64.i16(p)
}

function {:inline} $i2p.i16.ref(i: i16) : ref
{
  $zext.i16.i64(i)
}

function {:inline} $p2i.ref.i32(p: ref) : i32
{
  $trunc.i64.i32(p)
}

function {:inline} $i2p.i32.ref(i: i32) : ref
{
  $zext.i32.i64(i)
}

function {:inline} $p2i.ref.i64(p: ref) : i64
{
  p
}

function {:inline} $i2p.i64.ref(i: i64) : ref
{
  i
}

function {:inline} $eq.ref(p1: ref, p2: ref) : i1
{
  (if $eq.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $eq.ref.bool(p1: ref, p2: ref) : bool
{
  $eq.i64.bool(p1, p2)
}

function {:inline} $ne.ref(p1: ref, p2: ref) : i1
{
  (if $ne.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $ne.ref.bool(p1: ref, p2: ref) : bool
{
  $ne.i64.bool(p1, p2)
}

function {:inline} $sge.ref(p1: ref, p2: ref) : i1
{
  (if $sge.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $sge.ref.bool(p1: ref, p2: ref) : bool
{
  $sge.i64.bool(p1, p2)
}

function {:inline} $sgt.ref(p1: ref, p2: ref) : i1
{
  (if $sgt.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $sgt.ref.bool(p1: ref, p2: ref) : bool
{
  $sgt.i64.bool(p1, p2)
}

function {:inline} $sle.ref(p1: ref, p2: ref) : i1
{
  (if $sle.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $sle.ref.bool(p1: ref, p2: ref) : bool
{
  $sle.i64.bool(p1, p2)
}

function {:inline} $slt.ref(p1: ref, p2: ref) : i1
{
  (if $slt.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $slt.ref.bool(p1: ref, p2: ref) : bool
{
  $slt.i64.bool(p1, p2)
}

function {:inline} $add.ref(p1: ref, p2: ref) : ref
{
  $add.i64(p1, p2)
}

function {:inline} $sub.ref(p1: ref, p2: ref) : ref
{
  $sub.i64(p1, p2)
}

function {:inline} $mul.ref(p1: ref, p2: ref) : ref
{
  $mul.i64(p1, p2)
}

const __SMACK_code: ref;

const __SMACK_decls: ref;

const __SMACK_dummy: ref;

const __SMACK_top_decl: ref;

const __VERIFIER_assert: ref;

const __VERIFIER_assume: ref;

const __VERIFIER_error: ref;

const __VERIFIER_nondet: ref;

const __VERIFIER_nondet_pointer: ref;

const __VERIFIER_nondet_uchar: ref;

const __VERIFIER_nondet_uint: ref;

const __VERIFIER_nondet_ulong: ref;

const __VERIFIER_nondet_unsigned_char: ref;

const __VERIFIER_nondet_unsigned_int: ref;

const __VERIFIER_nondet_unsigned_long: ref;

const __VERIFIER_nondet_unsigned_short: ref;

const __VERIFIER_nondet_ushort: ref;

const bar: ref;

const exit: ref;

const foo: ref;

const llvm.dbg.declare: ref;

const llvm.dbg.value: ref;

const main: ref;

procedure $init_funcs();



implementation $init_funcs()
{

  anon0:
    return;
}



procedure $static_init();
  modifies $CurrAddr;



implementation $static_init()
{

  anon0:
    $CurrAddr := 1024;
    return;
}



procedure __SMACK_code.ref($p0: ref);



procedure __SMACK_code.ref.i32($p0: ref, $i1: i32);



procedure __SMACK_dummy(v: i32);
  modifies $exn;



implementation __SMACK_dummy(v: i32)
{

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 78} true;
    assume true;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 79} true;
    $exn := false;
    return;
}



procedure __SMACK_top_decl.ref($p0: ref);



procedure {:inline 1} __VERIFIER_assert(x: i32);
  modifies $exn;



implementation __VERIFIER_assert(x: i32)
{

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 78} true;
    assume true;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 36} true;
    assert x != $0;
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 37} true;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_assume(x: i32);
  modifies $exn;



implementation __VERIFIER_assume(x: i32)
{

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 78} true;
    assume true;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 31} true;
    assume x != $0;
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 32} true;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_error();
  modifies $exn;



implementation __VERIFIER_error()
{

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 41} true;
    assert false;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 42} true;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_nondet() returns (r: ref);



procedure {:inline 1} __VERIFIER_nondet_pointer() returns ($r: ref);
  modifies $exn;



implementation __VERIFIER_nondet_pointer() returns ($r: ref)
{
  var $p0: ref;

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 74} true;
    call $p0 := __VERIFIER_nondet();
    assume $isExternal($p0);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 74} true;
    $r := $p0;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_nondet_uchar() returns ($r: i8);
  modifies $exn;



implementation __VERIFIER_nondet_uchar() returns ($r: i8)
{
  var $i0: i8;
  var $i1: i32;
  var $i2: i1;
  var $i3: i32;

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 50} true;
    call $i0 := __VERIFIER_nondet_unsigned_char();
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 51} true;
    $i1 := $zext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 51} true;
    $i2 := $sge.i32($i1, 0);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 51} true;
    $i3 := $zext.i1.i32($i2);
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 51} true;
    call __VERIFIER_assume($i3);
    goto $bb0_splitSourceLine_5;

  $bb0_splitSourceLine_5:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 52} true;
    $r := $i0;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_nondet_uint() returns ($r: i32);
  modifies $exn;



implementation __VERIFIER_nondet_uint() returns ($r: i32)
{
  var $i0: i32;
  var $i1: i1;
  var $i2: i32;

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 62} true;
    call $i0 := __VERIFIER_nondet_unsigned_int();
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 63} true;
    $i1 := $uge.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 63} true;
    $i2 := $zext.i1.i32($i1);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 63} true;
    call __VERIFIER_assume($i2);
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 64} true;
    $r := $i0;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_nondet_ulong() returns ($r: i64);
  modifies $exn;



implementation __VERIFIER_nondet_ulong() returns ($r: i64)
{
  var $i0: i64;
  var $i1: i1;
  var $i2: i32;

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 68} true;
    call $i0 := __VERIFIER_nondet_unsigned_long();
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 69} true;
    $i1 := $uge.i64($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 69} true;
    $i2 := $zext.i1.i32($i1);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 69} true;
    call __VERIFIER_assume($i2);
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 70} true;
    $r := $i0;
    $exn := false;
    return;
}



procedure {:inline 1} __VERIFIER_nondet_unsigned_char() returns (r: i8);



procedure {:inline 1} __VERIFIER_nondet_unsigned_int() returns (r: i32);



procedure {:inline 1} __VERIFIER_nondet_unsigned_long() returns (r: i64);



procedure {:inline 1} __VERIFIER_nondet_unsigned_short() returns (r: i16);



procedure {:inline 1} __VERIFIER_nondet_ushort() returns ($r: i16);
  modifies $exn;



implementation __VERIFIER_nondet_ushort() returns ($r: i16)
{
  var $i0: i16;
  var $i1: i32;
  var $i2: i1;
  var $i3: i32;

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 56} true;
    call $i0 := __VERIFIER_nondet_unsigned_short();
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 57} true;
    $i1 := $zext.i16.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 57} true;
    $i2 := $sge.i32($i1, 0);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 57} true;
    $i3 := $zext.i1.i32($i2);
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 57} true;
    call __VERIFIER_assume($i3);
    goto $bb0_splitSourceLine_5;

  $bb0_splitSourceLine_5:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 58} true;
    $r := $i0;
    $exn := false;
    return;
}



procedure bar() returns ($r: i32);
  modifies $exn;



implementation bar() returns ($r: i32)
{
  var $i0: i32;

  $bb0:
    assert {:sourcefile "v1\change.c"} {:sourceline 9} true;
    call $i0 := foo(25, 32);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\change.c"} {:sourceline 10} true;
    $r := 1;
    $exn := false;
    return;
}



procedure exit(x: i32);
  modifies $exn;



implementation exit(x: i32)
{

  $bb0:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 45} true;
    assume false;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\/smack.c"} {:sourceline 46} true;
    $exn := false;
    return;
}



procedure foo(p: i32, q: i32) returns ($r: i32);
  modifies $exn;



implementation foo(p: i32, q: i32) returns ($r: i32)
{
  var $i0: i32;
  var $i1: i32;

  $bb0:
    assert {:sourcefile "v1\change.c"} {:sourceline 3} true;
    $i0 := $add.i32(q, 1);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "v1\change.c"} {:sourceline 4} true;
    call $i1 := foo($i0, $i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "v1\change.c"} {:sourceline 5} true;
    $r := p;
    $exn := false;
    return;
}



procedure llvm.dbg.value($p0: ref, $i1: i64, $p2: ref);



procedure {:entrypoint} main(argc: i32, argv: ref) returns ($r: i32);
  modifies $CurrAddr, $exn;



implementation main(argc: i32, argv: ref) returns ($r: i32)
{

  $bb0:
    call $static_init();
    call $init_funcs();
    assert {:sourcefile "v1\change.c"} {:sourceline 15} true;
    $r := 0;
    $exn := false;
    return;
}



axiom foo == $sub.ref(0, 8);

axiom llvm.dbg.declare == $sub.ref(0, 16);

axiom bar == $sub.ref(0, 24);

axiom main == $sub.ref(0, 32);

axiom __VERIFIER_assume == $sub.ref(0, 40);

axiom __SMACK_dummy == $sub.ref(0, 48);

axiom __SMACK_code == $sub.ref(0, 56);

axiom __VERIFIER_assert == $sub.ref(0, 64);

axiom __VERIFIER_error == $sub.ref(0, 72);

axiom exit == $sub.ref(0, 80);

axiom __VERIFIER_nondet_uchar == $sub.ref(0, 88);

axiom __VERIFIER_nondet_unsigned_char == $sub.ref(0, 96);

axiom __VERIFIER_nondet_ushort == $sub.ref(0, 104);

axiom __VERIFIER_nondet_unsigned_short == $sub.ref(0, 112);

axiom __VERIFIER_nondet_uint == $sub.ref(0, 120);

axiom __VERIFIER_nondet_unsigned_int == $sub.ref(0, 128);

axiom __VERIFIER_nondet_ulong == $sub.ref(0, 136);

axiom __VERIFIER_nondet_unsigned_long == $sub.ref(0, 144);

axiom __VERIFIER_nondet_pointer == $sub.ref(0, 152);

axiom __VERIFIER_nondet == $sub.ref(0, 160);

axiom __SMACK_decls == $sub.ref(0, 168);

axiom __SMACK_top_decl == $sub.ref(0, 176);

axiom llvm.dbg.value == $sub.ref(0, 184);

axiom $and.i1(0, 0) == 0;

axiom $and.i1(0, 1) == 0;

axiom $and.i1(1, 0) == 0;

axiom $and.i1(1, 1) == 1;

axiom $or.i1(0, 0) == 0;

axiom $or.i1(0, 1) == 1;

axiom $or.i1(1, 0) == 1;

axiom $or.i1(1, 1) == 1;

axiom $xor.i1(0, 0) == 0;

axiom $xor.i1(0, 1) == 1;

axiom $xor.i1(1, 0) == 1;

axiom $xor.i1(1, 1) == 0;

axiom (forall f1: float, f2: float :: f1 != f2 || $foeq.bool(f1, f2));

axiom (forall f: float :: $si2fp.i128.float($fp2si.float.i128(f)) == f);

axiom (forall f: float :: $si2fp.i16.float($fp2si.float.i16(f)) == f);

axiom (forall f: float :: $si2fp.i32.float($fp2si.float.i32(f)) == f);

axiom (forall f: float :: $si2fp.i64.float($fp2si.float.i64(f)) == f);

axiom (forall f: float :: $si2fp.i8.float($fp2si.float.i8(f)) == f);

axiom (forall f: float :: $si2fp.i96.float($fp2si.float.i96(f)) == f);

axiom (forall f: float :: $ui2fp.i128.float($fp2ui.float.i128(f)) == f);

axiom (forall f: float :: $ui2fp.i16.float($fp2ui.float.i16(f)) == f);

axiom (forall f: float :: $ui2fp.i32.float($fp2ui.float.i32(f)) == f);

axiom (forall f: float :: $ui2fp.i64.float($fp2ui.float.i64(f)) == f);

axiom (forall f: float :: $ui2fp.i8.float($fp2ui.float.i8(f)) == f);

axiom (forall f: float :: $ui2fp.i96.float($fp2ui.float.i96(f)) == f);

axiom (forall i: i128 :: $fp2si.float.i128($si2fp.i128.float(i)) == i);

axiom (forall i: i128 :: $fp2ui.float.i128($ui2fp.i128.float(i)) == i);

axiom (forall i: i16 :: $fp2si.float.i16($si2fp.i16.float(i)) == i);

axiom (forall i: i16 :: $fp2ui.float.i16($ui2fp.i16.float(i)) == i);

axiom (forall i: i32 :: $fp2si.float.i32($si2fp.i32.float(i)) == i);

axiom (forall i: i32 :: $fp2ui.float.i32($ui2fp.i32.float(i)) == i);

axiom (forall i: i64 :: $fp2si.float.i64($si2fp.i64.float(i)) == i);

axiom (forall i: i64 :: $fp2ui.float.i64($ui2fp.i64.float(i)) == i);

axiom (forall i: i8 :: $fp2si.float.i8($si2fp.i8.float(i)) == i);

axiom (forall i: i8 :: $fp2ui.float.i8($ui2fp.i8.float(i)) == i);

axiom (forall i: i96 :: $fp2si.float.i96($si2fp.i96.float(i)) == i);

axiom (forall i: i96 :: $fp2ui.float.i96($ui2fp.i96.float(i)) == i);

const $EXTERNS_BOTTOM: ref;

const $GLOBALS_BOTTOM: ref;

const $MALLOC_TOP: ref;

const $MOP: $mop;

function $and.i1(i1: i1, i2: i1) : i1;

function $and.i128(i1: i128, i2: i128) : i128;

function $and.i16(i1: i16, i2: i16) : i16;

function $and.i32(i1: i32, i2: i32) : i32;

function $and.i64(i1: i64, i2: i64) : i64;

function $and.i8(i1: i8, i2: i8) : i8;

function $and.i96(i1: i96, i2: i96) : i96;

function $ashr.i1(i1: i1, i2: i1) : i1;

function $ashr.i128(i1: i128, i2: i128) : i128;

function $ashr.i16(i1: i16, i2: i16) : i16;

function $ashr.i32(i1: i32, i2: i32) : i32;

function $ashr.i64(i1: i64, i2: i64) : i64;

function $ashr.i8(i1: i8, i2: i8) : i8;

function $ashr.i96(i1: i96, i2: i96) : i96;

function $base(ref) : ref;

function $extractvalue(p: int, i: int) : int;

function $fadd.float(f1: float, f2: float) : float;

function $fdiv.float(f1: float, f2: float) : float;

function $ffalse.float(f1: float, f2: float) : i1;

function $fmul.float(f1: float, f2: float) : float;

function $foeq.bool(f1: float, f2: float) : bool;

function $foge.float(f1: float, f2: float) : i1;

function $fogt.float(f1: float, f2: float) : i1;

function $fole.float(f1: float, f2: float) : i1;

function $folt.float(f1: float, f2: float) : i1;

function $fone.float(f1: float, f2: float) : i1;

function $ford.float(f1: float, f2: float) : i1;

function $fp(ipart: int, fpart: int, epart: int) : float;

function $fp2si.float.bv128(f: float) : bv128;

function $fp2si.float.bv16(f: float) : bv16;

function $fp2si.float.bv32(f: float) : bv32;

function $fp2si.float.bv64(f: float) : bv64;

function $fp2si.float.bv8(f: float) : bv8;

function $fp2si.float.bv96(f: float) : bv96;

function $fp2si.float.i128(f: float) : i128;

function $fp2si.float.i16(f: float) : i16;

function $fp2si.float.i32(f: float) : i32;

function $fp2si.float.i64(f: float) : i64;

function $fp2si.float.i8(f: float) : i8;

function $fp2si.float.i96(f: float) : i96;

function $fp2ui.float.bv128(f: float) : bv128;

function $fp2ui.float.bv16(f: float) : bv16;

function $fp2ui.float.bv32(f: float) : bv32;

function $fp2ui.float.bv64(f: float) : bv64;

function $fp2ui.float.bv8(f: float) : bv8;

function $fp2ui.float.bv96(f: float) : bv96;

function $fp2ui.float.i128(f: float) : i128;

function $fp2ui.float.i16(f: float) : i16;

function $fp2ui.float.i32(f: float) : i32;

function $fp2ui.float.i64(f: float) : i64;

function $fp2ui.float.i8(f: float) : i8;

function $fp2ui.float.i96(f: float) : i96;

function $fpext.float.float(f: float) : float;

function $fptrunc.float.float(f: float) : float;

function $frem.float(f1: float, f2: float) : float;

function $fsub.float(f1: float, f2: float) : float;

function $ftrue.float(f1: float, f2: float) : i1;

function $fueq.float(f1: float, f2: float) : i1;

function $fuge.float(f1: float, f2: float) : i1;

function $fugt.float(f1: float, f2: float) : i1;

function $fule.float(f1: float, f2: float) : i1;

function $fult.float(f1: float, f2: float) : i1;

function $fune.float(f1: float, f2: float) : i1;

function $funo.float(f1: float, f2: float) : i1;

function $lshr.i1(i1: i1, i2: i1) : i1;

function $lshr.i128(i1: i128, i2: i128) : i128;

function $lshr.i16(i1: i16, i2: i16) : i16;

function $lshr.i32(i1: i32, i2: i32) : i32;

function $lshr.i64(i1: i64, i2: i64) : i64;

function $lshr.i8(i1: i8, i2: i8) : i8;

function $lshr.i96(i1: i96, i2: i96) : i96;

function $nand.i1(i1: i1, i2: i1) : i1;

function $nand.i128(i1: i128, i2: i128) : i128;

function $nand.i16(i1: i16, i2: i16) : i16;

function $nand.i32(i1: i32, i2: i32) : i32;

function $nand.i64(i1: i64, i2: i64) : i64;

function $nand.i8(i1: i8, i2: i8) : i8;

function $nand.i96(i1: i96, i2: i96) : i96;

function $not.i1(i: i1) : i1;

function $not.i128(i: i128) : i128;

function $not.i16(i: i16) : i16;

function $not.i32(i: i32) : i32;

function $not.i64(i: i64) : i64;

function $not.i8(i: i8) : i8;

function $not.i96(i: i96) : i96;

function $or.i1(i1: i1, i2: i1) : i1;

function $or.i128(i1: i128, i2: i128) : i128;

function $or.i16(i1: i16, i2: i16) : i16;

function $or.i32(i1: i32, i2: i32) : i32;

function $or.i64(i1: i64, i2: i64) : i64;

function $or.i8(i1: i8, i2: i8) : i8;

function $or.i96(i1: i96, i2: i96) : i96;

function $shl.i1(i1: i1, i2: i1) : i1;

function $shl.i128(i1: i128, i2: i128) : i128;

function $shl.i16(i1: i16, i2: i16) : i16;

function $shl.i32(i1: i32, i2: i32) : i32;

function $shl.i64(i1: i64, i2: i64) : i64;

function $shl.i8(i1: i8, i2: i8) : i8;

function $shl.i96(i1: i96, i2: i96) : i96;

function $si2fp.bv128.float(i: bv128) : float;

function $si2fp.bv16.float(i: bv16) : float;

function $si2fp.bv32.float(i: bv32) : float;

function $si2fp.bv64.float(i: bv64) : float;

function $si2fp.bv8.float(i: bv8) : float;

function $si2fp.bv96.float(i: bv96) : float;

function $si2fp.i128.float(i: i128) : float;

function $si2fp.i16.float(i: i16) : float;

function $si2fp.i32.float(i: i32) : float;

function $si2fp.i64.float(i: i64) : float;

function $si2fp.i8.float(i: i8) : float;

function $si2fp.i96.float(i: i96) : float;

function $ui2fp.bv128.float(i: bv128) : float;

function $ui2fp.bv16.float(i: bv16) : float;

function $ui2fp.bv32.float(i: bv32) : float;

function $ui2fp.bv64.float(i: bv64) : float;

function $ui2fp.bv8.float(i: bv8) : float;

function $ui2fp.bv96.float(i: bv96) : float;

function $ui2fp.i128.float(i: i128) : float;

function $ui2fp.i16.float(i: i16) : float;

function $ui2fp.i32.float(i: i32) : float;

function $ui2fp.i64.float(i: i64) : float;

function $ui2fp.i8.float(i: i8) : float;

function $ui2fp.i96.float(i: i96) : float;

function $xor.i1(i1: i1, i2: i1) : i1;

function $xor.i128(i1: i128, i2: i128) : i128;

function $xor.i16(i1: i16, i2: i16) : i16;

function $xor.i32(i1: i32, i2: i32) : i32;

function $xor.i64(i1: i64, i2: i64) : i64;

function $xor.i8(i1: i8, i2: i8) : i8;

function $xor.i96(i1: i96, i2: i96) : i96;

function {:builtin "div"} $div(i1: int, i2: int) : int;

function {:builtin "div"} $sdiv.i1(i1: i1, i2: i1) : i1;

function {:builtin "div"} $sdiv.i128(i1: i128, i2: i128) : i128;

function {:builtin "div"} $sdiv.i16(i1: i16, i2: i16) : i16;

function {:builtin "div"} $sdiv.i32(i1: i32, i2: i32) : i32;

function {:builtin "div"} $sdiv.i64(i1: i64, i2: i64) : i64;

function {:builtin "div"} $sdiv.i8(i1: i8, i2: i8) : i8;

function {:builtin "div"} $sdiv.i96(i1: i96, i2: i96) : i96;

function {:builtin "div"} $udiv.i1(i1: i1, i2: i1) : i1;

function {:builtin "div"} $udiv.i128(i1: i128, i2: i128) : i128;

function {:builtin "div"} $udiv.i16(i1: i16, i2: i16) : i16;

function {:builtin "div"} $udiv.i32(i1: i32, i2: i32) : i32;

function {:builtin "div"} $udiv.i64(i1: i64, i2: i64) : i64;

function {:builtin "div"} $udiv.i8(i1: i8, i2: i8) : i8;

function {:builtin "div"} $udiv.i96(i1: i96, i2: i96) : i96;

function {:builtin "mod"} $mod(i1: int, i2: int) : int;

function {:builtin "mod"} $smod.i1(i1: i1, i2: i1) : i1;

function {:builtin "mod"} $smod.i128(i1: i128, i2: i128) : i128;

function {:builtin "mod"} $smod.i16(i1: i16, i2: i16) : i16;

function {:builtin "mod"} $smod.i32(i1: i32, i2: i32) : i32;

function {:builtin "mod"} $smod.i64(i1: i64, i2: i64) : i64;

function {:builtin "mod"} $smod.i8(i1: i8, i2: i8) : i8;

function {:builtin "mod"} $smod.i96(i1: i96, i2: i96) : i96;

function {:builtin "rem"} $rem(i1: int, i2: int) : int;

function {:builtin "rem"} $srem.i1(i1: i1, i2: i1) : i1;

function {:builtin "rem"} $srem.i128(i1: i128, i2: i128) : i128;

function {:builtin "rem"} $srem.i16(i1: i16, i2: i16) : i16;

function {:builtin "rem"} $srem.i32(i1: i32, i2: i32) : i32;

function {:builtin "rem"} $srem.i64(i1: i64, i2: i64) : i64;

function {:builtin "rem"} $srem.i8(i1: i8, i2: i8) : i8;

function {:builtin "rem"} $srem.i96(i1: i96, i2: i96) : i96;

function {:builtin "rem"} $urem.i1(i1: i1, i2: i1) : i1;

function {:builtin "rem"} $urem.i128(i1: i128, i2: i128) : i128;

function {:builtin "rem"} $urem.i16(i1: i16, i2: i16) : i16;

function {:builtin "rem"} $urem.i32(i1: i32, i2: i32) : i32;

function {:builtin "rem"} $urem.i64(i1: i64, i2: i64) : i64;

function {:builtin "rem"} $urem.i8(i1: i8, i2: i8) : i8;

function {:builtin "rem"} $urem.i96(i1: i96, i2: i96) : i96;

function {:bvbuiltin "(_ sign_extend 112)"} $sext.bv16.bv128(i: bv16) : bv128;

function {:bvbuiltin "(_ sign_extend 120)"} $sext.bv8.bv128(i: bv8) : bv128;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv16.bv32(i: bv16) : bv32;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv8.bv32(i: bv8) : bv32;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv32.bv64(i: bv32) : bv64;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv64.bv96(i: bv64) : bv96;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv96.bv128(i: bv96) : bv128;

function {:bvbuiltin "(_ sign_extend 48)"} $sext.bv16.bv64(i: bv16) : bv64;

function {:bvbuiltin "(_ sign_extend 56)"} $sext.bv8.bv64(i: bv8) : bv64;

function {:bvbuiltin "(_ sign_extend 64)"} $sext.bv32.bv96(i: bv32) : bv96;

function {:bvbuiltin "(_ sign_extend 64)"} $sext.bv64.bv128(i: bv64) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv8.bv16(i: bv8) : bv16;

function {:bvbuiltin "(_ sign_extend 80)"} $sext.bv16.bv96(i: bv16) : bv96;

function {:bvbuiltin "(_ sign_extend 88)"} $sext.bv8.bv96(i: bv8) : bv96;

function {:bvbuiltin "(_ sign_extend 96)"} $sext.bv32.bv128(i: bv32) : bv128;

function {:bvbuiltin "(_ zero_extend 112)"} $zext.bv16.bv128(i: bv16) : bv128;

function {:bvbuiltin "(_ zero_extend 120)"} $zext.bv8.bv128(i: bv8) : bv128;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv16.bv32(i: bv16) : bv32;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv8.bv32(i: bv8) : bv32;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv32.bv64(i: bv32) : bv64;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv64.bv96(i: bv64) : bv96;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv96.bv128(i: bv96) : bv128;

function {:bvbuiltin "(_ zero_extend 48)"} $zext.bv16.bv64(i: bv16) : bv64;

function {:bvbuiltin "(_ zero_extend 56)"} $zext.bv8.bv64(i: bv8) : bv64;

function {:bvbuiltin "(_ zero_extend 64)"} $zext.bv32.bv96(i: bv32) : bv96;

function {:bvbuiltin "(_ zero_extend 64)"} $zext.bv64.bv128(i: bv64) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv8.bv16(i: bv8) : bv16;

function {:bvbuiltin "(_ zero_extend 80)"} $zext.bv16.bv96(i: bv16) : bv96;

function {:bvbuiltin "(_ zero_extend 88)"} $zext.bv8.bv96(i: bv8) : bv96;

function {:bvbuiltin "(_ zero_extend 96)"} $zext.bv32.bv128(i: bv32) : bv128;

function {:bvbuiltin "bvadd"} $add.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvadd"} $add.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvadd"} $add.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvadd"} $add.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvadd"} $add.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvadd"} $add.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvadd"} $add.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvand"} $and.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvand"} $and.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvand"} $and.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvand"} $and.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvand"} $and.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvand"} $and.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvand"} $and.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvashr"} $ashr.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvashr"} $ashr.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvashr"} $ashr.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvashr"} $ashr.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvashr"} $ashr.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvashr"} $ashr.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvashr"} $ashr.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvlshr"} $lshr.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvlshr"} $lshr.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvlshr"} $lshr.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvlshr"} $lshr.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvlshr"} $lshr.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvlshr"} $lshr.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvlshr"} $lshr.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvmul"} $mul.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvmul"} $mul.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvmul"} $mul.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvmul"} $mul.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvmul"} $mul.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvmul"} $mul.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvmul"} $mul.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvnand"} $nand.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvnand"} $nand.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvnand"} $nand.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvnand"} $nand.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvnand"} $nand.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvnand"} $nand.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvnand"} $nand.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvnot"} $not.bv1(i: bv1) : bv1;

function {:bvbuiltin "bvnot"} $not.bv128(i: bv128) : bv128;

function {:bvbuiltin "bvnot"} $not.bv16(i: bv16) : bv16;

function {:bvbuiltin "bvnot"} $not.bv32(i: bv32) : bv32;

function {:bvbuiltin "bvnot"} $not.bv64(i: bv64) : bv64;

function {:bvbuiltin "bvnot"} $not.bv8(i: bv8) : bv8;

function {:bvbuiltin "bvnot"} $not.bv96(i: bv96) : bv96;

function {:bvbuiltin "bvor"} $or.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvor"} $or.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvor"} $or.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvor"} $or.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvor"} $or.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvor"} $or.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvor"} $or.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsdiv"} $sdiv.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsdiv"} $sdiv.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsdiv"} $sdiv.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsdiv"} $sdiv.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsdiv"} $sdiv.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsdiv"} $sdiv.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsdiv"} $sdiv.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsge"} $sge.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sge.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sge.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $sge.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $sge.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $sge.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $sge.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $sge.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $sge.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $sge.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $sge.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $sge.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $sge.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $sge.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $sge.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sgt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sgt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $sgt.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $sgt.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $sgt.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $sgt.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $sgt.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $sgt.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $sgt.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $sgt.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $sgt.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $sgt.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $sgt.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $sgt.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvshl"} $shl.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvshl"} $shl.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvshl"} $shl.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvshl"} $shl.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvshl"} $shl.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvshl"} $shl.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvshl"} $shl.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsle"} $sle.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sle.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sle.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $sle.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $sle.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $sle.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $sle.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $sle.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $sle.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $sle.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $sle.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $sle.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $sle.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $sle.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $sle.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $slt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $slt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $slt.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $slt.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $slt.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $slt.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $slt.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $slt.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $slt.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $slt.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $slt.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $slt.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $slt.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $slt.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsmod"} $smod.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsmod"} $smod.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsmod"} $smod.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsmod"} $smod.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsmod"} $smod.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsmod"} $smod.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsmod"} $smod.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsrem"} $srem.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsrem"} $srem.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsrem"} $srem.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsrem"} $srem.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsrem"} $srem.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsrem"} $srem.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsrem"} $srem.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsub"} $sub.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsub"} $sub.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsub"} $sub.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsub"} $sub.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsub"} $sub.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsub"} $sub.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsub"} $sub.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvudiv"} $udiv.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvudiv"} $udiv.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvudiv"} $udiv.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvudiv"} $udiv.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvudiv"} $udiv.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvudiv"} $udiv.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvudiv"} $udiv.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvuge"} $uge.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $uge.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $uge.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $uge.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $uge.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $uge.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $uge.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $uge.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $uge.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $uge.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $uge.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $uge.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $uge.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $uge.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $uge.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ugt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ugt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $ugt.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $ugt.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $ugt.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $ugt.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $ugt.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $ugt.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $ugt.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $ugt.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $ugt.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $ugt.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $ugt.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $ugt.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ule.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ule.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $ule.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $ule.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $ule.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $ule.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $ule.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $ule.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $ule.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $ule.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $ule.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $ule.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $ule.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $ule.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ult.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ult.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $ult.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $ult.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $ult.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $ult.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $ult.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $ult.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $ult.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $ult.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $ult.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $ult.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $ult.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $ult.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvurem"} $urem.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvurem"} $urem.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvurem"} $urem.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvurem"} $urem.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvurem"} $urem.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvurem"} $urem.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvurem"} $urem.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvxor"} $xor.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvxor"} $xor.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvxor"} $xor.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvxor"} $xor.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvxor"} $xor.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvxor"} $xor.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvxor"} $xor.bv96(i1: bv96, i2: bv96) : bv96;

function {:inline} $add.i1(i1: i1, i2: i1) : i1
{
  i1 + i2
}

function {:inline} $add.i128(i1: i128, i2: i128) : i128
{
  i1 + i2
}

function {:inline} $add.i16(i1: i16, i2: i16) : i16
{
  i1 + i2
}

function {:inline} $add.i32(i1: i32, i2: i32) : i32
{
  i1 + i2
}

function {:inline} $add.i64(i1: i64, i2: i64) : i64
{
  i1 + i2
}

function {:inline} $add.i8(i1: i8, i2: i8) : i8
{
  i1 + i2
}

function {:inline} $add.i96(i1: i96, i2: i96) : i96
{
  i1 + i2
}

function {:inline} $bitcast.ref.ref(i: ref) : ref
{
  i
}

function {:inline} $eq.bv1.bool(i1: bv1, i2: bv1) : bool
{
  i1 == i2
}

function {:inline} $eq.bv1(i1: bv1, i2: bv1) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv128.bool(i1: bv128, i2: bv128) : bool
{
  i1 == i2
}

function {:inline} $eq.bv128(i1: bv128, i2: bv128) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv16.bool(i1: bv16, i2: bv16) : bool
{
  i1 == i2
}

function {:inline} $eq.bv16(i1: bv16, i2: bv16) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv32.bool(i1: bv32, i2: bv32) : bool
{
  i1 == i2
}

function {:inline} $eq.bv32(i1: bv32, i2: bv32) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv64.bool(i1: bv64, i2: bv64) : bool
{
  i1 == i2
}

function {:inline} $eq.bv64(i1: bv64, i2: bv64) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv8.bool(i1: bv8, i2: bv8) : bool
{
  i1 == i2
}

function {:inline} $eq.bv8(i1: bv8, i2: bv8) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv96.bool(i1: bv96, i2: bv96) : bool
{
  i1 == i2
}

function {:inline} $eq.bv96(i1: bv96, i2: bv96) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.i1.bool(i1: i1, i2: i1) : bool
{
  i1 == i2
}

function {:inline} $eq.i1(i1: i1, i2: i1) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i128.bool(i1: i128, i2: i128) : bool
{
  i1 == i2
}

function {:inline} $eq.i128(i1: i128, i2: i128) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i16.bool(i1: i16, i2: i16) : bool
{
  i1 == i2
}

function {:inline} $eq.i16(i1: i16, i2: i16) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i32.bool(i1: i32, i2: i32) : bool
{
  i1 == i2
}

function {:inline} $eq.i32(i1: i32, i2: i32) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i64.bool(i1: i64, i2: i64) : bool
{
  i1 == i2
}

function {:inline} $eq.i64(i1: i64, i2: i64) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i8.bool(i1: i8, i2: i8) : bool
{
  i1 == i2
}

function {:inline} $eq.i8(i1: i8, i2: i8) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i96.bool(i1: i96, i2: i96) : bool
{
  i1 == i2
}

function {:inline} $eq.i96(i1: i96, i2: i96) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $foeq.float(f1: float, f2: float) : i1
{
  (if $foeq.bool(f1, f2) then 1 else 0)
}

function {:inline} $isExternal(p: ref) : bool
{
  $slt.ref.bool(p, $EXTERNS_BOTTOM)
}

function {:inline} $load.bv128(M: [ref]bv8, p: ref) : bv128
{
  $load.bv64(M, $add.ref(p, $4.ref)) ++ $load.bv64(M, p)
}

function {:inline} $load.bv16(M: [ref]bv8, p: ref) : bv16
{
  M[$add.ref(p, $1.ref)] ++ M[p]
}

function {:inline} $load.bv32(M: [ref]bv8, p: ref) : bv32
{
  M[$add.ref(p, $3.ref)] ++ M[$add.ref(p, $2.ref)] ++ M[$add.ref(p, $1.ref)] ++ M[p]
}

function {:inline} $load.bv64(M: [ref]bv8, p: ref) : bv64
{
  $load.bv32(M, $add.ref(p, $4.ref)) ++ $load.bv32(M, p)
}

function {:inline} $load.bv8(M: [ref]bv8, p: ref) : bv8
{
  M[p]
}

function {:inline} $load.bv96(M: [ref]bv8, p: ref) : bv96
{
  $load.bv64(M, $add.ref(p, $4.ref)) ++ $load.bv32(M, p)
}

function {:inline} $max(i1: int, i2: int) : int
{
  (if i1 > i2 then i1 else i2)
}

function {:inline} $max.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sgt.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $sgt.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $sgt.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $sgt.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $sgt.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $sgt.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $sgt.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $min(i1: int, i2: int) : int
{
  (if i1 < i2 then i1 else i2)
}

function {:inline} $min.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $slt.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $slt.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $slt.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $slt.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $slt.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $slt.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $slt.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $mul.i1(i1: i1, i2: i1) : i1
{
  i1 * i2
}

function {:inline} $mul.i128(i1: i128, i2: i128) : i128
{
  i1 * i2
}

function {:inline} $mul.i16(i1: i16, i2: i16) : i16
{
  i1 * i2
}

function {:inline} $mul.i32(i1: i32, i2: i32) : i32
{
  i1 * i2
}

function {:inline} $mul.i64(i1: i64, i2: i64) : i64
{
  i1 * i2
}

function {:inline} $mul.i8(i1: i8, i2: i8) : i8
{
  i1 * i2
}

function {:inline} $mul.i96(i1: i96, i2: i96) : i96
{
  i1 * i2
}

function {:inline} $ne.bv1.bool(i1: bv1, i2: bv1) : bool
{
  i1 != i2
}

function {:inline} $ne.bv1(i1: bv1, i2: bv1) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv128.bool(i1: bv128, i2: bv128) : bool
{
  i1 != i2
}

function {:inline} $ne.bv128(i1: bv128, i2: bv128) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv16.bool(i1: bv16, i2: bv16) : bool
{
  i1 != i2
}

function {:inline} $ne.bv16(i1: bv16, i2: bv16) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv32.bool(i1: bv32, i2: bv32) : bool
{
  i1 != i2
}

function {:inline} $ne.bv32(i1: bv32, i2: bv32) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv64.bool(i1: bv64, i2: bv64) : bool
{
  i1 != i2
}

function {:inline} $ne.bv64(i1: bv64, i2: bv64) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv8.bool(i1: bv8, i2: bv8) : bool
{
  i1 != i2
}

function {:inline} $ne.bv8(i1: bv8, i2: bv8) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv96.bool(i1: bv96, i2: bv96) : bool
{
  i1 != i2
}

function {:inline} $ne.bv96(i1: bv96, i2: bv96) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.i1.bool(i1: i1, i2: i1) : bool
{
  i1 != i2
}

function {:inline} $ne.i1(i1: i1, i2: i1) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i128.bool(i1: i128, i2: i128) : bool
{
  i1 != i2
}

function {:inline} $ne.i128(i1: i128, i2: i128) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i16.bool(i1: i16, i2: i16) : bool
{
  i1 != i2
}

function {:inline} $ne.i16(i1: i16, i2: i16) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i32.bool(i1: i32, i2: i32) : bool
{
  i1 != i2
}

function {:inline} $ne.i32(i1: i32, i2: i32) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i64.bool(i1: i64, i2: i64) : bool
{
  i1 != i2
}

function {:inline} $ne.i64(i1: i64, i2: i64) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i8.bool(i1: i8, i2: i8) : bool
{
  i1 != i2
}

function {:inline} $ne.i8(i1: i8, i2: i8) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i96.bool(i1: i96, i2: i96) : bool
{
  i1 != i2
}

function {:inline} $ne.i96(i1: i96, i2: i96) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $sext.bv1.bv128(i: bv1) : bv128
{
  (if i == 0bv1 then 0bv128 else 340282366920938463463374607431768211455bv128)
}

function {:inline} $sext.bv1.bv16(i: bv1) : bv16
{
  (if i == 0bv1 then 0bv16 else 65535bv16)
}

function {:inline} $sext.bv1.bv32(i: bv1) : bv32
{
  (if i == 0bv1 then 0bv32 else 4294967295bv32)
}

function {:inline} $sext.bv1.bv64(i: bv1) : bv64
{
  (if i == 0bv1 then 0bv64 else 18446744073709551615bv64)
}

function {:inline} $sext.bv1.bv8(i: bv1) : bv8
{
  (if i == 0bv1 then 0bv8 else 255bv8)
}

function {:inline} $sext.bv1.bv96(i: bv1) : bv96
{
  (if i == 0bv1 then 0bv96 else 79228162514264337593543950335bv96)
}

function {:inline} $sext.i1.i128(i: i1) : i128
{
  i
}

function {:inline} $sext.i1.i16(i: i1) : i16
{
  i
}

function {:inline} $sext.i1.i32(i: i1) : i32
{
  i
}

function {:inline} $sext.i1.i64(i: i1) : i64
{
  i
}

function {:inline} $sext.i1.i8(i: i1) : i8
{
  i
}

function {:inline} $sext.i1.i96(i: i1) : i96
{
  i
}

function {:inline} $sext.i16.i128(i: i16) : i128
{
  i
}

function {:inline} $sext.i16.i32(i: i16) : i32
{
  i
}

function {:inline} $sext.i16.i64(i: i16) : i64
{
  i
}

function {:inline} $sext.i16.i96(i: i16) : i96
{
  i
}

function {:inline} $sext.i32.i128(i: i32) : i128
{
  i
}

function {:inline} $sext.i32.i64(i: i32) : i64
{
  i
}

function {:inline} $sext.i32.i96(i: i32) : i96
{
  i
}

function {:inline} $sext.i64.i128(i: i64) : i128
{
  i
}

function {:inline} $sext.i64.i96(i: i64) : i96
{
  i
}

function {:inline} $sext.i8.i128(i: i8) : i128
{
  i
}

function {:inline} $sext.i8.i16(i: i8) : i16
{
  i
}

function {:inline} $sext.i8.i32(i: i8) : i32
{
  i
}

function {:inline} $sext.i8.i64(i: i8) : i64
{
  i
}

function {:inline} $sext.i8.i96(i: i8) : i96
{
  i
}

function {:inline} $sext.i96.i128(i: i96) : i128
{
  i
}

function {:inline} $sge.i1.bool(i1: i1, i2: i1) : bool
{
  i1 >= i2
}

function {:inline} $sge.i1(i1: i1, i2: i1) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i128.bool(i1: i128, i2: i128) : bool
{
  i1 >= i2
}

function {:inline} $sge.i128(i1: i128, i2: i128) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i16.bool(i1: i16, i2: i16) : bool
{
  i1 >= i2
}

function {:inline} $sge.i16(i1: i16, i2: i16) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i32.bool(i1: i32, i2: i32) : bool
{
  i1 >= i2
}

function {:inline} $sge.i32(i1: i32, i2: i32) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i64.bool(i1: i64, i2: i64) : bool
{
  i1 >= i2
}

function {:inline} $sge.i64(i1: i64, i2: i64) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i8.bool(i1: i8, i2: i8) : bool
{
  i1 >= i2
}

function {:inline} $sge.i8(i1: i8, i2: i8) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i96.bool(i1: i96, i2: i96) : bool
{
  i1 >= i2
}

function {:inline} $sge.i96(i1: i96, i2: i96) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sgt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 > i2
}

function {:inline} $sgt.i1(i1: i1, i2: i1) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i128.bool(i1: i128, i2: i128) : bool
{
  i1 > i2
}

function {:inline} $sgt.i128(i1: i128, i2: i128) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i16.bool(i1: i16, i2: i16) : bool
{
  i1 > i2
}

function {:inline} $sgt.i16(i1: i16, i2: i16) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i32.bool(i1: i32, i2: i32) : bool
{
  i1 > i2
}

function {:inline} $sgt.i32(i1: i32, i2: i32) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i64.bool(i1: i64, i2: i64) : bool
{
  i1 > i2
}

function {:inline} $sgt.i64(i1: i64, i2: i64) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i8.bool(i1: i8, i2: i8) : bool
{
  i1 > i2
}

function {:inline} $sgt.i8(i1: i8, i2: i8) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i96.bool(i1: i96, i2: i96) : bool
{
  i1 > i2
}

function {:inline} $sgt.i96(i1: i96, i2: i96) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sle.i1.bool(i1: i1, i2: i1) : bool
{
  i1 <= i2
}

function {:inline} $sle.i1(i1: i1, i2: i1) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i128.bool(i1: i128, i2: i128) : bool
{
  i1 <= i2
}

function {:inline} $sle.i128(i1: i128, i2: i128) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i16.bool(i1: i16, i2: i16) : bool
{
  i1 <= i2
}

function {:inline} $sle.i16(i1: i16, i2: i16) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i32.bool(i1: i32, i2: i32) : bool
{
  i1 <= i2
}

function {:inline} $sle.i32(i1: i32, i2: i32) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i64.bool(i1: i64, i2: i64) : bool
{
  i1 <= i2
}

function {:inline} $sle.i64(i1: i64, i2: i64) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i8.bool(i1: i8, i2: i8) : bool
{
  i1 <= i2
}

function {:inline} $sle.i8(i1: i8, i2: i8) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i96.bool(i1: i96, i2: i96) : bool
{
  i1 <= i2
}

function {:inline} $sle.i96(i1: i96, i2: i96) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $slt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 < i2
}

function {:inline} $slt.i1(i1: i1, i2: i1) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i128.bool(i1: i128, i2: i128) : bool
{
  i1 < i2
}

function {:inline} $slt.i128(i1: i128, i2: i128) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i16.bool(i1: i16, i2: i16) : bool
{
  i1 < i2
}

function {:inline} $slt.i16(i1: i16, i2: i16) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i32.bool(i1: i32, i2: i32) : bool
{
  i1 < i2
}

function {:inline} $slt.i32(i1: i32, i2: i32) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i64.bool(i1: i64, i2: i64) : bool
{
  i1 < i2
}

function {:inline} $slt.i64(i1: i64, i2: i64) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i8.bool(i1: i8, i2: i8) : bool
{
  i1 < i2
}

function {:inline} $slt.i8(i1: i8, i2: i8) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i96.bool(i1: i96, i2: i96) : bool
{
  i1 < i2
}

function {:inline} $slt.i96(i1: i96, i2: i96) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $smax.i1(i1: i1, i2: i1) : i1
{
  $max(i1, i2)
}

function {:inline} $smax.i128(i1: i128, i2: i128) : i128
{
  $max(i1, i2)
}

function {:inline} $smax.i16(i1: i16, i2: i16) : i16
{
  $max(i1, i2)
}

function {:inline} $smax.i32(i1: i32, i2: i32) : i32
{
  $max(i1, i2)
}

function {:inline} $smax.i64(i1: i64, i2: i64) : i64
{
  $max(i1, i2)
}

function {:inline} $smax.i8(i1: i8, i2: i8) : i8
{
  $max(i1, i2)
}

function {:inline} $smax.i96(i1: i96, i2: i96) : i96
{
  $max(i1, i2)
}

function {:inline} $smin.i1(i1: i1, i2: i1) : i1
{
  $min(i1, i2)
}

function {:inline} $smin.i128(i1: i128, i2: i128) : i128
{
  $min(i1, i2)
}

function {:inline} $smin.i16(i1: i16, i2: i16) : i16
{
  $min(i1, i2)
}

function {:inline} $smin.i32(i1: i32, i2: i32) : i32
{
  $min(i1, i2)
}

function {:inline} $smin.i64(i1: i64, i2: i64) : i64
{
  $min(i1, i2)
}

function {:inline} $smin.i8(i1: i8, i2: i8) : i8
{
  $min(i1, i2)
}

function {:inline} $smin.i96(i1: i96, i2: i96) : i96
{
  $min(i1, i2)
}

function {:inline} $store.bv128(M: [ref]bv8, p: ref, v: bv128) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]][$add.ref(p, $7.ref) := v[72:64]][$add.ref(p, $8.ref) := v[80:72]][$add.ref(p, $9.ref) := v[88:80]][$add.ref(p, $10.ref) := v[96:88]][$add.ref(p, $11.ref) := v[104:96]][$add.ref(p, $12.ref) := v[112:104]][$add.ref(p, $13.ref) := v[120:112]][$add.ref(p, $14.ref) := v[128:120]]
}

function {:inline} $store.bv16(M: [ref]bv8, p: ref, v: bv16) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]]
}

function {:inline} $store.bv32(M: [ref]bv8, p: ref, v: bv32) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]]
}

function {:inline} $store.bv64(M: [ref]bv8, p: ref, v: bv64) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]]
}

function {:inline} $store.bv8(M: [ref]bv8, p: ref, v: bv8) : [ref]bv8
{
  M[p := v]
}

function {:inline} $store.bv96(M: [ref]bv8, p: ref, v: bv96) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]][$add.ref(p, $7.ref) := v[72:64]][$add.ref(p, $8.ref) := v[80:72]][$add.ref(p, $9.ref) := v[88:80]][$add.ref(p, $10.ref) := v[96:88]]
}

function {:inline} $sub.i1(i1: i1, i2: i1) : i1
{
  i1 - i2
}

function {:inline} $sub.i128(i1: i128, i2: i128) : i128
{
  i1 - i2
}

function {:inline} $sub.i16(i1: i16, i2: i16) : i16
{
  i1 - i2
}

function {:inline} $sub.i32(i1: i32, i2: i32) : i32
{
  i1 - i2
}

function {:inline} $sub.i64(i1: i64, i2: i64) : i64
{
  i1 - i2
}

function {:inline} $sub.i8(i1: i8, i2: i8) : i8
{
  i1 - i2
}

function {:inline} $sub.i96(i1: i96, i2: i96) : i96
{
  i1 - i2
}

function {:inline} $trunc.bv128.bv1(i: bv128) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv128.bv16(i: bv128) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv128.bv32(i: bv128) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv128.bv64(i: bv128) : bv64
{
  i[64:0]
}

function {:inline} $trunc.bv128.bv8(i: bv128) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv128.bv96(i: bv128) : bv96
{
  i[96:0]
}

function {:inline} $trunc.bv16.bv1(i: bv16) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv16.bv8(i: bv16) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv32.bv1(i: bv32) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv32.bv16(i: bv32) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv32.bv8(i: bv32) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv64.bv1(i: bv64) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv64.bv16(i: bv64) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv64.bv32(i: bv64) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv64.bv8(i: bv64) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv8.bv1(i: bv8) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv96.bv1(i: bv96) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv96.bv16(i: bv96) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv96.bv32(i: bv96) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv96.bv64(i: bv96) : bv64
{
  i[64:0]
}

function {:inline} $trunc.bv96.bv8(i: bv96) : bv8
{
  i[8:0]
}

function {:inline} $trunc.i128.i1(i: i128) : i1
{
  i
}

function {:inline} $trunc.i128.i16(i: i128) : i16
{
  i
}

function {:inline} $trunc.i128.i32(i: i128) : i32
{
  i
}

function {:inline} $trunc.i128.i64(i: i128) : i64
{
  i
}

function {:inline} $trunc.i128.i8(i: i128) : i8
{
  i
}

function {:inline} $trunc.i128.i96(i: i128) : i96
{
  i
}

function {:inline} $trunc.i16.i1(i: i16) : i1
{
  i
}

function {:inline} $trunc.i16.i8(i: i16) : i8
{
  i
}

function {:inline} $trunc.i32.i1(i: i32) : i1
{
  i
}

function {:inline} $trunc.i32.i16(i: i32) : i16
{
  i
}

function {:inline} $trunc.i32.i8(i: i32) : i8
{
  i
}

function {:inline} $trunc.i64.i1(i: i64) : i1
{
  i
}

function {:inline} $trunc.i64.i16(i: i64) : i16
{
  i
}

function {:inline} $trunc.i64.i32(i: i64) : i32
{
  i
}

function {:inline} $trunc.i64.i8(i: i64) : i8
{
  i
}

function {:inline} $trunc.i8.i1(i: i8) : i1
{
  i
}

function {:inline} $trunc.i96.i1(i: i96) : i1
{
  i
}

function {:inline} $trunc.i96.i16(i: i96) : i16
{
  i
}

function {:inline} $trunc.i96.i32(i: i96) : i32
{
  i
}

function {:inline} $trunc.i96.i64(i: i96) : i64
{
  i
}

function {:inline} $trunc.i96.i8(i: i96) : i8
{
  i
}

function {:inline} $uge.i1.bool(i1: i1, i2: i1) : bool
{
  i1 >= i2
}

function {:inline} $uge.i1(i1: i1, i2: i1) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i128.bool(i1: i128, i2: i128) : bool
{
  i1 >= i2
}

function {:inline} $uge.i128(i1: i128, i2: i128) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i16.bool(i1: i16, i2: i16) : bool
{
  i1 >= i2
}

function {:inline} $uge.i16(i1: i16, i2: i16) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i32.bool(i1: i32, i2: i32) : bool
{
  i1 >= i2
}

function {:inline} $uge.i32(i1: i32, i2: i32) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i64.bool(i1: i64, i2: i64) : bool
{
  i1 >= i2
}

function {:inline} $uge.i64(i1: i64, i2: i64) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i8.bool(i1: i8, i2: i8) : bool
{
  i1 >= i2
}

function {:inline} $uge.i8(i1: i8, i2: i8) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i96.bool(i1: i96, i2: i96) : bool
{
  i1 >= i2
}

function {:inline} $uge.i96(i1: i96, i2: i96) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $ugt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 > i2
}

function {:inline} $ugt.i1(i1: i1, i2: i1) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i128.bool(i1: i128, i2: i128) : bool
{
  i1 > i2
}

function {:inline} $ugt.i128(i1: i128, i2: i128) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i16.bool(i1: i16, i2: i16) : bool
{
  i1 > i2
}

function {:inline} $ugt.i16(i1: i16, i2: i16) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i32.bool(i1: i32, i2: i32) : bool
{
  i1 > i2
}

function {:inline} $ugt.i32(i1: i32, i2: i32) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i64.bool(i1: i64, i2: i64) : bool
{
  i1 > i2
}

function {:inline} $ugt.i64(i1: i64, i2: i64) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i8.bool(i1: i8, i2: i8) : bool
{
  i1 > i2
}

function {:inline} $ugt.i8(i1: i8, i2: i8) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i96.bool(i1: i96, i2: i96) : bool
{
  i1 > i2
}

function {:inline} $ugt.i96(i1: i96, i2: i96) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ule.i1.bool(i1: i1, i2: i1) : bool
{
  i1 <= i2
}

function {:inline} $ule.i1(i1: i1, i2: i1) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i128.bool(i1: i128, i2: i128) : bool
{
  i1 <= i2
}

function {:inline} $ule.i128(i1: i128, i2: i128) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i16.bool(i1: i16, i2: i16) : bool
{
  i1 <= i2
}

function {:inline} $ule.i16(i1: i16, i2: i16) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i32.bool(i1: i32, i2: i32) : bool
{
  i1 <= i2
}

function {:inline} $ule.i32(i1: i32, i2: i32) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i64.bool(i1: i64, i2: i64) : bool
{
  i1 <= i2
}

function {:inline} $ule.i64(i1: i64, i2: i64) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i8.bool(i1: i8, i2: i8) : bool
{
  i1 <= i2
}

function {:inline} $ule.i8(i1: i8, i2: i8) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i96.bool(i1: i96, i2: i96) : bool
{
  i1 <= i2
}

function {:inline} $ule.i96(i1: i96, i2: i96) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ult.i1.bool(i1: i1, i2: i1) : bool
{
  i1 < i2
}

function {:inline} $ult.i1(i1: i1, i2: i1) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i128.bool(i1: i128, i2: i128) : bool
{
  i1 < i2
}

function {:inline} $ult.i128(i1: i128, i2: i128) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i16.bool(i1: i16, i2: i16) : bool
{
  i1 < i2
}

function {:inline} $ult.i16(i1: i16, i2: i16) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i32.bool(i1: i32, i2: i32) : bool
{
  i1 < i2
}

function {:inline} $ult.i32(i1: i32, i2: i32) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i64.bool(i1: i64, i2: i64) : bool
{
  i1 < i2
}

function {:inline} $ult.i64(i1: i64, i2: i64) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i8.bool(i1: i8, i2: i8) : bool
{
  i1 < i2
}

function {:inline} $ult.i8(i1: i8, i2: i8) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i96.bool(i1: i96, i2: i96) : bool
{
  i1 < i2
}

function {:inline} $ult.i96(i1: i96, i2: i96) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $umax.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ugt.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $ugt.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $ugt.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $ugt.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $ugt.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $ugt.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $ugt.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.i1(i1: i1, i2: i1) : i1
{
  $max(i1, i2)
}

function {:inline} $umax.i128(i1: i128, i2: i128) : i128
{
  $max(i1, i2)
}

function {:inline} $umax.i16(i1: i16, i2: i16) : i16
{
  $max(i1, i2)
}

function {:inline} $umax.i32(i1: i32, i2: i32) : i32
{
  $max(i1, i2)
}

function {:inline} $umax.i64(i1: i64, i2: i64) : i64
{
  $max(i1, i2)
}

function {:inline} $umax.i8(i1: i8, i2: i8) : i8
{
  $max(i1, i2)
}

function {:inline} $umax.i96(i1: i96, i2: i96) : i96
{
  $max(i1, i2)
}

function {:inline} $umin.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ult.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $ult.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $ult.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $ult.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $ult.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $ult.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $ult.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.i1(i1: i1, i2: i1) : i1
{
  $min(i1, i2)
}

function {:inline} $umin.i128(i1: i128, i2: i128) : i128
{
  $min(i1, i2)
}

function {:inline} $umin.i16(i1: i16, i2: i16) : i16
{
  $min(i1, i2)
}

function {:inline} $umin.i32(i1: i32, i2: i32) : i32
{
  $min(i1, i2)
}

function {:inline} $umin.i64(i1: i64, i2: i64) : i64
{
  $min(i1, i2)
}

function {:inline} $umin.i8(i1: i8, i2: i8) : i8
{
  $min(i1, i2)
}

function {:inline} $umin.i96(i1: i96, i2: i96) : i96
{
  $min(i1, i2)
}

function {:inline} $zext.bv1.bv128(i: bv1) : bv128
{
  (if i == 0bv1 then 0bv128 else 1bv128)
}

function {:inline} $zext.bv1.bv16(i: bv1) : bv16
{
  (if i == 0bv1 then 0bv16 else 1bv16)
}

function {:inline} $zext.bv1.bv32(i: bv1) : bv32
{
  (if i == 0bv1 then 0bv32 else 1bv32)
}

function {:inline} $zext.bv1.bv64(i: bv1) : bv64
{
  (if i == 0bv1 then 0bv64 else 1bv64)
}

function {:inline} $zext.bv1.bv8(i: bv1) : bv8
{
  (if i == 0bv1 then 0bv8 else 1bv8)
}

function {:inline} $zext.bv1.bv96(i: bv1) : bv96
{
  (if i == 0bv1 then 0bv96 else 1bv96)
}

function {:inline} $zext.i1.i128(i: i1) : i128
{
  i
}

function {:inline} $zext.i1.i16(i: i1) : i16
{
  i
}

function {:inline} $zext.i1.i32(i: i1) : i32
{
  i
}

function {:inline} $zext.i1.i64(i: i1) : i64
{
  i
}

function {:inline} $zext.i1.i8(i: i1) : i8
{
  i
}

function {:inline} $zext.i1.i96(i: i1) : i96
{
  i
}

function {:inline} $zext.i16.i128(i: i16) : i128
{
  i
}

function {:inline} $zext.i16.i32(i: i16) : i32
{
  i
}

function {:inline} $zext.i16.i64(i: i16) : i64
{
  i
}

function {:inline} $zext.i16.i96(i: i16) : i96
{
  i
}

function {:inline} $zext.i32.i128(i: i32) : i128
{
  i
}

function {:inline} $zext.i32.i64(i: i32) : i64
{
  i
}

function {:inline} $zext.i32.i96(i: i32) : i96
{
  i
}

function {:inline} $zext.i64.i128(i: i64) : i128
{
  i
}

function {:inline} $zext.i64.i96(i: i64) : i96
{
  i
}

function {:inline} $zext.i8.i128(i: i8) : i128
{
  i
}

function {:inline} $zext.i8.i16(i: i8) : i16
{
  i
}

function {:inline} $zext.i8.i32(i: i8) : i32
{
  i
}

function {:inline} $zext.i8.i64(i: i8) : i64
{
  i
}

function {:inline} $zext.i8.i96(i: i8) : i96
{
  i
}

function {:inline} $zext.i96.i128(i: i96) : i128
{
  i
}

procedure {:inline 1} $alloc(n: ref) returns (p: ref);
  modifies $CurrAddr, $Alloc;



implementation $alloc(n: ref) returns (p: ref)
{

  anon0:
    assume $sgt.ref.bool($CurrAddr, $0.ref);
    p := $CurrAddr;
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} $sgt.ref.bool(n, $0.ref);
    $CurrAddr := $add.ref($CurrAddr, n);
    goto anon3;

  anon4_Else:
    assume {:partition} !$sgt.ref.bool(n, $0.ref);
    $CurrAddr := $add.ref($CurrAddr, $1.ref);
    goto anon3;

  anon3:
    $Alloc := $Alloc[p := true];
    return;
}



procedure {:inline 1} $free(p: ref);
  modifies $Alloc;



implementation $free(p: ref)
{

  anon0:
    $Alloc := $Alloc[p := false];
    return;
}



procedure boogie_si_record_bool(i: bool);



procedure boogie_si_record_bv1(i: bv1);



procedure boogie_si_record_bv128(i: bv128);



procedure boogie_si_record_bv16(i: bv16);



procedure boogie_si_record_bv32(i: bv32);



procedure boogie_si_record_bv64(i: bv64);



procedure boogie_si_record_bv8(i: bv8);



procedure boogie_si_record_bv96(i: bv96);



procedure boogie_si_record_float(i: float);



procedure boogie_si_record_i1(i: i1);



procedure boogie_si_record_i128(i: i128);



procedure boogie_si_record_i16(i: i16);



procedure boogie_si_record_i32(i: i32);



procedure boogie_si_record_i64(i: i64);



procedure boogie_si_record_i8(i: i8);



procedure boogie_si_record_i96(i: i96);



procedure boogie_si_record_mop(m: $mop);



procedure boogie_si_record_ref(i: ref);



type $mop;

type float;

var $Alloc: [ref]bool;

var $CurrAddr: ref;

var $exn: bool;

var $exnv: int;
