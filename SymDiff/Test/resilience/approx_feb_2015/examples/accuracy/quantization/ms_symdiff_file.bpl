/*function {:inline true} MS$_v1.quantization_loop_anon2_LoopHead$_v2.quantization_loop_anon2_LoopHead(_v1.in_data: [int]int, 
    _v1.in_i: int, 
    _v1.in_value: int, 
    _v1.Temp_old: [int]int, 
    _v1.OK_old: bool,
    _v1.Temp_: [int]int, 
    _v1.out_i: int, 
    _v1.out_value: int, 
    _v2.in_i: int, 
    _v2.in_value: int, 
    _v2.in_data_approx: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.OK_old: bool,
    _v2.Temp_: [int]int, 
    _v2.out_i: int, 
    _v2.out_value: int)
   : bool
{
  (forall i:int :: (i>=0 && i<=63) ==> _v2.RelaxedEq(_v1.Temp_[i], _v2.Temp_[i], 2)) 
}*/

function {:inline true} MS$_v1.quantization$_v2.quantization(_v1.data: [int]int, 
    _v1.luminanceQuantTable_old: [int]int, 
    _v1.Temp_old: [int]int, 
    _v1.OK_old: bool, 
    _v1.luminanceQuantTable_: [int]int, 
    _v1.Temp_: [int]int, 
    _v2.data: [int]int, 
    _v2.luminanceQuantTable_old: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.OK_old: bool, 
    _v2.luminanceQuantTable_: [int]int, 
    _v2.Temp_: [int]int)
   : bool
{
  //true
  (forall i:int :: (i>=0 && i<=63) ==> _v2.RelaxedEq(_v1.Temp_[i], _v2.Temp_[i], 2)) 
}

function {:inline true} RelaxedBefore(x:[int]int, y: [int]int, e:int, i: int) : bool
{
  (forall j: int:: j <= 63 && j >= 0 ==> _v2.RelaxedEq(x[j], y[j], e))
}

function {:inline true} RelaxedAfter(x:[int]int, y: [int]int, e:int, i: int) : bool
{
  (forall j: int:: j > i && j <= 63 ==> _v2.RelaxedEq(x[j], y[j], e))
}

function {:inline true} MS$_v1.quantization_loop_anon2_LoopHead$_v2.quantization_loop_anon2_LoopHead(_v1.in_data: [int]int, 
    _v1.in_i: int, 
    _v1.in_value: int, 
    _v1.luminanceQuantTable_old: [int]int, 
    _v1.Temp_old: [int]int, 
    _v1.OK_old: bool, 
    _v1.Temp_: [int]int, 
    _v1.out_i: int, 
    _v1.out_value: int, 
    _v2.in_i: int, 
    _v2.in_value: int, 
    _v2.in_data_approx: [int]int, 
    _v2.luminanceQuantTable_old: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.OK_old: bool, 
    _v2.Temp_: [int]int, 
    _v2.out_i: int, 
    _v2.out_value: int)
   : bool
{
  RelaxedAfter(_v2.Temp_, _v1.Temp_, 2, _v1.out_i) && _v1.in_i >= -1 
}

function {:inline true} MS_pre_$_v1.quantization_loop_anon2_LoopHead$_v2.quantization_loop_anon2_LoopHead(_v1.in_data: [int]int, 
    _v1.in_i: int, 
    _v1.in_value: int, 
    _v1.luminanceQuantTable_old: [int]int, 
    _v1.Temp_old: [int]int, 
    _v1.OK_old: bool, 
    _v2.in_i: int, 
    _v2.in_value: int, 
    _v2.in_data_approx: [int]int, 
    _v2.luminanceQuantTable_old: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.OK_old: bool)
   : bool
{
  //RelaxedBefore(_v2.in_data_approx, _v1.in_data, 16, _v1.in_i) && _v1.in_i >= -1 && RelaxedAfter(_v2.Temp_old, _v1.Temp_old, 2, _v1.in_i) 
  RelaxedBefore(_v2.in_data_approx, _v1.in_data, 16, _v1.in_i) && _v1.in_i >= -1 && RelaxedAfter(_v2.Temp_old, _v1.Temp_old, 2, _v1.in_i) 
   && (forall k:int :: k>=0 && k<=63 ==> (_v2.luminanceQuantTable_old[k] >= 270 && _v2.luminanceQuantTable_old[k] <= 3276))
/*
        &&(_v1.in_data[0] <= 32767 && _v1.in_data[0] >= -32768)
        &&(_v1.in_data[1] <= 32767 && _v1.in_data[1] >= -32768)
        &&(_v1.in_data[2] <= 32767 && _v1.in_data[2] >= -32768)
        &&(_v1.in_data[3] <= 32767 && _v1.in_data[3] >= -32768)
        &&(_v1.in_data[4] <= 32767 && _v1.in_data[4] >= -32768)
        &&(_v1.in_data[5] <= 32767 && _v1.in_data[5] >= -32768)
        &&(_v1.in_data[6] <= 32767 && _v1.in_data[6] >= -32768)
        &&(_v1.in_data[7] <= 32767 && _v1.in_data[7] >= -32768)
        &&(_v1.in_data[8] <= 32767 && _v1.in_data[8] >= -32768)
        &&(_v1.in_data[9] <= 32767 && _v1.in_data[9] >= -32768)
        &&(_v1.in_data[10] <= 32767 && _v1.in_data[10] >= -32768)
        &&(_v1.in_data[11] <= 32767 && _v1.in_data[11] >= -32768)
        &&(_v1.in_data[12] <= 32767 && _v1.in_data[12] >= -32768)
        &&(_v1.in_data[13] <= 32767 && _v1.in_data[13] >= -32768)
        &&(_v1.in_data[14] <= 32767 && _v1.in_data[14] >= -32768)
        &&(_v1.in_data[15] <= 32767 && _v1.in_data[15] >= -32768)
        &&(_v1.in_data[16] <= 32767 && _v1.in_data[16] >= -32768)
        &&(_v1.in_data[17] <= 32767 && _v1.in_data[17] >= -32768)
        &&(_v1.in_data[18] <= 32767 && _v1.in_data[18] >= -32768)
        &&(_v1.in_data[19] <= 32767 && _v1.in_data[19] >= -32768)
        &&(_v1.in_data[20] <= 32767 && _v1.in_data[20] >= -32768)
        &&(_v1.in_data[21] <= 32767 && _v1.in_data[21] >= -32768)
        &&(_v1.in_data[22] <= 32767 && _v1.in_data[22] >= -32768)
        &&(_v1.in_data[23] <= 32767 && _v1.in_data[23] >= -32768)
        &&(_v1.in_data[24] <= 32767 && _v1.in_data[24] >= -32768)
        &&(_v1.in_data[25] <= 32767 && _v1.in_data[25] >= -32768)
        &&(_v1.in_data[26] <= 32767 && _v1.in_data[26] >= -32768)
        &&(_v1.in_data[27] <= 32767 && _v1.in_data[27] >= -32768)
        &&(_v1.in_data[28] <= 32767 && _v1.in_data[28] >= -32768)
        &&(_v1.in_data[29] <= 32767 && _v1.in_data[29] >= -32768)
        &&(_v1.in_data[30] <= 32767 && _v1.in_data[30] >= -32768)
        &&(_v1.in_data[31] <= 32767 && _v1.in_data[31] >= -32768)
        &&(_v1.in_data[32] <= 32767 && _v1.in_data[32] >= -32768)
        &&(_v1.in_data[33] <= 32767 && _v1.in_data[33] >= -32768)
        &&(_v1.in_data[34] <= 32767 && _v1.in_data[34] >= -32768)
        &&(_v1.in_data[35] <= 32767 && _v1.in_data[35] >= -32768)
        &&(_v1.in_data[36] <= 32767 && _v1.in_data[36] >= -32768)
        &&(_v1.in_data[37] <= 32767 && _v1.in_data[37] >= -32768)
        &&(_v1.in_data[38] <= 32767 && _v1.in_data[38] >= -32768)
        &&(_v1.in_data[39] <= 32767 && _v1.in_data[39] >= -32768)
        &&(_v1.in_data[40] <= 32767 && _v1.in_data[40] >= -32768)
        &&(_v1.in_data[41] <= 32767 && _v1.in_data[41] >= -32768)
        &&(_v1.in_data[42] <= 32767 && _v1.in_data[42] >= -32768)
        &&(_v1.in_data[43] <= 32767 && _v1.in_data[43] >= -32768)
        &&(_v1.in_data[44] <= 32767 && _v1.in_data[44] >= -32768)
        &&(_v1.in_data[45] <= 32767 && _v1.in_data[45] >= -32768)
        &&(_v1.in_data[46] <= 32767 && _v1.in_data[46] >= -32768)
        &&(_v1.in_data[47] <= 32767 && _v1.in_data[47] >= -32768)
        &&(_v1.in_data[48] <= 32767 && _v1.in_data[48] >= -32768)
        &&(_v1.in_data[49] <= 32767 && _v1.in_data[49] >= -32768)
        &&(_v1.in_data[50] <= 32767 && _v1.in_data[50] >= -32768)
        &&(_v1.in_data[51] <= 32767 && _v1.in_data[51] >= -32768)
        &&(_v1.in_data[52] <= 32767 && _v1.in_data[52] >= -32768)
        &&(_v1.in_data[53] <= 32767 && _v1.in_data[53] >= -32768)
        &&(_v1.in_data[54] <= 32767 && _v1.in_data[54] >= -32768)
        &&(_v1.in_data[55] <= 32767 && _v1.in_data[55] >= -32768)
        &&(_v1.in_data[56] <= 32767 && _v1.in_data[56] >= -32768)
        &&(_v1.in_data[57] <= 32767 && _v1.in_data[57] >= -32768)
        &&(_v1.in_data[58] <= 32767 && _v1.in_data[58] >= -32768)
        &&(_v1.in_data[59] <= 32767 && _v1.in_data[59] >= -32768)
        &&(_v1.in_data[60] <= 32767 && _v1.in_data[60] >= -32768)
        &&(_v1.in_data[61] <= 32767 && _v1.in_data[61] >= -32768)
        &&(_v1.in_data[62] <= 32767 && _v1.in_data[62] >= -32768)
        &&(_v1.in_data[63] <= 32767 && _v1.in_data[63] >= -32768)
  
  && _v2.luminanceQuantTable[0] == 2047
  && _v2.luminanceQuantTable[1] == 2978
  && _v2.luminanceQuantTable[2] == 3276 
  && _v2.luminanceQuantTable[3] == 2047
&&_v2.luminanceQuantTable[0] == 2047
&&_v2.luminanceQuantTable[1] == 2978
&&_v2.luminanceQuantTable[2] == 3276
&&_v2.luminanceQuantTable[3] == 2047
&&_v2.luminanceQuantTable[4] == 1365
&&_v2.luminanceQuantTable[5] == 819
&&_v2.luminanceQuantTable[6] == 642
&&_v2.luminanceQuantTable[7] == 537
&&_v2.luminanceQuantTable[8] == 2730
&&_v2.luminanceQuantTable[9] == 2730
&&_v2.luminanceQuantTable[10] == 2340
&&_v2.luminanceQuantTable[11] == 1724
&&_v2.luminanceQuantTable[12] == 1260
&&_v2.luminanceQuantTable[13] == 564
&&_v2.luminanceQuantTable[14] == 546
&&_v2.luminanceQuantTable[15] == 595
&&_v2.luminanceQuantTable[16] == 2340
&&_v2.luminanceQuantTable[17] == 2520
&&_v2.luminanceQuantTable[18] == 2047
&&_v2.luminanceQuantTable[19] == 1365
&&_v2.luminanceQuantTable[20] == 819
&&_v2.luminanceQuantTable[21] == 574
&&_v2.luminanceQuantTable[22] == 474
&&_v2.luminanceQuantTable[23] == 585
&&_v2.luminanceQuantTable[24] == 2340
&&_v2.luminanceQuantTable[25] == 1927
&&_v2.luminanceQuantTable[26] == 1489
&&_v2.luminanceQuantTable[27] == 1129
&&_v2.luminanceQuantTable[28] == 642
&&_v2.luminanceQuantTable[29] == 376
&&_v2.luminanceQuantTable[30] == 409
&&_v2.luminanceQuantTable[31] == 528
&&_v2.luminanceQuantTable[32] == 1820
&&_v2.luminanceQuantTable[33] == 1489
&&_v2.luminanceQuantTable[34] == 885
&&_v2.luminanceQuantTable[35] == 585
&&_v2.luminanceQuantTable[36] == 481
&&_v2.luminanceQuantTable[37] == 300
&&_v2.luminanceQuantTable[38] == 318
&&_v2.luminanceQuantTable[39] == 425
&&_v2.luminanceQuantTable[40] == 1365
&&_v2.luminanceQuantTable[41] == 936
&&_v2.luminanceQuantTable[42] == 595
&&_v2.luminanceQuantTable[43] == 511
&&_v2.luminanceQuantTable[44] == 404
&&_v2.luminanceQuantTable[45] == 315
&&_v2.luminanceQuantTable[46] == 289
&&_v2.luminanceQuantTable[47] == 356
&&_v2.luminanceQuantTable[48] == 668
&&_v2.luminanceQuantTable[49] == 511
&&_v2.luminanceQuantTable[50] == 420
&&_v2.luminanceQuantTable[51] == 376
&&_v2.luminanceQuantTable[52] == 318
&&_v2.luminanceQuantTable[53] == 270
&&_v2.luminanceQuantTable[54] == 273
&&_v2.luminanceQuantTable[55] == 324
&&_v2.luminanceQuantTable[56] == 455
&&_v2.luminanceQuantTable[57] == 356
&&_v2.luminanceQuantTable[58] == 344
&&_v2.luminanceQuantTable[59] == 334
&&_v2.luminanceQuantTable[60] == 292
&&_v2.luminanceQuantTable[61] == 327
&&_v2.luminanceQuantTable[62] == 318
&&_v2.luminanceQuantTable[63] == 330
*/
  
}

function {:inline true} MS$_v1.initQuantTable$_v2.initQuantTable(_v1.luminanceQuantTable_old: [int]int, 
    _v1.Temp_old: [int]int, 
    _v1.OK_old: bool, 
    _v1.luminanceQuantTable_: [int]int, 
    _v2.luminanceQuantTable_old: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.OK_old: bool, 
    _v2.luminanceQuantTable_: [int]int)
   : bool
{
  //true
   (forall k: int :: 
    k >= 0 && k <= 63
       ==> _v2.luminanceQuantTable_[k] >= 270 && _v2.luminanceQuantTable_[k] <= 3276)
}
