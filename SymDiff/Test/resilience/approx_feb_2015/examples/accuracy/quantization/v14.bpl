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
modifies Temp;
modifies luminanceQuantTable;
{
	var i : int;
	var value : int;
        var data_approx: [int]int;

        // approximation
        //havoc data_approx;
        assume(forall j: int :: (j>=0 && j<= 63) ==> RelaxedEq(data_approx[j], data[j], 16));
        call initQuantTable();        
        
        i := 63;
	while(i >= 0) {
                //assume(RelaxedEq(data_approx[i], data[i], 16));
		value := data_approx[i] * luminanceQuantTable[i];
		value := sdiv((value + 16384), 32768);

		Temp[i] := value;
                i := i - 1;
	}
}
