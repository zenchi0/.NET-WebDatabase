<html>

<head>
<title>Edit Sales</title>
  <link href="style.css" rel="stylesheet">
</head>

<body>
<form ACTION="Update.aspx" METHOD="get">
<b><center><h2>Edit Sale Data</h2>
<div class ="container">
<table border=1>
	<tr>
	  <td>Enter Sale ID:</td><td> <input TYPE="number" NAME="saleIDnum"></td>
	</tr>
	<tr>
	  <td>Enter Contract Number:</td><td> <input TYPE="text" NAME="contractIDtext"></td>
	</tr>
	<tr>
	 <td>Enter Sale Date DD-MON-YYYY:</td><td> <input TYPE="text" NAME="datetext"></td>
	</tr>
	<tr>
	 <td>Enter Sale Amount:</td><td> <input TYPE="number" NAME="amounttext"></td>
	</tr>
	<tr>
	 <td>Enter Home ID:</td><td> <input TYPE="number" NAME="homeIDtext"></td>
	</tr>
	<tr>
	 <td>Enter Agent ID</td><td><input TYPE="number" NAME="agentIDtext"></td>
	</tr>
	<tr>
	 <td>Enter Customer ID </td><td><input TYPE="number" NAME="custIDtext"></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><input TYPE="submit" VALUE="Update Sale"></td>
	</tr>
</table>
</div>
</form>
<div class="container">
<table border=1>
	<tr>
	  <td><a class ="btn" href="http://localhost/ASP/Project2.html">Back</a></td>
	</tr>
</table>
</div>
</body>

</html>