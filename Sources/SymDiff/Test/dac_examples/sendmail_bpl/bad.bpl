/*
* Manual BPL encoding of 
* verisec-suite\programs\apps\sendmail\CVE-1999-0047\mime7to8\
*    - mime7to8_arr_one_char_no_test_ok.c 
*
*/

function VALID_REGION(x:int): bool;

var fbuf:[int]int;

const EOF:int;
const MAXLINE:int;
const EOS:int;

procedure nondet_int() returns (r:int);

procedure main ()
{
  var fb:int;
  var c1:int;

  fb := 0;

  call c1 := nondet_int();
 
  while (c1 != EOF) {
    /* OK */
    assert (VALID_REGION(fb));
    fbuf[fb] := c1;
    fb := fb + 1;
    call c1 := nondet_int();
  }


  /* force out partial last line */
  if (fb > 0) {
    /* OK */
    assert (VALID_REGION(fb));
    fbuf[fb] := EOS;
  }
}
