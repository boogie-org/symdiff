//this will be appended to a bpl file to allocate param for main
//TODO: automate
procedure AA_main_harness ( ) {
   
  var argc:int;
  var argv:int;
  var t:int;

  call argv := __HAVOC_det_malloc(100);
  call t := main(argc, argv);
  
}
