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
# Symdiff in Differential Assertion Checking mode
# Input: v1 v2 [options]
#         It analyzes v1.bpl v2.bpl
#############################################################

sub MyExec{
    my $cmd = shift;
    print "$cmd \n";
    system("$cmd");
}

sub Error{
  my $msg = shift;
  print "ERROR::$msg";
}

sub PrintUsage{
  print "usage: run_symdiff_dac v1 v2 [/options]\n";
  print "\t  v1, v2: to analyze the files v1.bpl v2.bpl\n";
  die "\n";
}

my $v1 = "";
my $v2 = "";

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
}

sub SetEnvVars{
  if (not (-d $ENV{'SYMDIFF_ROOT'})){
    die "SYMDIFF_ROOT not set\n";
  }
  $symdiff_root = $ENV{'SYMDIFF_ROOT'};
}

## Main processing
SetEnvVars();
ProcessOptions();

MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -extractLoops $v1.bpl $v1"."_u.bpl");
MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -extractLoops $v2.bpl $v2"."_u.bpl");
MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -inferConfig  $v1"."_u.bpl $v2"."_u.bpl > $v1"."_u$v2"."_u.config");
MyExec("$symdiff_root\\SymDiff\\bin\\x86\\debug\\symdiff.exe -allInOne $v1"."_u.bpl $v2"."_u.bpl $v1"."_u$v2"."_u.config -asserts -usemutual -sound $ARGV[0] $ARGV[1] $ARGV[2] $ARGV[3] $ARGV[4] $ARGV[5]");
# TODO change the path of boogie to the references dir
MyExec("echo $symdiff_root");
MyExec("$symdiff_root\\references\\boogie.exe /contractInfer /printAssignment mergedProgSingle.bpl > $v1$v2.log");
