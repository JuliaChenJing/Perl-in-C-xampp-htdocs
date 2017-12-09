#!C:\xampp\perl\bin\perl.exe
use CGI;
$co = new CGI;
print $co->header;

print "
<html>

<head>
	<title>Import Table</title>
	<meta charset="utf-8" />
	<script src="insert_table.js" type="text/javascript"></script>

	<!-- Bootstrap CSS -->
	<!--  https://bootswatch.com/cerulean/#forms-->
	<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css" rel="stylesheet" integrity="sha384-zF4BRsG/fLiTGfR9QL82DrilZxrwgY/+du4p/c7J72zZj+FLYq4zY00RylP9ZjiT"
	 crossorigin="anonymous">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<body onLoad="buildHtmlTable('#excelDataTable')">

	<div class="alert alert-dismissible alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Processes data structure from JavaScript to insert an HTML table into a web page</strong>

	</div>
	<ul class="nav nav-pills">
		<li class="active">
			<a href="#">Home
				<span class="badge">42</span>
			</a>
		</li>
		<li>
			<a href="#">Profile
				<span class="badge"></span>
			</a>
		</li>
		<li>
			<a href="#">Messages
				<span class="badge">3</span>
			</a>
		</li>
	</ul>

	<table class="table table-striped table-hover " id="excelDataTable" border="1">
	</table>

	<footer>
		<p>Created by: Julia Chen</p>
		<p>Contact information:
			<a href="mailto:juliachenjing@gmail.com">
				juliachenjing@gmail.com</a>.</p>
	</footer>

</body>



</html>
";