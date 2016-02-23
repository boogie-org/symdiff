function {:inline true} RelaxedEq(x:int, y:int, e: int) returns (bool) {
  x <= y + e && y <= x + e
}

function {:builtin "div"} sdiv(i1: int, i2: int) returns (int);

const luminanceQuantTable: [int]int;

var Temp: [int]int;

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
{
	var i : int;
	var value : int;

        i := 63;
	while(i >= 0) {
                //assume (data[i] <= 32767 && data[i] >= -32768); 
		value := data[i] * luminanceQuantTable[i];
		value := sdiv((value + 16384), 32768);

		Temp[i] := value;
                i := i - 1;
	}
}
