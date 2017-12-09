#!C:\xampp\perl\bin\perl.exe
use CGI;
$co = new CGI;
print $co->header;

print "
<html>
     <head>
          <title> Perl Web Example 1
          </title>
    </head>
 
<body bgcolor=white>
    <center>
       <H2> Output for Perl Web Example 1</H2>
    </center>
    <I>Hi $Name. In eleven years you will be</I    <b> $age</b>   <I>years old</I>.
 
    <p>I've got to go back to work now. Bye Bye.</p>
</body>

</html>
";