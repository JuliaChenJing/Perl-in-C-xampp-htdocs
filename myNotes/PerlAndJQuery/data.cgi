#!C:\xampp\perl\bin\perl.exe
# The above line is perl execution path in xampp
# The below line tells the browser, that this script will send html content.
# If you miss this line then it will show "malformed header from script" error.

use CGI;
use DBI;
use JSON;

my $dbh = get_dbh(); # your connect details

# test data
$dbh->do('CREATE TEMPORARY TABLE json (
          col1 char(3))');
		  
for ("ABC", "BCD", "CDE", "DEF", "EFG", "FGH", "GHI"){
  $dbh->do('INSERT INTO json VALUES (?)',undef,$_);
}

# query database
my $q = CGI->new();
my $sth = $dbh->prepare('SELECT * FROM json WHERE col1 like ?');
$sth->execute('%'.$q->param('term').'%');
my @data=();
while ( my @f = $sth->fetchrow_array){
  push @data,$f[0];
}

print "Content-type: application/json; charset=iso-8859-1\n\n";
print JSON::to_json(\@data);