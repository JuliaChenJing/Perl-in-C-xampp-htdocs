#!D:\Strawberry\perl\bin\perl.exe

use strict;
use warnings;
 
use DBI;
 
my $dbfile = "appointment.db";
 
my $dsn      = "dbi:SQLite:dbname=$dbfile";
my $user     = "";
my $password = "";
my $dbh = DBI->connect($dsn, $user, $password, {
   PrintError       => 0,
   RaiseError       => 1,
   AutoCommit       => 1,
   FetchHashKeyName => 'NAME_lc',
});
 
# ...
my $crt = <<'END_SQL';
CREATE TABLE details (
  id       INTEGER PRIMARY KEY,
  appointmentDate    TEXT NOT NULL,
  appointmentTime    TEXT NOT NULL,
  description        TEXT
)
END_SQL
$dbh->do($crt);
my $appointmentDate = '2016-01-01 10:20:05.123';
my $appointmentTime = '2016-01-01 10:20:05.123',
my $description = 'meeting';
$dbh->do('INSERT INTO details (appointmentDate, appointmentTime, description) VALUES (date(?), time(?), ?)',
  undef,
  $appointmentDate, $appointmentTime, $description);
