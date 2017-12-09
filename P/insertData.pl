#!C:\Perl64\bin\perl.exe -wT

print "Content-type : text/html\n\n";
use DBI;
use strict;
use CGI;

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
my $url="http://localhost/ATnT/index.html";
my $t=0; # time until redirect activates
print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";