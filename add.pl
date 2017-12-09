#!D:\Strawberry\perl\bin\perl.exe
use strict;
use warnings;
use JSON qw( decode_json );
 
use DBI;
my $dbfile = "appointment.db";
my $buffer;
my $decoded;

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
if ($ENV{'REQUEST_METHOD'} eq "POST")
{
	
   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    $decoded = decode_json($buffer);
	$dbh->do('INSERT INTO details (appointmentDate, appointmentTime, description) VALUES (date(?),time(?),?)',
	  undef, $decoded->{appointmentDate},$decoded->{appointmentTime},$decoded->{appointmentDescription});
	print "Content-type: application/json; charset=iso-8859-1\n\n";
	print '{"success":1}';
}else {
	print "Content-type: application/json; charset=iso-8859-1\n\n";
	print '{"success":0}';
}

$dbh->disconnect;
