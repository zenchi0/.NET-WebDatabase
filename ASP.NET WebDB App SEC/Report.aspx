<%@ Page Language="vb" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Odbc "%>
<html>
<head>
<script runat="server">
   Sub Page_Load(sender As Object, e As EventArgs) ' subroutine run on page load event

      ' Declaration section
      Dim objDBConn As OdbcConnection
      Dim objCmd1    As OdbcCommand
      Dim objCmd2    As OdbcCommand
      Dim objCmd3    As OdbcCommand
      Dim objDR1     As OdbcDataReader
      Dim objDR2     As OdbcDataReader
      Dim objDR3     As OdbcDataReader

	
      objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
     
      ' Open DB connection
      objDBConn.Open
      

      ' Create new OdbcCommand object with SQL to execute
      objCmd1 = New OdbcCommand("SELECT COUNT(*) AS TOTAL FROM SALES",objDBConn)
      objCmd2 = New OdbcCommand("SELECT SUM(actual_amount) AS TOTAL FROM SALES",objDBConn)
      objCmd3 = New OdbcCommand("SELECT AVG(actual_amount) AS AVERAGE FROM SALES",objDBConn)


      ' Create a DataReader and execute the command
      objDR1 = objCmd1.ExecuteReader
      objDR2 = objCmd2.ExecuteReader
      objDR3 = objCmd3.ExecuteReader

      ' Copy results from DataReader to to DataGrid object
      gridTotalHomes.DataSource = objDR1
      gridTotalHomes.DataBind
      gridTotalSales.DataSource = objDR2
      gridTotalSales.DataBind
      gridAverageHome.DataSource = objDR3
      gridAverageHome.DataBind


     ' Close all objects
      objDR1.Close
      objDR2.Close
      objDR3.Close
      objCmd1.Dispose
      objCmd2.Dispose
      objCmd3.Dispose
      objDBConn.Close

   End Sub
</script>
<title>Data Tables</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<center>
<h2>Total Homes Sold</h2>
<div class="datagrid table">
<asp:DataGrid id="gridTotalHomes" runat="server" />
</div>
<h2>Total Sales</h2>
<div class="datagrid table">
<asp:DataGrid id="gridTotalSales" runat="server" />
</div>
<h2>Average Price of Home Sold</h2>
<div class="datagrid table">
<asp:DataGrid id="gridAverageHome" runat="server" />
</div>
<div class="container">
<table border=1>
	<tr>
	  <td><a class ="btn" href="http://localhost/ASP/FinalProject.html">Back</a></td>
	</tr>
</table>
</div>
</center>
</body>
</html>