#!C:\xampp\perl\bin\perl.exe
# The above line is perl execution path in xampp
# The below line tells the browser, that this script will send html content.
# If you miss this line then it will show "malformed header from script" error.
#!"C:\xampp\perl\bin\perl.exe"
require 5.003;
#push(@INC,"/www/cgi-bin");
push(@INC,"/home/httpd/cgi-bin");
require 5.003;
require "cgi-lib.pl";
 
#-------------------------- What This Does ----------------------------
# Input data:  users first_name and age
# Output:      age + 11
#---------------------------- Main Program ----------------------------
# The subroutine &ReadParse" (from the external utility program
# cgi-lib.pl) gets the data that was just submitted and makes it
# available to you.  For instance  $in{first_name}  has the first name.
&ReadParse;
 
# The subroutine  "&PrintHeader"  (also from cgi-lib.pl)  is essential
# to print output to the user's screen.
print &PrintHeader;
 
$Name = $in{first_name};
$age = $in{age};
$age=$age+11;
 
print <<"alice";        # Prints through the line with alice
<html><head><title>Math 210, Perl Web Example 1</title></head>
 
<body bgcolor=white>
<center>
<H2> Output for Perl Web Example 1</H2>
</center>
<I>Hi $Name. In eleven years you will be</I> <b> $age</b> <I>years old</I>.
 
<P>
I've got to go back to work now. Bye Bye.
</body></html>
alice                                 