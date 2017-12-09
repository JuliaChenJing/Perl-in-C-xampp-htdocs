#!D:\Strawberry\perl\bin\perl.exe
use strict;
use warnings;
use JSON qw( encode_json decode_json);
 
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
if ($ENV{'REQUEST_METHOD'} eq "POST")
{
	read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	$decoded = decode_json($buffer);
	my $sql = 'SELECT * FROM details WHERE description LIKE ?';
	my $sth = $dbh->prepare($sql);
	$sth->execute('%'.$decoded->{keyWords}.'%');

	my $data = $sth->fetchall_arrayref();
	my @to_encode;
     
	foreach $data ( @$data) {
        my ($var1, $var2, $var3, $var4) = @$data;
		    my $hash;
		    $hash->{id} = $var1;
		    $hash->{appointmentDate} = $var2;
		    $hash->{appointmentTime} = $var3;
		    $hash->{appointmentDescription} = $var4;
		    push @to_encode, $hash;
	}

	my $js = encode_json(\@to_encode);
	print "Content-type: application/json; charset=iso-8859-1\n\n";
	print $js;      


#      while ($ref = $sth->fetchrow_hashref()) {
# 
#		  while ((my $key, my $value) = each(%$ref)){
#		  	  $value =~ s/"/\\"/g;
#			  $tableRow .= "\"${value}\",";
#		  }
# 
#		  $tableRow =~ s/,$//;
#		  $tableRow = "[${tableRow}],";
# 
#		  $table .= $tableRow;
#		  $tableRow = "";
#      }
 
#		$table =~ s/,$//;
# 
#	  	$result = '{"failure":0,"result":['.$table.']}';
#		print "Content-type: application/json; charset=iso-8859-1\n\n";
#		 
#		print $result;	  		
} else {
	print"Content-type: text/html\n\n";
	print"not a get request\n";
}


$dbh->disconnect;
