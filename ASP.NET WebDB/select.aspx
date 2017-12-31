<%@ Page Language="vb" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Odbc "%>
<html>
<head>
<script runat="server">
   Sub Page_Load(sender As Object, e As EventArgs) ' subroutine run on page load event

      ' Declaration section
      Dim objDBConn As OdbcConnection
      Dim objCmd    As OdbcCommand
      Dim objDR     As OdbcDataReader
	
      objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
     
      ' Open DB connection
      objDBConn.Open

      ' Create new OdbcCommand object with SQL to execute
      objCmd = New OdbcCommand("SELECT * FROM SALES ORDER BY sale_id",objDBConn)

      ' Create a DataReader and execute the command
      objDR = objCmd.ExecuteReader

      ' Copy results from DataReader to to DataGrid object
      gridSales.DataSource = objDR
      gridSales.DataBind

     ' Close all objects
      objDR.Close
      objCmd.Dispose
      objDBConn.Close

   End Sub
</script>
<title>SALES table</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<center>
<h2>Oracle SALES table contents</h2>
<div class="datagrid table">
<asp:DataGrid id="gridSales" runat="server" />
</div>
<div class="container">
<table border=1>
	<tr>
	  <td><a class ="btn" href="http://localhost/ASP/Project2.html">Back</a></td>
	</tr>
</table>
</div>
</center>
</body>
</html>