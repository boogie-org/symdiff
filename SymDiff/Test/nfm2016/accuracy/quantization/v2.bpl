function {:inline true} RelaxedEq(x:int, y:int, e: int) returns (bool) {
  x <= y + e && y <= x + e
}

function {:builtin "div"} sdiv(i1: int, i2: int) returns (int);

const luminanceQuantTable: [int]int;

var Temp: [int]int;

procedure quantization(data: [int]int)
modifies Temp;
{
	var i : int;
	var value : int;
        var data_approx: [int]int;

        // approximation
        //havoc data_approx;
        assume(forall j: int :: (j>=0 && j<= 63) ==> RelaxedEq(data_approx[j], data[j], 16));
        
        i := 63;
	while(i >= 0) {
                //assume(RelaxedEq(data_approx[i], data[i], 16));
		value := data_approx[i] * luminanceQuantTable[i];
		value := sdiv((value + 16384), 32768);

		Temp[i] := value;
                i := i - 1;
	}
}

axiom(luminanceQuantTable[0] == 2047);
axiom(luminanceQuantTable[1] == 2978);
axiom(luminanceQuantTable[2] == 3276);
axiom(luminanceQuantTable[3] == 2047);
axiom(luminanceQuantTable[4] == 1365);
axiom(luminanceQuantTable[5] == 819);
axiom(luminanceQuantTable[6] == 642);
axiom(luminanceQuantTable[7] == 537);
axiom(luminanceQuantTable[8] == 2730);
axiom(luminanceQuantTable[9] == 2730);
axiom(luminanceQuantTable[10] == 2340);
axiom(luminanceQuantTable[11] == 1724);
axiom(luminanceQuantTable[12] == 1260);
axiom(luminanceQuantTable[13] == 564);
axiom(luminanceQuantTable[14] == 546);
axiom(luminanceQuantTable[15] == 595);
axiom(luminanceQuantTable[16] == 2340);
axiom(luminanceQuantTable[17] == 2520);
axiom(luminanceQuantTable[18] == 2047);
axiom(luminanceQuantTable[19] == 1365);
axiom(luminanceQuantTable[20] == 819);
axiom(luminanceQuantTable[21] == 574);
axiom(luminanceQuantTable[22] == 474);
axiom(luminanceQuantTable[23] == 585);
axiom(luminanceQuantTable[24] == 2340);
axiom(luminanceQuantTable[25] == 1927);
axiom(luminanceQuantTable[26] == 1489);
axiom(luminanceQuantTable[27] == 1129);
axiom(luminanceQuantTable[28] == 642);
axiom(luminanceQuantTable[29] == 376);
axiom(luminanceQuantTable[30] == 409);
axiom(luminanceQuantTable[31] == 528);
axiom(luminanceQuantTable[32] == 1820);
axiom(luminanceQuantTable[33] == 1489);
axiom(luminanceQuantTable[34] == 885);
axiom(luminanceQuantTable[35] == 585);
axiom(luminanceQuantTable[36] == 481);
axiom(luminanceQuantTable[37] == 300);
axiom(luminanceQuantTable[38] == 318);
axiom(luminanceQuantTable[39] == 425);
axiom(luminanceQuantTable[40] == 1365);
axiom(luminanceQuantTable[41] == 936);
axiom(luminanceQuantTable[42] == 595);
axiom(luminanceQuantTable[43] == 511);
axiom(luminanceQuantTable[44] == 404);
axiom(luminanceQuantTable[45] == 315);
axiom(luminanceQuantTable[46] == 289);
axiom(luminanceQuantTable[47] == 356);
axiom(luminanceQuantTable[48] == 668);
axiom(luminanceQuantTable[49] == 511);
axiom(luminanceQuantTable[50] == 420);
axiom(luminanceQuantTable[51] == 376);
axiom(luminanceQuantTable[52] == 318);
axiom(luminanceQuantTable[53] == 270);
axiom(luminanceQuantTable[54] == 273);
axiom(luminanceQuantTable[55] == 324);
axiom(luminanceQuantTable[56] == 455);
axiom(luminanceQuantTable[57] == 356);
axiom(luminanceQuantTable[58] == 344);
axiom(luminanceQuantTable[59] == 334);
axiom(luminanceQuantTable[60] == 292);
axiom(luminanceQuantTable[61] == 327);
axiom(luminanceQuantTable[62] == 318);
axiom(luminanceQuantTable[63] == 330);
