@rem -*- Perl -*-
@setlocal

@if (%PERL_BIN_PATH%) == () ( 
    @perl -x "%~dpnx0" %* 
    @goto :eof
) else (
    @if "%PERL_BIN_PATH%" == "UNDEFINED" (
        @perl -x "%~dpnx0" %* 
        @goto :eof
    ) else (
        @%PERL_BIN_PATH%\perl -x "%~dpnx0" %* 
        @goto :eof
    )
)
@goto :eof
#!perl

use Cwd;

#############################################################
# Symdiff on a C example using HAVOC
#############################################################

open OUTPUT, ">symdiff.output" or die "can't open symdiff.output for writing\n";

sub MyExec{
    my $cmd = shift;
    print OUTPUT "$cmd \n";
    system("$cmd ");
}

my $dir1 = "";
my $dir2 = "";

my $nonmodular = "";
my $asserts = "";
my $justmain = "";
my $localcheck = "";
my $oneproc = "";
my $preserve = 0;
my $loopUnrollCount = 2; # 2 by default
my $changedFile = ""; 
my $analyzeCallersOnly = 0;
my $syntacticEqOpt = "";
my $diffinline = "";
my $enumpaths = "";
my $cexstr = "";
my $notrace = "";
my $returnOnlyStr = ""; # only consider the returns as output

my $pophtml = 1; 
my $hidemodel = 1;
my $boogiewrapper = "";

my $havoc_dll_dir = "";
my $symdiff_root  = "";
my $skipbpl = 0;
my $oacr = 0;
my $smv = 0;
my $ascpp = " ";
my $rvt = 0;
$houdini = 0;
my $configFile = "";
my $usemutual = "";
my $dumpeq = "";
my $boogieopts = "";

my $genBplsOnly = 0;

my $stripAbsolutePathsInBpl = 0;
my $optString = "";
my $abstractNonTainted = 0;

sub Error{
  my $msg = shift;
  print "ERROR::$msg";
}

sub PrintUsage{
  print "usage: run_symdiff_c d1 d2 [/options]\n";
  print "\t  d1, d2: directories with two versions of C files\n";
  print "\n  [Build environment options]\n";
  print "\t  /oacr:  if running in oacr\n";
  print "\t  /smv: use SMV for front end instead of a build\n";
  print "\t  /nocpp : do not pass -TP to the C compiler (to compile older C files such as siemens suite)\n";
  print "\t  /genBplsOnly:  stop after generating v1.bpl and v2.bpl\n";
  print "\t  /stripAbsolutePathsInBpl:  keep paths relative to where run_symdiff_c.cmd is invoked\n";

  print "\n  [Analysis options]\n";
  print "\t  /lu:k : unroll loops k times (default 2)\n";
  print "\t  /loopExtract : extract loops as deterministic tail recursive procedures (FSE'13 DAC)\n";
  print "\t  /localcheck : report differences only in procedures with changes\n";
  print "\t  /nonmodular : inline everything\n";
#  print "\t  /diffinline : differential inlining\n";
  print "\t  /abstractNonTainted : abstract code shown to be not tainted by static analysis \n";
  print "\t  /bv         : use when using bit vectors in boogie file\n";
  print "\t  /boogiewrapper:  use the BoogieWrapper.exe (useful for large examples with outOfMem exceptions)\n";
  print "\t  /opts:\"<option-string>\" : option-string is passed to -allInOne\n";


  print "\n  [Functions to analyze options]\n";
  print "\t  /cf:file : file containing the functions that have changed (no directory path)\n";
  print "\t  /analyzeChangedCallersOnly : only analyze the transitive modified callers \n";
  print "\t                               (bpl file contains callees(callers(mod funcs)))\n";
  print "\t  /useConfig:file : use file as the config file (default auto generated)\n";

  print "\n  [Output options]\n";
  print "\t  /nohtml:  does not pop the html viewer (default: off)\n";
  print "\t  /showmodel:  shows the model on mouse hover (default: off)\n";

  print "\n  [Other options --- not well tested]\n";
  print "\t  /oneproc : don't perform differential checking (checks only 1 procedure for /asserts)\n";
  print "\t  /rvt : use rvt option (currently same as /loopExtract, RVT analysis deprecated) \n";
  print "\t  /skipbpl : do NOT generate test.bpl (reuse existing test.bpl)\n";
  print "\t  /asserts : Replace assertions with OK\n";
  print "\t  /justmain : just analyze the main function\n";
  print "\t  /usemutual : use mutual summaries\n";
  print "\t  /dumpeq : dump equality relations and summary templates\n";
  print "\t  /houdini : use houdini to generate preconditions\n";
  print "\t  /preserve : use existing bpl files\n";
  print "\t  /sound : do a sound analysis\n";
  print "\t  /enumpaths  : perform symbolic execution for paths to get time estimate [checks for assert false]\n";
  print "\t  /cex:k : upto k counterexamples per procedure (default 5)\n";
  print "\t  /notrace : do not generate counterexample traces (just reports the #cex) [for evaluation of underlying algorithm only]\n";

  die "\n";
}

sub ProcessOptions {

  ### Get the directories 
  if (not $ARGV[0]){PrintUsage();}
  $dir1 = shift @ARGV;
  if (not(-d $dir1)){
    Error ("$dir1 does not exist\n");
    PrintUsage();
  }
  if (not $ARGV[0]){PrintUsage();}
  $dir2 = shift @ARGV;
  if (not(-d $dir2)){
    Error ("$dir2 does not exist\n");
    PrintUsage();
  }
  

  ## other options
  while ($ARGV[0]){
    $opt = shift @ARGV;

    if($opt =~ /^\/lu:([0-9]+)$/){
      $loopUnrollCount = $1;
      #print "Using loop unroll count of $1\n";
    }
    elsif($opt =~ /^\/oacr$/){
      $oacr = 1;
      print "Using OACR...\n";
    }
    elsif($opt =~ /^\/smv$/){
      $smv = 1;
      print "Using SMV...\n";
    }
    elsif($opt =~ /^\/nocpp$/){
      $ascpp = " \/nocpp ";
      print "Removing -TP for CL...\n";
    }
    elsif($opt =~ /^\/bv$/){
      $boogieopts = " /boogieOpt:/z3opt:RELEVANCY=0 ";
      print "Using efficien Z3 bv flags...\n";
    }
    elsif($opt =~ /^\/skipbpl$/){
      $skipbpl = 1;
      print "Skipping generation of test.bpl...\n";
    }
    elsif($opt =~ /^\/nohtml$/){
      $pophtml = 0;
    }
    elsif($opt =~ /^\/showmodel$/){
      $hidemodel = 0;
    }
    elsif($opt =~ /^\/boogiewrapper$/){
      $boogiewrapper = "-wrapper";
    }
    elsif($opt =~ /^\/houdini$/){
      $houdini = 1;
      print "May the force be with you...\n";
    }
    elsif($opt =~ /^\/nonmodular$/){
      $nonmodular = "-nonmodular";
      print "Inlining Everything...\n";
    }
    elsif($opt =~ /^\/abstractNonTainted$/){
      $abstractNonTainted = 1;
      print "Running taint analysis to determine tainted blocks...\n";
    }
    elsif($opt =~ /^\/diffinline$/){
      $diffinline = "-di";
      print "Differential inlining...\n";
    }
    elsif($opt =~ /^\/asserts$/){
      $asserts = "-asserts";
      print "Replacing asserts by OK...\n";
    }
    elsif($opt =~ /^\/justmain$/){
      $justmain = "-justmain";
      print "Analyzing only the main function...\n";
    }
    elsif($opt =~ /^\/localcheck$/){
      $localcheck = "-localcheck";
      print "Not propagating differences to callers...\n";
    }
    elsif($opt =~ /^\/oneproc$/){
      $oneproc = "-oneproc";
      print "Differential inlining switched off...\n";
    }
    elsif($opt =~ /^\/usemutual$/){
      $usemutual = "-usemutual";
      print "Using mutual summaries...\n";
    }
    elsif($opt =~ /^\/dumpeq$/){
      $dumpeq = "-dumpeq";
      print "Dump equality data and summary templates...\n";
    }
    elsif($opt =~ /^\/preserve$/){
      $preserve = 1;
      print "Skipping generation of bpl files...\n";
    }
    elsif($opt =~ /^\/sound$/){
      $sound = "-sound";
      print "Performing a sound analysis...\n";
    }
    elsif($opt =~ /^\/rvt$/ || $opt =~ /^\/loopExtract/){
      $rvt = 1;
      print "Extracting loops as recursive procedures....\n";
    }
    elsif($opt =~ /^\/opts:(.*)$/){
      $optString = $1;
      print "Passing $1 to symdiff.exe -allInOne\n";
    }
    elsif($opt =~ /^\/genBplsOnly$/){
      $genBplsOnly = 1;
      print "Only generating BPL files, not invoking symdiff.exe...\n";
    }
    elsif($opt =~ /^\/stripAbsolutePathsInBpl$/){
      $stripAbsolutePathsInBpl = 1;
      print "Removing absolute paths from generated bpl files...\n";
    }
    elsif($opt =~ /^\/enumpaths$/){
      $enumpaths = "-enumpaths";
      print "Enumerating paths instead of VCGen, for estimating time (just checks for assert false)....\n";
    }
    elsif($opt =~ /^\/notrace$/){
      $notrace = "-notrace";
      $pophtml = 0; #also blocks html from popping up
      print "No html report....look at the $dir1$dir2.log to see the number of counterexamples....\n";
    }
    elsif($opt =~ /^\/returnOnly$/){
      $returnOnlyStr = "-returnAsOnlyOutput";
      print "Only considering return value as the output of a procedure, ignoring globals/out parameters modified....\n";
    }
    elsif($opt =~ /^\/cex:([0-9]+)$/){
      $cexcount = $1;
      $cexstr = "-cex:$1";
    }
    elsif($opt =~ /^\/useConfig:([a-zA-Z0-9_\.]+)$/){
      $configFile = $1;
      print "Using config file $1...\n";
      if (not(-e $configFile)){
	Error ("$configFile does not exist\n");
	PrintUsage();
      }
    }
    elsif($opt =~ /^\/cf:([a-zA-Z0-9_\.]+)$/){
      $changedFile = $1;
      print "Changed file is $1\n";
      if (not(-e $changedFile)){
	Error ("$changedFile does not exist\n");
	PrintUsage();
      }
    }
    elsif($opt =~ /^\/analyzeChangedCallersOnly$/){
	$analyzeCallersOnly = 1;
    }
    else {
      	Error("Unrecognized option ".$opt."\n");
	PrintUsage();
    }
  }
  
}

sub SetEnvVars{
  if (not (-d $ENV{'HAVOC_DLL_DIR'})){
    die "HAVOC_DLL_DIR not set\n";
  }
  $havoc_dll_dir = $ENV{'HAVOC_DLL_DIR'};

  if (not (-d $ENV{'SYMDIFF_ROOT'})){
    die "SYMDIFF_ROOT not set\n";
  }
  $symdiff_root = $ENV{'SYMDIFF_ROOT'};
}


sub GenerateChangedFile{

  #generate the changedFile if AnalyzeCallersOnly is specified (overrides /cf option)
  if ($analyzeCallersOnly eq 1){
        if (not($changedFile eq "")){
	    Error("Use of /analyzeCallersOnly and /cf together is not permitted\n");
	    PrintUsage();
	}
	
	#################################################################################
	#Generate the starting line for each procedure in the module
	#################################################################################
	my $newcmd;
	my $cmd = "$havoc_dll_dir\havoc.cmd";
	if ($oacr eq 1){
	  $cmd = "$havoc_dll_dir\havoc.cmd /oacr";
	}
	if ($smv eq 1){
	  $cmd = "$havoc_dll_dir\havoc.cmd /smv";
	}

	$cmd = "$cmd $ascpp "; # to control the -TP option

	$newcmd = "$cmd /TranslateMode=PrintProcedureSourceLines  \| grep CFG_SOURCE_LINE \| sort \| uniq \| sed s/\"CFG_SOURCE_LINES::\"//g > func_source_lines.txt";
	MyExec($newcmd);

	#################################################################################
	#Use the output of diff and the func_source_lines to generate the $changedFile
	#################################################################################
	#1. Generate the diff_v1_v2 file
	#2. For each line in diff_v1_v2, figure out the enclosing procedure from $func_source_lines.txt
	#3. Output it to $changedFile (give it some name)
         
        #--------------- Added by Agnelo--------------------- 
        @fnArray = &GetModifiedFuncList ("func_source_lines.txt", \%fileDiffInfo);
        $changedFile = "automodfunclist.txt";
        if (open MFFILE, ">$changedFile")
        {
            for my $funcName (@fnArray)
            {
               print MFFILE "$funcName\n";
            }
            close MFFILE;
        }
        else
        {
            $changedFile = "";
        }
        #--------------- Added by Agnelo--------------------- 
        
  }
 

}

sub ProcessCDir{
  my $dir = shift;

  $olddir = getcwd();

  chdir $dir;
  MyExec("rm -f test.*.bpl havoc.log");
  if (-e "havoc.h" && ($houdini eq 1))
  {
    print "Calling houdini on $dir\n";
    #create a blank __havoc_infer.c
    open HOUDINIFILE, ">__havoc_infer.c" or die $!;
    close HOUDINIFILE;
    
    #move havoc.config and delete it
    MyExec("cp $havoc_dll_dir\houdini_havoc.config .\\havoc.config");
    MyExec("$havoc_dll_dir\havocfe.cmd /houdini");
    MyExec("rm havoc.config"); 
  }
  my $cmd = "$havoc_dll_dir\havoc.cmd";
  if ($oacr eq 1){
    $cmd = "$havoc_dll_dir\havoc.cmd /oacr";
  }
  if ($smv eq 1){
    $cmd = "$havoc_dll_dir\havoc.cmd /smv";
  }
  $cmd = "$cmd $ascpp "; # to control the -TP option
  GenerateChangedFile();

  #generate the public_funcs.txt from the changedFile
  #MyExec("attrib -R public_funcs.txt*");
  if (not($changedFile eq "")){
    my $newcmd = $cmd;
    #MyExec("cp  public_funcs.txt public_funcs.txt.old\n");
    #MyExec("attrib -R public_funcs.*");

    # b = PrintPublicFuncs
    $newcmd = "$cmd /TranslateMode=PrintPublicFuncs /PublicFuncs= \| grep FUNC \| sed s/\"FUNC: \"//g   > public_funcs.txt.0";
    MyExec("$newcmd"); #redirecting here does not generate the public_funcs.txt

    ## HAVOC has a problem that empty PublicFuncs is construed as specifying everything
    if (-s $changedFile > 0) {
      # c = callers(mod) or mod (if localcheck is specified)
      if ($localcheck eq "") {
	$newcmd = "$cmd /TranslateMode=PrintCallers /PublicFuncs=\@$changedFile \| grep FUNCTION \| sed s/\"FUNCTION \"//g  \| sed s/\" ::.*\"//g > public_funcs.txt.1";
	MyExec("$newcmd"); #redirecting here does not generate the public_funcs.txt
      }	else {
	MyExec("copy /Y $changedFile public_funcs.txt.1");
      }	
      # d = callees(c)
      $newcmd = "$cmd /TranslateMode=PrintCallees /PublicFuncs=\@public_funcs.txt.1 \| grep FUNCTION \| sed s/\"FUNCTION \"//g  \| sed s/\" ::.*\"//g > public_funcs.txt.2";
      MyExec("$newcmd"); #redirecting here does not generate the public_funcs.txt
    } else {
      print "All functions are syntactically equal, nothing to analyze....\n";
      print "Done.\n";
      exit(1);
    }	
    # e = d \intersect b
    # f = b \minus c
    open BFILE, "<public_funcs.txt.0" or die "Can't open public_funcs.txt.0\n";
    open CFILE, "<public_funcs.txt.1" or die "Can't open public_funcs.txt.1\n";
    open DFILE, "<public_funcs.txt.2" or die "Can't open public_funcs.txt.2\n";
    open EFILE, ">public_funcs.txt" or die "Can't open public_funcs.txt for writing\n";
    open FFILE, ">synt_eq_funcs.txt" or die "Can't open synt_eq_funcs.txt for writing\n";

    my @bfile = <BFILE>;
    my @cfile = <CFILE>;
    my @dfile = <DFILE>;

    my %celements;
    foreach $cfunc (@cfile) {
      $celements{$cfunc} = 1;
    }	
    
    my %elements;
    foreach $bfunc (@bfile) {
      $elements{$bfunc} = 1;
      if (not (exists $celements{$bfunc})) {
	print FFILE "$bfunc";
      }
    }	

    foreach $dfunc (@dfile) {
      if (exists $elements{$dfunc}){
	print EFILE "$dfunc";
      }
    }	

    close BFILE;
    close CFLILE;
    close DFILE;
    close EFILE;
    close FFILE;

    #$changedFile = "";
  }
  # this is where the BPL gets generated
  if ($skipbpl eq 0){
    MyExec("$cmd >> havoc.log"); #redirect the havoc.cmd's output
  }
  $cmd = "grep -v \"__LOOP_\" test.bpl  > test.tmp.bpl";
  MyExec($cmd);

  sleep(2); #get "access violation in oacr otherwise"

  if ($rvt eq 1){
    #print "Extracting loops as recursive procedures....\n";
    MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -extractLoops test.tmp.bpl test.unr.bpl >> havoc.log");
  } else {
    print "Unrolling loops $loopUnrollCount times....\n";
    MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -loopUnroll $loopUnrollCount test.tmp.bpl test.unr.bpl >> havoc.log");
  }

  #may need to go back multiple levels
  chdir $olddir;
}


#-------------------------------------------------------------------------------
# Agnelo :: Added code for detection of changed fucntions
#-------------------------------------------------------------------------------
#

#-------------------------------------------------------------------------------
# GetModifiedFileInfo (dir1, dir2)
#-------------------------------------------------------------------------------
#   params : dir1 and dir2 are the paths of the directories being compared
#   return : hash containing the names of modified files and the modified line numbers
#            {{filename1, {array of modified line numbers}}
#             .............................................
#             {filenameN, {array of modified line numbers}}}
#             
sub GetModifiedFileInfo {
  my $dir1 = shift;
  my $dir2 = shift;
  my $cmd, $res, $fileCount;
  my @diffFiles, %diffInfo;

  # Get the list of modified files
  $cmd = "diff --brief -r $dir1 $dir2 | grep ^Files | grep \"\\.c \" | cut -d\" \" -f2,4 --output-delimiter=\",\"";
  print OUTPUT "$cmd\n";
  @diffFiles = `$cmd`;

  $fileCount = $#diffFiles + 1;
  %diffInfo = undef; 

  # get line diff information for each modified file
  for ($f=0;  $f < $fileCount; $f++)
  {
    my (@lineArr, @diff, @fpair) = (undef, undef, undef);
    my ($lineCount, $n) = (0, 0);
    my $tmp, $l1, $l2;

    chomp ($diffFiles[$f]);
    @fpair = split (/\,/,$diffFiles[$f]);

    $cmd = "diff $fpair[0] $fpair[1] | grep -v \"^[<>-]\"";
    print OUTPUT "$cmd\n";
    @diff = `$cmd`;

    $lineCount = $#diff + 1;

    for ($l=0;  $l < $lineCount;  $l++)
    {
      $diff[$l] =~ m/^([^adc]+)/;
      $tmp = $1;
      $tmp =~ m/(\d+)(,(\d+))?/;
      $l1 = $1;
      $l2 = $3;
  
      $lineArr[$n++] = $l1;
      if ($l2 != undef)
      {
        for (++$l1; $l1<=$l2; ++$l1)
	  {
	  $lineArr[$n++] = $l1;diffInfo
        }
      }
    }

    $diffInfo {$fpair[0]} = \@lineArr;
  }

  delete $diffInfo{""};
  return %diffInfo;
}


#-------------------------------------------------------------------------------
# GetFunctionInfo ($modified_file_name, $func_sources_list_filename)
#-------------------------------------------------------------------------------
# Return : Returns a structure containing line number information for each 
#          modified function in $modified_file_name by referring to func_sources_list.txt
#
sub GetFunctionInfo {
  my $file   = shift;
  my $dbFile = shift;
  my $n, $cmd, $file, $fnCount;
  my (@res, @ftable) = (undef, undef);

  $file =~ tr/\//\\/;
  $file =~ s/([^A-Za-z0-9])/\\$1/g;
  $file =~ s/\\\\/\\\\\\/g;
  $cmd = "grep -i \"$file,\" $dbFile | cut -d\",\" -f2,3 --output-delimiter=\",\"";
  @res = `$cmd`;
  $fnCount = $#res + 1;

  for ($n=0;  $n < $fnCount;  $n++)
  {
    chomp ($res[$n]);
    if ($res[$n] =~ m/\s+([0-9]+)\,(\S+)/)
    {
      my @fdetails;

      @fdetails[0] = $1; # line number
      @fdetails[1] = $2; # function name

      $ftable[$n] = \@fdetails;
    }
  }
  
  return @ftable;
}


#-------------------------------------------------------------------------------
# GetModifiedFuncList ($func_sources_list_filename, $diffFileInfo)
#-------------------------------------------------------------------------------
# params : $func_sources_list_filename - path to func_sources_list.txt
#        : $diffFileInfo - reference to hash containing file diff info
# return : array of modified function names
#
sub GetModifiedFuncList {
  my $dbFile = shift;
  my $tmp = shift;
  my %diffFileInfo = %$tmp;

  my $file, $fnCount, $count = 0;
  my (@ftable, @funcList, @lineList) = (undef, undef, undef);

  open DIFF_OUTUT,  ">changed_lines.txt" or die "can't open changed_lines.txt...\n";

  
  foreach $file (keys(%diffFileInfo))
  {
    my @tmpArr = ("2147483647", "dummy");

    @ftable = &GetFunctionInfo ($file, $dbFile);
    $fnCount = $#ftable;
    $ftable[$fnCount+1] = \@tmpArr;

    @lineList = @{$diffFileInfo {$file}};

    $l = 0;
    $f = 0;
    for my $lineNo (@lineList)
    {
      #get function correspoding to each modified line number
      if ($f==1)
      {
	if ($lineNo < $ftable[$m+1][0])
	{
	  if (not($lineNo eq "")) {
	    print DIFF_OUTUT "$ftable[$m][1], $lineNo\n";
	  }
          next;
	}
      }

      $h = $fnCount;
      $f = 0;

      # Binary Search to find the enclosing function
      while ($l <= $h)
      {
        $m = int (($l+$h)/2);
        if ($lineNo >= $ftable[$m][0]  &&  $lineNo < $ftable[$m+1][0])
        {
	  $f = 1;	
	  last;
        }
    
        ($lineNo < $ftable[$m][0]) ?  ($h = $m-1) : ($l = $m+1);
      }

      if ($f == 1)
      {
        $funcList[$count++] = $ftable[$m][1];
	  if (not($lineNo eq "")) {
	    print DIFF_OUTUT "$ftable[$m][1], $lineNo\n";
	  }
        $l = $m;
      } 
    }
  }

  close DIFF_OUTUT;

  return @funcList;
}

#if the directory has nested structure (c:\a\b\c\..\, then we will remove the {:,\,.} 
sub GetWfDirName{
  my $dir = shift;

  $dir =~ s/[:.\\-]/_/g;
  
  return $dir;
}


# logic related to abstractNonTainted
sub AbstractNonTainted{
  my $bpl = shift;
  my $changedLinesFile = shift;
  
  MyExec("dependency.exe $bpl.bpl /taint:$changedLinesFile /abstractNonTainted "); #outputs to $bpl.abstractNonTainted.bpl
  return $bpl . ".bpl.taintAbstract";
}


###### Main processing #######

ProcessOptions();
SetEnvVars();

# cleanup
MyExec("rm -f *.gv *.jpeg *.html synt_eq_* ");
MyExec("attrib -R /S");

if (not($changedFile eq "")){
  MyExec("cp  $changedFile $dir1\\$changedFile");
  MyExec("attrib -R $dir1\\$changedFile");
  MyExec("cp  $changedFile $dir2\\$changedFile");
  MyExec("attrib -R $dir2\\$changedFile");
}
#----- Added by Agnelo -----
# Get file Diff Info
if ($analyzeCallersOnly eq 1)
{
  %fileDiffInfo = &GetModifiedFileInfo ($dir1, $dir2);
}
#----- Agnelo End ----------

my $dir1name = GetWfDirName($dir1);
my $dir2name = GetWfDirName($dir2);

#print ("dir1 = $dir1name \n");
#print ("dir2 = $dir2name \n");

# my $olddir = getcwd();
# chdir $dir1 or die "Can't cd to $dir1\n";
# chdir $olddir;
# chdir $dir2 or die "Can't cd to $dir1\n";
# my $olddir = getcwd();
# chdir $olddir;

#----- Added by Agnelo -----
# Get file Diff Info
if ($analyzeCallersOnly eq 1)
{
  %fileDiffInfo = &GetModifiedFileInfo ($dir1, $dir2);
}
#----- Agnelo End ----------
ProcessCDir($dir1);
#reset the changedFile
if ($analyzeCallersOnly eq 1){
  $changedFile = "";
  %fileDiffInfo = &GetModifiedFileInfo ($dir2, $dir1);
}
ProcessCDir($dir2);

if ($analyzeCallersOnly eq 1){
  # only copy the syntactic equal list from version 1
  MyExec("xcopy /Y /Q /I $dir1\\synt_eq_funcs.txt .\\");
  #MyExec("attrib -R synt_eq_funcs.txt");
  $syntacticEqOpt = "-synEq:synt_eq_funcs.txt";
  # only copy changed functions from v1
  MyExec("xcopy /Y/Q/I $dir1\\automodfunclist.txt .\\");
}

#first copy the files
MyExec("cp  $dir1\\test.unr.bpl $dir1name.bpl");
MyExec("cp  $dir2\\test.unr.bpl $dir2name.bpl");
MyExec("attrib -R $dir1name.bpl");
MyExec("attrib -R $dir2name.bpl");
MyExec("chmod 755 $dir1name.bpl");
MyExec("chmod 755 $dir2name.bpl");

## HACK!! The presence of {:inline true} does not work well with the current too
## especially for the INT_EQ, INT_NEQ etc. Eat up the {:inline true} 
MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/\\{:inline.*true\\}//g $dir1name.bpl");
MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/\\{:inline.*true\\}//g $dir2name.bpl");

## Replace $$ with :\ in file path
MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/\\\$\\\$/:\\\\/g $dir1name.bpl");
MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/\\\$\\\$/:\\\\/g $dir2name.bpl");

# Replace assert {:sourcefile "unknown"} {:sourceline 0} true; --> skip
#MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/.*sourcefile \"unknown\".*//g $dir1name.bpl");
#MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/.*sourcefile \"unknown\".*//g $dir2name.bpl");



if ($stripAbsolutePathsInBpl eq 1) {
  my $currDir = getcwd();
  $currDir =~ s/\//\\\\/g;
  $currDir = lc $currDir; # Esp only has lowercase paths
  MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/$currDir/./g $dir1name.bpl");
  MyExec("$symdiff_root\\scripts\\cygwin_binaries\\sed -i s/$currDir/./g $dir2name.bpl");
}

if ($genBplsOnly eq 1) {
  exit(1);
}

# taint abstraction logic
if ($abstractNonTainted eq 1) {
  if($analyzeCallersOnly eq 0){
    die "Using /abstractNonTainted only permitted with /analyzeChangedCallersOnly\n";
  } 
  my $v1 = AbstractNonTainted($dir1name, "$dir1name\\changed_lines.txt");
  my $v2 = AbstractNonTainted($dir2name, "$dir2name\\changed_lines.txt");
  MyExec("xcopy /Y /Q /I $v1.bpl $dir1name.bpl");
  MyExec("xcopy /Y /Q /I $v2.bpl $dir2name.bpl");
}


#generate config file
my $rvtstr = ""; 
if ($rvt eq 1) {
    $rvtstr = "-rvt";
}

if ($configFile eq ""){
   MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -inferConfig $dir1name.bpl $dir2name.bpl > $dir1name$dir2name.config");
   $configFile = "$dir1name$dir2name.config";
}

#run symdiff for equivalence and dump output
if ($dumpeq ne "") {
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne $dir1name.bpl $dir2name.bpl $configFile $dumpeq> $dir1name$dir2name.log");
}

MyExec("rm -f EQ*");

#run symdiff
$rvtstr = ""; #-rvt option to symdiff.exe deprecate for now
MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne $dir1name.bpl $dir2name.bpl $configFile $rvtstr $nonmodular $asserts $justmain $localcheck $oneproc $usemutual $sound $boogiewrapper $syntacticEqOpt $diffinline $enumpaths $cexstr $returnOnlyStr $optString $notrace $boogieopts > $dir1name$dir2name.log");
#generate the call graph view
# if ($rvt eq 1 && ($pophtml eq 1)){
#   MyExec("dot -Tjpeg final1.gv > final1.jpeg");
#   MyExec("dot -Tjpeg final2.gv > final2.jpeg");
# }

#generate html log
MyExec("$symdiff_root\\scripts\\cygwin_binaries\\grep CTrace $dir1name$dir2name.log > clog");
MyExec("perl $symdiff_root\\scripts\\log2html.pl clog $dir1name$dir2name");

#convert the decotated .c files into html files
my @cfiles = <EQ*.c>;
my $f;
foreach $f (@cfiles) {
  if ($hidemodel eq 1){
    system("perl $symdiff_root\\scripts\\myC2Html.pl $f $f 0");
  } else {
    system("perl $symdiff_root\\scripts\\myC2Html.pl $f $f 1");
  }	
}

##MyExec("rm -f EQ*.c ");
if ($pophtml eq 1){
  system("$dir1name$dir2name.html");
}

close OUTPUT; 
print("Done.\n");
exit(1);
