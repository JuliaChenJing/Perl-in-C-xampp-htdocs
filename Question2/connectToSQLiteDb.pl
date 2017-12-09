#!/usr/bin/perl

use strict;
use DBI;

my $dbh = DBI->connect(          
    "dbi:SQLite:dbname=problem2.db", 
    "",                          
    "",                          
    { RaiseError => 1 },         
) or die $DBI::errstr;

my $sth = $dbh->prepare("SELECT SQLITE_VERSION()");
$sth->execute();

my $ver = $sth->fetch();
print @$ver;
print "\n";
my $res=$dbh->selectall_arrayref(q(SELECT first_name,last_name,home FROM person));

foreach(@$res){
    foreach my $i(0..$#$_){
        print"$_->[$i]";
         print " ";
        
    }

     print "\n";

}


$sth->finish();
$dbh->disconnect();