#!/usr/bin/perl

####################################################################################
## PERL LEARNING SCRIPT BY SETH

use strict;
use warnings;
use 5.010;
use Data::Dumper qw(Dumper);

say "This is a test perl script gathered and modified by Seth!\nThanks for checking it out.\n";

####################################################################################
## INSTALL STUFF ON PERL SHELL
# $perl -MCPAN -e shell
# $cpan> install DBD::mysql
# $ppm install DBD::mysql

####################################################################################
## SOME FUNCTION DEFINITIONS
sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };
# Function definition
sub Average {
   # get total number of arguments passed.
   my $n = scalar(@_);
   my $sum = 0;
   my $item = 0;
   foreach $item (@_) { $sum += $item; }
   my $average = $sum / $n;
   print "Average for the given numbers : $average\n";
}

sub scurtime {
 my $datestring = localtime();
 return $datestring;
# my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
# my @days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
# my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
# my $retval="$mday $months[$mon] $days[$wday]";
# return $retval;
#  print $retval;
}

# Function call
Average(10, 20, 30);

####################################################################################
# ARRAY STUFF

say "Some array stuff... the array \@ar:";
my @ar = ("Test", "two", "three");
say Dumper \@ar;
foreach my $n (@ar) {
 say $n;
}
say $#ar;
say scalar @ar;
foreach my $i (0 .. $#ar) {
 say "$i - $ar[$i]";
}

my @sorted_words = sort @ar;
say Dumper \@sorted_words;

# MULTIDIMENSIONAL ARRAY
my @matrix;
$matrix[0][0] = 'zero-zero';
$matrix[1][1] = 'one-one';
$matrix[1][2] = 'one-two';
$matrix[1][3][0] = 130;
$matrix[1][3][1] = 131;
say Dumper \@matrix;

####################################################################################
## HASH STUFF

my %color = (
    "apple"  => "red",
    "orange" => "orange",
    "grape"  => "purple",
);

my $fruit="apple";
$color{$fruit}="red";

print "$color{apple}\n";

####################################################################################
# REFERENCE STUFF

my $st = {
    name => 'Foo Bar',
    email => 'foo@bar.com',
    gender => undef,
    classes => [
        'Chemistry',
        'Math',
        'Literature',
    ],
    address => {
        city => 'Fooville',
        planet => 'Earth',
    },
    fruit => "apple"
};

print "\n\n======================================================================\n";
print "The student, $st->{name} has a fruit[ $st->{fruit} ] which is $color{$st->{fruit}}\n";

####################################################################################
## FILE OPERATIONS


## READ FILE
my $row = "";
my $filename = 'flatfile.txt';
if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
  while ($row = <$fh>) {
    chomp $row;
    my @outrow = split /,/, $row;
    my $fname=$outrow[0];
    my $lname=$outrow[1];
    if(defined $fname) {
     print "FIRST NAME: $fname\n";
    }
    else {
     print "FIRST NAME: UNDEFINED\n";
    }
    if(defined $lname) {
     print "LAST NAME : $lname\n";
    }
    else {
     print "LAST NAME : UNDEFINED\n";
    }
  }
  close $fh;
} else {
  warn "Could not open file '$filename' $!";
}

## APPEND FILE
$filename = 'report.txt';
open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
my $ct = scurtime();
say $fh "$ct: Appended line generated by perl";
close $fh;
say 'done';


####################################################################################
## MySQL connectors and result examples

###################
## DBI connection
# use DBI;
# my $myConnectionDBI = DBI->connect("DBI:mysql:DBNAME:localhost", "USERNAME", "PASSWORD");
# my $query = $myConnectionDBI->prepare("SELECT lastname FROM employees");
# my $result = $query->execute();

##################
## Mysql connection
# use Mysql;
# $myConnection = Mysql->connect('localhost','DBNAME','USERNAME','PASSWORD');
# $result = $myConnection->query('SELECT lastname FROM employees');

##################
## examples of querys/results

# DEFINE A MySQL QUERY
# $myquery = "INSERT INTO $tablename (id, product, quantity) VALUES (DEFAULT,'pineapples','15')";
# EXECUTE THE QUERY FUNCTION
# $execute = $myConnection->query($myquery);

##################
## HTML output example

# print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES
# $hostname  = "localhost";
# $database  = "store";
# $tablename = "inventory";
# $username  = "username";
# $password  = "password";

# PERL MYSQL CONNECT()
# $connect = Mysql->connect($hostname, $database, $username, $password);

# SELECT DB
# $connect->selectdb($database);

# DEFINE A MySQL QUERY
# $myquery = "INSERT INTO 
# $tablename (id, product, quantity) VALUES (DEFAULT,'pineapples','15')";

# EXECUTE THE QUERY FUNCTION
# $execute = $connect->query($myquery);

# AFFECTED ROWS
# $affectedrows = $execute->affectedrows($myquery);

# ID OF LAST INSERT
# $lastid = $execute->insertid($myquery);

# print $affectedrows."<br />";
# print $lastid."<br />";

##################
## Another HTML example

# use Mysql;

# HTTP HEADER
# print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES
# $host = "localhost";
# $database = "store";
# $tablename = "inventory";
# $user = "username";
# $pw = "password";

# PERL MYSQL CONNECT()
# $connect = Mysql->connect($host, $database, $user, $pw);

# SELECT DB
# $connect->selectdb($database);

# DEFINE A MySQL QUERY
# $myquery = "SELECT * FROM $tablename";

# EXECUTE THE QUERY
# $execute = $connect->query($myquery);

# $rownumber = $execute->numrows();
# $fieldnumber = $execute->numfields();

# PRINT THE RESULTS
# print $rownumber."<br />";
# print $fieldnumber."<br />";

####################
## Mysql Fetchrow

# use Mysql;

# print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES
# $host = "localhost";
# $database = "store";
# $tablename = "inventory";
# $user = "username";
# $pw = "password";

# PERL MYSQL CONNECT()
# $connect = Mysql->connect($host, $database, $user, $pw);

# SELECT DB
# $connect->selectdb($database);

# DEFINE A MySQL QUERY
# $myquery = "SELECT * FROM $tablename";

# EXECUTE THE QUERY FUNCTION
# $execute = $connect->query($myquery);

# HTML TABLE
# print "<table border='1'><tr><th>id</th><th>product</th><th>quantity</th></tr>";

# FETCHROW ARRAY

# while (@results = $execute->fetchrow()) {
# 	print "<tr><td>"
# 	.$results[0]."</td><td>"
# 	.$results[1]."</td><td>"
# 	.$results[2]."</td></tr>";
# }

# print "</table>";



