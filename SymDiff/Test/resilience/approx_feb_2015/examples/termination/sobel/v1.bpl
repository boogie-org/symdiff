var image: [int]int;
var weight: [int]int;
const MAX_IMAGESIZE: int; 
const DBL_MAX: int;

procedure sobel_filtering(y_size:int, x_size:int) returns(min: int, max:int)
{
  var yp: int;
  var xp: int;
  var j: int;
  var i: int;
  var pixel_value: int;
  
  yp := MAX_IMAGESIZE;
  min := DBL_MAX;
  max := -DBL_MAX;

  // iterate column
  while (yp < MAX_IMAGESIZE * (y_size - 1)) {
    // iterate row
    xp := yp + 1;
    while (xp < yp + x_size - 1) {
      pixel_value := 0; 
      j := -1;
      // iterate 3x3 matrix
      while(j < 1) {
        i := -1;
        while(i < 1) {
          pixel_value := pixel_value + weight[3*(j+1)+i+1] * image[xp+3*j+i];
          i := i + 1;
        }
        j := j + 1;
      }
      if (pixel_value < min) {
        min := pixel_value;
      }
      if (pixel_value > max) {
        max := pixel_value;
      }
      xp := xp + 1;
    }
    yp := yp + MAX_IMAGESIZE;
  } 
}

axiom MAX_IMAGESIZE == 4096;
axiom DBL_MAX > 0;
