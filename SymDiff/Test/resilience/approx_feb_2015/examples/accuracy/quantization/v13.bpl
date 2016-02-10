function {:inline true} RelaxedEq(x:int, y:int, e: int) returns (bool) {
  x <= y + e && y <= x + e
}

function {:builtin "div"} sdiv(i1: int, i2: int) returns (int);

var luminanceQuantTable: [int]int;

var Temp: [int]int;

procedure initQuantTable()
modifies luminanceQuantTable;
{
	luminanceQuantTable[0] := 2047;
	luminanceQuantTable[1] := 2978;
	luminanceQuantTable[2] := 3276;
	luminanceQuantTable[3] := 2047;
	luminanceQuantTable[4] := 1365;
	luminanceQuantTable[5] := 819;
	luminanceQuantTable[6] := 642;
	luminanceQuantTable[7] := 537;
	luminanceQuantTable[8] := 2730;
	luminanceQuantTable[9] := 2730;
	luminanceQuantTable[10] := 2340;
	luminanceQuantTable[11] := 1724;
	luminanceQuantTable[12] := 1260;
	luminanceQuantTable[13] := 564;
	luminanceQuantTable[14] := 546;
	luminanceQuantTable[15] := 595;
	luminanceQuantTable[16] := 2340;
	luminanceQuantTable[17] := 2520;
	luminanceQuantTable[18] := 2047;
	luminanceQuantTable[19] := 1365;
	luminanceQuantTable[20] := 819;
	luminanceQuantTable[21] := 574;
	luminanceQuantTable[22] := 474;
	luminanceQuantTable[23] := 585;
	luminanceQuantTable[24] := 2340;
	luminanceQuantTable[25] := 1927;
	luminanceQuantTable[26] := 1489;
	luminanceQuantTable[27] := 1129;
	luminanceQuantTable[28] := 642;
	luminanceQuantTable[29] := 376;
	luminanceQuantTable[30] := 409;
	luminanceQuantTable[31] := 528;
	luminanceQuantTable[32] := 1820;
	luminanceQuantTable[33] := 1489;
	luminanceQuantTable[34] := 885;
	luminanceQuantTable[35] := 585;
	luminanceQuantTable[36] := 481;
	luminanceQuantTable[37] := 300;
	luminanceQuantTable[38] := 318;
	luminanceQuantTable[39] := 425;
	luminanceQuantTable[40] := 1365;
	luminanceQuantTable[41] := 936;
	luminanceQuantTable[42] := 595;
	luminanceQuantTable[43] := 511;
	luminanceQuantTable[44] := 404;
	luminanceQuantTable[45] := 315;
	luminanceQuantTable[46] := 289;
	luminanceQuantTable[47] := 356;
	luminanceQuantTable[48] := 668;
	luminanceQuantTable[49] := 511;
	luminanceQuantTable[50] := 420;
	luminanceQuantTable[51] := 376;
	luminanceQuantTable[52] := 318;
	luminanceQuantTable[53] := 270;
	luminanceQuantTable[54] := 273;
	luminanceQuantTable[55] := 324;
	luminanceQuantTable[56] := 455;
	luminanceQuantTable[57] := 356;
	luminanceQuantTable[58] := 344;
	luminanceQuantTable[59] := 334;
	luminanceQuantTable[60] := 292;
	luminanceQuantTable[61] := 327;
	luminanceQuantTable[62] := 318;
	luminanceQuantTable[63] := 330;
}

procedure quantization(data: [int]int)
requires(data[0] <= 32767 && data[0] >= -32768); 
requires(data[1] <= 32767 && data[1] >= -32768); 
requires(data[2] <= 32767 && data[2] >= -32768); 
requires(data[3] <= 32767 && data[3] >= -32768); 
requires(data[4] <= 32767 && data[4] >= -32768);
        requires(data[5] <= 32767 && data[5] >= -32768);
        requires(data[6] <= 32767 && data[6] >= -32768);
        requires(data[7] <= 32767 && data[7] >= -32768);
        requires(data[8] <= 32767 && data[8] >= -32768);
        requires(data[9] <= 32767 && data[9] >= -32768);
        requires(data[10] <= 32767 && data[10] >= -32768);
        requires(data[11] <= 32767 && data[11] >= -32768);
        requires(data[12] <= 32767 && data[12] >= -32768);
        requires(data[13] <= 32767 && data[13] >= -32768);
        requires(data[14] <= 32767 && data[14] >= -32768);
        requires(data[15] <= 32767 && data[15] >= -32768);
        requires(data[16] <= 32767 && data[16] >= -32768);
        requires(data[17] <= 32767 && data[17] >= -32768);
        requires(data[18] <= 32767 && data[18] >= -32768);
        requires(data[19] <= 32767 && data[19] >= -32768);
        requires(data[20] <= 32767 && data[20] >= -32768);
        requires(data[21] <= 32767 && data[21] >= -32768);
        requires(data[22] <= 32767 && data[22] >= -32768);
        requires(data[23] <= 32767 && data[23] >= -32768);
        requires(data[24] <= 32767 && data[24] >= -32768);
        requires(data[25] <= 32767 && data[25] >= -32768);
        requires(data[26] <= 32767 && data[26] >= -32768);
        requires(data[27] <= 32767 && data[27] >= -32768);
        requires(data[28] <= 32767 && data[28] >= -32768);
        requires(data[29] <= 32767 && data[29] >= -32768);
        requires(data[30] <= 32767 && data[30] >= -32768);
        requires(data[31] <= 32767 && data[31] >= -32768);
        requires(data[32] <= 32767 && data[32] >= -32768);
        requires(data[33] <= 32767 && data[33] >= -32768);
        requires(data[34] <= 32767 && data[34] >= -32768);
        requires(data[35] <= 32767 && data[35] >= -32768);
        requires(data[36] <= 32767 && data[36] >= -32768);
        requires(data[37] <= 32767 && data[37] >= -32768);
        requires(data[38] <= 32767 && data[38] >= -32768);
        requires(data[39] <= 32767 && data[39] >= -32768);
        requires(data[40] <= 32767 && data[40] >= -32768);
        requires(data[41] <= 32767 && data[41] >= -32768);
        requires(data[42] <= 32767 && data[42] >= -32768);
        requires(data[43] <= 32767 && data[43] >= -32768);
        requires(data[44] <= 32767 && data[44] >= -32768);
        requires(data[45] <= 32767 && data[45] >= -32768);
        requires(data[46] <= 32767 && data[46] >= -32768);
        requires(data[47] <= 32767 && data[47] >= -32768);
        requires(data[48] <= 32767 && data[48] >= -32768);
        requires(data[49] <= 32767 && data[49] >= -32768);
        requires(data[50] <= 32767 && data[50] >= -32768);
        requires(data[51] <= 32767 && data[51] >= -32768);
        requires(data[52] <= 32767 && data[52] >= -32768);
        requires(data[53] <= 32767 && data[53] >= -32768);
        requires(data[54] <= 32767 && data[54] >= -32768);
        requires(data[55] <= 32767 && data[55] >= -32768);
        requires(data[56] <= 32767 && data[56] >= -32768);
        requires(data[57] <= 32767 && data[57] >= -32768);
        requires(data[58] <= 32767 && data[58] >= -32768);
        requires(data[59] <= 32767 && data[59] >= -32768);
        requires(data[60] <= 32767 && data[60] >= -32768);
        requires(data[61] <= 32767 && data[61] >= -32768);
        requires(data[62] <= 32767 && data[62] >= -32768);
        requires(data[63] <= 32767 && data[63] >= -32768);
modifies Temp;
modifies luminanceQuantTable;
{
	var i : int;
	var value : int;

        call initQuantTable();        
        i := 63;
	while(i >= 0) {
                //assume (data[i] <= 32767 && data[i] >= -32768); 
		value := data[i] * luminanceQuantTable[i];
		value := sdiv((value + 16384), 32768);

		Temp[i] := value;
                i := i - 1;
	}
}
