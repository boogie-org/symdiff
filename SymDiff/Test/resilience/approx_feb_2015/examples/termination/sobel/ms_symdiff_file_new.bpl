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
