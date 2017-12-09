#!C:\xampp\perl\bin\perl.exe

       

use DBI;
use strict;
use CGI;
print STDERR "message\n";
my $driver="SQLite";
my $database="atnt.db";
my $dsn="DBI:$driver:dbname=$database";
my $userid="";
my $password="";


#DATABASE CONNECTION
my $db_handle = DBI -> connect($dsn,$userid,$password,{RaiseError=>1}) or die $DBI::errstr;

my $cgi = new CGI;

#FORM PARAMETERS
my $txtDate = $cgi->param('txtDate');
my $txtTime = $cgi->param('txtTime');
my $txtDescription = $cgi->param('txtDescription');


#INSERTING TO RECORD TABLE
my $sth= $db_handle -> prepare("insert into record(datetime, description) values (?,?);");

  
#EXECUTE INSERT STATEMENT COMBINING DATE AND TIME
$sth->execute($txtDate." ".$txtTime, $txtDescription) or die $DBI::errstr;

$db_handle->disconnect();


#AUTO RE-DIRECT AFTER DATA ENTRY
my $url="http://localhost/perl/p/index.html";



my $t=0; # time until redirect activates


print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";
#print "Content-type: text/html\n\n";
#print "Hello world." 

