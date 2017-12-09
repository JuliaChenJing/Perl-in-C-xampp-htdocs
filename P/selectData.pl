#!C:\Perl64\bin\perl.exe -wT

print "Content-type : text/json\n\n";
use strict;
use DBI;
use JSON;

#INITIALIZATION OF DATABASE DRIVER AND DATABASE NAME
my $driver="SQLite";
my $database="atnt.db";
my $dsn="DBI:$driver:dbname=$database";
my $userid="";
my $password="";

#DATABASE OONNECTION
my $db_handle = DBI -> connect($dsn,$userid,$password,{RaiseError=>1});

my @output;

#SELECTING VALUE FROM DATABASE
my $query=qq(select datetime,description from record);
my $query_handle = $db_handle->prepare($query);

#EXECUTE THE QUERY
$query_handle->execute() or die $DBI::errstr;

while ( my $row = $query_handle->fetchrow_hashref ){
    push @output, $row;
}

#CONVERTING TO JSON
print to_json(\@output);

$db_handle->disconnect();
