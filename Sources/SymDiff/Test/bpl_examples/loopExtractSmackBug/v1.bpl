type i1 = int;

type i8 = int;

type i16 = int;

type i32 = int;

type i64 = int;

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

axiom $0.ref == 0;

axiom $1.ref == 1;

axiom $2.ref == 2;

axiom $3.ref == 3;

axiom $4.ref == 4;

axiom $5.ref == 5;

axiom $6.ref == 6;

axiom $7.ref == 7;

var $M.0: [ref]i8;

var $M.1: [ref]i8;

var $M.2: [ref]i8;

var $M.3: [ref]i8;

var $M.4: [ref]i8;

var $M.5: i8;

var $M.6: [ref]i8;

var $M.7: [ref]i8;

var $M.8: [ref]i8;

var $M.9: [ref]i8;

var $M.10: [ref]i8;

var $M.11: [ref]i8;

var $M.12: [ref]i8;

var $M.13: [ref]i8;

var $M.14: [ref]i8;

var $M.15: [ref]i8;

var $M.16: [ref]i8;

var $M.17: [ref]i8;

var $M.18: [ref]i8;

var $M.19: [ref]i8;

var $M.20: [ref]i8;

var $M.21: [ref]i8;

var $M.22: [ref]i8;

var $M.23: [ref]i8;

var $M.24: [ref]i8;

var $M.25: [ref]i8;

var $M.26: [ref]i8;

var $M.27: [ref]i8;

var $M.28: [ref]i8;

var $M.29: [ref]i8;

var $M.30: [ref]i8;

var $M.31: [ref]i8;

var $M.32: [ref]i8;

var $M.33: [ref]i8;

var $M.34: [ref]i8;

var $M.35: [ref]i8;

var $M.36: [ref]i8;

var $M.37: [ref]i8;

axiom $GLOBALS_BOTTOM == $sub.ref(0, 634);

axiom $EXTERNS_BOTTOM == $sub.ref(0, 32784);

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

const $u2: i32;

const $u24: i32;

const .str: ref;

const .str1: ref;

const .str10: ref;

const .str11: ref;

const .str12: ref;

const .str13: ref;

const .str14: ref;

const .str15: ref;

const .str16: ref;

const .str17: ref;

const .str18: ref;

const .str19: ref;

const .str2: ref;

const .str20: ref;

const .str21: ref;

const .str22: ref;

const .str23: ref;

const .str24: ref;

const .str25: ref;

const .str26: ref;

const .str27: ref;

const .str28: ref;

const .str29: ref;

const .str3: ref;

const .str30: ref;

const .str31: ref;

const .str32: ref;

const .str4: ref;

const .str5: ref;

const .str6: ref;

const .str7: ref;

const .str8: ref;

const .str9: ref;

const _IO_getc: ref;

const __SMACK_code: ref;

const __SMACK_decls: ref;

const __SMACK_dummy: ref;

const __SMACK_top_decl: ref;

const __ctype_b_loc: ref;

const {:count 81} buffer: ref;

const const_80: ref;

const exit: ref;

const fopen: ref;

const fprintf: ref;

const get_char: ref;

const get_token: ref;

const is_char_constant: ref;

const is_comment: ref;

const is_eof_token: ref;

const is_identifier: ref;

const is_keyword: ref;

const is_num_constant: ref;

const is_spec_symbol: ref;

const is_str_constant: ref;

const is_token_end: ref;

const llvm.dbg.declare: ref;

const llvm.dbg.value: ref;

const main: ref;

const malloc: ref;

const open_character_stream: ref;

const open_token_stream: ref;

const print_spec_symbol: ref;

const print_token: ref;

const stdin: ref;

const stdout: ref;

const strcmp: ref;

const token_type: ref;

const unget_char: ref;

const unget_error: ref;

const ungetc: ref;

procedure $init_funcs();
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation $init_funcs()
{

  anon0:
    return;
}



procedure $static_init();
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation $static_init()
{

  anon0:
    $CurrAddr := 1024;
    $M.5 := 0;
    $M.6 := $M.6[buffer := 0];
    $M.6 := $M.6[$add.ref(buffer, 1) := 0];
    $M.6 := $M.6[$add.ref(buffer, 2) := 0];
    $M.6 := $M.6[$add.ref(buffer, 3) := 0];
    $M.6 := $M.6[$add.ref(buffer, 4) := 0];
    $M.6 := $M.6[$add.ref(buffer, 5) := 0];
    $M.6 := $M.6[$add.ref(buffer, 6) := 0];
    $M.6 := $M.6[$add.ref(buffer, 7) := 0];
    $M.6 := $M.6[$add.ref(buffer, 8) := 0];
    $M.6 := $M.6[$add.ref(buffer, 9) := 0];
    $M.6 := $M.6[$add.ref(buffer, 10) := 0];
    $M.6 := $M.6[$add.ref(buffer, 11) := 0];
    $M.6 := $M.6[$add.ref(buffer, 12) := 0];
    $M.6 := $M.6[$add.ref(buffer, 13) := 0];
    $M.6 := $M.6[$add.ref(buffer, 14) := 0];
    $M.6 := $M.6[$add.ref(buffer, 15) := 0];
    $M.6 := $M.6[$add.ref(buffer, 16) := 0];
    $M.6 := $M.6[$add.ref(buffer, 17) := 0];
    $M.6 := $M.6[$add.ref(buffer, 18) := 0];
    $M.6 := $M.6[$add.ref(buffer, 19) := 0];
    $M.6 := $M.6[$add.ref(buffer, 20) := 0];
    $M.6 := $M.6[$add.ref(buffer, 21) := 0];
    $M.6 := $M.6[$add.ref(buffer, 22) := 0];
    $M.6 := $M.6[$add.ref(buffer, 23) := 0];
    $M.6 := $M.6[$add.ref(buffer, 24) := 0];
    $M.6 := $M.6[$add.ref(buffer, 25) := 0];
    $M.6 := $M.6[$add.ref(buffer, 26) := 0];
    $M.6 := $M.6[$add.ref(buffer, 27) := 0];
    $M.6 := $M.6[$add.ref(buffer, 28) := 0];
    $M.6 := $M.6[$add.ref(buffer, 29) := 0];
    $M.6 := $M.6[$add.ref(buffer, 30) := 0];
    $M.6 := $M.6[$add.ref(buffer, 31) := 0];
    $M.6 := $M.6[$add.ref(buffer, 32) := 0];
    $M.6 := $M.6[$add.ref(buffer, 33) := 0];
    $M.6 := $M.6[$add.ref(buffer, 34) := 0];
    $M.6 := $M.6[$add.ref(buffer, 35) := 0];
    $M.6 := $M.6[$add.ref(buffer, 36) := 0];
    $M.6 := $M.6[$add.ref(buffer, 37) := 0];
    $M.6 := $M.6[$add.ref(buffer, 38) := 0];
    $M.6 := $M.6[$add.ref(buffer, 39) := 0];
    $M.6 := $M.6[$add.ref(buffer, 40) := 0];
    $M.6 := $M.6[$add.ref(buffer, 41) := 0];
    $M.6 := $M.6[$add.ref(buffer, 42) := 0];
    $M.6 := $M.6[$add.ref(buffer, 43) := 0];
    $M.6 := $M.6[$add.ref(buffer, 44) := 0];
    $M.6 := $M.6[$add.ref(buffer, 45) := 0];
    $M.6 := $M.6[$add.ref(buffer, 46) := 0];
    $M.6 := $M.6[$add.ref(buffer, 47) := 0];
    $M.6 := $M.6[$add.ref(buffer, 48) := 0];
    $M.6 := $M.6[$add.ref(buffer, 49) := 0];
    $M.6 := $M.6[$add.ref(buffer, 50) := 0];
    $M.6 := $M.6[$add.ref(buffer, 51) := 0];
    $M.6 := $M.6[$add.ref(buffer, 52) := 0];
    $M.6 := $M.6[$add.ref(buffer, 53) := 0];
    $M.6 := $M.6[$add.ref(buffer, 54) := 0];
    $M.6 := $M.6[$add.ref(buffer, 55) := 0];
    $M.6 := $M.6[$add.ref(buffer, 56) := 0];
    $M.6 := $M.6[$add.ref(buffer, 57) := 0];
    $M.6 := $M.6[$add.ref(buffer, 58) := 0];
    $M.6 := $M.6[$add.ref(buffer, 59) := 0];
    $M.6 := $M.6[$add.ref(buffer, 60) := 0];
    $M.6 := $M.6[$add.ref(buffer, 61) := 0];
    $M.6 := $M.6[$add.ref(buffer, 62) := 0];
    $M.6 := $M.6[$add.ref(buffer, 63) := 0];
    $M.6 := $M.6[$add.ref(buffer, 64) := 0];
    $M.6 := $M.6[$add.ref(buffer, 65) := 0];
    $M.6 := $M.6[$add.ref(buffer, 66) := 0];
    $M.6 := $M.6[$add.ref(buffer, 67) := 0];
    $M.6 := $M.6[$add.ref(buffer, 68) := 0];
    $M.6 := $M.6[$add.ref(buffer, 69) := 0];
    $M.6 := $M.6[$add.ref(buffer, 70) := 0];
    $M.6 := $M.6[$add.ref(buffer, 71) := 0];
    $M.6 := $M.6[$add.ref(buffer, 72) := 0];
    $M.6 := $M.6[$add.ref(buffer, 73) := 0];
    $M.6 := $M.6[$add.ref(buffer, 74) := 0];
    $M.6 := $M.6[$add.ref(buffer, 75) := 0];
    $M.6 := $M.6[$add.ref(buffer, 76) := 0];
    $M.6 := $M.6[$add.ref(buffer, 77) := 0];
    $M.6 := $M.6[$add.ref(buffer, 78) := 0];
    $M.6 := $M.6[$add.ref(buffer, 79) := 0];
    $M.6 := $M.6[$add.ref(buffer, 80) := 0];
    return;
}



procedure _IO_getc($p0: ref) returns (r: i32);



procedure __SMACK_code.ref($p0: ref);



procedure __SMACK_dummy(v: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation __SMACK_dummy(v: i32)
{

  $bb0:
    assert {:sourcefile "../../../../share/smack/lib/smack.c"} {:sourceline 31} true;
    assume true;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "../../../../share/smack/lib/smack.c"} {:sourceline 32} true;
    $exn := false;
    return;
}



procedure __SMACK_top_decl.ref($p0: ref);



procedure __ctype_b_loc() returns (r: ref);



procedure exit($i0: i32);



procedure fopen($p0: ref, $p1: ref) returns (r: ref);



procedure fprintf.ref.ref($p0: ref, $p1: ref) returns (r: i32);



procedure fprintf.ref.ref.ref($p0: ref, $p1: ref, $p2: ref) returns (r: i32);



procedure get_char(fp: ref) returns ($r: i8);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation get_char(fp: ref) returns ($r: i8)
{
  var $i0: i32;
  var $i1: i8;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 80} true;
    call $i0 := _IO_getc(fp);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 80} true;
    $i1 := $trunc.i32.i8($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 81} true;
    $r := $i1;
    $exn := false;
    return;
}



procedure get_token(tp: ref) returns ($r: ref);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation get_token(tp: ref) returns ($r: ref)
{
  var $i1: i32;
  var $i10: i8;
  var $i11: i32;
  var $i12: i1;
  var $i13: i32;
  var $i14: i1;
  var $i15: i8;
  var $i16: i64;
  var $i18: i32;
  var $i19: i1;
  var $i2: i32;
  var $i20: i32;
  var $i21: i1;
  var $i22: i32;
  var $i23: i1;
  var $i24: i32;
  var $i25: i32;
  var $i26: i1;
  var $i27: i32;
  var $i28: i8;
  var $i29: i32;
  var $i3: i1;
  var $i30: i8;
  var $i31: i32;
  var $i32: i32;
  var $i33: i1;
  var $i34: i32;
  var $i35: i64;
  var $i37: i8;
  var $i4: i64;
  var $i40: i32;
  var $i41: i1;
  var $i42: i32;
  var $i43: i8;
  var $i44: i32;
  var $i45: i1;
  var $i46: i32;
  var $i48: i32;
  var $i49: i1;
  var $i50: i32;
  var $i51: i8;
  var $i52: i32;
  var $i53: i1;
  var $i54: i32;
  var $i55: i1;
  var $i56: i32;
  var $i57: i64;
  var $i59: i1;
  var $i6: i32;
  var $i60: i32;
  var $i61: i1;
  var $i62: i32;
  var $i63: i8;
  var $i64: i32;
  var $i65: i1;
  var $i66: i32;
  var $i9: i8;
  var $p0: ref;
  var $p17: ref;
  var $p36: ref;
  var $p38: ref;
  var $p39: ref;
  var $p47: ref;
  var $p5: ref;
  var $p58: ref;
  var $p7: ref;
  var $p8: ref;

  $bb0:
    call $p0 := $alloc($mul.ref(2, 1));
    assume true;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 151} true;
    $i1 := 0;
    goto $bb1;

  $bb1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 151} true;
    $i2 := $M.5;
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 151} true;
    $i3 := $sle.i32($i1, $i2);
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 151} true;
    goto $bb2, $bb3;

  $bb2:
    assume $i3 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 152} true;
    $i4 := $sext.i32.i64($i1);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 152} true;
    $p5 := $add.ref(buffer, $mul.ref($i4, 1));
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 152} true;
    $M.6 := $M.6[$p5 := 0];
    goto $bb2_splitSourceLine_3;

  $bb2_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 151} true;
    $i6 := $add.i32($i1, 1);
    goto $bb2_splitSourceLine_4;

  $bb2_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 151} true;
    $i1 := $i6;
    goto $bb1;

  $bb3:
    assume !($i3 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 153} true;
    $p7 := $p0;
    goto $bb3_splitSourceLine_1;

  $bb3_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 153} true;
    $M.6 := $M.6[$p7 := 0];
    goto $bb3_splitSourceLine_2;

  $bb3_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 154} true;
    $p8 := $add.ref($p0, 1);
    goto $bb3_splitSourceLine_3;

  $bb3_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 154} true;
    $M.6 := $M.6[$p8 := 0];
    goto $bb3_splitSourceLine_4;

  $bb3_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 155} true;
    call $i9 := get_char(tp);
    goto $bb3_splitSourceLine_5;

  $bb3_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    $i10 := $i9;
    goto $bb4;

  $bb4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    $i11 := $sext.i8.i32($i10);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    $i12 := $eq.i32($i11, 32);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    goto $bb5, $bb7;

  $bb5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    assume $i12 == 1;
    goto $bb6;

  $bb6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 158} true;
    call $i15 := get_char(tp);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 159} true;
    $i10 := $i15;
    goto $bb4;

  $bb7:
    assume !($i12 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    $i13 := $sext.i8.i32($i10);
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    $i14 := $eq.i32($i13, 10);
    goto $bb7_splitSourceLine_2;

  $bb7_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    goto $bb8, $bb9;

  $bb8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 156} true;
    assume $i14 == 1;
    goto $bb6;

  $bb9:
    assume !($i14 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 160} true;
    $i16 := $sext.i32.i64(0);
    goto $bb9_splitSourceLine_1;

  $bb9_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 160} true;
    $p17 := $add.ref(buffer, $mul.ref($i16, 1));
    goto $bb9_splitSourceLine_2;

  $bb9_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 160} true;
    $M.6 := $M.6[$p17 := $i10];
    goto $bb9_splitSourceLine_3;

  $bb9_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 161} true;
    call $i18 := is_eof_token(buffer);
    goto $bb9_splitSourceLine_4;

  $bb9_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 161} true;
    $i19 := $eq.i32($i18, 1);
    goto $bb9_splitSourceLine_5;

  $bb9_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 161} true;
    goto $bb10, $bb11;

  $bb10:
    assume $i19 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 161} true;
    goto $bb12;

  $bb11:
    assume !($i19 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 162} true;
    call $i20 := is_spec_symbol(buffer);
    goto $bb11_splitSourceLine_1;

  $bb11_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 162} true;
    $i21 := $eq.i32($i20, 1);
    goto $bb11_splitSourceLine_2;

  $bb11_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 162} true;
    goto $bb13, $bb14;

  $bb12:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 196} true;
    $r := buffer;
    $exn := false;
    return;

  $bb13:
    assume $i21 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 162} true;
    goto $bb12;

  $bb14:
    assume !($i21 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 163} true;
    $i22 := $sext.i8.i32($i10);
    goto $bb14_splitSourceLine_1;

  $bb14_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 163} true;
    $i23 := $eq.i32($i22, 34);
    goto $bb14_splitSourceLine_2;

  $bb14_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 163} true;
    $i24 := 0;
    goto $bb15, $bb16;

  $bb15:
    assume $i23 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 163} true;
    $i24 := 1;
    goto $bb17;

  $bb16:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 163} true;
    assume !($i23 == 1);
    goto $bb17;

  $bb17:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 164} true;
    $i25 := $sext.i8.i32($i10);
    goto $bb17_splitSourceLine_1;

  $bb17_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 164} true;
    $i26 := $eq.i32($i25, 59);
    goto $bb17_splitSourceLine_2;

  $bb17_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 164} true;
    $i27 := $i24;
    goto $bb18, $bb19;

  $bb18:
    assume $i26 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 164} true;
    $i27 := 2;
    goto $bb20;

  $bb19:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 164} true;
    assume !($i26 == 1);
    goto $bb20;

  $bb20:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 165} true;
    call $i28 := get_char(tp);
    goto $bb20_splitSourceLine_1;

  $bb20_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 167} true;
    $i29, $i30 := 0, $i28;
    goto $bb21;

  $bb21:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 167} true;
    $i31 := $sext.i8.i32($i30);
    goto $bb21_splitSourceLine_1;

  $bb21_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 167} true;
    call $i32 := is_token_end($i27, $i31);
    goto $bb21_splitSourceLine_2;

  $bb21_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 167} true;
    $i33 := $eq.i32($i32, 0);
    goto $bb21_splitSourceLine_3;

  $bb21_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 167} true;
    goto $bb22, $bb23;

  $bb22:
    assume $i33 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 169} true;
    $i34 := $add.i32($i29, 1);
    goto $bb22_splitSourceLine_1;

  $bb22_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 170} true;
    $i35 := $sext.i32.i64($i34);
    goto $bb22_splitSourceLine_2;

  $bb22_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 170} true;
    $p36 := $add.ref(buffer, $mul.ref($i35, 1));
    goto $bb22_splitSourceLine_3;

  $bb22_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 170} true;
    $M.6 := $M.6[$p36 := $i30];
    goto $bb22_splitSourceLine_4;

  $bb22_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 171} true;
    call $i37 := get_char(tp);
    goto $bb22_splitSourceLine_5;

  $bb22_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 172} true;
    $i29, $i30 := $i34, $i37;
    goto $bb21;

  $bb23:
    assume !($i33 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 173} true;
    $p38 := $p0;
    goto $bb23_splitSourceLine_1;

  $bb23_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 173} true;
    $M.6 := $M.6[$p38 := $i30];
    goto $bb23_splitSourceLine_2;

  $bb23_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 174} true;
    $p39 := $p0;
    goto $bb23_splitSourceLine_3;

  $bb23_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 174} true;
    call $i40 := is_eof_token($p39);
    goto $bb23_splitSourceLine_4;

  $bb23_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 174} true;
    $i41 := $eq.i32($i40, 1);
    goto $bb23_splitSourceLine_5;

  $bb23_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 174} true;
    goto $bb24, $bb25;

  $bb24:
    assume $i41 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 175} true;
    $i42 := $sext.i8.i32($i30);
    goto $bb24_splitSourceLine_1;

  $bb24_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 175} true;
    call $i43 := unget_char($i42, tp);
    goto $bb24_splitSourceLine_2;

  $bb24_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 176} true;
    $i44 := $sext.i8.i32($i43);
    goto $bb24_splitSourceLine_3;

  $bb24_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 176} true;
    $i45 := $eq.i32($i44, $sub.i32(0, 1));
    goto $bb24_splitSourceLine_4;

  $bb24_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 176} true;
    goto $bb26, $bb27;

  $bb25:
    assume !($i41 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 179} true;
    $p47 := $p0;
    goto $bb25_splitSourceLine_1;

  $bb25_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 179} true;
    call $i48 := is_spec_symbol($p47);
    goto $bb25_splitSourceLine_2;

  $bb25_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 179} true;
    $i49 := $eq.i32($i48, 1);
    goto $bb25_splitSourceLine_3;

  $bb25_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 179} true;
    goto $bb29, $bb30;

  $bb26:
    assume $i45 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 176} true;
    call $i46 := unget_error(tp);
    goto $bb26_splitSourceLine_1;

  $bb26_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 176} true;
    goto $bb28;

  $bb27:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 176} true;
    assume !($i45 == 1);
    goto $bb28;

  $bb28:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 177} true;
    goto $bb12;

  $bb29:
    assume $i49 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 180} true;
    $i50 := $sext.i8.i32($i30);
    goto $bb29_splitSourceLine_1;

  $bb29_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 180} true;
    call $i51 := unget_char($i50, tp);
    goto $bb29_splitSourceLine_2;

  $bb29_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 181} true;
    $i52 := $sext.i8.i32($i51);
    goto $bb29_splitSourceLine_3;

  $bb29_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 181} true;
    $i53 := $eq.i32($i52, $sub.i32(0, 1));
    goto $bb29_splitSourceLine_4;

  $bb29_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 181} true;
    goto $bb31, $bb32;

  $bb30:
    assume !($i49 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 184} true;
    $i55 := $eq.i32($i27, 1);
    goto $bb30_splitSourceLine_1;

  $bb30_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 184} true;
    goto $bb34, $bb35;

  $bb31:
    assume $i53 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 181} true;
    call $i54 := unget_error(tp);
    goto $bb31_splitSourceLine_1;

  $bb31_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 181} true;
    goto $bb33;

  $bb32:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 181} true;
    assume !($i53 == 1);
    goto $bb33;

  $bb33:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 182} true;
    goto $bb12;

  $bb34:
    assume $i55 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 185} true;
    $i56 := $add.i32($i29, 1);
    goto $bb34_splitSourceLine_1;

  $bb34_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 186} true;
    $i57 := $sext.i32.i64($i56);
    goto $bb34_splitSourceLine_2;

  $bb34_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 186} true;
    $p58 := $add.ref(buffer, $mul.ref($i57, 1));
    goto $bb34_splitSourceLine_3;

  $bb34_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 186} true;
    $M.6 := $M.6[$p58 := $i30];
    goto $bb34_splitSourceLine_4;

  $bb34_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 187} true;
    goto $bb12;

  $bb35:
    assume !($i55 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    $i59 := $eq.i32($i27, 0);
    goto $bb35_splitSourceLine_1;

  $bb35_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    goto $bb36, $bb37;

  $bb36:
    assume $i59 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    $i60 := $sext.i8.i32($i30);
    goto $bb36_splitSourceLine_1;

  $bb36_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    $i61 := $eq.i32($i60, 59);
    goto $bb36_splitSourceLine_2;

  $bb36_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    goto $bb39, $bb40;

  $bb37:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    assume !($i59 == 1);
    goto $bb38;

  $bb38:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 195} true;
    goto $bb12;

  $bb39:
    assume $i61 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 191} true;
    $i62 := $sext.i8.i32($i30);
    goto $bb39_splitSourceLine_1;

  $bb39_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 191} true;
    call $i63 := unget_char($i62, tp);
    goto $bb39_splitSourceLine_2;

  $bb39_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 192} true;
    $i64 := $sext.i8.i32($i63);
    goto $bb39_splitSourceLine_3;

  $bb39_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 192} true;
    $i65 := $eq.i32($i64, $sub.i32(0, 1));
    goto $bb39_splitSourceLine_4;

  $bb39_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 192} true;
    goto $bb41, $bb42;

  $bb40:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 189} true;
    assume !($i61 == 1);
    goto $bb38;

  $bb41:
    assume $i65 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 192} true;
    call $i66 := unget_error(tp);
    goto $bb41_splitSourceLine_1;

  $bb41_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 192} true;
    goto $bb43;

  $bb42:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 192} true;
    assume !($i65 == 1);
    goto $bb43;

  $bb43:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 193} true;
    goto $bb12;
}



procedure is_char_constant(str: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_char_constant(str: ref) returns ($r: i32)
{
  var $i0: i8;
  var $i1: i32;
  var $i10: i16;
  var $i11: i32;
  var $i12: i32;
  var $i13: i1;
  var $i14: i32;
  var $i2: i1;
  var $i4: i8;
  var $i5: i32;
  var $i6: i64;
  var $p3: ref;
  var $p7: ref;
  var $p8: ref;
  var $p9: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i0 := $M.6[str];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i2 := $eq.i32($i1, 35);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i2 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $p3 := $add.ref(str, 1);
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i4 := $M.6[$p3];
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i5 := $sext.i8.i32($i4);
    goto $bb1_splitSourceLine_3;

  $bb1_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i6 := $sext.i32.i64($i5);
    goto $bb1_splitSourceLine_4;

  $bb1_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    call $p7 := __ctype_b_loc();
    goto $bb1_splitSourceLine_5;

  $bb1_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $p8 := $M.0[$p7];
    goto $bb1_splitSourceLine_6;

  $bb1_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $p9 := $add.ref($p8, $mul.ref($i6, 2));
    goto $bb1_splitSourceLine_7;

  $bb1_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i10 := $M.0[$p9];
    goto $bb1_splitSourceLine_8;

  $bb1_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i11 := $zext.i16.i32($i10);
    goto $bb1_splitSourceLine_9;

  $bb1_splitSourceLine_9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i12 := $and.i32($i11, 1024);
    goto $bb1_splitSourceLine_10;

  $bb1_splitSourceLine_10:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    $i13 := $ne.i32($i12, 0);
    goto $bb1_splitSourceLine_11;

  $bb1_splitSourceLine_11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    goto $bb4, $bb5;

  $bb2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    assume !($i2 == 1);
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 341} true;
    $i14 := 0;
    goto $bb6;

  $bb4:
    assume $i13 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 339} true;
    $i14 := 1;
    goto $bb6;

  $bb5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 338} true;
    assume !($i13 == 1);
    goto $bb3;

  $bb6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 342} true;
    $r := $i14;
    $exn := false;
    return;
}



procedure is_comment(ident: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_comment(ident: ref) returns ($r: i32)
{
  var $i0: i8;
  var $i1: i32;
  var $i2: i1;
  var $i3: i32;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 309} true;
    $i0 := $M.6[ident];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 309} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 309} true;
    $i2 := $eq.i32($i1, 59);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 309} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i2 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 310} true;
    $i3 := 1;
    goto $bb3;

  $bb2:
    assume !($i2 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 312} true;
    $i3 := 0;
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 313} true;
    $r := $i3;
    $exn := false;
    return;
}



procedure is_eof_token(tok: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_eof_token(tok: ref) returns ($r: i32)
{
  var $i0: i8;
  var $i1: i32;
  var $i2: i1;
  var $i3: i32;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 295} true;
    $i0 := $M.6[tok];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 295} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 295} true;
    $i2 := $eq.i32($i1, $sub.i32(0, 1));
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 295} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i2 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 296} true;
    $i3 := 1;
    goto $bb3;

  $bb2:
    assume !($i2 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 298} true;
    $i3 := 0;
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 299} true;
    $r := $i3;
    $exn := false;
    return;
}



procedure is_identifier(str: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_identifier(str: ref) returns ($r: i32)
{
  var $i0: i8;
  var $i1: i32;
  var $i10: i32;
  var $i11: i64;
  var $i13: i8;
  var $i14: i32;
  var $i15: i1;
  var $i16: i64;
  var $i18: i8;
  var $i19: i32;
  var $i2: i64;
  var $i20: i64;
  var $i24: i16;
  var $i25: i32;
  var $i26: i32;
  var $i27: i1;
  var $i28: i64;
  var $i30: i8;
  var $i31: i32;
  var $i32: i64;
  var $i36: i16;
  var $i37: i32;
  var $i38: i32;
  var $i39: i1;
  var $i40: i32;
  var $i41: i32;
  var $i6: i16;
  var $i7: i32;
  var $i8: i32;
  var $i9: i1;
  var $p12: ref;
  var $p17: ref;
  var $p21: ref;
  var $p22: ref;
  var $p23: ref;
  var $p29: ref;
  var $p3: ref;
  var $p33: ref;
  var $p34: ref;
  var $p35: ref;
  var $p4: ref;
  var $p5: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i0 := $M.6[str];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i2 := $sext.i32.i64($i1);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    call $p3 := __ctype_b_loc();
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $p4 := $M.0[$p3];
    goto $bb0_splitSourceLine_5;

  $bb0_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $p5 := $add.ref($p4, $mul.ref($i2, 2));
    goto $bb0_splitSourceLine_6;

  $bb0_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i6 := $M.0[$p5];
    goto $bb0_splitSourceLine_7;

  $bb0_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i7 := $zext.i16.i32($i6);
    goto $bb0_splitSourceLine_8;

  $bb0_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i8 := $and.i32($i7, 1024);
    goto $bb0_splitSourceLine_9;

  $bb0_splitSourceLine_9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i9 := $ne.i32($i8, 0);
    goto $bb0_splitSourceLine_10;

  $bb0_splitSourceLine_10:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    $i10 := 1;
    goto $bb1, $bb3;

  $bb1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 401} true;
    assume $i9 == 1;
    goto $bb2;

  $bb2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 403} true;
    $i11 := $sext.i32.i64($i10);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 403} true;
    $p12 := $add.ref(str, $mul.ref($i11, 1));
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 403} true;
    $i13 := $M.6[$p12];
    goto $bb2_splitSourceLine_3;

  $bb2_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 403} true;
    $i14 := $sext.i8.i32($i13);
    goto $bb2_splitSourceLine_4;

  $bb2_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 403} true;
    $i15 := $ne.i32($i14, 0);
    goto $bb2_splitSourceLine_5;

  $bb2_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 403} true;
    goto $bb4, $bb5;

  $bb3:
    assume !($i9 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 413} true;
    $i41 := 0;
    goto $bb11;

  $bb4:
    assume $i15 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i16 := $sext.i32.i64($i10);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $p17 := $add.ref(str, $mul.ref($i16, 1));
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i18 := $M.6[$p17];
    goto $bb4_splitSourceLine_3;

  $bb4_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i19 := $sext.i8.i32($i18);
    goto $bb4_splitSourceLine_4;

  $bb4_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i20 := $sext.i32.i64($i19);
    goto $bb4_splitSourceLine_5;

  $bb4_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    call $p21 := __ctype_b_loc();
    goto $bb4_splitSourceLine_6;

  $bb4_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $p22 := $M.0[$p21];
    goto $bb4_splitSourceLine_7;

  $bb4_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $p23 := $add.ref($p22, $mul.ref($i20, 2));
    goto $bb4_splitSourceLine_8;

  $bb4_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i24 := $M.0[$p23];
    goto $bb4_splitSourceLine_9;

  $bb4_splitSourceLine_9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i25 := $zext.i16.i32($i24);
    goto $bb4_splitSourceLine_10;

  $bb4_splitSourceLine_10:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i26 := $and.i32($i25, 1024);
    goto $bb4_splitSourceLine_11;

  $bb4_splitSourceLine_11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i27 := $ne.i32($i26, 0);
    goto $bb4_splitSourceLine_12;

  $bb4_splitSourceLine_12:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    goto $bb6, $bb8;

  $bb5:
    assume !($i15 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 410} true;
    $i41 := 1;
    goto $bb11;

  $bb6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    assume $i27 == 1;
    goto $bb7;

  $bb7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 406} true;
    $i40 := $add.i32($i10, 1);
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 409} true;
    $i10 := $i40;
    goto $bb2;

  $bb8:
    assume !($i27 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i28 := $sext.i32.i64($i10);
    goto $bb8_splitSourceLine_1;

  $bb8_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $p29 := $add.ref(str, $mul.ref($i28, 1));
    goto $bb8_splitSourceLine_2;

  $bb8_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i30 := $M.6[$p29];
    goto $bb8_splitSourceLine_3;

  $bb8_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i31 := $sext.i8.i32($i30);
    goto $bb8_splitSourceLine_4;

  $bb8_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i32 := $sext.i32.i64($i31);
    goto $bb8_splitSourceLine_5;

  $bb8_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    call $p33 := __ctype_b_loc();
    goto $bb8_splitSourceLine_6;

  $bb8_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $p34 := $M.0[$p33];
    goto $bb8_splitSourceLine_7;

  $bb8_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $p35 := $add.ref($p34, $mul.ref($i32, 2));
    goto $bb8_splitSourceLine_8;

  $bb8_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i36 := $M.0[$p35];
    goto $bb8_splitSourceLine_9;

  $bb8_splitSourceLine_9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i37 := $zext.i16.i32($i36);
    goto $bb8_splitSourceLine_10;

  $bb8_splitSourceLine_10:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i38 := $and.i32($i37, 2048);
    goto $bb8_splitSourceLine_11;

  $bb8_splitSourceLine_11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    $i39 := $ne.i32($i38, 0);
    goto $bb8_splitSourceLine_12;

  $bb8_splitSourceLine_12:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    goto $bb9, $bb10;

  $bb9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 405} true;
    assume $i39 == 1;
    goto $bb7;

  $bb10:
    assume !($i39 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 408} true;
    $i41 := 0;
    goto $bb11;

  $bb11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 414} true;
    $r := $i41;
    $exn := false;
    return;
}



procedure is_keyword(str: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_keyword(str: ref) returns ($r: i32)
{
  var $i0: i32;
  var $i1: i1;
  var $i10: i32;
  var $i11: i1;
  var $i12: i32;
  var $i2: i32;
  var $i3: i1;
  var $i4: i32;
  var $i5: i1;
  var $i6: i32;
  var $i7: i1;
  var $i8: i32;
  var $i9: i1;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    call $i0 := strcmp(str, .str27);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    $i1 := $ne.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i1 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    call $i2 := strcmp(str, .str28);
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    $i3 := $ne.i32($i2, 0);
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    goto $bb4, $bb5;

  $bb2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    assume !($i1 == 1);
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 325} true;
    $i12 := 1;
    goto $bb14;

  $bb4:
    assume $i3 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    call $i4 := strcmp(str, .str29);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    $i5 := $ne.i32($i4, 0);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    goto $bb6, $bb7;

  $bb5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    assume !($i3 == 1);
    goto $bb3;

  $bb6:
    assume $i5 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    call $i6 := strcmp(str, .str30);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    $i7 := $ne.i32($i6, 0);
    goto $bb6_splitSourceLine_2;

  $bb6_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    goto $bb8, $bb9;

  $bb7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 323} true;
    assume !($i5 == 1);
    goto $bb3;

  $bb8:
    assume $i7 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    call $i8 := strcmp(str, .str31);
    goto $bb8_splitSourceLine_1;

  $bb8_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    $i9 := $ne.i32($i8, 0);
    goto $bb8_splitSourceLine_2;

  $bb8_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    goto $bb10, $bb11;

  $bb9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    assume !($i7 == 1);
    goto $bb3;

  $bb10:
    assume $i9 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    call $i10 := strcmp(str, .str32);
    goto $bb10_splitSourceLine_1;

  $bb10_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    $i11 := $ne.i32($i10, 0);
    goto $bb10_splitSourceLine_2;

  $bb10_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    goto $bb12, $bb13;

  $bb11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    assume !($i9 == 1);
    goto $bb3;

  $bb12:
    assume $i11 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 327} true;
    $i12 := 0;
    goto $bb14;

  $bb13:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 324} true;
    assume !($i11 == 1);
    goto $bb3;

  $bb14:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 328} true;
    $r := $i12;
    $exn := false;
    return;
}



procedure is_num_constant(str: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_num_constant(str: ref) returns ($r: i32)
{
  var $i0: i8;
  var $i1: i32;
  var $i10: i32;
  var $i11: i64;
  var $i13: i8;
  var $i14: i32;
  var $i15: i1;
  var $i16: i64;
  var $i18: i8;
  var $i19: i32;
  var $i2: i64;
  var $i20: i64;
  var $i24: i16;
  var $i25: i32;
  var $i26: i32;
  var $i27: i1;
  var $i28: i32;
  var $i29: i32;
  var $i6: i16;
  var $i7: i32;
  var $i8: i32;
  var $i9: i1;
  var $p12: ref;
  var $p17: ref;
  var $p21: ref;
  var $p22: ref;
  var $p23: ref;
  var $p3: ref;
  var $p4: ref;
  var $p5: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i0 := $M.6[str];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i2 := $sext.i32.i64($i1);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    call $p3 := __ctype_b_loc();
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $p4 := $M.0[$p3];
    goto $bb0_splitSourceLine_5;

  $bb0_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $p5 := $add.ref($p4, $mul.ref($i2, 2));
    goto $bb0_splitSourceLine_6;

  $bb0_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i6 := $M.0[$p5];
    goto $bb0_splitSourceLine_7;

  $bb0_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i7 := $zext.i16.i32($i6);
    goto $bb0_splitSourceLine_8;

  $bb0_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i8 := $and.i32($i7, 2048);
    goto $bb0_splitSourceLine_9;

  $bb0_splitSourceLine_9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i9 := $ne.i32($i8, 0);
    goto $bb0_splitSourceLine_10;

  $bb0_splitSourceLine_10:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    $i10 := 1;
    goto $bb1, $bb3;

  $bb1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 354} true;
    assume $i9 == 1;
    goto $bb2;

  $bb2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 356} true;
    $i11 := $sext.i32.i64($i10);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 356} true;
    $p12 := $add.ref(str, $mul.ref($i11, 1));
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 356} true;
    $i13 := $M.6[$p12];
    goto $bb2_splitSourceLine_3;

  $bb2_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 356} true;
    $i14 := $sext.i8.i32($i13);
    goto $bb2_splitSourceLine_4;

  $bb2_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 356} true;
    $i15 := $ne.i32($i14, 0);
    goto $bb2_splitSourceLine_5;

  $bb2_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 356} true;
    goto $bb4, $bb5;

  $bb3:
    assume !($i9 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 366} true;
    $i29 := 0;
    goto $bb8;

  $bb4:
    assume $i15 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i16 := $sext.i32.i64($i10);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $p17 := $add.ref(str, $mul.ref($i16, 1));
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i18 := $M.6[$p17];
    goto $bb4_splitSourceLine_3;

  $bb4_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i19 := $sext.i8.i32($i18);
    goto $bb4_splitSourceLine_4;

  $bb4_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i20 := $sext.i32.i64($i19);
    goto $bb4_splitSourceLine_5;

  $bb4_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    call $p21 := __ctype_b_loc();
    goto $bb4_splitSourceLine_6;

  $bb4_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $p22 := $M.0[$p21];
    goto $bb4_splitSourceLine_7;

  $bb4_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $p23 := $add.ref($p22, $mul.ref($i20, 2));
    goto $bb4_splitSourceLine_8;

  $bb4_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i24 := $M.0[$p23];
    goto $bb4_splitSourceLine_9;

  $bb4_splitSourceLine_9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i25 := $zext.i16.i32($i24);
    goto $bb4_splitSourceLine_10;

  $bb4_splitSourceLine_10:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i26 := $and.i32($i25, 2048);
    goto $bb4_splitSourceLine_11;

  $bb4_splitSourceLine_11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    $i27 := $ne.i32($i26, 0);
    goto $bb4_splitSourceLine_12;

  $bb4_splitSourceLine_12:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 358} true;
    goto $bb6, $bb7;

  $bb5:
    assume !($i15 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 363} true;
    $i29 := 1;
    goto $bb8;

  $bb6:
    assume $i27 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 359} true;
    $i28 := $add.i32($i10, 1);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 362} true;
    $i10 := $i28;
    goto $bb2;

  $bb7:
    assume !($i27 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 361} true;
    $i29 := 0;
    goto $bb8;

  $bb8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 367} true;
    $r := $i29;
    $exn := false;
    return;
}



procedure is_spec_symbol(str: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_spec_symbol(str: ref) returns ($r: i32)
{
  var $i0: i32;
  var $i1: i1;
  var $i10: i1;
  var $i11: i32;
  var $i12: i1;
  var $i13: i32;
  var $i14: i1;
  var $i2: i32;
  var $i3: i32;
  var $i4: i1;
  var $i5: i32;
  var $i6: i1;
  var $i7: i32;
  var $i8: i1;
  var $i9: i32;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 479} true;
    call $i0 := strcmp(str, .str11);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 479} true;
    $i1 := $ne.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 479} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i1 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 483} true;
    call $i3 := strcmp(str, .str12);
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 483} true;
    $i4 := $ne.i32($i3, 0);
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 483} true;
    goto $bb4, $bb5;

  $bb2:
    assume !($i1 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 481} true;
    $i2 := 1;
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 508} true;
    $r := $i2;
    $exn := false;
    return;

  $bb4:
    assume $i4 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 487} true;
    call $i5 := strcmp(str, .str13);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 487} true;
    $i6 := $ne.i32($i5, 0);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 487} true;
    goto $bb6, $bb7;

  $bb5:
    assume !($i4 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 485} true;
    $i2 := 1;
    goto $bb3;

  $bb6:
    assume $i6 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 491} true;
    call $i7 := strcmp(str, .str14);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 491} true;
    $i8 := $ne.i32($i7, 0);
    goto $bb6_splitSourceLine_2;

  $bb6_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 491} true;
    goto $bb8, $bb9;

  $bb7:
    assume !($i6 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 489} true;
    $i2 := 1;
    goto $bb3;

  $bb8:
    assume $i8 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 495} true;
    call $i9 := strcmp(str, .str15);
    goto $bb8_splitSourceLine_1;

  $bb8_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 495} true;
    $i10 := $ne.i32($i9, 0);
    goto $bb8_splitSourceLine_2;

  $bb8_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 495} true;
    goto $bb10, $bb11;

  $bb9:
    assume !($i8 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 493} true;
    $i2 := 1;
    goto $bb3;

  $bb10:
    assume $i10 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 499} true;
    call $i11 := strcmp(str, .str16);
    goto $bb10_splitSourceLine_1;

  $bb10_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 499} true;
    $i12 := $ne.i32($i11, 0);
    goto $bb10_splitSourceLine_2;

  $bb10_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 499} true;
    goto $bb12, $bb13;

  $bb11:
    assume !($i10 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 497} true;
    $i2 := 1;
    goto $bb3;

  $bb12:
    assume $i12 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 503} true;
    call $i13 := strcmp(str, .str17);
    goto $bb12_splitSourceLine_1;

  $bb12_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 503} true;
    $i14 := $ne.i32($i13, 0);
    goto $bb12_splitSourceLine_2;

  $bb12_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 503} true;
    goto $bb14, $bb15;

  $bb13:
    assume !($i12 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 501} true;
    $i2 := 1;
    goto $bb3;

  $bb14:
    assume $i14 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 507} true;
    $i2 := 0;
    goto $bb3;

  $bb15:
    assume !($i14 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 505} true;
    $i2 := 1;
    goto $bb3;
}



procedure is_str_constant(str: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_str_constant(str: ref) returns ($r: i32)
{
  var $i0: i8;
  var $i1: i32;
  var $i11: i8;
  var $i12: i32;
  var $i13: i1;
  var $i14: i32;
  var $i15: i32;
  var $i2: i1;
  var $i3: i32;
  var $i4: i64;
  var $i6: i8;
  var $i7: i32;
  var $i8: i1;
  var $i9: i64;
  var $p10: ref;
  var $p5: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 379} true;
    $i0 := $M.6[str];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 379} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 379} true;
    $i2 := $eq.i32($i1, 34);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 379} true;
    $i3 := 1;
    goto $bb1, $bb3;

  $bb1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 379} true;
    assume $i2 == 1;
    goto $bb2;

  $bb2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 380} true;
    $i4 := $sext.i32.i64($i3);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 380} true;
    $p5 := $add.ref(str, $mul.ref($i4, 1));
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 380} true;
    $i6 := $M.6[$p5];
    goto $bb2_splitSourceLine_3;

  $bb2_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 380} true;
    $i7 := $sext.i8.i32($i6);
    goto $bb2_splitSourceLine_4;

  $bb2_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 380} true;
    $i8 := $ne.i32($i7, 0);
    goto $bb2_splitSourceLine_5;

  $bb2_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 380} true;
    goto $bb4, $bb5;

  $bb3:
    assume !($i2 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 389} true;
    $i14 := 0;
    goto $bb8;

  $bb4:
    assume $i8 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 381} true;
    $i9 := $sext.i32.i64($i3);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 381} true;
    $p10 := $add.ref(str, $mul.ref($i9, 1));
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 381} true;
    $i11 := $M.6[$p10];
    goto $bb4_splitSourceLine_3;

  $bb4_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 381} true;
    $i12 := $sext.i8.i32($i11);
    goto $bb4_splitSourceLine_4;

  $bb4_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 381} true;
    $i13 := $eq.i32($i12, 34);
    goto $bb4_splitSourceLine_5;

  $bb4_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 381} true;
    goto $bb6, $bb7;

  $bb5:
    assume !($i8 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 386} true;
    $i14 := 0;
    goto $bb8;

  $bb6:
    assume $i13 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 382} true;
    $i14 := 1;
    goto $bb8;

  $bb7:
    assume !($i13 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 384} true;
    $i15 := $add.i32($i3, 1);
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 385} true;
    $i3 := $i15;
    goto $bb2;

  $bb8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 390} true;
    $r := $i14;
    $exn := false;
    return;
}



procedure is_token_end(str_com_id: i32, p.1: i32) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation is_token_end(str_com_id: i32, p.1: i32) returns ($r: i32)
{
  var $i1: i8;
  var $i10: i1;
  var $i11: i32;
  var $i12: i32;
  var $i13: i1;
  var $i14: i32;
  var $i15: i32;
  var $i16: i1;
  var $i17: i1;
  var $i18: i32;
  var $i19: i1;
  var $i21: i32;
  var $i22: i1;
  var $i23: i32;
  var $i24: i1;
  var $i25: i32;
  var $i26: i1;
  var $i27: i32;
  var $i28: i1;
  var $i5: i32;
  var $i6: i1;
  var $i7: i32;
  var $i8: i1;
  var $i9: i32;
  var $p0: ref;
  var $p2: ref;
  var $p20: ref;
  var $p3: ref;
  var $p4: ref;

  $bb0:
    call $p0 := $alloc($mul.ref(2, 1));
    $i1 := $trunc.i32.i8(p.1);
    assume true;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 207} true;
    $p2 := $p0;
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 207} true;
    $M.6 := $M.6[$p2 := $i1];
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 208} true;
    $p3 := $add.ref($p0, 1);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 208} true;
    $M.6 := $M.6[$p3 := 0];
    goto $bb0_splitSourceLine_4;

  $bb0_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 209} true;
    $p4 := $p0;
    goto $bb0_splitSourceLine_5;

  $bb0_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 209} true;
    call $i5 := is_eof_token($p4);
    goto $bb0_splitSourceLine_6;

  $bb0_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 209} true;
    $i6 := $eq.i32($i5, 1);
    goto $bb0_splitSourceLine_7;

  $bb0_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 209} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i6 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 209} true;
    $i7 := 1;
    goto $bb3;

  $bb2:
    assume !($i6 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 210} true;
    $i8 := $eq.i32(str_com_id, 1);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 210} true;
    goto $bb4, $bb5;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 228} true;
    $r := $i7;
    $exn := false;
    return;

  $bb4:
    assume $i8 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i9 := $sext.i8.i32($i1);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i10 := $eq.i32($i9, 34);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i11 := $zext.i1.i32($i10);
    goto $bb4_splitSourceLine_3;

  $bb4_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i12 := $sext.i8.i32($i1);
    goto $bb4_splitSourceLine_4;

  $bb4_splitSourceLine_4:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i13 := $eq.i32($i12, 10);
    goto $bb4_splitSourceLine_5;

  $bb4_splitSourceLine_5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i14 := $zext.i1.i32($i13);
    goto $bb4_splitSourceLine_6;

  $bb4_splitSourceLine_6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i15 := $or.i32($i11, $i14);
    goto $bb4_splitSourceLine_7;

  $bb4_splitSourceLine_7:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    $i16 := $ne.i32($i15, 0);
    goto $bb4_splitSourceLine_8;

  $bb4_splitSourceLine_8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 211} true;
    goto $bb6, $bb7;

  $bb5:
    assume !($i8 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 217} true;
    $i17 := $eq.i32(str_com_id, 2);
    goto $bb5_splitSourceLine_1;

  $bb5_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 217} true;
    goto $bb8, $bb9;

  $bb6:
    assume $i16 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 212} true;
    $i7 := 1;
    goto $bb3;

  $bb7:
    assume !($i16 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 214} true;
    $i7 := 0;
    goto $bb3;

  $bb8:
    assume $i17 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 218} true;
    $i18 := $sext.i8.i32($i1);
    goto $bb8_splitSourceLine_1;

  $bb8_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 218} true;
    $i19 := $eq.i32($i18, 10);
    goto $bb8_splitSourceLine_2;

  $bb8_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 218} true;
    goto $bb10, $bb11;

  $bb9:
    assume !($i17 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 224} true;
    $p20 := $p0;
    goto $bb9_splitSourceLine_1;

  $bb9_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 224} true;
    call $i21 := is_spec_symbol($p20);
    goto $bb9_splitSourceLine_2;

  $bb9_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 224} true;
    $i22 := $eq.i32($i21, 1);
    goto $bb9_splitSourceLine_3;

  $bb9_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 224} true;
    goto $bb12, $bb13;

  $bb10:
    assume $i19 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 219} true;
    $i7 := 1;
    goto $bb3;

  $bb11:
    assume !($i19 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 221} true;
    $i7 := 0;
    goto $bb3;

  $bb12:
    assume $i22 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 224} true;
    $i7 := 1;
    goto $bb3;

  $bb13:
    assume !($i22 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i23 := $sext.i8.i32($i1);
    goto $bb13_splitSourceLine_1;

  $bb13_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i24 := $eq.i32($i23, 32);
    goto $bb13_splitSourceLine_2;

  $bb13_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    goto $bb14, $bb16;

  $bb14:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    assume $i24 == 1;
    goto $bb15;

  $bb15:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i7 := 1;
    goto $bb3;

  $bb16:
    assume !($i24 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i25 := $sext.i8.i32($i1);
    goto $bb16_splitSourceLine_1;

  $bb16_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i26 := $eq.i32($i25, 10);
    goto $bb16_splitSourceLine_2;

  $bb16_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    goto $bb17, $bb18;

  $bb17:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    assume $i26 == 1;
    goto $bb15;

  $bb18:
    assume !($i26 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i27 := $sext.i8.i32($i1);
    goto $bb18_splitSourceLine_1;

  $bb18_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    $i28 := $eq.i32($i27, 59);
    goto $bb18_splitSourceLine_2;

  $bb18_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    goto $bb19, $bb20;

  $bb19:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 225} true;
    assume $i28 == 1;
    goto $bb15;

  $bb20:
    assume !($i28 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 227} true;
    $i7 := 0;
    goto $bb3;
}



procedure llvm.dbg.declare($p0: ref, $p1: ref);



procedure llvm.dbg.value($p0: ref, $i1: i64, $p2: ref);



procedure main(argc: i32, argv: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation main(argc: i32, argv: ref) returns ($r: i32)
{
  var $i0: i1;
  var $i11: i32;
  var $i12: i1;
  var $i13: i32;
  var $i3: i1;
  var $i7: i32;
  var $p1: ref;
  var $p10: ref;
  var $p14: ref;
  var $p2: ref;
  var $p4: ref;
  var $p5: ref;
  var $p6: ref;
  var $p8: ref;
  var $p9: ref;

  $bb0:
    call $static_init();
    call $init_funcs();
    assert {:sourcefile "print_tokens2.c"} {:sourceline 27} true;
    $i0 := $eq.i32(argc, 1);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 27} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i0 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 29} true;
    call $p1 := malloc(1);
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 30} true;
    $M.36 := $M.36[$p1 := 0];
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 31} true;
    $p2 := $p1;
    goto $bb3;

  $bb2:
    assume !($i0 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 32} true;
    $i3 := $eq.i32(argc, 2);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 32} true;
    goto $bb4, $bb5;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 38} true;
    call $p8 := open_token_stream($p2);
    goto $bb3_splitSourceLine_1;

  $bb3_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 39} true;
    call $p9 := get_token($p8);
    goto $bb3_splitSourceLine_2;

  $bb3_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 40} true;
    $p10 := $p9;
    goto $bb6;

  $bb4:
    assume $i3 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 33} true;
    $p4 := $add.ref(argv, 8);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 33} true;
    $p5 := $M.37[$p4];
    $p2 := $p5;
    goto $bb3;

  $bb5:
    assume !($i3 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 35} true;
    $p6 := $M.0[stdout];
    goto $bb5_splitSourceLine_1;

  $bb5_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 35} true;
    call $i7 := fprintf.ref.ref($p6, .str);
    goto $bb5_splitSourceLine_2;

  $bb5_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 36} true;
    call exit(0);
    goto $bb5_splitSourceLine_3;

  $bb5_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 36} true;
    assume false;
    goto $bb6;

  $bb6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 40} true;
    call $i11 := is_eof_token($p10);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 40} true;
    $i12 := $eq.i32($i11, 0);
    goto $bb6_splitSourceLine_2;

  $bb6_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 42} true;
    call $i13 := print_token($p10);
    goto $bb6_splitSourceLine_3;

  $bb6_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 40} true;
    goto $bb7, $bb8;

  $bb7:
    assume $i12 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 43} true;
    call $p14 := get_token($p8);
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 44} true;
    $p10 := $p14;
    goto $bb6;

  $bb8:
    assume !($i12 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 46} true;
    call exit(0);
    goto $bb8_splitSourceLine_1;

  $bb8_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 46} true;
    assume false;
    return;
}



procedure malloc(n: i64) returns (r: ref);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation malloc(n: i64) returns (r: ref)
{

  anon0:
    call r := $alloc(n);
    return;
}



procedure open_character_stream(fname: ref) returns ($r: ref);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation open_character_stream(fname: ref) returns ($r: ref)
{
  var $i0: i1;
  var $i4: i1;
  var $i6: i32;
  var $p1: ref;
  var $p2: ref;
  var $p3: ref;
  var $p5: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 62} true;
    $i0 := $eq.ref(fname, $0.ref);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 62} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i0 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 63} true;
    $p1 := $M.0[stdin];
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 63} true;
    $p2 := $p1;
    goto $bb3;

  $bb2:
    assume !($i0 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 64} true;
    call $p3 := fopen(fname, .str1);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 64} true;
    $i4 := $eq.ref($p3, $0.ref);
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 64} true;
    $p2 := $p3;
    goto $bb4, $bb5;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 69} true;
    $r := $p2;
    $exn := false;
    return;

  $bb4:
    assume $i4 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 66} true;
    $p5 := $M.0[stdout];
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 66} true;
    call $i6 := fprintf.ref.ref.ref($p5, .str2, fname);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 67} true;
    call exit(0);
    goto $bb4_splitSourceLine_3;

  $bb4_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 67} true;
    assume false;
    goto $bb5;

  $bb5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 64} true;
    assume !($i4 == 1);
    goto $bb3;
}



procedure open_token_stream(fname: ref) returns ($r: ref);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation open_token_stream(fname: ref) returns ($r: ref)
{
  var $i0: i32;
  var $i1: i1;
  var $p2: ref;
  var $p3: ref;
  var $p4: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 131} true;
    call $i0 := strcmp(fname, .str3);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 131} true;
    $i1 := $eq.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 131} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i1 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 132} true;
    call $p2 := open_character_stream($0.ref);
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 132} true;
    $p3 := $p2;
    goto $bb3;

  $bb2:
    assume !($i1 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 134} true;
    call $p4 := open_character_stream(fname);
    $p3 := $p4;
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 135} true;
    $r := $p3;
    $exn := false;
    return;
}



procedure print_spec_symbol(str: ref);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation print_spec_symbol(str: ref)
{
  var $i0: i32;
  var $i1: i1;
  var $i11: i32;
  var $i12: i32;
  var $i13: i1;
  var $i15: i32;
  var $i16: i32;
  var $i17: i1;
  var $i19: i32;
  var $i20: i32;
  var $i21: i1;
  var $i23: i32;
  var $i24: i32;
  var $i3: i32;
  var $i4: i32;
  var $i5: i1;
  var $i7: i32;
  var $i8: i32;
  var $i9: i1;
  var $p10: ref;
  var $p14: ref;
  var $p18: ref;
  var $p2: ref;
  var $p22: ref;
  var $p6: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 436} true;
    call $i0 := strcmp(str, .str11);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 436} true;
    $i1 := $ne.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 436} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i1 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 441} true;
    call $i4 := strcmp(str, .str12);
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 441} true;
    $i5 := $ne.i32($i4, 0);
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 441} true;
    goto $bb4, $bb5;

  $bb2:
    assume !($i1 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 438} true;
    $p2 := $M.0[stdout];
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 438} true;
    call $i3 := fprintf.ref.ref.ref($p2, .str18, .str19);
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 439} true;
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 468} true;
    $exn := false;
    return;

  $bb4:
    assume $i5 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 446} true;
    call $i8 := strcmp(str, .str13);
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 446} true;
    $i9 := $ne.i32($i8, 0);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 446} true;
    goto $bb6, $bb7;

  $bb5:
    assume !($i5 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 443} true;
    $p6 := $M.0[stdout];
    goto $bb5_splitSourceLine_1;

  $bb5_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 443} true;
    call $i7 := fprintf.ref.ref.ref($p6, .str18, .str20);
    goto $bb5_splitSourceLine_2;

  $bb5_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 444} true;
    goto $bb3;

  $bb6:
    assume $i9 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 451} true;
    call $i12 := strcmp(str, .str14);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 451} true;
    $i13 := $ne.i32($i12, 0);
    goto $bb6_splitSourceLine_2;

  $bb6_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 451} true;
    goto $bb8, $bb9;

  $bb7:
    assume !($i9 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 448} true;
    $p10 := $M.0[stdout];
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 448} true;
    call $i11 := fprintf.ref.ref.ref($p10, .str18, .str21);
    goto $bb7_splitSourceLine_2;

  $bb7_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 449} true;
    goto $bb3;

  $bb8:
    assume $i13 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 456} true;
    call $i16 := strcmp(str, .str15);
    goto $bb8_splitSourceLine_1;

  $bb8_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 456} true;
    $i17 := $ne.i32($i16, 0);
    goto $bb8_splitSourceLine_2;

  $bb8_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 456} true;
    goto $bb10, $bb11;

  $bb9:
    assume !($i13 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 453} true;
    $p14 := $M.0[stdout];
    goto $bb9_splitSourceLine_1;

  $bb9_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 453} true;
    call $i15 := fprintf.ref.ref.ref($p14, .str18, .str22);
    goto $bb9_splitSourceLine_2;

  $bb9_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 454} true;
    goto $bb3;

  $bb10:
    assume $i17 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 461} true;
    call $i20 := strcmp(str, .str16);
    goto $bb10_splitSourceLine_1;

  $bb10_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 461} true;
    $i21 := $ne.i32($i20, 0);
    goto $bb10_splitSourceLine_2;

  $bb10_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 467} true;
    $p22 := $M.0[stdout];
    goto $bb10_splitSourceLine_3;

  $bb10_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 461} true;
    goto $bb12, $bb13;

  $bb11:
    assume !($i17 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 458} true;
    $p18 := $M.0[stdout];
    goto $bb11_splitSourceLine_1;

  $bb11_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 458} true;
    call $i19 := fprintf.ref.ref.ref($p18, .str18, .str23);
    goto $bb11_splitSourceLine_2;

  $bb11_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 459} true;
    goto $bb3;

  $bb12:
    assume $i21 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 467} true;
    call $i24 := fprintf.ref.ref.ref($p22, .str18, .str25);
    goto $bb12_splitSourceLine_1;

  $bb12_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 468} true;
    goto $bb3;

  $bb13:
    assume !($i21 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 463} true;
    call $i23 := fprintf.ref.ref.ref($p22, .str18, .str24);
    goto $bb13_splitSourceLine_1;

  $bb13_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 464} true;
    goto $bb3;
}



procedure print_token(tok: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation print_token(tok: ref) returns ($r: i32)
{
  var $i0: i32;
  var $i1: i1;
  var $i10: i32;
  var $i11: i1;
  var $i13: i32;
  var $i14: i1;
  var $i16: i32;
  var $i17: i1;
  var $i20: i32;
  var $i21: i1;
  var $i23: i32;
  var $i3: i32;
  var $i4: i1;
  var $i6: i32;
  var $i7: i1;
  var $i8: i1;
  var $p12: ref;
  var $p15: ref;
  var $p18: ref;
  var $p19: ref;
  var $p2: ref;
  var $p22: ref;
  var $p5: ref;
  var $p9: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 260} true;
    call $i0 := token_type(tok);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 261} true;
    $i1 := $eq.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 261} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i1 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 262} true;
    $p2 := $M.0[stdout];
    goto $bb1_splitSourceLine_1;

  $bb1_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 262} true;
    call $i3 := fprintf.ref.ref.ref($p2, .str4, tok);
    goto $bb1_splitSourceLine_2;

  $bb1_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 263} true;
    goto $bb3;

  $bb2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 261} true;
    assume !($i1 == 1);
    goto $bb3;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 264} true;
    $i4 := $eq.i32($i0, 1);
    goto $bb3_splitSourceLine_1;

  $bb3_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 264} true;
    goto $bb4, $bb5;

  $bb4:
    assume $i4 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 265} true;
    $p5 := $M.0[stdout];
    goto $bb4_splitSourceLine_1;

  $bb4_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 265} true;
    call $i6 := fprintf.ref.ref.ref($p5, .str5, tok);
    goto $bb4_splitSourceLine_2;

  $bb4_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 266} true;
    goto $bb6;

  $bb5:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 264} true;
    assume !($i4 == 1);
    goto $bb6;

  $bb6:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 267} true;
    $i7 := $eq.i32($i0, 2);
    goto $bb6_splitSourceLine_1;

  $bb6_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 267} true;
    goto $bb7, $bb8;

  $bb7:
    assume $i7 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 267} true;
    call print_spec_symbol(tok);
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 267} true;
    goto $bb9;

  $bb8:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 267} true;
    assume !($i7 == 1);
    goto $bb9;

  $bb9:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 268} true;
    $i8 := $eq.i32($i0, 3);
    goto $bb9_splitSourceLine_1;

  $bb9_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 268} true;
    goto $bb10, $bb11;

  $bb10:
    assume $i8 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 269} true;
    $p9 := $M.0[stdout];
    goto $bb10_splitSourceLine_1;

  $bb10_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 269} true;
    call $i10 := fprintf.ref.ref.ref($p9, .str6, tok);
    goto $bb10_splitSourceLine_2;

  $bb10_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 270} true;
    goto $bb12;

  $bb11:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 268} true;
    assume !($i8 == 1);
    goto $bb12;

  $bb12:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 271} true;
    $i11 := $eq.i32($i0, 41);
    goto $bb12_splitSourceLine_1;

  $bb12_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 271} true;
    goto $bb13, $bb14;

  $bb13:
    assume $i11 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 272} true;
    $p12 := $M.0[stdout];
    goto $bb13_splitSourceLine_1;

  $bb13_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 272} true;
    call $i13 := fprintf.ref.ref.ref($p12, .str7, tok);
    goto $bb13_splitSourceLine_2;

  $bb13_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 273} true;
    goto $bb15;

  $bb14:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 271} true;
    assume !($i11 == 1);
    goto $bb15;

  $bb15:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 274} true;
    $i14 := $eq.i32($i0, 42);
    goto $bb15_splitSourceLine_1;

  $bb15_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 274} true;
    goto $bb16, $bb17;

  $bb16:
    assume $i14 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 275} true;
    $p15 := $M.0[stdout];
    goto $bb16_splitSourceLine_1;

  $bb16_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 275} true;
    call $i16 := fprintf.ref.ref.ref($p15, .str8, tok);
    goto $bb16_splitSourceLine_2;

  $bb16_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 276} true;
    goto $bb18;

  $bb17:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 274} true;
    assume !($i14 == 1);
    goto $bb18;

  $bb18:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 277} true;
    $i17 := $eq.i32($i0, 43);
    goto $bb18_splitSourceLine_1;

  $bb18_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 277} true;
    goto $bb19, $bb20;

  $bb19:
    assume $i17 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 278} true;
    $p18 := $add.ref(tok, 1);
    goto $bb19_splitSourceLine_1;

  $bb19_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 279} true;
    $p19 := $M.0[stdout];
    goto $bb19_splitSourceLine_2;

  $bb19_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 279} true;
    call $i20 := fprintf.ref.ref.ref($p19, .str9, $p18);
    goto $bb19_splitSourceLine_3;

  $bb19_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 280} true;
    goto $bb21;

  $bb20:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 277} true;
    assume !($i17 == 1);
    goto $bb21;

  $bb21:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 281} true;
    $i21 := $eq.i32($i0, 6);
    goto $bb21_splitSourceLine_1;

  $bb21_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 281} true;
    goto $bb22, $bb23;

  $bb22:
    assume $i21 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 282} true;
    $p22 := $M.0[stdout];
    goto $bb22_splitSourceLine_1;

  $bb22_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 282} true;
    call $i23 := fprintf.ref.ref($p22, .str10);
    goto $bb22_splitSourceLine_2;

  $bb22_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 282} true;
    goto $bb24;

  $bb23:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 281} true;
    assume !($i21 == 1);
    goto $bb24;

  $bb24:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 283} true;
    $r := $u24;
    $exn := false;
    return;
}



procedure strcmp($p0: ref, $p1: ref) returns (r: i32);



procedure token_type(tok: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation token_type(tok: ref) returns ($r: i32)
{
  var $i0: i32;
  var $i1: i1;
  var $i10: i1;
  var $i11: i32;
  var $i12: i1;
  var $i13: i32;
  var $i14: i1;
  var $i15: i32;
  var $i16: i1;
  var $i2: i32;
  var $i3: i32;
  var $i4: i1;
  var $i5: i32;
  var $i6: i1;
  var $i7: i32;
  var $i8: i1;
  var $i9: i32;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 240} true;
    call $i0 := is_keyword(tok);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 240} true;
    $i1 := $ne.i32($i0, 0);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 240} true;
    goto $bb1, $bb2;

  $bb1:
    assume $i1 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 240} true;
    $i2 := 1;
    goto $bb3;

  $bb2:
    assume !($i1 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 241} true;
    call $i3 := is_spec_symbol(tok);
    goto $bb2_splitSourceLine_1;

  $bb2_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 241} true;
    $i4 := $ne.i32($i3, 0);
    goto $bb2_splitSourceLine_2;

  $bb2_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 241} true;
    goto $bb4, $bb5;

  $bb3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 249} true;
    $r := $i2;
    $exn := false;
    return;

  $bb4:
    assume $i4 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 241} true;
    $i2 := 2;
    goto $bb3;

  $bb5:
    assume !($i4 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 242} true;
    call $i5 := is_identifier(tok);
    goto $bb5_splitSourceLine_1;

  $bb5_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 242} true;
    $i6 := $ne.i32($i5, 0);
    goto $bb5_splitSourceLine_2;

  $bb5_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 242} true;
    goto $bb6, $bb7;

  $bb6:
    assume $i6 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 242} true;
    $i2 := 3;
    goto $bb3;

  $bb7:
    assume !($i6 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 243} true;
    call $i7 := is_num_constant(tok);
    goto $bb7_splitSourceLine_1;

  $bb7_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 243} true;
    $i8 := $ne.i32($i7, 0);
    goto $bb7_splitSourceLine_2;

  $bb7_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 243} true;
    goto $bb8, $bb9;

  $bb8:
    assume $i8 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 243} true;
    $i2 := 41;
    goto $bb3;

  $bb9:
    assume !($i8 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 244} true;
    call $i9 := is_str_constant(tok);
    goto $bb9_splitSourceLine_1;

  $bb9_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 244} true;
    $i10 := $ne.i32($i9, 0);
    goto $bb9_splitSourceLine_2;

  $bb9_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 244} true;
    goto $bb10, $bb11;

  $bb10:
    assume $i10 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 244} true;
    $i2 := 42;
    goto $bb3;

  $bb11:
    assume !($i10 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 245} true;
    call $i11 := is_char_constant(tok);
    goto $bb11_splitSourceLine_1;

  $bb11_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 245} true;
    $i12 := $ne.i32($i11, 0);
    goto $bb11_splitSourceLine_2;

  $bb11_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 245} true;
    goto $bb12, $bb13;

  $bb12:
    assume $i12 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 245} true;
    $i2 := 43;
    goto $bb3;

  $bb13:
    assume !($i12 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 246} true;
    call $i13 := is_comment(tok);
    goto $bb13_splitSourceLine_1;

  $bb13_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 246} true;
    $i14 := $ne.i32($i13, 0);
    goto $bb13_splitSourceLine_2;

  $bb13_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 246} true;
    goto $bb14, $bb15;

  $bb14:
    assume $i14 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 246} true;
    $i2 := 5;
    goto $bb3;

  $bb15:
    assume !($i14 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 247} true;
    call $i15 := is_eof_token(tok);
    goto $bb15_splitSourceLine_1;

  $bb15_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 247} true;
    $i16 := $ne.i32($i15, 0);
    goto $bb15_splitSourceLine_2;

  $bb15_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 247} true;
    goto $bb16, $bb17;

  $bb16:
    assume $i16 == 1;
    assert {:sourcefile "print_tokens2.c"} {:sourceline 247} true;
    $i2 := 6;
    goto $bb3;

  $bb17:
    assume !($i16 == 1);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 248} true;
    $i2 := 0;
    goto $bb3;
}



procedure unget_char(p.0: i32, fp: ref) returns ($r: i8);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation unget_char(p.0: i32, fp: ref) returns ($r: i8)
{
  var $i0: i8;
  var $i1: i32;
  var $i2: i32;
  var $i3: i8;

  $bb0:
    $i0 := $trunc.i32.i8(p.0);
    assert {:sourcefile "print_tokens2.c"} {:sourceline 94} true;
    $i1 := $sext.i8.i32($i0);
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 94} true;
    call $i2 := ungetc($i1, fp);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 94} true;
    $i3 := $trunc.i32.i8($i2);
    goto $bb0_splitSourceLine_3;

  $bb0_splitSourceLine_3:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 101} true;
    $r := $i3;
    $exn := false;
    return;
}



procedure unget_error(fp: ref) returns ($r: i32);
  modifies $Alloc, $CurrAddr, $exn, $exnv, $M.0, $M.1, $M.2, $M.3, $M.4, $M.5, $M.6, $M.7, $M.8, $M.9, $M.10, $M.11, $M.12, $M.13, $M.14, $M.15, $M.16, $M.17, $M.18, $M.19, $M.20, $M.21, $M.22, $M.23, $M.24, $M.25, $M.26, $M.27, $M.28, $M.29, $M.30, $M.31, $M.32, $M.33, $M.34, $M.35, $M.36, $M.37;



implementation unget_error(fp: ref) returns ($r: i32)
{
  var $i1: i32;
  var $p0: ref;

  $bb0:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 424} true;
    $p0 := $M.0[stdout];
    goto $bb0_splitSourceLine_1;

  $bb0_splitSourceLine_1:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 424} true;
    call $i1 := fprintf.ref.ref($p0, .str26);
    goto $bb0_splitSourceLine_2;

  $bb0_splitSourceLine_2:
    assert {:sourcefile "print_tokens2.c"} {:sourceline 425} true;
    $r := $u2;
    $exn := false;
    return;
}



procedure ungetc($i0: i32, $p1: ref) returns (r: i32);



axiom stdout == $sub.ref(0, 32776);

axiom .str == $sub.ref(0, 37);

axiom stdin == $sub.ref(0, 32784);

axiom .str1 == $sub.ref(0, 39);

axiom .str2 == $sub.ref(0, 67);

axiom .str3 == $sub.ref(0, 68);

axiom const_80 == $sub.ref(0, 72);

axiom buffer == $sub.ref(0, 153);

axiom .str4 == $sub.ref(0, 166);

axiom .str5 == $sub.ref(0, 181);

axiom .str6 == $sub.ref(0, 199);

axiom .str7 == $sub.ref(0, 212);

axiom .str8 == $sub.ref(0, 224);

axiom .str9 == $sub.ref(0, 241);

axiom .str10 == $sub.ref(0, 247);

axiom .str11 == $sub.ref(0, 249);

axiom .str12 == $sub.ref(0, 251);

axiom .str13 == $sub.ref(0, 253);

axiom .str14 == $sub.ref(0, 255);

axiom .str15 == $sub.ref(0, 257);

axiom .str16 == $sub.ref(0, 259);

axiom .str17 == $sub.ref(0, 261);

axiom .str18 == $sub.ref(0, 265);

axiom .str19 == $sub.ref(0, 273);

axiom .str20 == $sub.ref(0, 281);

axiom .str21 == $sub.ref(0, 290);

axiom .str22 == $sub.ref(0, 299);

axiom .str23 == $sub.ref(0, 306);

axiom .str24 == $sub.ref(0, 314);

axiom .str25 == $sub.ref(0, 321);

axiom .str26 == $sub.ref(0, 346);

axiom .str27 == $sub.ref(0, 350);

axiom .str28 == $sub.ref(0, 353);

axiom .str29 == $sub.ref(0, 356);

axiom .str30 == $sub.ref(0, 360);

axiom .str31 == $sub.ref(0, 367);

axiom .str32 == $sub.ref(0, 370);

axiom main == $sub.ref(0, 378);

axiom llvm.dbg.declare == $sub.ref(0, 386);

axiom malloc == $sub.ref(0, 394);

axiom fprintf == $sub.ref(0, 402);

axiom exit == $sub.ref(0, 410);

axiom open_character_stream == $sub.ref(0, 418);

axiom fopen == $sub.ref(0, 426);

axiom get_char == $sub.ref(0, 434);

axiom _IO_getc == $sub.ref(0, 442);

axiom unget_char == $sub.ref(0, 450);

axiom ungetc == $sub.ref(0, 458);

axiom open_token_stream == $sub.ref(0, 466);

axiom strcmp == $sub.ref(0, 474);

axiom get_token == $sub.ref(0, 482);

axiom print_token == $sub.ref(0, 490);

axiom token_type == $sub.ref(0, 498);

axiom is_eof_token == $sub.ref(0, 506);

axiom is_spec_symbol == $sub.ref(0, 514);

axiom print_spec_symbol == $sub.ref(0, 522);

axiom unget_error == $sub.ref(0, 530);

axiom is_comment == $sub.ref(0, 538);

axiom is_char_constant == $sub.ref(0, 546);

axiom __ctype_b_loc == $sub.ref(0, 554);

axiom is_str_constant == $sub.ref(0, 562);

axiom is_num_constant == $sub.ref(0, 570);

axiom is_identifier == $sub.ref(0, 578);

axiom is_keyword == $sub.ref(0, 586);

axiom is_token_end == $sub.ref(0, 594);

axiom __SMACK_dummy == $sub.ref(0, 602);

axiom __SMACK_code == $sub.ref(0, 610);

axiom __SMACK_decls == $sub.ref(0, 618);

axiom __SMACK_top_decl == $sub.ref(0, 626);

axiom llvm.dbg.value == $sub.ref(0, 634);

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

axiom (forall f: float :: $si2fp.i16($fp2si.i16(f)) == f);

axiom (forall f: float :: $si2fp.i32($fp2si.i32(f)) == f);

axiom (forall f: float :: $si2fp.i64($fp2si.i64(f)) == f);

axiom (forall f: float :: $si2fp.i8($fp2si.i8(f)) == f);

axiom (forall f: float :: $ui2fp.i16($fp2ui.i16(f)) == f);

axiom (forall f: float :: $ui2fp.i32($fp2ui.i32(f)) == f);

axiom (forall f: float :: $ui2fp.i64($fp2ui.i64(f)) == f);

axiom (forall f: float :: $ui2fp.i8($fp2ui.i8(f)) == f);

axiom (forall i: i16 :: $fp2si.i16($si2fp.i16(i)) == i);

axiom (forall i: i16 :: $fp2ui.i16($ui2fp.i16(i)) == i);

axiom (forall i: i32 :: $fp2si.i32($si2fp.i32(i)) == i);

axiom (forall i: i32 :: $fp2ui.i32($ui2fp.i32(i)) == i);

axiom (forall i: i64 :: $fp2si.i64($si2fp.i64(i)) == i);

axiom (forall i: i64 :: $fp2ui.i64($ui2fp.i64(i)) == i);

axiom (forall i: i8 :: $fp2si.i8($si2fp.i8(i)) == i);

axiom (forall i: i8 :: $fp2ui.i8($ui2fp.i8(i)) == i);

const $EXTERNS_BOTTOM: ref;

const $GLOBALS_BOTTOM: ref;

const $MALLOC_TOP: ref;

const $MOP: $mop;

function $and.i1(i1: i1, i2: i1) : i1;

function $and.i16(i1: i16, i2: i16) : i16;

function $and.i32(i1: i32, i2: i32) : i32;

function $and.i64(i1: i64, i2: i64) : i64;

function $and.i8(i1: i8, i2: i8) : i8;

function $ashr.i1(i1: i1, i2: i1) : i1;

function $ashr.i16(i1: i16, i2: i16) : i16;

function $ashr.i32(i1: i32, i2: i32) : i32;

function $ashr.i64(i1: i64, i2: i64) : i64;

function $ashr.i8(i1: i8, i2: i8) : i8;

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

function $fp2si.i16(f: float) : i16;

function $fp2si.i32(f: float) : i32;

function $fp2si.i64(f: float) : i64;

function $fp2si.i8(f: float) : i8;

function $fp2ui.i16(f: float) : i16;

function $fp2ui.i32(f: float) : i32;

function $fp2ui.i64(f: float) : i64;

function $fp2ui.i8(f: float) : i8;

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

function $lshr.i16(i1: i16, i2: i16) : i16;

function $lshr.i32(i1: i32, i2: i32) : i32;

function $lshr.i64(i1: i64, i2: i64) : i64;

function $lshr.i8(i1: i8, i2: i8) : i8;

function $nand.i1(i1: i1, i2: i1) : i1;

function $nand.i16(i1: i16, i2: i16) : i16;

function $nand.i32(i1: i32, i2: i32) : i32;

function $nand.i64(i1: i64, i2: i64) : i64;

function $nand.i8(i1: i8, i2: i8) : i8;

function $not.i1(i: i1) : i1;

function $not.i16(i: i16) : i16;

function $not.i32(i: i32) : i32;

function $not.i64(i: i64) : i64;

function $not.i8(i: i8) : i8;

function $or.i1(i1: i1, i2: i1) : i1;

function $or.i16(i1: i16, i2: i16) : i16;

function $or.i32(i1: i32, i2: i32) : i32;

function $or.i64(i1: i64, i2: i64) : i64;

function $or.i8(i1: i8, i2: i8) : i8;

function $shl.i1(i1: i1, i2: i1) : i1;

function $shl.i16(i1: i16, i2: i16) : i16;

function $shl.i32(i1: i32, i2: i32) : i32;

function $shl.i64(i1: i64, i2: i64) : i64;

function $shl.i8(i1: i8, i2: i8) : i8;

function $si2fp.i16(i: i16) : float;

function $si2fp.i32(i: i32) : float;

function $si2fp.i64(i: i64) : float;

function $si2fp.i8(i: i8) : float;

function $ui2fp.i16(i: i16) : float;

function $ui2fp.i32(i: i32) : float;

function $ui2fp.i64(i: i64) : float;

function $ui2fp.i8(i: i8) : float;

function $xor.i1(i1: i1, i2: i1) : i1;

function $xor.i16(i1: i16, i2: i16) : i16;

function $xor.i32(i1: i32, i2: i32) : i32;

function $xor.i64(i1: i64, i2: i64) : i64;

function $xor.i8(i1: i8, i2: i8) : i8;

function {:builtin "div"} $div(i1: int, i2: int) : int;

function {:builtin "div"} $sdiv.i1(i1: i1, i2: i1) : i1;

function {:builtin "div"} $sdiv.i16(i1: i16, i2: i16) : i16;

function {:builtin "div"} $sdiv.i32(i1: i32, i2: i32) : i32;

function {:builtin "div"} $sdiv.i64(i1: i64, i2: i64) : i64;

function {:builtin "div"} $sdiv.i8(i1: i8, i2: i8) : i8;

function {:builtin "div"} $udiv.i1(i1: i1, i2: i1) : i1;

function {:builtin "div"} $udiv.i16(i1: i16, i2: i16) : i16;

function {:builtin "div"} $udiv.i32(i1: i32, i2: i32) : i32;

function {:builtin "div"} $udiv.i64(i1: i64, i2: i64) : i64;

function {:builtin "div"} $udiv.i8(i1: i8, i2: i8) : i8;

function {:builtin "mod"} $mod(i1: int, i2: int) : int;

function {:builtin "mod"} $smod.i1(i1: i1, i2: i1) : i1;

function {:builtin "mod"} $smod.i16(i1: i16, i2: i16) : i16;

function {:builtin "mod"} $smod.i32(i1: i32, i2: i32) : i32;

function {:builtin "mod"} $smod.i64(i1: i64, i2: i64) : i64;

function {:builtin "mod"} $smod.i8(i1: i8, i2: i8) : i8;

function {:builtin "rem"} $rem(i1: int, i2: int) : int;

function {:builtin "rem"} $srem.i1(i1: i1, i2: i1) : i1;

function {:builtin "rem"} $srem.i16(i1: i16, i2: i16) : i16;

function {:builtin "rem"} $srem.i32(i1: i32, i2: i32) : i32;

function {:builtin "rem"} $srem.i64(i1: i64, i2: i64) : i64;

function {:builtin "rem"} $srem.i8(i1: i8, i2: i8) : i8;

function {:builtin "rem"} $urem.i1(i1: i1, i2: i1) : i1;

function {:builtin "rem"} $urem.i16(i1: i16, i2: i16) : i16;

function {:builtin "rem"} $urem.i32(i1: i32, i2: i32) : i32;

function {:builtin "rem"} $urem.i64(i1: i64, i2: i64) : i64;

function {:builtin "rem"} $urem.i8(i1: i8, i2: i8) : i8;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv16.bv32(i: bv16) : bv32;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv8.bv32(i: bv8) : bv32;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv32.bv64(i: bv32) : bv64;

function {:bvbuiltin "(_ sign_extend 48)"} $sext.bv16.bv64(i: bv16) : bv64;

function {:bvbuiltin "(_ sign_extend 56)"} $sext.bv8.bv64(i: bv8) : bv64;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv8.bv16(i: bv8) : bv16;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv16.bv32(i: bv16) : bv32;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv8.bv32(i: bv8) : bv32;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv32.bv64(i: bv32) : bv64;

function {:bvbuiltin "(_ zero_extend 48)"} $zext.bv16.bv64(i: bv16) : bv64;

function {:bvbuiltin "(_ zero_extend 56)"} $zext.bv8.bv64(i: bv8) : bv64;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv8.bv16(i: bv8) : bv16;

function {:bvbuiltin "bvadd"} $add.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvadd"} $add.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvadd"} $add.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvadd"} $add.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvadd"} $add.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvand"} $and.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvand"} $and.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvand"} $and.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvand"} $and.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvand"} $and.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvashr"} $ashr.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvashr"} $ashr.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvashr"} $ashr.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvashr"} $ashr.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvashr"} $ashr.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvlshr"} $lshr.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvlshr"} $lshr.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvlshr"} $lshr.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvlshr"} $lshr.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvlshr"} $lshr.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvmul"} $mul.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvmul"} $mul.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvmul"} $mul.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvmul"} $mul.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvmul"} $mul.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvnand"} $nand.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvnand"} $nand.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvnand"} $nand.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvnand"} $nand.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvnand"} $nand.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvnot"} $not.bv1(i: bv1) : bv1;

function {:bvbuiltin "bvnot"} $not.bv16(i: bv16) : bv16;

function {:bvbuiltin "bvnot"} $not.bv32(i: bv32) : bv32;

function {:bvbuiltin "bvnot"} $not.bv64(i: bv64) : bv64;

function {:bvbuiltin "bvnot"} $not.bv8(i: bv8) : bv8;

function {:bvbuiltin "bvor"} $or.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvor"} $or.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvor"} $or.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvor"} $or.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvor"} $or.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsdiv"} $sdiv.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsdiv"} $sdiv.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsdiv"} $sdiv.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsdiv"} $sdiv.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsdiv"} $sdiv.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsge"} $sge.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sge.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sge.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvsgt"} $sgt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sgt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sgt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvshl"} $shl.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvshl"} $shl.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvshl"} $shl.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvshl"} $shl.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvshl"} $shl.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsle"} $sle.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sle.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sle.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvslt"} $slt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $slt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $slt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvsmod"} $smod.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsmod"} $smod.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsmod"} $smod.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsmod"} $smod.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsmod"} $smod.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsrem"} $srem.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsrem"} $srem.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsrem"} $srem.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsrem"} $srem.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsrem"} $srem.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsub"} $sub.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsub"} $sub.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsub"} $sub.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsub"} $sub.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsub"} $sub.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvudiv"} $udiv.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvudiv"} $udiv.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvudiv"} $udiv.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvudiv"} $udiv.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvudiv"} $udiv.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvuge"} $uge.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $uge.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $uge.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvugt"} $ugt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ugt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ugt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvule"} $ule.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ule.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ule.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvult"} $ult.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ult.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ult.bv1.bool(i1, i2) then 1bv1 else 0bv1)
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

function {:bvbuiltin "bvurem"} $urem.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvurem"} $urem.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvurem"} $urem.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvurem"} $urem.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvurem"} $urem.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvxor"} $xor.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvxor"} $xor.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvxor"} $xor.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvxor"} $xor.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvxor"} $xor.bv8(i1: bv8, i2: bv8) : bv8;

function {:inline} $add.i1(i1: i1, i2: i1) : i1
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

function {:inline} $eq.i1.bool(i1: i1, i2: i1) : bool
{
  i1 == i2
}

function {:inline} $eq.i1(i1: i1, i2: i1) : i1
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

function {:inline} $foeq.float(f1: float, f2: float) : i1
{
  (if $foeq.bool(f1, f2) then 1 else 0)
}

function {:inline} $isExternal(p: ref) : bool
{
  $slt.ref.bool(p, $EXTERNS_BOTTOM)
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

function {:inline} $max(i1: int, i2: int) : int
{
  (if i1 > i2 then i1 else i2)
}

function {:inline} $max.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sgt.bv1.bool(i1, i2) then i1 else i2)
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

function {:inline} $min(i1: int, i2: int) : int
{
  (if i1 < i2 then i1 else i2)
}

function {:inline} $min.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $slt.bv1.bool(i1, i2) then i1 else i2)
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

function {:inline} $mul.i1(i1: i1, i2: i1) : i1
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

function {:inline} $ne.bv1.bool(i1: bv1, i2: bv1) : bool
{
  i1 != i2
}

function {:inline} $ne.bv1(i1: bv1, i2: bv1) : bv1
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

function {:inline} $ne.i1.bool(i1: i1, i2: i1) : bool
{
  i1 != i2
}

function {:inline} $ne.i1(i1: i1, i2: i1) : i1
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

function {:inline} $sext.i16.i32(i: i16) : i32
{
  i
}

function {:inline} $sext.i16.i64(i: i16) : i64
{
  i
}

function {:inline} $sext.i32.i64(i: i32) : i64
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

function {:inline} $sge.i1.bool(i1: i1, i2: i1) : bool
{
  i1 >= i2
}

function {:inline} $sge.i1(i1: i1, i2: i1) : i1
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

function {:inline} $sgt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 > i2
}

function {:inline} $sgt.i1(i1: i1, i2: i1) : i1
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

function {:inline} $sle.i1.bool(i1: i1, i2: i1) : bool
{
  i1 <= i2
}

function {:inline} $sle.i1(i1: i1, i2: i1) : i1
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

function {:inline} $slt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 < i2
}

function {:inline} $slt.i1(i1: i1, i2: i1) : i1
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

function {:inline} $smax.i1(i1: i1, i2: i1) : i1
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

function {:inline} $smin.i1(i1: i1, i2: i1) : i1
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

function {:inline} $sub.i1(i1: i1, i2: i1) : i1
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

function {:inline} $uge.i1.bool(i1: i1, i2: i1) : bool
{
  i1 >= i2
}

function {:inline} $uge.i1(i1: i1, i2: i1) : i1
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

function {:inline} $ugt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 > i2
}

function {:inline} $ugt.i1(i1: i1, i2: i1) : i1
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

function {:inline} $ule.i1.bool(i1: i1, i2: i1) : bool
{
  i1 <= i2
}

function {:inline} $ule.i1(i1: i1, i2: i1) : i1
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

function {:inline} $ult.i1.bool(i1: i1, i2: i1) : bool
{
  i1 < i2
}

function {:inline} $ult.i1(i1: i1, i2: i1) : i1
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

function {:inline} $umax.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ugt.bv1.bool(i1, i2) then i1 else i2)
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

function {:inline} $umax.i1(i1: i1, i2: i1) : i1
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

function {:inline} $umin.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ult.bv1.bool(i1, i2) then i1 else i2)
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

function {:inline} $umin.i1(i1: i1, i2: i1) : i1
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

function {:inline} $zext.i16.i32(i: i16) : i32
{
  i
}

function {:inline} $zext.i16.i64(i: i16) : i64
{
  i
}

function {:inline} $zext.i32.i64(i: i32) : i64
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

procedure $alloc(n: ref) returns (p: ref);
  modifies $CurrAddr, $Alloc;
  ensures $sgt.ref.bool(p, $0.ref);
  ensures p == old($CurrAddr);
  ensures $sgt.ref.bool($CurrAddr, old($CurrAddr));
  ensures $sge.ref.bool(n, $0.ref) ==> $sge.ref.bool($CurrAddr, $add.ref(old($CurrAddr), n));
  ensures $Alloc[p];
  ensures (forall q: ref :: { $Alloc[q] } q != p ==> ($Alloc[q] <==> old($Alloc[q])));
  ensures $sge.ref.bool(n, $0.ref) ==> (forall q: ref :: { $base(q) } $sle.ref.bool(p, q) && $slt.ref.bool(q, $add.ref(p, n)) ==> $base(q) == p);



procedure $free(p: ref);
  modifies $Alloc;
  ensures !$Alloc[p];
  ensures (forall q: ref :: { $Alloc[q] } q != p ==> ($Alloc[q] <==> old($Alloc[q])));



procedure boogie_si_record_bool(i: bool);



procedure boogie_si_record_bv1(i: bv1);



procedure boogie_si_record_bv16(i: bv16);



procedure boogie_si_record_bv32(i: bv32);



procedure boogie_si_record_bv64(i: bv64);



procedure boogie_si_record_bv8(i: bv8);



procedure boogie_si_record_float(i: float);



procedure boogie_si_record_i1(i: i1);



procedure boogie_si_record_i16(i: i16);



procedure boogie_si_record_i32(i: i32);



procedure boogie_si_record_i64(i: i64);



procedure boogie_si_record_i8(i: i8);



procedure boogie_si_record_mop(m: $mop);



procedure boogie_si_record_ref(i: ref);



type $mop;

type float;

var $Alloc: [ref]bool;

var $CurrAddr: ref;

var $exn: bool;

var $exnv: int;
