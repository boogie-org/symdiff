//i = 0; j = 0;
//While(src[i] != '\0') {
//          dest[j] = src[i];
//          if (src[i] == '\0') break; i++;
//          i++; j++;
//}
//dest[i] = '\0';

var src: [int]int;
var dest: [int]int;

const src_l: int;
const dest_l: int;

procedure string_copy()
modifies dest;
{
  var i: int;
  var j: int;

  i := 0;
  j := 0;

  assert i < src_l;
  while(src[i] != 0) {
    assert j < dest_l; 
    dest[j] := src[i];
    i := i + 1;
    j := j + 1;
    assert i < src_l;
    if (src[i] == 0) {
      break;
    } 
    i := i + 1;
    assert i < src_l;
  }
  assert j < dest_l;
  dest[j] := 0;

}

