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

#############################################################
# Symdiff on a BPL example 
# Input: v1 v2 [options]
#         It analyzes v1.bpl v2.bpl
#############################################################
sub MyExec{
    my $cmd = shift;
    print "$cmd \n";
    system("$cmd");
}


sub MyExecAndDieOnFailure{
    my $cmd = shift;
    my $status = MyExec($cmd);
    die unless $status eq 0;
}


sub Error{
  my $msg = shift;
  print "ERROR::$msg";
}

sub PrintUsage{
  print "usage: run_symdiff_c v1 v2 [/options]\n";
  print "\t  v1, v2: to analyze the files v1.bpl v2.bpl\n";
  print "\t  /lu:k : unroll loops k times (default on with k = 2)\n";
  print "\t  /rvt : extract loops as tail-recursive procedures (default off)\n";
  print "\t  /useConfig:file : use file as the config file (default auto generated)\n";
  print "\t  /opts:\"<option-string>\" : option-string is passed to SymDiff.exe -allInOne\n";
  print "\t  /inferContracts:\"<option-string>\" : perform Boogie /contractInfer to infer mutual summaries with option-string \n";
  die "\n";
}

my $v1 = "";
my $v2 = "";
my $luCount = 2;
my $rvt = 0;
my $configFile = "";
my $returnOnlyStr = "";
my $optString = "";
my $inferContracts = 0;
my $inferContractsOpts = "";

sub ProcessOptions {

  ### Get the directories 
  if (not $ARGV[0]){PrintUsage();}
  $v1 = shift @ARGV;
  if (not(-e "$v1.bpl")){
    Error ("$v1.bpl does not exist\n");
    PrintUsage();
  }
  if (not $ARGV[0]){PrintUsage();}
  $v2 = shift @ARGV;
  if (not(-e "$v2.bpl")){
    Error ("$v2.bpl does not exist\n");
    PrintUsage();
  }

  ## other options
  while ($ARGV[0]){
    $opt = shift @ARGV;
    if($opt =~ /^\/lu:([0-9]+)$/){
      $luCount = $1;
      print "Loop unroll count is $1\n";
    }
    if($opt =~ /^\/rvt$/){
      $rvt = 1;
      print "#### Extracting loops \n";
    }
    if($opt =~ /^\/opts:(.*)$/){
      $optString = $1;
      print "#### Passing $1 to symdiff.exe -allInOne\n";
    }
    if($opt =~ /^\/inferContracts:(.*)$/){
      $inferContracts = 1;
      $inferContractsOpts = $1;
      print "#### Passing $1 to boogie.exe /contractInfer to infer mutual summaries \n";
    }
    elsif($opt =~ /^\/returnOnly$/){
      $returnOnlyStr = "-returnAsOnlyOutput -localcheck";
      print "#### Only considering return value as the output of a procedure, ignoring globals/out parameters modified....\n";
    }
    if($opt =~ /^\/useConfig:([a-zA-Z0-9_\.]+)$/){
      $configFile = $1;
      print "Using config file $1\n";
      if (not(-e $configFile)){
	Error ("$configFile does not exist\n");
	PrintUsage();
      }
    }
  }
  
}




$symdiff_root = $ENV{'SYMDIFF_ROOT'};

## Main processing
ProcessOptions();
if ($rvt eq 1){
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -extractLoops $v1.bpl _v1.bpl");
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -extractLoops $v2.bpl _v2.bpl");
} else {
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -loopUnroll $luCount $v1.bpl _v1.bpl");
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -loopUnroll $luCount $v2.bpl _v2.bpl");
}

## run dependency analysis
MyExecAndDieOnFailure("$symdiff_root\\dependency\\bin\\debug\\dependency.exe _v1.bpl /annotateDependencies "); #outputs to _v1.bpl_w_deps.bpl
MyExecAndDieOnFailure("$symdiff_root\\dependency\\bin\\debug\\dependency.exe _v2.bpl /annotateDependencies "); #outputs to _v2.bpl_w_deps.bpl
MyExecAndDieOnFailure("copy /Y _v1.bpl_w_dep.bpl  _v1.bpl"); 
MyExecAndDieOnFailure("copy /Y _v2.bpl_w_dep.bpl  _v2.bpl"); 


MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config"); 

MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config $returnOnlyStr $optString > $v1$v2.log"); 

#-rvt option to symdiff.exe deprecate for now
#if ($rvt eq 1){
#  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config -rvt $returnOnlyStr $optString > $v1$v2.log"); 
#} else {
#  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config $returnOnlyStr $optString > $v1$v2.log"); 
#}
 

if ($inferContracts eq 1){
  MyExec("$symdiff_root\\references\\boogie.exe /contractInfer /printAssignment $inferContractsOpts mergedProgSingle.bpl >> $v1$v2.log");
}
