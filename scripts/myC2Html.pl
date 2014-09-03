#!/usr/local/bin/perl

#################################################################
# Generate the html file from a C file with a trace

# inputs: a C file with trace lines starting with the marker "$$$"
# 
# <print-model> : 1 denotes whether to show the model in the trace or 0 denotes hover
# <full-trace>: 1 shows the entire file along withe trace, 0 only shows regions around the traces (may include other procedures)
#################################################################


############ main function ####################



# perl run.pl #files
$numArgs = $#ARGV + 1;

# print "# of args = $numArgs\n";
if ($numArgs ne 3) {
  die "usage: myC2Html.pl <c-file-with-trace> <output-html-file> <print-model> \n";
}

my $file = $ARGV[0];
my $ofile = $ARGV[1];
my $printModels = $ARGV[2];
my $ignoreNonTrace = $ARGV[3];

# Prepass to figure out the regions around the trace
my $start1 = -1, $end1 = -1, $start2 = -1, $end2 = -1, $middle = -1;
FigureOutRegionAroundTraces();


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
print OUTPUT  "<h2> Trace viewer </h2> <hr>\n";

print OUTPUT  "<table>";
print OUTPUT  "<tr><td>";

my $srcLine = "";

my $linenum = 1;
my $count = 1;
my $prelude = 10;
my $postlude = 3;

if ($printModels eq 1) {

   ## don't <, > and quotes need to be translated?
   while (<FILE>){
    my $skip = SkipLine($_); # do it before the transformations

    s/ /&nbsp;/g;
    #s/\t/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/;
    s/\t/&nbsp;&nbsp;/g;
    s/</&lt;/g; # the html eats up lines such as while (i<n), after "<"
    s/^\$\$\$l(.*)$/<font color=red size=3 style="background-color:yellow"><b>\1<\/b><\/font>/;
    s/^\#\#\#l(.*)$/<font color=black size=3 style="background-color:lightgray"><b>\1<\/b><\/font>/;
    s/^\$\$\$b\n/<\/td><td>/;
    s/^(.*)$/\1<br>/;

    next if ($skip eq 1);
    print OUTPUT "<font face=\"monospace\">";
    print OUTPUT $_;
    print OUTPUT "</font>";
  }

} else {

  while (<FILE>){
    my $skip = SkipLine($_); # do it before the transformations

   s/ /&nbsp;/g;
   #s/\t/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/;
   s/\t/&nbsp;&nbsp;/g;
   my $tmp = $_;
   s/^\$\$\$l(.*)$/<font color=red size=3 style="background-color:yellow"><b>\1<\/b><\/font>/;
   s/^\#\#\#l(.*)$/<font color=black size=3 style="background-color:lightgray"><b>\1<\/b><\/font>/;
   s/^\$\$\$b\n/<\/td><td>/;
   s/^(.*)$/\1<br>/;

   if ($tmp =~ /\$\$\$b/){
     if (not ($srcLine eq "")) { # not cleared because we didn' encounter a ###
       print OUTPUT "<font face=\"monospace\">";
       print OUTPUT $srcLine;
       print OUTPUT "</font>";
       $srcLine = "";
     }	
     print OUTPUT "<font face=\"monospace\">";
     print OUTPUT $_;
     print OUTPUT "</font>";
   }
   elsif ($tmp =~ /\$\$\$/){
     if (not ($srcLine eq "")) { # not cleared because we didn' encounter a ###
       print OUTPUT "<font face=\"monospace\">";
       print OUTPUT $srcLine;
       print OUTPUT "</font>";
       $srcLine = "";
     }	
     $srcLine = $_;
   } 
   elsif ($tmp =~ /\#\#\#/){
     $_ = $tmp;
     s/^\#\#\#l(.*)$/\1/;
     print OUTPUT "<A TITLE=\"$_\" </A>" ;
     print OUTPUT "<font face=\"monospace\">";
     print OUTPUT $srcLine;
     $srcLine = "";
     print OUTPUT "</font>";
   }
   else {
     if (not ($srcLine eq "")) { # not cleared because we didn' encounter a ###
       print OUTPUT "<font face=\"monospace\">";
       print OUTPUT $srcLine;
       print OUTPUT "</font>";
       $srcLine = "";
     }	
     next if ($skip eq 1);
     print OUTPUT "<font face=\"monospace\">";
     print OUTPUT $_;
     print OUTPUT "</font>";
   }
 }

}

## POST-LUDE

print OUTPUT  "</td></tr>";
print OUTPUT  "</table>";

print OUTPUT  "</body>\n";
print OUTPUT  "</html>\n";

close FILE or die "can't close $file\n";
close OUTPUT or die "can't close $ofile.html\n";


sub FigureOutRegionAroundTraces() {
  open FILE, "<$file" or die "can't open $file\n"; 
  my $count = 1;
  my $linenum = 1;
  while(<FILE>) {
    $linenum ++;
    if (($_ =~ /^\$\$\$b\n/) && ($count eq 1)) {
      $count = 2;
      $middle = $linenum;
    }	
    if ($count eq 1) {
      if ($_ =~ /^\$\$\$l(.*)/) { 
	if ($start1 eq -1) {
	  #only come here for the first line for 1st trace
	  $start1 = $linenum; 
	}	
	$end1 = $linenum; #set it to the latest line
      }
    }
    if ($count eq 2) {
      if ($_ =~ /^\$\$\$l(.*)/) { 
	if ($start2 eq -1) {
	  #only come here for the first line for 1st trace
	  $start2 = $linenum; 
	}	
	$end2 = $linenum; #set it to the latest line
      }
    }
  }
  ##print "start1 = $start1, end1 = $end1, start2 = $start2, end2 = $end2, middle = $middle\n";
  close FILE;
}

sub SkipLine() {
  my $line = shift;
  my $skip = 0;
  $linenum ++;
  if ($line =~ /^\$\$\$b\n/) {
    $count = 2;
  }	
  if (not ($line =~ /\$\$\$/ || $line =~ /\#\#\#/)) {
      if ($count eq 1) {
	if ($linenum < $start1 - $prelude) {
	  $skip = 1;
	}
	if ($linenum > $end1   + $postlude) {
	  $skip  = 1;
	}	
      } 
      if ($count eq 2) {
	if ($linenum < $start2 - $prelude) {
	  $skip = 1;
	}	
	if ($linenum > $end2   + $postlude) {
	  $skip = 1;
	}	
      } 
    }
  $skip
}
