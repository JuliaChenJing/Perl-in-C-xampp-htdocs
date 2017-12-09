#!D:\Strawberry\perl\bin\perl.exe
use strict;
use warnings;
use JSON qw( encode_json );
 
use DBI;
my $dbfile = "appointment.db";
my $buffer;
my $decoded;
my $ref;
my $table = "";
my $tableRow;
my $result = '({"failure":1})';

my $dsn      = "dbi:SQLite:dbname=$dbfile";
my $user     = "";
my $password = "";
my $dbh = DBI->connect($dsn, $user, $password, {
   PrintError       => 0,
   RaiseError       => 1,
   AutoCommit       => 1,
   FetchHashKeyName => 'NAME_lc',
}); 
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
if ($ENV{'REQUEST_METHOD'} eq "GET")
{
		my $r = $dbh->selectall_arrayref(q/SELECT * FROM details/);

		my @to_encode;
		foreach my $row (@$r) {
		    my $hash;
		    $hash->{id} = shift @$row;
		    $hash->{appointmentDate} = shift @$row;
		    $hash->{appointmentTime} = shift @$row;
		    $hash->{appointmentDescription} = shift @$row;
		    push @to_encode, $hash;
		}
		my $js = encode_json(\@to_encode);
		print "Content-type: application/json; charset=iso-8859-1\n\n";
		print $js;

} else {
	print"Content-type: text/html\n\n";
	print"not a get request\n";
}


$dbh->disconnect;
