// Casts added manually
function $fp2si.float.i32(x :float) : i32;
function $fp2si.float.i64(x :float) : i32;
function $fpext.float.float(x :float) : float;
function $fptrunc.float.float(x : float) : float;
function $si2fp.i32.float(x :i32) : float;
function $si2fp.i64.float(x : i64) : float;
function $ui2fp.i32.float(x : i32) : float;
function $ui2fp.i64.float(x : i64) : float;
// Some bugs in smack
procedure strdup.ref(x : ref) returns (r: i32);
