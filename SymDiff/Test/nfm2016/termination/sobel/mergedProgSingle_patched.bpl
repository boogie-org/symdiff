var _v2.image: [int]int;

var _v2.weight: [int]int;

const _v2.MAX_IMAGESIZE: int;

const _v2.DBL_MAX: int;

axiom _v2.MAX_IMAGESIZE == 4096;

axiom _v2.DBL_MAX > 0;

procedure {:prefix "_v2"} _v2.sobel_filtering(y_size: int, x_size: int) returns (min: int, max: int);
  free ensures {:io_dependency "min", "y_size", "x_size", "weight", "image"} true;
  free ensures {:io_dependency "max", "y_size", "x_size", "weight", "image"} true;
  free ensures {:io_dependency "min", "y_size", "x_size", "weight", "image"} true;
  free ensures {:io_dependency "max", "y_size", "x_size", "weight", "image"} true;
  free ensures R'___v2.sobel_filtering(y_size, x_size, old(_v2.image), old(_v2.weight));
  free ensures R___v2.sobel_filtering(y_size, x_size, old(_v2.image), old(_v2.weight), min, max);



procedure {:prefix "_v2"} _v2.sobel_filtering_loop_anon15_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_i: int, out_pixel_value: int);
  free ensures {:io_dependency "out_i", "in_i", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_i", "weight", "in_j", "image", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_i", "weight", "in_j", "image", "in_xp"} true;
  free ensures R'___v2.sobel_filtering_loop_anon15_LoopHead(in_xp, in_j, in_i, in_pixel_value, old(_v2.image), old(_v2.weight));
  free ensures R___v2.sobel_filtering_loop_anon15_LoopHead(in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  out_i, 
  out_pixel_value);



procedure {:prefix "_v2"} _v2.sobel_filtering_loop_anon14_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_j: int, out_i: int, out_pixel_value: int);
  free ensures {:io_dependency "out_j", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_j", "weight", "in_xp", "image"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_j", "weight", "in_xp", "image"} true;
  free ensures R'___v2.sobel_filtering_loop_anon14_LoopHead(in_xp, in_j, in_i, in_pixel_value, old(_v2.image), old(_v2.weight));
  free ensures R___v2.sobel_filtering_loop_anon14_LoopHead(in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  out_j, 
  out_i, 
  out_pixel_value);



procedure {:prefix "_v2"} _v2.sobel_filtering_loop_anon13_LoopHead(in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int);
  free ensures {:io_dependency "out_min", "in_min", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_min", "in_min", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures R'___v2.sobel_filtering_loop_anon13_LoopHead(in_x_size, 
  in_min, 
  in_max, 
  in_yp, 
  in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight));
  free ensures R___v2.sobel_filtering_loop_anon13_LoopHead(in_x_size, 
  in_min, 
  in_max, 
  in_yp, 
  in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  out_min, 
  out_max, 
  out_xp, 
  out_j, 
  out_i, 
  out_pixel_value);



procedure {:prefix "_v2"} _v2.sobel_filtering_loop_anon12_LoopHead(in_y_size: int, 
    in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_yp: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int);
  free ensures {:io_dependency "out_min", "in_min", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_yp", "in_yp", "in_y_size", "in_x_size"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_min", "in_min", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_yp", "in_yp", "in_y_size", "in_x_size"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures R'___v2.sobel_filtering_loop_anon12_LoopHead(in_y_size, 
  in_x_size, 
  in_min, 
  in_max, 
  in_yp, 
  in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight));
  free ensures R___v2.sobel_filtering_loop_anon12_LoopHead(in_y_size, 
  in_x_size, 
  in_min, 
  in_max, 
  in_yp, 
  in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  out_min, 
  out_max, 
  out_yp, 
  out_xp, 
  out_j, 
  out_i, 
  out_pixel_value);



implementation _v2.sobel_filtering(y_size: int, x_size: int) returns (min: int, max: int)
{
  var yp: int;
  var xp: int;
  var j: int;
  var i: int;
  var pixel_value: int;

  anon0:
    yp := _v2.MAX_IMAGESIZE;
    min := _v2.DBL_MAX;
    max := -_v2.DBL_MAX;
    goto anon12_LoopHead;

  anon12_LoopHead:
    call min, max, yp, xp, j, i, pixel_value := _v2.sobel_filtering_loop_anon12_LoopHead(y_size, x_size, min, max, yp, xp, j, i, pixel_value);
    goto anon12_LoopHead_last;

  anon12_LoopHead_last:
    goto anon12_LoopDone, anon12_LoopBody;

  anon12_LoopBody:
    assume {:partition} yp < _v2.MAX_IMAGESIZE * (y_size - 1);
    xp := yp + 1;
    goto anon13_LoopHead;

  anon13_LoopHead:
    call min, max, xp, j, i, pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(x_size, min, max, yp, xp, j, i, pixel_value);
    goto anon13_LoopHead_last;

  anon13_LoopHead_last:
    goto anon13_LoopDone, anon13_LoopBody;

  anon13_LoopBody:
    assume {:partition} xp < yp + x_size - 1;
    pixel_value := 0;
    j := -1;
    goto anon14_LoopHead;

  anon14_LoopHead:
    call j, i, pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(xp, j, i, pixel_value);
    goto anon14_LoopHead_last;

  anon14_LoopHead_last:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} j < 1;
    i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call i, pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(xp, j, i, pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} i < 1;
    pixel_value := pixel_value + _v2.weight[3 * (j + 1) + i + 1] * _v2.image[xp + 3 * j + i];
    i := i + 1;
    goto anon15_LoopBody_dummy;

  anon15_LoopBody_dummy:
    assume false;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= i;
    goto anon5;

  anon5:
    j := j + 1;
    goto anon5_dummy;

  anon5_dummy:
    assume false;
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= j;
    goto anon6;

  anon6:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} min <= pixel_value;
    goto anon8;

  anon8:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} max >= pixel_value;
    goto anon10;

  anon10:
    xp := xp + 2;
    goto anon10_dummy;

  anon10_dummy:
    assume false;
    return;

  anon17_Then:
    assume {:partition} pixel_value > max;
    max := pixel_value;
    goto anon10;

  anon16_Then:
    assume {:partition} pixel_value < min;
    min := pixel_value;
    goto anon8;

  anon13_LoopDone:
    assume {:partition} yp + x_size - 1 <= xp;
    goto anon11;

  anon11:
    yp := yp + 2 * _v2.MAX_IMAGESIZE;
    goto anon11_dummy;

  anon11_dummy:
    assume false;
    return;

  anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (y_size - 1) <= yp;
    return;
}



implementation _v2.sobel_filtering_loop_anon15_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_i: int, out_pixel_value: int)
{

  entry:
    out_i, out_pixel_value := in_i, in_pixel_value;
    goto anon15_LoopHead;

  anon15_LoopHead:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v2.weight[3 * (in_j + 1) + out_i + 1] * _v2.image[in_xp + 3 * in_j + out_i];
    out_i := out_i + 1;
    goto anon15_LoopBody_dummy;

  anon15_LoopBody_dummy:
    call out_i, out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(in_xp, in_j, out_i, out_pixel_value);
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    out_i, out_pixel_value := in_i, in_pixel_value;
    return;
}



implementation _v2.sobel_filtering_loop_anon14_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_j: int, out_i: int, out_pixel_value: int)
{

  entry:
    out_j, out_i, out_pixel_value := in_j, in_i, in_pixel_value;
    goto anon14_LoopHead;

  anon14_LoopHead:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} out_j < 1;
    out_i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call out_i, out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(in_xp, out_j, out_i, out_pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v2.weight[3 * (out_j + 1) + out_i + 1] * _v2.image[in_xp + 3 * out_j + out_i];
    out_i := out_i + 1;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    goto anon5;

  anon5:
    out_j := out_j + 1;
    goto anon5_dummy;

  anon5_dummy:
    call out_j, out_i, out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(in_xp, out_j, out_i, out_pixel_value);
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= out_j;
    out_j, out_i, out_pixel_value := in_j, in_i, in_pixel_value;
    return;
}



implementation _v2.sobel_filtering_loop_anon13_LoopHead(in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int)
{

  entry:
    out_min, out_max, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_xp, in_j, in_i, in_pixel_value;
    goto anon13_LoopHead;

  anon13_LoopHead:
    goto anon13_LoopDone, anon13_LoopBody;

  anon13_LoopBody:
    assume {:partition} out_xp < in_yp + in_x_size - 1;
    out_pixel_value := 0;
    out_j := -1;
    goto anon14_LoopHead;

  anon14_LoopHead:
    call out_j, out_i, out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon14_LoopHead_last;

  anon14_LoopHead_last:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} out_j < 1;
    out_i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call out_i, out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v2.weight[3 * (out_j + 1) + out_i + 1] * _v2.image[out_xp + 3 * out_j + out_i];
    out_i := out_i + 1;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    goto anon5;

  anon5:
    out_j := out_j + 1;
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= out_j;
    goto anon6;

  anon6:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} out_min <= out_pixel_value;
    goto anon8;

  anon8:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} out_max >= out_pixel_value;
    goto anon10;

  anon10:
    out_xp := out_xp + 2;
    goto anon10_dummy;

  anon10_dummy:
    call out_min, out_max, out_xp, out_j, out_i, out_pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(in_x_size, out_min, out_max, in_yp, out_xp, out_j, out_i, out_pixel_value);
    return;

  anon17_Then:
    assume {:partition} out_pixel_value > out_max;
    out_max := out_pixel_value;
    goto anon10;

  anon16_Then:
    assume {:partition} out_pixel_value < out_min;
    out_min := out_pixel_value;
    goto anon8;

  anon13_LoopDone:
    assume {:partition} in_yp + in_x_size - 1 <= out_xp;
    out_min, out_max, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_xp, in_j, in_i, in_pixel_value;
    return;
}



implementation _v2.sobel_filtering_loop_anon12_LoopHead(in_y_size: int, 
    in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_yp: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int)
{

  entry:
    out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_yp, in_xp, in_j, in_i, in_pixel_value;
    goto anon12_LoopHead;

  anon12_LoopHead:
    goto anon12_LoopDone, anon12_LoopBody;

  anon12_LoopBody:
    assume {:partition} out_yp < _v2.MAX_IMAGESIZE * (in_y_size - 1);
    out_xp := out_yp + 1;
    goto anon13_LoopHead;

  anon13_LoopHead:
    call out_min, out_max, out_xp, out_j, out_i, out_pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(in_x_size, out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value);
    goto anon13_LoopHead_last;

  anon13_LoopHead_last:
    goto anon13_LoopDone, anon13_LoopBody;

  anon13_LoopBody:
    assume {:partition} out_xp < out_yp + in_x_size - 1;
    out_pixel_value := 0;
    out_j := -1;
    goto anon14_LoopHead;

  anon14_LoopHead:
    call out_j, out_i, out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon14_LoopHead_last;

  anon14_LoopHead_last:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} out_j < 1;
    out_i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call out_i, out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v2.weight[3 * (out_j + 1) + out_i + 1] * _v2.image[out_xp + 3 * out_j + out_i];
    out_i := out_i + 1;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    goto anon5;

  anon5:
    out_j := out_j + 1;
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= out_j;
    goto anon6;

  anon6:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} out_min <= out_pixel_value;
    goto anon8;

  anon8:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} out_max >= out_pixel_value;
    goto anon10;

  anon10:
    out_xp := out_xp + 2;
    return;

  anon17_Then:
    assume {:partition} out_pixel_value > out_max;
    out_max := out_pixel_value;
    goto anon10;

  anon16_Then:
    assume {:partition} out_pixel_value < out_min;
    out_min := out_pixel_value;
    goto anon8;

  anon13_LoopDone:
    assume {:partition} out_yp + in_x_size - 1 <= out_xp;
    goto anon11;

  anon11:
    out_yp := out_yp + 2 * _v2.MAX_IMAGESIZE;
    goto anon11_dummy;

  anon11_dummy:
    call out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value := _v2.sobel_filtering_loop_anon12_LoopHead(in_y_size, in_x_size, out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value);
    return;

  anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (in_y_size - 1) <= out_yp;
    out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_yp, in_xp, in_j, in_i, in_pixel_value;
    return;
}



var _v1.image: [int]int;

var _v1.weight: [int]int;

const _v1.MAX_IMAGESIZE: int;

const _v1.DBL_MAX: int;

axiom _v2.MAX_IMAGESIZE == 4096;

axiom _v2.DBL_MAX > 0;

procedure {:prefix "_v1"} _v1.sobel_filtering(y_size: int, x_size: int) returns (min: int, max: int);
  free ensures {:io_dependency "min", "y_size", "x_size", "weight", "image"} true;
  free ensures {:io_dependency "max", "y_size", "x_size", "weight", "image"} true;
  free ensures {:io_dependency "min", "y_size", "x_size", "weight", "image"} true;
  free ensures {:io_dependency "max", "y_size", "x_size", "weight", "image"} true;
  free ensures R___v1.sobel_filtering(y_size, x_size, old(_v1.image), old(_v1.weight), min, max);



procedure {:prefix "_v1"} _v1.sobel_filtering_loop_anon15_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_i: int, out_pixel_value: int);
  free ensures {:io_dependency "out_i", "in_i", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_i", "weight", "in_j", "image", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_i", "weight", "in_j", "image", "in_xp"} true;
  free ensures R___v1.sobel_filtering_loop_anon15_LoopHead(in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  out_i, 
  out_pixel_value);



procedure {:prefix "_v1"} _v1.sobel_filtering_loop_anon14_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_j: int, out_i: int, out_pixel_value: int);
  free ensures {:io_dependency "out_j", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_j", "weight", "in_xp", "image"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_j", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_j", "weight", "in_xp", "image"} true;
  free ensures R___v1.sobel_filtering_loop_anon14_LoopHead(in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  out_j, 
  out_i, 
  out_pixel_value);



procedure {:prefix "_v1"} _v1.sobel_filtering_loop_anon13_LoopHead(in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int);
  free ensures {:io_dependency "out_min", "in_min", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_min", "in_min", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_yp", "in_x_size", "in_xp"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_yp", "in_x_size", "in_xp", "weight", "image"} true;
  free ensures R___v1.sobel_filtering_loop_anon13_LoopHead(in_x_size, 
  in_min, 
  in_max, 
  in_yp, 
  in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  out_min, 
  out_max, 
  out_xp, 
  out_j, 
  out_i, 
  out_pixel_value);



procedure {:prefix "_v1"} _v1.sobel_filtering_loop_anon12_LoopHead(in_y_size: int, 
    in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_yp: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int);
  free ensures {:io_dependency "out_min", "in_min", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_yp", "in_yp", "in_y_size", "in_x_size"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_min", "in_min", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures {:io_dependency "out_yp", "in_yp", "in_y_size", "in_x_size"} true;
  free ensures {:io_dependency "out_xp", "in_xp", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_j", "in_j", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_y_size", "in_yp", "in_x_size"} true;
  free ensures {:io_dependency "out_pixel_value", "in_pixel_value", "in_y_size", "in_yp", "in_x_size", "weight", "image"} true;
  free ensures R___v1.sobel_filtering_loop_anon12_LoopHead(in_y_size, 
  in_x_size, 
  in_min, 
  in_max, 
  in_yp, 
  in_xp, 
  in_j, 
  in_i, 
  in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  out_min, 
  out_max, 
  out_yp, 
  out_xp, 
  out_j, 
  out_i, 
  out_pixel_value);



implementation _v1.sobel_filtering(y_size: int, x_size: int) returns (min: int, max: int)
{
  var yp: int;
  var xp: int;
  var j: int;
  var i: int;
  var pixel_value: int;

  anon0:
    yp := _v2.MAX_IMAGESIZE;
    min := _v2.DBL_MAX;
    max := -_v2.DBL_MAX;
    goto anon12_LoopHead;

  anon12_LoopHead:
    call min, max, yp, xp, j, i, pixel_value := _v1.sobel_filtering_loop_anon12_LoopHead(y_size, x_size, min, max, yp, xp, j, i, pixel_value);
    goto anon12_LoopHead_last;

  anon12_LoopHead_last:
    goto anon12_LoopDone, anon12_LoopBody;

  anon12_LoopBody:
    assume {:partition} yp < _v2.MAX_IMAGESIZE * (y_size - 1);
    xp := yp + 1;
    goto anon13_LoopHead;

  anon13_LoopHead:
    call min, max, xp, j, i, pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(x_size, min, max, yp, xp, j, i, pixel_value);
    goto anon13_LoopHead_last;

  anon13_LoopHead_last:
    goto anon13_LoopDone, anon13_LoopBody;

  anon13_LoopBody:
    assume {:partition} xp < yp + x_size - 1;
    pixel_value := 0;
    j := -1;
    goto anon14_LoopHead;

  anon14_LoopHead:
    call j, i, pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(xp, j, i, pixel_value);
    goto anon14_LoopHead_last;

  anon14_LoopHead_last:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} j < 1;
    i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call i, pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(xp, j, i, pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} i < 1;
    pixel_value := pixel_value + _v1.weight[3 * (j + 1) + i + 1] * _v1.image[xp + 3 * j + i];
    i := i + 1;
    goto anon15_LoopBody_dummy;

  anon15_LoopBody_dummy:
    assume false;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= i;
    goto anon5;

  anon5:
    j := j + 1;
    goto anon5_dummy;

  anon5_dummy:
    assume false;
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= j;
    goto anon6;

  anon6:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} min <= pixel_value;
    goto anon8;

  anon8:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} max >= pixel_value;
    goto anon10;

  anon10:
    xp := xp + 1;
    goto anon10_dummy;

  anon10_dummy:
    assume false;
    return;

  anon17_Then:
    assume {:partition} pixel_value > max;
    max := pixel_value;
    goto anon10;

  anon16_Then:
    assume {:partition} pixel_value < min;
    min := pixel_value;
    goto anon8;

  anon13_LoopDone:
    assume {:partition} yp + x_size - 1 <= xp;
    goto anon11;

  anon11:
    yp := yp + _v2.MAX_IMAGESIZE;
    goto anon11_dummy;

  anon11_dummy:
    assume false;
    return;

  anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (y_size - 1) <= yp;
    return;
}



implementation _v1.sobel_filtering_loop_anon15_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_i: int, out_pixel_value: int)
{

  entry:
    out_i, out_pixel_value := in_i, in_pixel_value;
    goto anon15_LoopHead;

  anon15_LoopHead:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v1.weight[3 * (in_j + 1) + out_i + 1] * _v1.image[in_xp + 3 * in_j + out_i];
    out_i := out_i + 1;
    goto anon15_LoopBody_dummy;

  anon15_LoopBody_dummy:
    call out_i, out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(in_xp, in_j, out_i, out_pixel_value);
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    out_i, out_pixel_value := in_i, in_pixel_value;
    return;
}



implementation _v1.sobel_filtering_loop_anon14_LoopHead(in_xp: int, in_j: int, in_i: int, in_pixel_value: int)
   returns (out_j: int, out_i: int, out_pixel_value: int)
{

  entry:
    out_j, out_i, out_pixel_value := in_j, in_i, in_pixel_value;
    goto anon14_LoopHead;

  anon14_LoopHead:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} out_j < 1;
    out_i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call out_i, out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(in_xp, out_j, out_i, out_pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v1.weight[3 * (out_j + 1) + out_i + 1] * _v1.image[in_xp + 3 * out_j + out_i];
    out_i := out_i + 1;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    goto anon5;

  anon5:
    out_j := out_j + 1;
    goto anon5_dummy;

  anon5_dummy:
    call out_j, out_i, out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(in_xp, out_j, out_i, out_pixel_value);
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= out_j;
    out_j, out_i, out_pixel_value := in_j, in_i, in_pixel_value;
    return;
}



implementation _v1.sobel_filtering_loop_anon13_LoopHead(in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int)
{

  entry:
    out_min, out_max, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_xp, in_j, in_i, in_pixel_value;
    goto anon13_LoopHead;

  anon13_LoopHead:
    goto anon13_LoopDone, anon13_LoopBody;

  anon13_LoopBody:
    assume {:partition} out_xp < in_yp + in_x_size - 1;
    out_pixel_value := 0;
    out_j := -1;
    goto anon14_LoopHead;

  anon14_LoopHead:
    call out_j, out_i, out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon14_LoopHead_last;

  anon14_LoopHead_last:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} out_j < 1;
    out_i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call out_i, out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v1.weight[3 * (out_j + 1) + out_i + 1] * _v1.image[out_xp + 3 * out_j + out_i];
    out_i := out_i + 1;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    goto anon5;

  anon5:
    out_j := out_j + 1;
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= out_j;
    goto anon6;

  anon6:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} out_min <= out_pixel_value;
    goto anon8;

  anon8:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} out_max >= out_pixel_value;
    goto anon10;

  anon10:
    out_xp := out_xp + 1;
    goto anon10_dummy;

  anon10_dummy:
    call out_min, out_max, out_xp, out_j, out_i, out_pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(in_x_size, out_min, out_max, in_yp, out_xp, out_j, out_i, out_pixel_value);
    return;

  anon17_Then:
    assume {:partition} out_pixel_value > out_max;
    out_max := out_pixel_value;
    goto anon10;

  anon16_Then:
    assume {:partition} out_pixel_value < out_min;
    out_min := out_pixel_value;
    goto anon8;

  anon13_LoopDone:
    assume {:partition} in_yp + in_x_size - 1 <= out_xp;
    out_min, out_max, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_xp, in_j, in_i, in_pixel_value;
    return;
}



implementation _v1.sobel_filtering_loop_anon12_LoopHead(in_y_size: int, 
    in_x_size: int, 
    in_min: int, 
    in_max: int, 
    in_yp: int, 
    in_xp: int, 
    in_j: int, 
    in_i: int, 
    in_pixel_value: int)
   returns (out_min: int, 
    out_max: int, 
    out_yp: int, 
    out_xp: int, 
    out_j: int, 
    out_i: int, 
    out_pixel_value: int)
{

  entry:
    out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_yp, in_xp, in_j, in_i, in_pixel_value;
    goto anon12_LoopHead;

  anon12_LoopHead:
    goto anon12_LoopDone, anon12_LoopBody;

  anon12_LoopBody:
    assume {:partition} out_yp < _v2.MAX_IMAGESIZE * (in_y_size - 1);
    out_xp := out_yp + 1;
    goto anon13_LoopHead;

  anon13_LoopHead:
    call out_min, out_max, out_xp, out_j, out_i, out_pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(in_x_size, out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value);
    goto anon13_LoopHead_last;

  anon13_LoopHead_last:
    goto anon13_LoopDone, anon13_LoopBody;

  anon13_LoopBody:
    assume {:partition} out_xp < out_yp + in_x_size - 1;
    out_pixel_value := 0;
    out_j := -1;
    goto anon14_LoopHead;

  anon14_LoopHead:
    call out_j, out_i, out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon14_LoopHead_last;

  anon14_LoopHead_last:
    goto anon14_LoopDone, anon14_LoopBody;

  anon14_LoopBody:
    assume {:partition} out_j < 1;
    out_i := -1;
    goto anon15_LoopHead;

  anon15_LoopHead:
    call out_i, out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(out_xp, out_j, out_i, out_pixel_value);
    goto anon15_LoopHead_last;

  anon15_LoopHead_last:
    goto anon15_LoopDone, anon15_LoopBody;

  anon15_LoopBody:
    assume {:partition} out_i < 1;
    out_pixel_value := out_pixel_value
   + _v1.weight[3 * (out_j + 1) + out_i + 1] * _v1.image[out_xp + 3 * out_j + out_i];
    out_i := out_i + 1;
    return;

  anon15_LoopDone:
    assume {:partition} 1 <= out_i;
    goto anon5;

  anon5:
    out_j := out_j + 1;
    return;

  anon14_LoopDone:
    assume {:partition} 1 <= out_j;
    goto anon6;

  anon6:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} out_min <= out_pixel_value;
    goto anon8;

  anon8:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} out_max >= out_pixel_value;
    goto anon10;

  anon10:
    out_xp := out_xp + 1;
    return;

  anon17_Then:
    assume {:partition} out_pixel_value > out_max;
    out_max := out_pixel_value;
    goto anon10;

  anon16_Then:
    assume {:partition} out_pixel_value < out_min;
    out_min := out_pixel_value;
    goto anon8;

  anon13_LoopDone:
    assume {:partition} out_yp + in_x_size - 1 <= out_xp;
    goto anon11;

  anon11:
    out_yp := out_yp + _v2.MAX_IMAGESIZE;
    goto anon11_dummy;

  anon11_dummy:
    call out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value := _v1.sobel_filtering_loop_anon12_LoopHead(in_y_size, in_x_size, out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value);
    return;

  anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (in_y_size - 1) <= out_yp;
    out_min, out_max, out_yp, out_xp, out_j, out_i, out_pixel_value := in_min, in_max, in_yp, in_xp, in_j, in_i, in_pixel_value;
    return;
}



function R___v2.sobel_filtering(.y_size: int, 
    .x_size: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    .min: int, 
    .max: int)
   : bool;

function R'___v2.sobel_filtering(.y_size: int, .x_size: int, _v2.image_old: [int]int, _v2.weight_old: [int]int)
   : bool;

function R___v2.sobel_filtering_loop_anon15_LoopHead(.in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R'___v2.sobel_filtering_loop_anon15_LoopHead(.in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool;

function R___v2.sobel_filtering_loop_anon14_LoopHead(.in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    .out_j: int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R'___v2.sobel_filtering_loop_anon14_LoopHead(.in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool;

function R___v2.sobel_filtering_loop_anon13_LoopHead(.in_x_size: int, 
    .in_min: int, 
    .in_max: int, 
    .in_yp: int, 
    .in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    .out_min: int, 
    .out_max: int, 
    .out_xp: int, 
    .out_j: int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R'___v2.sobel_filtering_loop_anon13_LoopHead(.in_x_size: int, 
    .in_min: int, 
    .in_max: int, 
    .in_yp: int, 
    .in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool;

function R___v2.sobel_filtering_loop_anon12_LoopHead(.in_y_size: int, 
    .in_x_size: int, 
    .in_min: int, 
    .in_max: int, 
    .in_yp: int, 
    .in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    .out_min: int, 
    .out_max: int, 
    .out_yp: int, 
    .out_xp: int, 
    .out_j: int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R'___v2.sobel_filtering_loop_anon12_LoopHead(.in_y_size: int, 
    .in_x_size: int, 
    .in_min: int, 
    .in_max: int, 
    .in_yp: int, 
    .in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool;

function R___v1.sobel_filtering(.y_size: int, 
    .x_size: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    .min: int, 
    .max: int)
   : bool;

function R___v1.sobel_filtering_loop_anon15_LoopHead(.in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R___v1.sobel_filtering_loop_anon14_LoopHead(.in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    .out_j: int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R___v1.sobel_filtering_loop_anon13_LoopHead(.in_x_size: int, 
    .in_min: int, 
    .in_max: int, 
    .in_yp: int, 
    .in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    .out_min: int, 
    .out_max: int, 
    .out_xp: int, 
    .out_j: int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function R___v1.sobel_filtering_loop_anon12_LoopHead(.in_y_size: int, 
    .in_x_size: int, 
    .in_min: int, 
    .in_max: int, 
    .in_yp: int, 
    .in_xp: int, 
    .in_j: int, 
    .in_i: int, 
    .in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    .out_min: int, 
    .out_max: int, 
    .out_yp: int, 
    .out_xp: int, 
    .out_j: int, 
    .out_i: int, 
    .out_pixel_value: int)
   : bool;

function {:inline true} MS$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size: int, 
    _v1.x_size: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.min: int, 
    _v1.max: int, 
    _v2.y_size: int, 
    _v2.x_size: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.min: int, 
    _v2.max: int)
   : bool
{
  _v1.y_size == _v2.y_size
     && _v1.x_size == _v2.x_size
     && _v1.image_old == _v2.image_old
     && _v1.weight_old == _v2.weight_old
   ==> _v1.min == _v2.min && _v1.max == _v2.max
}

axiom (forall _v1.y_size: int, 
    _v1.x_size: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.min: int, 
    _v1.max: int, 
    _v2.y_size: int, 
    _v2.x_size: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.min: int, 
    _v2.max: int :: 
  { R___v1.sobel_filtering(_v1.y_size, _v1.x_size, _v1.image_old, _v1.weight_old, _v1.min, _v1.max), R___v2.sobel_filtering(_v2.y_size, _v2.x_size, _v2.image_old, _v2.weight_old, _v2.min, _v2.max) } 
  R___v1.sobel_filtering(_v1.y_size, _v1.x_size, _v1.image_old, _v1.weight_old, _v1.min, _v1.max)
       && R___v2.sobel_filtering(_v2.y_size, _v2.x_size, _v2.image_old, _v2.weight_old, _v2.min, _v2.max)
     ==> MS$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size, 
      _v1.x_size, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.min, 
      _v1.max, 
      _v2.y_size, 
      _v2.x_size, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.min, 
      _v2.max));

function {:inline true} MS_pre_$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size: int, 
    _v1.x_size: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.y_size: int, 
    _v2.x_size: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
 _v1.y_size == _v2.y_size && _v1.x_size == _v2.x_size 
}

procedure {:MS_procs "_v1.sobel_filtering", "_v2.sobel_filtering"} MS_Check__v1.sobel_filtering___v2.sobel_filtering(_v1.y_size: int, _v1.x_size: int, _v2.y_size: int, _v2.x_size: int)
   returns (_v1.min: int, _v1.max: int, _v2.min: int, _v2.max: int);
  requires MS_pre_$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size, 
  _v1.x_size, 
  _v1.image, 
  _v1.weight, 
  _v2.y_size, 
  _v2.x_size, 
  _v2.image, 
  _v2.weight);
  ensures MS$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size, 
  _v1.x_size, 
  old(_v1.image), 
  old(_v1.weight), 
  _v1.min, 
  _v1.max, 
  _v2.y_size, 
  _v2.x_size, 
  old(_v2.image), 
  old(_v2.weight), 
  _v2.min, 
  _v2.max);



implementation MS_Check__v1.sobel_filtering___v2.sobel_filtering(_v1.y_size: int, _v1.x_size: int, _v2.y_size: int, _v2.x_size: int)
   returns (_v1.min: int, _v1.max: int, _v2.min: int, _v2.max: int)
{
  var inline$_v1.sobel_filtering$0$yp: int;
  var inline$_v1.sobel_filtering$0$xp: int;
  var inline$_v1.sobel_filtering$0$j: int;
  var inline$_v1.sobel_filtering$0$i: int;
  var inline$_v1.sobel_filtering$0$pixel_value: int;
  var inline$_v1.sobel_filtering$0$y_size: int;
  var inline$_v1.sobel_filtering$0$x_size: int;
  var inline$_v1.sobel_filtering$0$min: int;
  var inline$_v1.sobel_filtering$0$max: int;
  var inline$_v2.sobel_filtering$0$yp: int;
  var inline$_v2.sobel_filtering$0$xp: int;
  var inline$_v2.sobel_filtering$0$j: int;
  var inline$_v2.sobel_filtering$0$i: int;
  var inline$_v2.sobel_filtering$0$pixel_value: int;
  var inline$_v2.sobel_filtering$0$y_size: int;
  var inline$_v2.sobel_filtering$0$x_size: int;
  var inline$_v2.sobel_filtering$0$min: int;
  var inline$_v2.sobel_filtering$0$max: int;

  START:
    goto inline$_v1.sobel_filtering$0$Entry;

  inline$_v1.sobel_filtering$0$Entry:
    inline$_v1.sobel_filtering$0$y_size := _v1.y_size;
    inline$_v1.sobel_filtering$0$x_size := _v1.x_size;
    havoc inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value, inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max;
    goto inline$_v1.sobel_filtering$0$anon0;

  inline$_v1.sobel_filtering$0$anon0:
    inline$_v1.sobel_filtering$0$yp := _v2.MAX_IMAGESIZE;
    inline$_v1.sobel_filtering$0$min := _v2.DBL_MAX;
    inline$_v1.sobel_filtering$0$max := -_v2.DBL_MAX;
    goto inline$_v1.sobel_filtering$0$anon12_LoopHead;

  inline$_v1.sobel_filtering$0$anon12_LoopHead:
    call inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon12_LoopHead(inline$_v1.sobel_filtering$0$y_size, inline$_v1.sobel_filtering$0$x_size, inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon12_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon12_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon12_LoopDone, inline$_v1.sobel_filtering$0$anon12_LoopBody;

  inline$_v1.sobel_filtering$0$anon12_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$yp
   < _v2.MAX_IMAGESIZE * (inline$_v1.sobel_filtering$0$y_size - 1);
    inline$_v1.sobel_filtering$0$xp := inline$_v1.sobel_filtering$0$yp + 1;
    goto inline$_v1.sobel_filtering$0$anon13_LoopHead;

  inline$_v1.sobel_filtering$0$anon13_LoopHead:
    call inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(inline$_v1.sobel_filtering$0$x_size, inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon13_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon13_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon13_LoopDone, inline$_v1.sobel_filtering$0$anon13_LoopBody;

  inline$_v1.sobel_filtering$0$anon13_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$xp
   < inline$_v1.sobel_filtering$0$yp + inline$_v1.sobel_filtering$0$x_size - 1;
    inline$_v1.sobel_filtering$0$pixel_value := 0;
    inline$_v1.sobel_filtering$0$j := -1;
    goto inline$_v1.sobel_filtering$0$anon14_LoopHead;

  inline$_v1.sobel_filtering$0$anon14_LoopHead:
    call inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon14_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon14_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon14_LoopDone, inline$_v1.sobel_filtering$0$anon14_LoopBody;

  inline$_v1.sobel_filtering$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$j < 1;
    inline$_v1.sobel_filtering$0$i := -1;
    goto inline$_v1.sobel_filtering$0$anon15_LoopHead;

  inline$_v1.sobel_filtering$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon15_LoopDone, inline$_v1.sobel_filtering$0$anon15_LoopBody;

  inline$_v1.sobel_filtering$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$i < 1;
    inline$_v1.sobel_filtering$0$pixel_value := inline$_v1.sobel_filtering$0$pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering$0$j + 1) + inline$_v1.sobel_filtering$0$i + 1]
     * _v1.image[inline$_v1.sobel_filtering$0$xp
       + 3 * inline$_v1.sobel_filtering$0$j
       + inline$_v1.sobel_filtering$0$i];
    inline$_v1.sobel_filtering$0$i := inline$_v1.sobel_filtering$0$i + 1;
    goto inline$_v1.sobel_filtering$0$anon15_LoopBody_dummy;

  inline$_v1.sobel_filtering$0$anon15_LoopBody_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering$0$i;
    goto inline$_v1.sobel_filtering$0$anon5;

  inline$_v1.sobel_filtering$0$anon5:
    inline$_v1.sobel_filtering$0$j := inline$_v1.sobel_filtering$0$j + 1;
    goto inline$_v1.sobel_filtering$0$anon5_dummy;

  inline$_v1.sobel_filtering$0$anon5_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering$0$j;
    goto inline$_v1.sobel_filtering$0$anon6;

  inline$_v1.sobel_filtering$0$anon6:
    goto inline$_v1.sobel_filtering$0$anon16_Then, inline$_v1.sobel_filtering$0$anon16_Else;

  inline$_v1.sobel_filtering$0$anon16_Else:
    assume {:partition} inline$_v1.sobel_filtering$0$min <= inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon8;

  inline$_v1.sobel_filtering$0$anon8:
    goto inline$_v1.sobel_filtering$0$anon17_Then, inline$_v1.sobel_filtering$0$anon17_Else;

  inline$_v1.sobel_filtering$0$anon17_Else:
    assume {:partition} inline$_v1.sobel_filtering$0$max >= inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon10;

  inline$_v1.sobel_filtering$0$anon10:
    inline$_v1.sobel_filtering$0$xp := inline$_v1.sobel_filtering$0$xp + 1;
    goto inline$_v1.sobel_filtering$0$anon10_dummy;

  inline$_v1.sobel_filtering$0$anon10_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon17_Then:
    assume {:partition} inline$_v1.sobel_filtering$0$pixel_value > inline$_v1.sobel_filtering$0$max;
    inline$_v1.sobel_filtering$0$max := inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon10;

  inline$_v1.sobel_filtering$0$anon16_Then:
    assume {:partition} inline$_v1.sobel_filtering$0$pixel_value < inline$_v1.sobel_filtering$0$min;
    inline$_v1.sobel_filtering$0$min := inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon8;

  inline$_v1.sobel_filtering$0$anon13_LoopDone:
    assume {:partition} inline$_v1.sobel_filtering$0$yp + inline$_v1.sobel_filtering$0$x_size - 1
   <= inline$_v1.sobel_filtering$0$xp;
    goto inline$_v1.sobel_filtering$0$anon11;

  inline$_v1.sobel_filtering$0$anon11:
    inline$_v1.sobel_filtering$0$yp := inline$_v1.sobel_filtering$0$yp + _v2.MAX_IMAGESIZE;
    goto inline$_v1.sobel_filtering$0$anon11_dummy;

  inline$_v1.sobel_filtering$0$anon11_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (inline$_v1.sobel_filtering$0$y_size - 1)
   <= inline$_v1.sobel_filtering$0$yp;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.min := inline$_v1.sobel_filtering$0$min;
    _v1.max := inline$_v1.sobel_filtering$0$max;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering$0$Entry;

  inline$_v2.sobel_filtering$0$Entry:
    inline$_v2.sobel_filtering$0$y_size := _v2.y_size;
    inline$_v2.sobel_filtering$0$x_size := _v2.x_size;
    havoc inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value, inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max;
    goto inline$_v2.sobel_filtering$0$anon0;

  inline$_v2.sobel_filtering$0$anon0:
    inline$_v2.sobel_filtering$0$yp := _v2.MAX_IMAGESIZE;
    inline$_v2.sobel_filtering$0$min := _v2.DBL_MAX;
    inline$_v2.sobel_filtering$0$max := -_v2.DBL_MAX;
    goto inline$_v2.sobel_filtering$0$anon12_LoopHead;

  inline$_v2.sobel_filtering$0$anon12_LoopHead:
    call inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon12_LoopHead(inline$_v2.sobel_filtering$0$y_size, inline$_v2.sobel_filtering$0$x_size, inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon12_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon12_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon12_LoopDone, inline$_v2.sobel_filtering$0$anon12_LoopBody;

  inline$_v2.sobel_filtering$0$anon12_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$yp
   < _v2.MAX_IMAGESIZE * (inline$_v2.sobel_filtering$0$y_size - 1);
    inline$_v2.sobel_filtering$0$xp := inline$_v2.sobel_filtering$0$yp + 1;
    goto inline$_v2.sobel_filtering$0$anon13_LoopHead;

  inline$_v2.sobel_filtering$0$anon13_LoopHead:
    call inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering$0$x_size, inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon13_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon13_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon13_LoopDone, inline$_v2.sobel_filtering$0$anon13_LoopBody;

  inline$_v2.sobel_filtering$0$anon13_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$xp
   < inline$_v2.sobel_filtering$0$yp + inline$_v2.sobel_filtering$0$x_size - 1;
    inline$_v2.sobel_filtering$0$pixel_value := 0;
    inline$_v2.sobel_filtering$0$j := -1;
    goto inline$_v2.sobel_filtering$0$anon14_LoopHead;

  inline$_v2.sobel_filtering$0$anon14_LoopHead:
    call inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon14_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon14_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon14_LoopDone, inline$_v2.sobel_filtering$0$anon14_LoopBody;

  inline$_v2.sobel_filtering$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$j < 1;
    inline$_v2.sobel_filtering$0$i := -1;
    goto inline$_v2.sobel_filtering$0$anon15_LoopHead;

  inline$_v2.sobel_filtering$0$anon15_LoopHead:
    call inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon15_LoopDone, inline$_v2.sobel_filtering$0$anon15_LoopBody;

  inline$_v2.sobel_filtering$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$i < 1;
    inline$_v2.sobel_filtering$0$pixel_value := inline$_v2.sobel_filtering$0$pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering$0$j + 1) + inline$_v2.sobel_filtering$0$i + 1]
     * _v2.image[inline$_v2.sobel_filtering$0$xp
       + 3 * inline$_v2.sobel_filtering$0$j
       + inline$_v2.sobel_filtering$0$i];
    inline$_v2.sobel_filtering$0$i := inline$_v2.sobel_filtering$0$i + 1;
    goto inline$_v2.sobel_filtering$0$anon15_LoopBody_dummy;

  inline$_v2.sobel_filtering$0$anon15_LoopBody_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering$0$i;
    goto inline$_v2.sobel_filtering$0$anon5;

  inline$_v2.sobel_filtering$0$anon5:
    inline$_v2.sobel_filtering$0$j := inline$_v2.sobel_filtering$0$j + 1;
    goto inline$_v2.sobel_filtering$0$anon5_dummy;

  inline$_v2.sobel_filtering$0$anon5_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering$0$j;
    goto inline$_v2.sobel_filtering$0$anon6;

  inline$_v2.sobel_filtering$0$anon6:
    goto inline$_v2.sobel_filtering$0$anon16_Then, inline$_v2.sobel_filtering$0$anon16_Else;

  inline$_v2.sobel_filtering$0$anon16_Else:
    assume {:partition} inline$_v2.sobel_filtering$0$min <= inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon8;

  inline$_v2.sobel_filtering$0$anon8:
    goto inline$_v2.sobel_filtering$0$anon17_Then, inline$_v2.sobel_filtering$0$anon17_Else;

  inline$_v2.sobel_filtering$0$anon17_Else:
    assume {:partition} inline$_v2.sobel_filtering$0$max >= inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon10;

  inline$_v2.sobel_filtering$0$anon10:
    inline$_v2.sobel_filtering$0$xp := inline$_v2.sobel_filtering$0$xp + 2;
    goto inline$_v2.sobel_filtering$0$anon10_dummy;

  inline$_v2.sobel_filtering$0$anon10_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon17_Then:
    assume {:partition} inline$_v2.sobel_filtering$0$pixel_value > inline$_v2.sobel_filtering$0$max;
    inline$_v2.sobel_filtering$0$max := inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon10;

  inline$_v2.sobel_filtering$0$anon16_Then:
    assume {:partition} inline$_v2.sobel_filtering$0$pixel_value < inline$_v2.sobel_filtering$0$min;
    inline$_v2.sobel_filtering$0$min := inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon8;

  inline$_v2.sobel_filtering$0$anon13_LoopDone:
    assume {:partition} inline$_v2.sobel_filtering$0$yp + inline$_v2.sobel_filtering$0$x_size - 1
   <= inline$_v2.sobel_filtering$0$xp;
    goto inline$_v2.sobel_filtering$0$anon11;

  inline$_v2.sobel_filtering$0$anon11:
    inline$_v2.sobel_filtering$0$yp := inline$_v2.sobel_filtering$0$yp + 2 * _v2.MAX_IMAGESIZE;
    goto inline$_v2.sobel_filtering$0$anon11_dummy;

  inline$_v2.sobel_filtering$0$anon11_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (inline$_v2.sobel_filtering$0$y_size - 1)
   <= inline$_v2.sobel_filtering$0$yp;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.min := inline$_v2.sobel_filtering$0$min;
    _v2.max := inline$_v2.sobel_filtering$0$max;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size: int, 
    _v1.x_size: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.y_size: int, 
    _v2.x_size: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  MS_pre_$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size, 
  _v1.x_size, 
  _v1.image_old, 
  _v1.weight_old, 
  _v2.y_size, 
  _v2.x_size, 
  _v2.image_old, 
  _v2.weight_old)
}

axiom (forall _v1.y_size: int, 
    _v1.x_size: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.min: int, 
    _v1.max: int, 
    _v2.y_size: int, 
    _v2.x_size: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int :: 
  { R___v1.sobel_filtering(_v1.y_size, _v1.x_size, _v1.image_old, _v1.weight_old, _v1.min, _v1.max), R'___v2.sobel_filtering(_v2.y_size, _v2.x_size, _v2.image_old, _v2.weight_old) } 
  RT_cond_$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size, 
        _v1.x_size, 
        _v1.image_old, 
        _v1.weight_old, 
        _v2.y_size, 
        _v2.x_size, 
        _v2.image_old, 
        _v2.weight_old)
       && R___v1.sobel_filtering(_v1.y_size, _v1.x_size, _v1.image_old, _v1.weight_old, _v1.min, _v1.max)
     ==> R'___v2.sobel_filtering(_v2.y_size, _v2.x_size, _v2.image_old, _v2.weight_old));

procedure RT_Check__v1.sobel_filtering___v2.sobel_filtering(_v1.y_size: int, _v1.x_size: int, _v2.y_size: int, _v2.x_size: int)
   returns (_v1.min: int, _v1.max: int, _v2.min: int, _v2.max: int);
  requires RT_cond_$_v1.sobel_filtering$_v2.sobel_filtering(_v1.y_size, 
  _v1.x_size, 
  _v1.image, 
  _v1.weight, 
  _v2.y_size, 
  _v2.x_size, 
  _v2.image, 
  _v2.weight);



implementation RT_Check__v1.sobel_filtering___v2.sobel_filtering(_v1.y_size: int, _v1.x_size: int, _v2.y_size: int, _v2.x_size: int)
   returns (_v1.min: int, _v1.max: int, _v2.min: int, _v2.max: int)
{
  var inline$_v1.sobel_filtering$0$yp: int;
  var inline$_v1.sobel_filtering$0$xp: int;
  var inline$_v1.sobel_filtering$0$j: int;
  var inline$_v1.sobel_filtering$0$i: int;
  var inline$_v1.sobel_filtering$0$pixel_value: int;
  var inline$_v1.sobel_filtering$0$y_size: int;
  var inline$_v1.sobel_filtering$0$x_size: int;
  var inline$_v1.sobel_filtering$0$min: int;
  var inline$_v1.sobel_filtering$0$max: int;
  var inline$_v2.sobel_filtering$0$yp: int;
  var inline$_v2.sobel_filtering$0$xp: int;
  var inline$_v2.sobel_filtering$0$j: int;
  var inline$_v2.sobel_filtering$0$i: int;
  var inline$_v2.sobel_filtering$0$pixel_value: int;
  var inline$_v2.sobel_filtering$0$y_size: int;
  var inline$_v2.sobel_filtering$0$x_size: int;
  var inline$_v2.sobel_filtering$0$min: int;
  var inline$_v2.sobel_filtering$0$max: int;

  START:
    goto inline$_v1.sobel_filtering$0$Entry;

  inline$_v1.sobel_filtering$0$Entry:
    inline$_v1.sobel_filtering$0$y_size := _v1.y_size;
    inline$_v1.sobel_filtering$0$x_size := _v1.x_size;
    havoc inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value, inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max;
    goto inline$_v1.sobel_filtering$0$anon0;

  inline$_v1.sobel_filtering$0$anon0:
    inline$_v1.sobel_filtering$0$yp := _v2.MAX_IMAGESIZE;
    inline$_v1.sobel_filtering$0$min := _v2.DBL_MAX;
    inline$_v1.sobel_filtering$0$max := -_v2.DBL_MAX;
    goto inline$_v1.sobel_filtering$0$anon12_LoopHead;

  inline$_v1.sobel_filtering$0$anon12_LoopHead:
    call inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon12_LoopHead(inline$_v1.sobel_filtering$0$y_size, inline$_v1.sobel_filtering$0$x_size, inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon12_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon12_LoopHead_last:
    //goto inline$_v1.sobel_filtering$0$anon12_LoopDone, inline$_v1.sobel_filtering$0$anon12_LoopBody;
    goto inline$_v1.sobel_filtering$0$anon12_LoopDone;

  inline$_v1.sobel_filtering$0$anon12_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$yp
   < _v2.MAX_IMAGESIZE * (inline$_v1.sobel_filtering$0$y_size - 1);
    inline$_v1.sobel_filtering$0$xp := inline$_v1.sobel_filtering$0$yp + 1;
    goto inline$_v1.sobel_filtering$0$anon13_LoopHead;

  inline$_v1.sobel_filtering$0$anon13_LoopHead:
    call inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(inline$_v1.sobel_filtering$0$x_size, inline$_v1.sobel_filtering$0$min, inline$_v1.sobel_filtering$0$max, inline$_v1.sobel_filtering$0$yp, inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon13_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon13_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon13_LoopDone, inline$_v1.sobel_filtering$0$anon13_LoopBody;

  inline$_v1.sobel_filtering$0$anon13_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$xp
   < inline$_v1.sobel_filtering$0$yp + inline$_v1.sobel_filtering$0$x_size - 1;
    inline$_v1.sobel_filtering$0$pixel_value := 0;
    inline$_v1.sobel_filtering$0$j := -1;
    goto inline$_v1.sobel_filtering$0$anon14_LoopHead;

  inline$_v1.sobel_filtering$0$anon14_LoopHead:
    call inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon14_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon14_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon14_LoopDone, inline$_v1.sobel_filtering$0$anon14_LoopBody;

  inline$_v1.sobel_filtering$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$j < 1;
    inline$_v1.sobel_filtering$0$i := -1;
    goto inline$_v1.sobel_filtering$0$anon15_LoopHead;

  inline$_v1.sobel_filtering$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering$0$xp, inline$_v1.sobel_filtering$0$j, inline$_v1.sobel_filtering$0$i, inline$_v1.sobel_filtering$0$pixel_value);
    goto inline$_v1.sobel_filtering$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering$0$anon15_LoopDone, inline$_v1.sobel_filtering$0$anon15_LoopBody;

  inline$_v1.sobel_filtering$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering$0$i < 1;
    inline$_v1.sobel_filtering$0$pixel_value := inline$_v1.sobel_filtering$0$pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering$0$j + 1) + inline$_v1.sobel_filtering$0$i + 1]
     * _v1.image[inline$_v1.sobel_filtering$0$xp
       + 3 * inline$_v1.sobel_filtering$0$j
       + inline$_v1.sobel_filtering$0$i];
    inline$_v1.sobel_filtering$0$i := inline$_v1.sobel_filtering$0$i + 1;
    goto inline$_v1.sobel_filtering$0$anon15_LoopBody_dummy;

  inline$_v1.sobel_filtering$0$anon15_LoopBody_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering$0$i;
    goto inline$_v1.sobel_filtering$0$anon5;

  inline$_v1.sobel_filtering$0$anon5:
    inline$_v1.sobel_filtering$0$j := inline$_v1.sobel_filtering$0$j + 1;
    goto inline$_v1.sobel_filtering$0$anon5_dummy;

  inline$_v1.sobel_filtering$0$anon5_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering$0$j;
    goto inline$_v1.sobel_filtering$0$anon6;

  inline$_v1.sobel_filtering$0$anon6:
    goto inline$_v1.sobel_filtering$0$anon16_Then, inline$_v1.sobel_filtering$0$anon16_Else;

  inline$_v1.sobel_filtering$0$anon16_Else:
    assume {:partition} inline$_v1.sobel_filtering$0$min <= inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon8;

  inline$_v1.sobel_filtering$0$anon8:
    goto inline$_v1.sobel_filtering$0$anon17_Then, inline$_v1.sobel_filtering$0$anon17_Else;

  inline$_v1.sobel_filtering$0$anon17_Else:
    assume {:partition} inline$_v1.sobel_filtering$0$max >= inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon10;

  inline$_v1.sobel_filtering$0$anon10:
    inline$_v1.sobel_filtering$0$xp := inline$_v1.sobel_filtering$0$xp + 1;
    goto inline$_v1.sobel_filtering$0$anon10_dummy;

  inline$_v1.sobel_filtering$0$anon10_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon17_Then:
    assume {:partition} inline$_v1.sobel_filtering$0$pixel_value > inline$_v1.sobel_filtering$0$max;
    inline$_v1.sobel_filtering$0$max := inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon10;

  inline$_v1.sobel_filtering$0$anon16_Then:
    assume {:partition} inline$_v1.sobel_filtering$0$pixel_value < inline$_v1.sobel_filtering$0$min;
    inline$_v1.sobel_filtering$0$min := inline$_v1.sobel_filtering$0$pixel_value;
    goto inline$_v1.sobel_filtering$0$anon8;

  inline$_v1.sobel_filtering$0$anon13_LoopDone:
    assume {:partition} inline$_v1.sobel_filtering$0$yp + inline$_v1.sobel_filtering$0$x_size - 1
   <= inline$_v1.sobel_filtering$0$xp;
    goto inline$_v1.sobel_filtering$0$anon11;

  inline$_v1.sobel_filtering$0$anon11:
    inline$_v1.sobel_filtering$0$yp := inline$_v1.sobel_filtering$0$yp + _v2.MAX_IMAGESIZE;
    goto inline$_v1.sobel_filtering$0$anon11_dummy;

  inline$_v1.sobel_filtering$0$anon11_dummy:
    assume false;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (inline$_v1.sobel_filtering$0$y_size - 1)
   <= inline$_v1.sobel_filtering$0$yp;
    goto inline$_v1.sobel_filtering$0$Return;

  inline$_v1.sobel_filtering$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.min := inline$_v1.sobel_filtering$0$min;
    _v1.max := inline$_v1.sobel_filtering$0$max;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering$0$Entry;

  inline$_v2.sobel_filtering$0$Entry:
    inline$_v2.sobel_filtering$0$y_size := _v2.y_size;
    inline$_v2.sobel_filtering$0$x_size := _v2.x_size;
    havoc inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value, inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max;
    goto inline$_v2.sobel_filtering$0$anon0;

  inline$_v2.sobel_filtering$0$anon0:
    inline$_v2.sobel_filtering$0$yp := _v2.MAX_IMAGESIZE;
    inline$_v2.sobel_filtering$0$min := _v2.DBL_MAX;
    inline$_v2.sobel_filtering$0$max := -_v2.DBL_MAX;
    goto inline$_v2.sobel_filtering$0$anon12_LoopHead;

  inline$_v2.sobel_filtering$0$anon12_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon12_LoopHead(inline$_v2.sobel_filtering$0$y_size, 
  inline$_v2.sobel_filtering$0$x_size, 
  inline$_v2.sobel_filtering$0$min, 
  inline$_v2.sobel_filtering$0$max, 
  inline$_v2.sobel_filtering$0$yp, 
  inline$_v2.sobel_filtering$0$xp, 
  inline$_v2.sobel_filtering$0$j, 
  inline$_v2.sobel_filtering$0$i, 
  inline$_v2.sobel_filtering$0$pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon12_LoopHead(inline$_v2.sobel_filtering$0$y_size, inline$_v2.sobel_filtering$0$x_size, inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon12_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon12_LoopHead_last:
    //goto inline$_v2.sobel_filtering$0$anon12_LoopDone, inline$_v2.sobel_filtering$0$anon12_LoopBody;
    goto inline$_v2.sobel_filtering$0$anon12_LoopDone;

  inline$_v2.sobel_filtering$0$anon12_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$yp
   < _v2.MAX_IMAGESIZE * (inline$_v2.sobel_filtering$0$y_size - 1);
    inline$_v2.sobel_filtering$0$xp := inline$_v2.sobel_filtering$0$yp + 1;
    goto inline$_v2.sobel_filtering$0$anon13_LoopHead;

  inline$_v2.sobel_filtering$0$anon13_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering$0$x_size, 
  inline$_v2.sobel_filtering$0$min, 
  inline$_v2.sobel_filtering$0$max, 
  inline$_v2.sobel_filtering$0$yp, 
  inline$_v2.sobel_filtering$0$xp, 
  inline$_v2.sobel_filtering$0$j, 
  inline$_v2.sobel_filtering$0$i, 
  inline$_v2.sobel_filtering$0$pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering$0$x_size, inline$_v2.sobel_filtering$0$min, inline$_v2.sobel_filtering$0$max, inline$_v2.sobel_filtering$0$yp, inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon13_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon13_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon13_LoopDone, inline$_v2.sobel_filtering$0$anon13_LoopBody;

  inline$_v2.sobel_filtering$0$anon13_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$xp
   < inline$_v2.sobel_filtering$0$yp + inline$_v2.sobel_filtering$0$x_size - 1;
    inline$_v2.sobel_filtering$0$pixel_value := 0;
    inline$_v2.sobel_filtering$0$j := -1;
    goto inline$_v2.sobel_filtering$0$anon14_LoopHead;

  inline$_v2.sobel_filtering$0$anon14_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering$0$xp, 
  inline$_v2.sobel_filtering$0$j, 
  inline$_v2.sobel_filtering$0$i, 
  inline$_v2.sobel_filtering$0$pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon14_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon14_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon14_LoopDone, inline$_v2.sobel_filtering$0$anon14_LoopBody;

  inline$_v2.sobel_filtering$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$j < 1;
    inline$_v2.sobel_filtering$0$i := -1;
    goto inline$_v2.sobel_filtering$0$anon15_LoopHead;

  inline$_v2.sobel_filtering$0$anon15_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering$0$xp, 
  inline$_v2.sobel_filtering$0$j, 
  inline$_v2.sobel_filtering$0$i, 
  inline$_v2.sobel_filtering$0$pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering$0$xp, inline$_v2.sobel_filtering$0$j, inline$_v2.sobel_filtering$0$i, inline$_v2.sobel_filtering$0$pixel_value);
    goto inline$_v2.sobel_filtering$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering$0$anon15_LoopDone, inline$_v2.sobel_filtering$0$anon15_LoopBody;

  inline$_v2.sobel_filtering$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering$0$i < 1;
    inline$_v2.sobel_filtering$0$pixel_value := inline$_v2.sobel_filtering$0$pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering$0$j + 1) + inline$_v2.sobel_filtering$0$i + 1]
     * _v2.image[inline$_v2.sobel_filtering$0$xp
       + 3 * inline$_v2.sobel_filtering$0$j
       + inline$_v2.sobel_filtering$0$i];
    inline$_v2.sobel_filtering$0$i := inline$_v2.sobel_filtering$0$i + 1;
    goto inline$_v2.sobel_filtering$0$anon15_LoopBody_dummy;

  inline$_v2.sobel_filtering$0$anon15_LoopBody_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering$0$i;
    goto inline$_v2.sobel_filtering$0$anon5;

  inline$_v2.sobel_filtering$0$anon5:
    inline$_v2.sobel_filtering$0$j := inline$_v2.sobel_filtering$0$j + 1;
    goto inline$_v2.sobel_filtering$0$anon5_dummy;

  inline$_v2.sobel_filtering$0$anon5_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering$0$j;
    goto inline$_v2.sobel_filtering$0$anon6;

  inline$_v2.sobel_filtering$0$anon6:
    goto inline$_v2.sobel_filtering$0$anon16_Then, inline$_v2.sobel_filtering$0$anon16_Else;

  inline$_v2.sobel_filtering$0$anon16_Else:
    assume {:partition} inline$_v2.sobel_filtering$0$min <= inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon8;

  inline$_v2.sobel_filtering$0$anon8:
    goto inline$_v2.sobel_filtering$0$anon17_Then, inline$_v2.sobel_filtering$0$anon17_Else;

  inline$_v2.sobel_filtering$0$anon17_Else:
    assume {:partition} inline$_v2.sobel_filtering$0$max >= inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon10;

  inline$_v2.sobel_filtering$0$anon10:
    inline$_v2.sobel_filtering$0$xp := inline$_v2.sobel_filtering$0$xp + 2;
    goto inline$_v2.sobel_filtering$0$anon10_dummy;

  inline$_v2.sobel_filtering$0$anon10_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon17_Then:
    assume {:partition} inline$_v2.sobel_filtering$0$pixel_value > inline$_v2.sobel_filtering$0$max;
    inline$_v2.sobel_filtering$0$max := inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon10;

  inline$_v2.sobel_filtering$0$anon16_Then:
    assume {:partition} inline$_v2.sobel_filtering$0$pixel_value < inline$_v2.sobel_filtering$0$min;
    inline$_v2.sobel_filtering$0$min := inline$_v2.sobel_filtering$0$pixel_value;
    goto inline$_v2.sobel_filtering$0$anon8;

  inline$_v2.sobel_filtering$0$anon13_LoopDone:
    assume {:partition} inline$_v2.sobel_filtering$0$yp + inline$_v2.sobel_filtering$0$x_size - 1
   <= inline$_v2.sobel_filtering$0$xp;
    goto inline$_v2.sobel_filtering$0$anon11;

  inline$_v2.sobel_filtering$0$anon11:
    inline$_v2.sobel_filtering$0$yp := inline$_v2.sobel_filtering$0$yp + 2 * _v2.MAX_IMAGESIZE;
    goto inline$_v2.sobel_filtering$0$anon11_dummy;

  inline$_v2.sobel_filtering$0$anon11_dummy:
    assume false;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE * (inline$_v2.sobel_filtering$0$y_size - 1)
   <= inline$_v2.sobel_filtering$0$yp;
    goto inline$_v2.sobel_filtering$0$Return;

  inline$_v2.sobel_filtering$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.min := inline$_v2.sobel_filtering$0$min;
    _v2.max := inline$_v2.sobel_filtering$0$max;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
   : bool
{
  _v1.in_xp == _v2.in_xp
     && _v1.in_j == _v2.in_j
     && _v1.in_i == _v2.in_i
     && _v1.in_pixel_value == _v2.in_pixel_value
     && _v1.image_old == _v2.image_old
     && _v1.weight_old == _v2.weight_old
   ==> _v1.out_i == _v2.out_i && _v1.out_pixel_value == _v2.out_pixel_value
}

axiom (forall _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int :: 
  { R___v1.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_i, 
      _v1.out_pixel_value), R___v2.sobel_filtering_loop_anon15_LoopHead(_v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_i, 
      _v2.out_pixel_value) } 
  R___v1.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_i, 
        _v1.out_pixel_value)
       && R___v2.sobel_filtering_loop_anon15_LoopHead(_v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old, 
        _v2.out_i, 
        _v2.out_pixel_value)
     ==> MS$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_i, 
      _v1.out_pixel_value, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_i, 
      _v2.out_pixel_value));

function {:inline true} MS_pre_$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  _v1.in_i == _v2.in_i 
}

procedure {:MS_procs "_v1.sobel_filtering_loop_anon15_LoopHead", "_v2.sobel_filtering_loop_anon15_LoopHead"} MS_Check__v1.sobel_filtering_loop_anon15_LoopHead___v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires MS_pre_$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);
  ensures MS$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  _v1.out_i, 
  _v1.out_pixel_value, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  _v2.out_i, 
  _v2.out_pixel_value);



implementation MS_Check__v1.sobel_filtering_loop_anon15_LoopHead___v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j + 1)
       + inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j
       + inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i + 1;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy:
    call inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j + 1)
       + inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j
       + inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy:
    call inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  MS_pre_$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image_old, 
  _v1.weight_old, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image_old, 
  _v2.weight_old)
}

axiom (forall _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int :: 
  { R___v1.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_i, 
      _v1.out_pixel_value), R'___v2.sobel_filtering_loop_anon15_LoopHead(_v2.in_xp, _v2.in_j, _v2.in_i, _v2.in_pixel_value, _v2.image_old, _v2.weight_old) } 
  RT_cond_$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old)
       && R___v1.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_i, 
        _v1.out_pixel_value)
     ==> R'___v2.sobel_filtering_loop_anon15_LoopHead(_v2.in_xp, _v2.in_j, _v2.in_i, _v2.in_pixel_value, _v2.image_old, _v2.weight_old));

procedure RT_Check__v1.sobel_filtering_loop_anon15_LoopHead___v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires RT_cond_$_v1.sobel_filtering_loop_anon15_LoopHead$_v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);



implementation RT_Check__v1.sobel_filtering_loop_anon15_LoopHead___v2.sobel_filtering_loop_anon15_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j + 1)
       + inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j
       + inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i + 1;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy:
    call inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j + 1)
       + inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j
       + inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopBody_dummy:
    assert R'___v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp, 
  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j, 
  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon15_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
   : bool
{
  _v1.in_xp == _v2.in_xp
     && _v1.in_j == _v2.in_j
     && _v1.in_i == _v2.in_i
     && _v1.in_pixel_value == _v2.in_pixel_value
     && _v1.image_old == _v2.image_old
     && _v1.weight_old == _v2.weight_old
   ==> _v1.out_j == _v2.out_j
     && _v1.out_i == _v2.out_i
     && _v1.out_pixel_value == _v2.out_pixel_value
}

axiom (forall _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int :: 
  { R___v1.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value), R___v2.sobel_filtering_loop_anon14_LoopHead(_v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_j, 
      _v2.out_i, 
      _v2.out_pixel_value) } 
  R___v1.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_j, 
        _v1.out_i, 
        _v1.out_pixel_value)
       && R___v2.sobel_filtering_loop_anon14_LoopHead(_v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old, 
        _v2.out_j, 
        _v2.out_i, 
        _v2.out_pixel_value)
     ==> MS$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_j, 
      _v2.out_i, 
      _v2.out_pixel_value));

function {:inline true} MS_pre_$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  _v1.in_j == _v2.in_j 
}

procedure {:MS_procs "_v1.sobel_filtering_loop_anon14_LoopHead", "_v2.sobel_filtering_loop_anon14_LoopHead"} MS_Check__v1.sobel_filtering_loop_anon14_LoopHead___v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires MS_pre_$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);
  ensures MS$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  _v1.out_j, 
  _v1.out_i, 
  _v1.out_pixel_value, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  _v2.out_j, 
  _v2.out_i, 
  _v2.out_pixel_value);



implementation MS_Check__v1.sobel_filtering_loop_anon14_LoopHead___v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j < 1;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i := -1;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1)
       + inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j
       + inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i + 1;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5:
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy:
    call inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_j := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j < 1;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i := -1;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead:
    call inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1)
       + inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j
       + inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5:
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy:
    call inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_j := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  MS_pre_$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image_old, 
  _v1.weight_old, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image_old, 
  _v2.weight_old)
}

axiom (forall _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int :: 
  { R___v1.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value), R'___v2.sobel_filtering_loop_anon14_LoopHead(_v2.in_xp, _v2.in_j, _v2.in_i, _v2.in_pixel_value, _v2.image_old, _v2.weight_old) } 
  RT_cond_$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old)
       && R___v1.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_j, 
        _v1.out_i, 
        _v1.out_pixel_value)
     ==> R'___v2.sobel_filtering_loop_anon14_LoopHead(_v2.in_xp, _v2.in_j, _v2.in_i, _v2.in_pixel_value, _v2.image_old, _v2.weight_old));

procedure RT_Check__v1.sobel_filtering_loop_anon14_LoopHead___v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires RT_cond_$_v1.sobel_filtering_loop_anon14_LoopHead$_v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);



implementation RT_Check__v1.sobel_filtering_loop_anon14_LoopHead___v2.sobel_filtering_loop_anon14_LoopHead(_v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j < 1;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i := -1;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1)
       + inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j
       + inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i + 1;
    assume false;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5:
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy:
    call inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_j := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j < 1;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i := -1;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp, 
  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1)
       + inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j
       + inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5:
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j + 1;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon5_dummy:
    assert R'___v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp, 
  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_j := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_j;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon14_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
   : bool
{
  _v1.in_x_size == _v2.in_x_size
     && _v1.in_min == _v2.in_min
     && _v1.in_max == _v2.in_max
     && _v1.in_yp == _v2.in_yp
     && _v1.in_xp == _v2.in_xp
     && _v1.in_j == _v2.in_j
     && _v1.in_i == _v2.in_i
     && _v1.in_pixel_value == _v2.in_pixel_value
     && _v1.image_old == _v2.image_old
     && _v1.weight_old == _v2.weight_old
   ==> _v1.out_min == _v2.out_min
     && _v1.out_max == _v2.out_max
     && _v1.out_xp == _v2.out_xp
     && _v1.out_j == _v2.out_j
     && _v1.out_i == _v2.out_i
     && _v1.out_pixel_value == _v2.out_pixel_value
}

axiom (forall _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int :: 
  { R___v1.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
      _v1.in_min, 
      _v1.in_max, 
      _v1.in_yp, 
      _v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_min, 
      _v1.out_max, 
      _v1.out_xp, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value), R___v2.sobel_filtering_loop_anon13_LoopHead(_v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_min, 
      _v2.out_max, 
      _v2.out_xp, 
      _v2.out_j, 
      _v2.out_i, 
      _v2.out_pixel_value) } 
  R___v1.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
        _v1.in_min, 
        _v1.in_max, 
        _v1.in_yp, 
        _v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_min, 
        _v1.out_max, 
        _v1.out_xp, 
        _v1.out_j, 
        _v1.out_i, 
        _v1.out_pixel_value)
       && R___v2.sobel_filtering_loop_anon13_LoopHead(_v2.in_x_size, 
        _v2.in_min, 
        _v2.in_max, 
        _v2.in_yp, 
        _v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old, 
        _v2.out_min, 
        _v2.out_max, 
        _v2.out_xp, 
        _v2.out_j, 
        _v2.out_i, 
        _v2.out_pixel_value)
     ==> MS$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
      _v1.in_min, 
      _v1.in_max, 
      _v1.in_yp, 
      _v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_min, 
      _v1.out_max, 
      _v1.out_xp, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value, 
      _v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_min, 
      _v2.out_max, 
      _v2.out_xp, 
      _v2.out_j, 
      _v2.out_i, 
      _v2.out_pixel_value));

function {:inline true} MS_pre_$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  _v2.in_xp - _v1.in_xp >= _v2.in_yp - _v1.in_yp && _v1.in_x_size == _v2.in_x_size 
}

procedure {:MS_procs "_v1.sobel_filtering_loop_anon13_LoopHead", "_v2.sobel_filtering_loop_anon13_LoopHead"} MS_Check__v1.sobel_filtering_loop_anon13_LoopHead___v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires MS_pre_$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);
  ensures MS$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  _v1.out_min, 
  _v1.out_max, 
  _v1.out_xp, 
  _v1.out_j, 
  _v1.out_i, 
  _v1.out_pixel_value, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  _v2.out_min, 
  _v2.out_max, 
  _v2.out_xp, 
  _v2.out_j, 
  _v2.out_i, 
  _v2.out_pixel_value);



implementation MS_Check__v1.sobel_filtering_loop_anon13_LoopHead___v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size := _v1.in_x_size;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min := _v1.in_min;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max := _v1.in_max;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp := _v1.in_yp;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp
   < inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := 0;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j := -1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j < 1;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i := -1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1)
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i + 1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon5;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon5:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon6;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon6:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min
   <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon8:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max
   >= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp + 1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy:
    call inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   > inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   < inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1
   <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_min := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    _v1.out_max := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    _v1.out_xp := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    _v1.out_j := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size := _v2.in_x_size;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min := _v2.in_min;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max := _v2.in_max;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp := _v2.in_yp;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp
   < inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := 0;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j := -1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead:
    call inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j < 1;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i := -1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead:
    call inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1)
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon5;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon5:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon6;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon6:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min
   <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon8:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max
   >= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp + 2;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy:
    call inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   > inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   < inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1
   <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_min := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    _v2.out_max := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    _v2.out_xp := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    _v2.out_j := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  MS_pre_$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image_old, 
  _v1.weight_old, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image_old, 
  _v2.weight_old)
}

axiom (forall _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int :: 
  { R___v1.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
      _v1.in_min, 
      _v1.in_max, 
      _v1.in_yp, 
      _v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_min, 
      _v1.out_max, 
      _v1.out_xp, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value), R'___v2.sobel_filtering_loop_anon13_LoopHead(_v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old) } 
  RT_cond_$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
        _v1.in_min, 
        _v1.in_max, 
        _v1.in_yp, 
        _v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v2.in_x_size, 
        _v2.in_min, 
        _v2.in_max, 
        _v2.in_yp, 
        _v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old)
       && R___v1.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
        _v1.in_min, 
        _v1.in_max, 
        _v1.in_yp, 
        _v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_min, 
        _v1.out_max, 
        _v1.out_xp, 
        _v1.out_j, 
        _v1.out_i, 
        _v1.out_pixel_value)
     ==> R'___v2.sobel_filtering_loop_anon13_LoopHead(_v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old));

procedure RT_Check__v1.sobel_filtering_loop_anon13_LoopHead___v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires RT_cond_$_v1.sobel_filtering_loop_anon13_LoopHead$_v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);



implementation RT_Check__v1.sobel_filtering_loop_anon13_LoopHead___v2.sobel_filtering_loop_anon13_LoopHead(_v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size := _v1.in_x_size;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min := _v1.in_min;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max := _v1.in_max;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp := _v1.in_yp;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp
   < inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := 0;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j := -1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone;
    //goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j < 1;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i := -1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1)
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i + 1;
    assume false;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon5;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon5:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon6;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon6:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min
   <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon8:
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max
   >= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10:
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp + 1;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy:
    call inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   > inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   < inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1
   <= inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_min := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    _v1.out_max := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    _v1.out_xp := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    _v1.out_j := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size := _v2.in_x_size;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min := _v2.in_min;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max := _v2.in_max;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp := _v2.in_yp;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp
   < inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := 0;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j := -1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopHead_last:
    //goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j < 1;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i := -1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1)
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i + 1;
    assume false;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon5;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon5:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j + 1;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon6;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon6:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min
   <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon8:
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max
   >= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10:
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp + 2;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10_dummy:
    assert R'___v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   > inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value
   < inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_yp
       + inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_x_size
     - 1
   <= inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_min := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_min;
    _v2.out_max := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_max;
    _v2.out_xp := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_xp;
    _v2.out_j := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_j;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon13_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_yp: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
   : bool
{
  _v1.in_y_size == _v2.in_y_size
     && _v1.in_x_size == _v2.in_x_size
     && _v1.in_min == _v2.in_min
     && _v1.in_max == _v2.in_max
     && _v1.in_yp == _v2.in_yp
     && _v1.in_xp == _v2.in_xp
     && _v1.in_j == _v2.in_j
     && _v1.in_i == _v2.in_i
     && _v1.in_pixel_value == _v2.in_pixel_value
     && _v1.image_old == _v2.image_old
     && _v1.weight_old == _v2.weight_old
   ==> _v1.out_min == _v2.out_min
     && _v1.out_max == _v2.out_max
     && _v1.out_yp == _v2.out_yp
     && _v1.out_xp == _v2.out_xp
     && _v1.out_j == _v2.out_j
     && _v1.out_i == _v2.out_i
     && _v1.out_pixel_value == _v2.out_pixel_value
}

axiom (forall _v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_yp: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int :: 
  { R___v1.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
      _v1.in_x_size, 
      _v1.in_min, 
      _v1.in_max, 
      _v1.in_yp, 
      _v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_min, 
      _v1.out_max, 
      _v1.out_yp, 
      _v1.out_xp, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value), R___v2.sobel_filtering_loop_anon12_LoopHead(_v2.in_y_size, 
      _v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_min, 
      _v2.out_max, 
      _v2.out_yp, 
      _v2.out_xp, 
      _v2.out_j, 
      _v2.out_i, 
      _v2.out_pixel_value) } 
  R___v1.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
        _v1.in_x_size, 
        _v1.in_min, 
        _v1.in_max, 
        _v1.in_yp, 
        _v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_min, 
        _v1.out_max, 
        _v1.out_yp, 
        _v1.out_xp, 
        _v1.out_j, 
        _v1.out_i, 
        _v1.out_pixel_value)
       && R___v2.sobel_filtering_loop_anon12_LoopHead(_v2.in_y_size, 
        _v2.in_x_size, 
        _v2.in_min, 
        _v2.in_max, 
        _v2.in_yp, 
        _v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old, 
        _v2.out_min, 
        _v2.out_max, 
        _v2.out_yp, 
        _v2.out_xp, 
        _v2.out_j, 
        _v2.out_i, 
        _v2.out_pixel_value)
     ==> MS$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
      _v1.in_x_size, 
      _v1.in_min, 
      _v1.in_max, 
      _v1.in_yp, 
      _v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_min, 
      _v1.out_max, 
      _v1.out_yp, 
      _v1.out_xp, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value, 
      _v2.in_y_size, 
      _v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old, 
      _v2.out_min, 
      _v2.out_max, 
      _v2.out_yp, 
      _v2.out_xp, 
      _v2.out_j, 
      _v2.out_i, 
      _v2.out_pixel_value));

function {:inline true} MS_pre_$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
 _v1.in_yp <= _v2.in_yp && _v1.in_y_size == _v2.in_y_size && _v1.in_x_size == _v2.in_x_size 
}

procedure {:MS_procs "_v1.sobel_filtering_loop_anon12_LoopHead", "_v2.sobel_filtering_loop_anon12_LoopHead"} MS_Check__v1.sobel_filtering_loop_anon12_LoopHead___v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_yp: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires MS_pre_$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
  _v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_y_size, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);
  ensures MS$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
  _v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  old(_v1.image), 
  old(_v1.weight), 
  _v1.out_min, 
  _v1.out_max, 
  _v1.out_yp, 
  _v1.out_xp, 
  _v1.out_j, 
  _v1.out_i, 
  _v1.out_pixel_value, 
  _v2.in_y_size, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  old(_v2.image), 
  old(_v2.weight), 
  _v2.out_min, 
  _v2.out_max, 
  _v2.out_yp, 
  _v2.out_xp, 
  _v2.out_j, 
  _v2.out_i, 
  _v2.out_pixel_value);



implementation MS_Check__v1.sobel_filtering_loop_anon12_LoopHead___v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_yp: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size := _v1.in_y_size;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size := _v1.in_x_size;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min := _v1.in_min;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max := _v1.in_max;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp := _v1.in_yp;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp
   < _v2.MAX_IMAGESIZE
     * (inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1);
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp
   < inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := 0;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j := -1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j < 1;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i := -1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1)
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon5;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon5:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon6;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon6:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min
   <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon8:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max
   >= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon10:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   > inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   < inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1
   <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp + _v2.MAX_IMAGESIZE;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon12_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE
     * (inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1)
   <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_min := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    _v1.out_max := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    _v1.out_yp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    _v1.out_xp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    _v1.out_j := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size := _v2.in_y_size;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size := _v2.in_x_size;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min := _v2.in_min;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max := _v2.in_max;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp := _v2.in_yp;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp
   < _v2.MAX_IMAGESIZE
     * (inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1);
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp + 1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead:
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp
   < inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := 0;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j := -1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead:
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j < 1;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i := -1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead:
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1)
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon5;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon5:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon6;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon6:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min
   <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon8:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max
   >= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon10:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp + 2;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   > inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   < inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1
   <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp + 2 * _v2.MAX_IMAGESIZE;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy:
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon12_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE
     * (inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1)
   <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_min := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    _v2.out_max := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    _v2.out_yp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    _v2.out_xp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    _v2.out_j := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int)
   : bool
{
  MS_pre_$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
  _v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image_old, 
  _v1.weight_old, 
  _v2.in_y_size, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image_old, 
  _v2.weight_old)
}

axiom (forall _v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v1.image_old: [int]int, 
    _v1.weight_old: [int]int, 
    _v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int, 
    _v2.image_old: [int]int, 
    _v2.weight_old: [int]int :: 
  { R___v1.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
      _v1.in_x_size, 
      _v1.in_min, 
      _v1.in_max, 
      _v1.in_yp, 
      _v1.in_xp, 
      _v1.in_j, 
      _v1.in_i, 
      _v1.in_pixel_value, 
      _v1.image_old, 
      _v1.weight_old, 
      _v1.out_min, 
      _v1.out_max, 
      _v1.out_yp, 
      _v1.out_xp, 
      _v1.out_j, 
      _v1.out_i, 
      _v1.out_pixel_value), R'___v2.sobel_filtering_loop_anon12_LoopHead(_v2.in_y_size, 
      _v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old) } 
  RT_cond_$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
        _v1.in_x_size, 
        _v1.in_min, 
        _v1.in_max, 
        _v1.in_yp, 
        _v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v2.in_y_size, 
        _v2.in_x_size, 
        _v2.in_min, 
        _v2.in_max, 
        _v2.in_yp, 
        _v2.in_xp, 
        _v2.in_j, 
        _v2.in_i, 
        _v2.in_pixel_value, 
        _v2.image_old, 
        _v2.weight_old)
       && R___v1.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
        _v1.in_x_size, 
        _v1.in_min, 
        _v1.in_max, 
        _v1.in_yp, 
        _v1.in_xp, 
        _v1.in_j, 
        _v1.in_i, 
        _v1.in_pixel_value, 
        _v1.image_old, 
        _v1.weight_old, 
        _v1.out_min, 
        _v1.out_max, 
        _v1.out_yp, 
        _v1.out_xp, 
        _v1.out_j, 
        _v1.out_i, 
        _v1.out_pixel_value)
     ==> R'___v2.sobel_filtering_loop_anon12_LoopHead(_v2.in_y_size, 
      _v2.in_x_size, 
      _v2.in_min, 
      _v2.in_max, 
      _v2.in_yp, 
      _v2.in_xp, 
      _v2.in_j, 
      _v2.in_i, 
      _v2.in_pixel_value, 
      _v2.image_old, 
      _v2.weight_old));

procedure RT_Check__v1.sobel_filtering_loop_anon12_LoopHead___v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_yp: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int);
  requires RT_cond_$_v1.sobel_filtering_loop_anon12_LoopHead$_v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size, 
  _v1.in_x_size, 
  _v1.in_min, 
  _v1.in_max, 
  _v1.in_yp, 
  _v1.in_xp, 
  _v1.in_j, 
  _v1.in_i, 
  _v1.in_pixel_value, 
  _v1.image, 
  _v1.weight, 
  _v2.in_y_size, 
  _v2.in_x_size, 
  _v2.in_min, 
  _v2.in_max, 
  _v2.in_yp, 
  _v2.in_xp, 
  _v2.in_j, 
  _v2.in_i, 
  _v2.in_pixel_value, 
  _v2.image, 
  _v2.weight);



implementation RT_Check__v1.sobel_filtering_loop_anon12_LoopHead___v2.sobel_filtering_loop_anon12_LoopHead(_v1.in_y_size: int, 
    _v1.in_x_size: int, 
    _v1.in_min: int, 
    _v1.in_max: int, 
    _v1.in_yp: int, 
    _v1.in_xp: int, 
    _v1.in_j: int, 
    _v1.in_i: int, 
    _v1.in_pixel_value: int, 
    _v2.in_y_size: int, 
    _v2.in_x_size: int, 
    _v2.in_min: int, 
    _v2.in_max: int, 
    _v2.in_yp: int, 
    _v2.in_xp: int, 
    _v2.in_j: int, 
    _v2.in_i: int, 
    _v2.in_pixel_value: int)
   returns (_v1.out_min: int, 
    _v1.out_max: int, 
    _v1.out_yp: int, 
    _v1.out_xp: int, 
    _v1.out_j: int, 
    _v1.out_i: int, 
    _v1.out_pixel_value: int, 
    _v2.out_min: int, 
    _v2.out_max: int, 
    _v2.out_yp: int, 
    _v2.out_xp: int, 
    _v2.out_j: int, 
    _v2.out_i: int, 
    _v2.out_pixel_value: int)
{
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i: int;
  var inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i: int;
  var inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value: int;

  START:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Entry;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Entry:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size := _v1.in_y_size;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size := _v1.in_x_size;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min := _v1.in_min;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max := _v1.in_max;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp := _v1.in_yp;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp := _v1.in_xp;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j := _v1.in_j;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value := _v1.in_pixel_value;
    havoc inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$entry;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$entry:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp
   < _v2.MAX_IMAGESIZE
     * (inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1);
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon13_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last:
    //goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp
   < inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := 0;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j := -1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon14_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j < 1;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i := -1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon15_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i < 1;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   + _v1.weight[3 * (inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1)
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i
       + 1]
     * _v1.image[inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp
       + 3 * inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i];
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon5;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon5:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon6;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon6:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min
   <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon8:
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max
   >= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon10:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp + 1;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   > inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   < inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1
   <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11:
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp + _v2.MAX_IMAGESIZE;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy:
    call inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v1.sobel_filtering_loop_anon12_LoopHead(inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE
     * (inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1)
   <= inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_min := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    _v1.out_max := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    _v1.out_yp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    _v1.out_xp := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    _v1.out_j := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    _v1.out_i := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    _v1.out_pixel_value := inline$_v1.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto START$1;

  START$1:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Entry;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Entry:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size := _v2.in_y_size;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size := _v2.in_x_size;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min := _v2.in_min;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max := _v2.in_max;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp := _v2.in_yp;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp := _v2.in_xp;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j := _v2.in_j;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value := _v2.in_pixel_value;
    havoc inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$entry;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$entry:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopHead:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp
   < _v2.MAX_IMAGESIZE
     * (inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1);
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp + 1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon13_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopHead_last:
    //goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp
   < inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := 0;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j := -1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon14_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j < 1;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i := -1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead:
    assert R'___v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon15_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopHead_last:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopBody:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i < 1;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   + _v2.weight[3 * (inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1)
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i
       + 1]
     * _v2.image[inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp
       + 3 * inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i];
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i + 1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon15_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon5;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon5:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j + 1;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon14_LoopDone:
    assume {:partition} 1 <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon6;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon6:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min
   <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon8:
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Else:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max
   >= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon10:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp + 2;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon17_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   > inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon10;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon16_Then:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value
   < inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon8;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon13_LoopDone:
    assume {:partition} inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp
       + inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size
     - 1
   <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11:
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp + 2 * _v2.MAX_IMAGESIZE;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon11_dummy:
    assert R'___v2.sobel_filtering_loop_anon12_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, 
  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value, 
  _v2.image, 
  _v2.weight);
    call inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := _v2.sobel_filtering_loop_anon12_LoopHead(inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_x_size, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value);
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$anon12_LoopDone:
    assume {:partition} _v2.MAX_IMAGESIZE
     * (inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_y_size - 1)
   <= inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_min, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_max, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_yp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_xp, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_j, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_i, inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$in_pixel_value;
    goto inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return;

  inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_min := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_min;
    _v2.out_max := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_max;
    _v2.out_yp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_yp;
    _v2.out_xp := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_xp;
    _v2.out_j := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_j;
    _v2.out_i := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_i;
    _v2.out_pixel_value := inline$_v2.sobel_filtering_loop_anon12_LoopHead$0$out_pixel_value;
    goto START$2;

  START$2:
    return;
}


