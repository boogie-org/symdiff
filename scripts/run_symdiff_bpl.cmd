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

###############################################
## Do not use any CYGWIN_BINARIES IN THIS FILE 
###############################################

my $symdiff_out = "symdiff_bpl.output";
open OUTPUT, ">$symdiff_out" or die "can't open $symdiff_out for writing\n";

sub MyExec{
    my $cmd = shift;
    print OUTPUT "$cmd \n";
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
  print "\t  /rvt[:n] : extract loops as tail-recursive procedures (default off) (:n makes the extraction non-deterministic)\n";
  print "\t  /useConfig:file : use file as the config file (default auto generated)\n";
  print "\t  /opts:\"<option-string>\" : <option-string> is passed to SymDiff.exe -allInOne\n";
  print "\t  /inferContracts:\"<option-string>\" : perform Boogie /contractInfer to infer mutual summaries with <option-string> \n";
  print "\t  /abstractNonTainted:[changed-file1 changed-file2] : abstract code shown to be not tainted by static analysis (/taint:changed-filei for ith version)\n";
  die "\n";
}

my $v1 = "";
my $v2 = "";
my $luCount = 2;
my $rvt = 0;
my $nonDeterministicLoopExtract = 0;
my $configFile = "";
my $returnOnlyStr = "";
my $optString = "";
my $inferContracts = 0;
my $inferContractsOpts = "";
my $abstractNonTainted = "";
my $taint1 = "";
my $taint2 = "";

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
    if($opt =~ /^\/changedLines$/){
      $doChangedBasedDep = 1;
    }
    if($opt =~ /^\/lu:([0-9]+)$/){
      $luCount = $1;
      print "\tLoop unroll count is $1\n";
    }
    if($opt =~ /^\/rvt$/){
      $rvt = 1;
      print "\tExtracting loops  as procedures\n";
    }
    if($opt =~ /^\/rvt:n$/){
      $rvt = 1;
      $nonDeterministicLoopExtract = 1;
      print "\tExtracting loops  as non-deterministic procedures\n";
    }    
    if($opt =~ /^\/opts:(.*)$/){
      $optString = $1;
      print "\tPassing options \"$1\" to symdiff.exe -allInOne\n";
    }
    if($opt =~ /^\/inferContracts:(.*)$/){
      $inferContracts = 1;
      $inferContractsOpts = $1;
      print "\tPassing options \"$1\" to boogie.exe /contractInfer to infer mutual summaries \n";
    }
    elsif($opt =~ /^\/returnOnly$/){
      $returnOnlyStr = "-returnAsOnlyOutput -localcheck";
      print "\tOnly considering return value as the output of a procedure, ignoring globals/out parameters modified....\n";
    }
    if($opt =~ /^\/abstractNonTainted:\[(.*) (.*)\]$/){
      $abstractNonTainted = "1"; #non-empty
      $taint1 = $1;
      $taint2 = $2;
      print "\tPerforming taint based abstraction based on changed files $1 and $2 \n";
    }
    if($opt =~ /^\/useConfig:([a-zA-Z0-9_\.]+)$/){
      $configFile = $1;
      print "\tUsing config file $1\n";
      if (not(-e $configFile)){
	Error ("$configFile does not exist\n");
	PrintUsage();
      }
    }
  }
  
}

# logic related to abstractNonTainted
sub AbstractNonTainted{
  my $bpl = shift;
  my $changedLinesFile = shift;
  
  MyExecAndDieOnFailure("dependency.exe $bpl.bpl /taint:$changedLinesFile /abstractNonTainted "); #outputs to $bpl.abstractNonTainted.bpl
  return $bpl . ".bpl.taintAbstract";
}

# prints stats about how many houdini constants are proved 
sub PrintHoudiniStats{
  my $file = shift;
  my $v1 = shift;
  my $v2 = shift;
  my $mergedFile = shift;

  my @arr = ($v1, $v1, $mergedFile);
  
  open HOUDINI_OUT, "<$file" or die "can't open $file for parsing the output of run_symdiff_bpl.cmd\n";
  my $houdiniCount = 0;
  my $houdiniTrueCount = 0;
  my $verifCount = 0;
  my $i = 0;
  foreach $line (<HOUDINI_OUT>) {
    if ($line =~ /Boogie program verifier finished/) {        
        print "\t [$arr[$i]] $line";
        $i++;
    }
    next unless $line =~ /_houdini/; #this is stale as the name of houdini constants can be anything
    $houdiniCount = $houdiniCount + 1;
    next unless $line =~ / True/;
    $houdiniTrueCount = $houdiniTrueCount + 1;    
  }
  print "#Candidates proved /#Candidates for Houdini = $houdiniTrueCount / $houdiniCount \n";
  close HOUDINI_OUT;
}




##################################
## Main processing ###############
##################################

$symdiff_root = $ENV{'SYMDIFF_ROOT'};


ProcessOptions();

#check the annotations in two versions separately
print "Checking $v1.bpl...\n";
MyExecAndDieOnFailure("$symdiff_root\\references\\boogie.exe /noinfer /doModSetAnalysis $v1.bpl > $v1$v2.log");
print "Checking $v2.bpl...\n";
MyExecAndDieOnFailure("$symdiff_root\\references\\boogie.exe /noinfer /doModSetAnalysis $v2.bpl >> $v1$v2.log");

if ($rvt eq 1){
  my $loopStr = "-extractLoops";
  if ($nonDeterministicLoopExtract eq 1) {
    $loopStr = $loopStr . ":n";
  }
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe $loopStr $v1.bpl _v1.bpl");
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe $loopStr $v2.bpl _v2.bpl");
} else {
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -loopUnroll $luCount $v1.bpl _v1.bpl");
  MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -loopUnroll $luCount $v2.bpl _v2.bpl");
}

if ($doChangedBasedDep eq 1){
      $v1ChangedLines = "/taint:_v1.bpl_changed_lines.txt";
      $v2ChangedLines = "/taint:_v2.bpl_changed_lines.txt";
      MyExecAndDieOnFailure("$symdiff_root\\SyntaxDiff\\bin\\debug\\SyntaxDiff.exe _v1.bpl _v2.bpl _v1_v2.config") #outputs _v1.bpl_changed_lines.txt and _v2.bpl.changed_lines.txt
}
## run dependency analysis (TODO: fold it together with abstractTainted)
MyExecAndDieOnFailure("$symdiff_root\\dependency\\bin\\debug\\dependency.exe _v1.bpl $v1ChangedLines /annotateDependencies /prune"); #outputs to _v1.bpl_w_deps.bpl
MyExecAndDieOnFailure("$symdiff_root\\dependency\\bin\\debug\\dependency.exe _v2.bpl $v2ChangedLines /annotateDependencies /prune"); #outputs to _v2.bpl_w_deps.bpl
MyExecAndDieOnFailure("copy /Y _v1.bpl_w_dep.bpl  _v1.bpl"); 
MyExecAndDieOnFailure("copy /Y _v2.bpl_w_dep.bpl  _v2.bpl"); 

## run abstractNonTainted
if (!($abstractNonTainted eq "")) {
  my $v1 = AbstractNonTainted("_v1", $taint1);
  my $v2 = AbstractNonTainted("_v2", $taint2);
  MyExecAndDieOnFailure("copy /Y $v1.bpl  _v1.bpl"); #renaming v1.bpl destroys the pristine files
  MyExecAndDieOnFailure("copy /Y $v2.bpl  _v2.bpl"); #renaming v1.bpl destroys the pristine files
}

MyExecAndDieOnFailure("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config"); 

MyExecAndDieOnFailure("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config $returnOnlyStr $optString >> $v1$v2.log"); 

MyExecAndDieOnFailure("echo Generated mergedProgSingle.bpl >> $v1$v2.log");

if ($inferContracts eq 1){
  print "Running Houdini to infer additional contracts......\n";
  MyExecAndDieOnFailure("$symdiff_root\\references\\boogie.exe /noinfer /contractInfer /printAssignment $inferContractsOpts mergedProgSingle.bpl >> $v1$v2.log");
  PrintHoudiniStats("$v1$v2.log", "$v1.bpl", "$v2.bpl", "mergedProgSingle.bpl");
}

close OUTPUT;
print("Commands written to $symdiff_out, and output redirected to $v1$v2.log\n"); 

exit(1);
