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
      Dim objCmd4    As OdbcCommand
      Dim objDR1     As OdbcDataReader
      Dim objDR2     As OdbcDataReader
      Dim objDR3     As OdbcDataReader
      Dim objDR4     As OdbcDataReader
	
      objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
     
      ' Open DB connection
      objDBConn.Open

      ' Create new OdbcCommand object with SQL to execute
      objCmd1 = New OdbcCommand("SELECT * FROM SALES ORDER BY sale_id",objDBConn)
      objCmd2 = New OdbcCommand("SELECT * FROM HOMES ORDER BY home_id",objDBConn)
      objCmd3 = New OdbcCommand("SELECT * FROM CUSTOMERS ORDER BY customer_id",objDBConn)
      objCmd4 = New OdbcCommand("SELECT * FROM AGENTS ORDER BY agent_id",objDBConn)

      ' Create a DataReader and execute the command
      objDR1 = objCmd1.ExecuteReader
      objDR2 = objCmd2.ExecuteReader
      objDR3 = objCmd3.ExecuteReader
      objDR4 = objCmd4.ExecuteReader

      ' Copy results from DataReader to to DataGrid object
      gridSales.DataSource = objDR1
      gridSales.DataBind
      gridHomes.DataSource = objDR2
      gridHomes.DataBind
      gridCustomers.DataSource = objDR3
      gridCustomers.DataBind
      gridAgents.DataSource = objDR4
      gridAgents.DataBind

     ' Close all objects
      objDR1.Close
      objDR2.Close
      objDR3.Close
      objDR4.Close
      objCmd1.Dispose
      objCmd2.Dispose
      objCmd3.Dispose
      objCmd4.Dispose
      objDBConn.Close

   End Sub
</script>
<title>Data Tables</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<center>
<h2>Oracle SALES table contents</h2>
<div class="datagrid table">
<asp:DataGrid id="gridSales" runat="server" />
</div>
<h2>Oracle HOMES table contents</h2>
<div class="datagrid table">
<asp:DataGrid id="gridHomes" runat="server" />
</div>
<h2>Oracle CUSTOMERS table contents</h2>
<div class="datagrid table">
<asp:DataGrid id="gridCustomers" runat="server" />
</div>
<h2>Oracle AGENTS table contents</h2>
<div class="datagrid table">
<asp:DataGrid id="gridAgents" runat="server" />
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