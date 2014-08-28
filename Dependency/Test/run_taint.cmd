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

######## globals ############

my $rootdir = getcwd();
my $depBinary = "$rootdir\\..\\bin\\debug\\dependency.exe";
open(my $reportFile, '>', 'taint_report.txt');

## List of options to run it with

@options = 
(
# [" /dataOnly /detStubs ", "_data_detstubs_"],
# ["           /detStubs ", "_control_detstubs"],
# [" /readSet  /detStubs ", "_readset_detstubs"],
 [" /dataOnly /prune ", "_data_"],
 ["           /prune ", "_control_"],
 [" /refine:2 /prune ", "_refined_"],
 [" /readSet  /prune ", "_readset_"]
);



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
    print $reportFile "@tokens[0] $ver, ";
    ProcessVersion(@tokens[1], $ver);
    print $reportFile "\n";
  }
  chdir $olddir;
}


# process a version 
sub ProcessVersion {
  my $src = shift;
  my $ver = shift;
  my $cmd; 
  foreach $ex (@options) {
    my $tag = "$ex->[1]";
    # TODO: do the other direction as well
    MyExec("$depBinary $ver.bpl /taint:$ver\\changed_lines.txt $ex->[0] > taint_output.$ver.$tag.log.txt");
    # print the number of tainted lines
    open TAINT, "<taint_output.$ver.$tag.log.txt";
    my $last;
    while (<TAINT>) { $last = $_ }
    close TAINT;
    $last =~ s/\s+$//;
    print $reportFile "$last, ";
    MyExec("move $ver.bpl.html $ver.bpl.taint.$tag.html");
  }
  MyExec("$cmd");
}

sub AddToGitRepo {
  my ($src, $ver) = @_;
  
  MyExec("git add $src.bpl $ver.bpl");
  MyExec("git add $src\\*.c $src\\*.h $src\\makefile $src\\changed*.txt");
  MyExec("git add $ver\\*.c $ver\\*.h $ver\\makefile $ver\\changed*.txt");
  
}

sub PrintUsage {

  print ("run_taint.cmd <config-file>\n");
  print ("\t  Has to be executed from this directory\n");
  print ("\t  Default config-file = .\\examples_with_versions.config\n");
}

## main processing

sub Main {
  if (not $ARGV[0]){PrintUsage();}
  $config = shift @ARGV;
  
  my @examples = ReadConfigFile($config);
  
  foreach $ex (@examples) {
    ProcessExample($ex);
  }

  close $reportFile;
}

Main();
