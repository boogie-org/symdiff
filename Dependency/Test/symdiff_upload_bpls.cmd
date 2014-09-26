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

#$| = 1; #flush

# execute a command
sub MyExec{
  my $cmd = shift;
  print "$cmd \n";
  system("$cmd ");
}

# read the lines from the config file
sub ReadConfigFile {
  my $cfgFile = shift;
  my @lines = ();

  open CFG, "<$cfgFile" or die "can't find config file $cfgFile\n";
 
  # print_tokens source v1 v2 v3 v4 v5 v6
  foreach $line (<CFG>) {
    # ignore lines starting in //  # ignore lines starting in //
    next if ($line =~ /^\/\//);
    #print "$line\n";
    push @lines, $line;
  } 
  close CFG;
  return @lines;
}

# process each example
sub ProcessExample {
  my $line = shift;
  chomp($line);
  my @tokens = split (' ', $line);
  my $len = @tokens;
  if ($len eq 0) {
    return;
  }
  print "Processing @tokens[0]...";
  if($len < 3) {
    die ("\nWARNING: Missing dir/src/v1 for entry --> $line\n");
  }
  $olddir = getcwd();
  chdir @tokens[0];
  for($n = 2; $n < $len; $n++) {
    $ver = @tokens[$n];
    print "\n\t Version $ver\n";
    ProcessVersion(@tokens[1], $ver);
  }
  chdir $olddir;
}


# process a version 
sub ProcessVersion {
  my $src = shift;
  my $ver = shift;
  my $cmd = "run_symdiff_bpl $src $ver /rvt /opts:\" -usemutual -checkEquivWithDependencies -freeContracts \" /inferContracts:\"/inlineDepth:1\" /abstractNonTainted:\"\[$ver\\changed_lines.txt $ver\\changed_lines.txt\]\" ";
  #my $cmd = "run_symdiff_c.cmd $src $ver /nocpp /rvt /nohtml /genBplsOnly /analyzeChangedCallersOnly /stripAbsolutePathsInBpl > $src.$ver.upload.log";
  MyExec("$cmd");
  #AddToGitRepo($src, $ver);
}

sub AddToGitRepo {
  my ($src, $ver) = @_;
  
  MyExec("git add $src.bpl $ver.bpl");
  MyExec("git add $src\\*.c $src\\makefile $src\\changed*.txt");
  MyExec("git add $src\\*.h");
  MyExec("git add $ver\\*.c $ver\\makefile $ver\\changed*.txt");
  MyExec("git add $ver\\*.h");
  
}

sub PrintUsage {

  print ("symdiff_upload_bpls.cmd <config-file>\n");
  print ("\t  Has to be executed from this directory\n");
  print ("\t  Default config-file = .\\examples_with_versions.config\n");
}

## main processing


if (not $ARGV[0]){PrintUsage();}
$config = shift @ARGV;


my @examples = ReadConfigFile($config);

foreach $ex (@examples) {
  ProcessExample($ex);
}
