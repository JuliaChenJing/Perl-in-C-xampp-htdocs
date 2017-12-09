#!C:\xampp\perl\bin\perl.exe
use CGI;
use strict;
use DBI;

my $dbh = DBI->connect(          
    "dbi:SQLite:dbname=problem2.db", 
    "",                          
    "",                          
    { RaiseError => 1 },         
) or die $DBI::errstr;


my $res=$dbh->selectall_arrayref(q(SELECT first_name,last_name,home FROM person));

foreach(@$res){
    foreach my $i(0..$#$_){
        print"$_->[$i]";
         print " ";
        
    }

     print "\n";

}


$dbh->disconnect();


my $co = new CGI;
print $co->header;

my $Name="Julia";
my $age=29;

print "
<html>
     <head>
          <title> Perl Web Example 1
          </title>
    </head>
 
<body bgcolor=white>
    <center>
       <H2> Output for Perl Web Example 1</H2>
    </center>
    <I>Hi  $Name. In eleven years you will be</I    <b> $age</b>   <I>years old</I>.
 
    <p>I've got to go back to work now. Bye Bye.</p>
</body>

</html>
";