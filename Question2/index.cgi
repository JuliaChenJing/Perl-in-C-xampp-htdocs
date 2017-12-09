#!C:\xampp\perl\bin\perl.exe
use CGI;

use strict;
use DBI;

my $co = new CGI;
print $co->header;

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
         print "\n";
        
    }

     print "\n";

}



my $Name="Julia";
my $age=28;
print "
<html>
     <head>
          <title> Question 2
          </title>
    </head>
 
<body bgcolor=white>
    <center>
       <H2> Question 2</H2>
    </center>
    <I>Julia Chen</I>
 
    <p>515-343-0878</p>


</body>

</html>
";