#!/usr/local/bin/perl

#################################################################
# Generate the html file from a C file with a trace

# inputs: a C file with trace lines starting with the marker "$$$"
# 
#################################################################


############ main function ####################



# perl run.pl #files
$numArgs = $#ARGV + 1;

# print "# of args = $numArgs\n";
if ($numArgs ne 2) {
  die "usage: log2html.pl <logfile> <output-html-file>\n";
}

my $file = $ARGV[0];
my $ofile = $ARGV[1];

open FILE, "<$file" or die "can't open $file\n"; 
open OUTPUT, ">$ofile.html" or die "can't open $ofile.html\n";

## PRELUDE
print OUTPUT  "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n";
print OUTPUT  "<html>\n";
print OUTPUT  "<head>\n";
print OUTPUT  "<title>C trace to html</title>\n";
print OUTPUT  "</head>\n";
print OUTPUT  "<body>\n";
print OUTPUT  "\n";
print OUTPUT  "<h2> Log viewer for behavioral differences </h2> <hr>\n";

### embed the graphs here
my $final1 = "final1.jpeg";
my $final2 = "final2.jpeg";

my $cexCnt = 0;
if ((-e $final1) && (-e $final2)){
    print OUTPUT "<p class=MsoNormal><b><img border=0  id=\"final1\" src=\"final1.jpeg\"></b></p>";
    print OUTPUT "<p class=MsoNormal><b><img border=0  id=\"final2\" src=\"final2.jpeg\"></b></p>";
    $cexCnt = -100; # to indicate that we are in RVT mode, and won't have cex traces
}


## don't <, > and quotes need to be translated?
my $currProc = "";

while (<FILE>){
  s/ /&nbsp;/;
  s/\t/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/;
#############  
 ##s/^CTracen:([0-9][0-9]*):EQ_v0\.(.*)__test\.(.*)$/Counterexample \1 in \2/;
#############  
##  s/^CTracen:([0-9][0-9]*):EQ_.*\.(.*)__(.*)$/Counterexample \1 in \2/;
  s/^CTracen:([0-9][0-9]*):EQ_.*\.(.*)__(.*)$/Counterexample \1/;
  my $new = $2;
  if (not($currProc eq $new) && not($new eq "")) {
    print OUTPUT  "<h4> Procedure  $new </h4>";
    $currProc = $new;
  } 

  s/^CTracew:(.*)$/<a href=\"\1\.html"><b>trace<\/b><\/a>/;
  s/^(.*)$/\1<br>/;
  print OUTPUT "<font face=\"monospace\">";
  print OUTPUT $_;
  print OUTPUT "</font>";
  $cexCnt = $cexCnt + 1;
}

if ($cexCnt eq 0) {
#  print OUTPUT "<font face=\"monospace\">";
  print OUTPUT "<h3> All matched procedures appear to be partially equivalent </h3>";
#  print OUTPUT "</font>";
}

## POST-LUDE

print OUTPUT  "</body>\n";
print OUTPUT  "</html>\n";

close FILE or die "can't close $file\n";
close OUTPUT or die "can't close $ofile.html\n";
