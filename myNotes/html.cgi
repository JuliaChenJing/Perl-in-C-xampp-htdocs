#!C:\xampp\perl\bin\perl.exe
use CGI;
$co = new CGI;
print $co->header;

print "
<html>
<title>CGI Example</title>
<head></head>
<body>
 welcome to CGI
</body>
</html>
";