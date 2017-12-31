<%@ Page Language="vb" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Odbc "%>
<html>
<head>
<script runat="server">
   Sub Page_Load(sender As Object, e As EventArgs) ' subroutine run on page load event
   
      

End Sub    
      
      Sub SaleBtnClick(ByVal sender As Object, _
      			ByVal e As EventArgs)
      			
      	Dim clickedButton As Button = sender
      	clickedButton.Text = "...button clicked..."
      	clickedButton.Enabled = False
      	
      	
      	' Declaration section
	Dim objDBConn     As OdbcConnection
	Dim objCmd1       As OdbcCommand
	Dim objDR1        As OdbcDataReader
	Dim strSQL1	  As String
	Dim intSaleID	  As Integer
     	
      	
      	' Retrieve parameters from HTML form
      	intSaleID = Request("SaleIDnum")
	Response.Write("Sale ID= " & intSaleID & "<br>")

      	
      	' Open DB connection
	objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
	objDBConn.Open
      
      ' Set up DELETE statement SQL
      strSQL1 = "DELETE FROM sales WHERE sale_id=" & intSaleID &""
               
      Response.Write("strSQL1= " & strSQL1 & "<br>")
      
      
      ' Execute the SQL to DELETE from sale
      objCmd1 = New OdbcCommand(strSQL1,objDBConn)
      objCmd1.ExecuteNonQuery()
      
      ' Post success message
      strSuccess.Text = "<h2>Sale successfully deleted from database!</h2>"
      strSuccess.Visible = "True"
      
      ' Close all objects
      objCmd1.Dispose
      objDBConn.Close
      
      
      End Sub
      
      
      Sub HomeBtnClick(ByVal sender As Object, _
      			ByVal e As EventArgs)
      
      Dim clickedButton As Button = sender
      clickedButton.Text = "...button clicked..."
      clickedButton.Enabled = False
      
      
      ' Declaration section
      Dim objDBConn     As OdbcConnection
      Dim objCmd2       As OdbcCommand
      Dim objDR2        As OdbcDataReader
      Dim strSQL2	As String
      Dim intHomeID	As Integer

      
      ' Retrieve parameters from HTML form
        intHomeID = Request("HomeIDnum")
	Response.Write("Home ID= " & intHomeID & "<br>")

	
	
	' Open DB connection
	objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
	objDBConn.Open
      
      ' Set up DELETE statement SQL
      strSQL2 = "DELETE FROM homes WHERE home_id=" & intHomeID &""
      		
      	Response.Write("strSQL2= " & strSQL2 & "<br>")
      	
      	
      	' Execute the SQL to DELETE from home
	objCmd2 = New OdbcCommand(strSQL2,objDBConn)
	objCmd2.ExecuteNonQuery()
	
	' Post success message
	strSuccess.Text = "<h2>Home successfully deleted from database!</h2>"
	strSuccess.Visible = "True"
	
      	' Close all objects
	objCmd2.Dispose
	objDBConn.Close
      
	End Sub
      
      
      Sub CustBtnClick(ByVal sender As Object, _
            			ByVal e As EventArgs)
            
        Dim clickedButton As Button = sender
        clickedButton.Text = "...button clicked..."
      	clickedButton.Enabled = False
      	
      	
      	' Declaration section
	Dim objDBConn     As OdbcConnection
	Dim objCmd3       As OdbcCommand
	Dim objDR3        As OdbcDataReader
	Dim strSQL3	  As String
	Dim intCustID	  As Integer
    	
      	' Retrieve parameters from HTML form
      	intCustID = Request("CustIDnum")
	Response.Write("Customer ID= " & intCustID & "<br>")

	
	
	' Open DB connection
	objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
	objDBConn.Open
	
      
      	 ' Set up DELETE statement SQL
      strSQL3 = "DELETE FROM customers WHERE customer_id=" & intCustID &""
	      		
      	Response.Write("strSQL3= " & strSQL3 & "<br>")
      
      
       ' Execute the SQL to DELETE from customer
      objCmd3 = New OdbcCommand(strSQL3,objDBConn)
      objCmd3.ExecuteNonQuery()
      
      ' Post success message
      	strSuccess.Text = "<h2>Customer successfully deleted from database!</h2>"
      	strSuccess.Visible = "True"
      	
        ' Close all objects
      	objCmd3.Dispose
      	objDBConn.Close
            
	End Sub
	
	
	Sub AgentBtnClick(ByVal sender As Object, _
	            			ByVal e As EventArgs)
	            
	        Dim clickedButton As Button = sender
	        clickedButton.Text = "...button clicked..."
	      	clickedButton.Enabled = False
	      	
	      	
	      	' Declaration section
		Dim objDBConn     As OdbcConnection
		Dim objCmd4       As OdbcCommand
		Dim objDR4        As OdbcDataReader
		Dim strSQL4	  As String
		Dim intAgentID	  As Integer
	    	
	      	' Retrieve parameters from HTML form
	      	intAgentID = Request("aIDnum")
		Response.Write("Agent ID= " & intAgentID & "<br>")
	
		
		
		' Open DB connection
		objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
		objDBConn.Open
		
	      
	      	 ' Set up DELETE statement SQL
	      strSQL4 = "DELETE FROM agents WHERE agent_id=" & intAgentID &""
		      		
	      	Response.Write("strSQL4= " & strSQL4 & "<br>")
	      
	      
	       ' Execute the SQL to DELETE from agents
	      objCmd4 = New OdbcCommand(strSQL4,objDBConn)
	      objCmd4.ExecuteNonQuery()
	      
	      ' Post success message
	      	strSuccess.Text = "<h2>Agent successfully deleted from database!</h2>"
	      	strSuccess.Visible = "True"
	      	
	        ' Close all objects
	      	objCmd4.Dispose
	      	objDBConn.Close
	            
	End Sub

   
</script>
<html>

<head>
<title>Delete Records</title>
  <link href="style.css" rel="stylesheet">
</head>

<body>
<form id="form1" runat="server">
<b><center><h2>Delete Sale</h2>
<div class ="container">
<table border=1>
	<tr>
	  <td>Enter Sale ID to Delete:</td><td> <input TYPE="number" NAME="SaleIDnum"></td>
	</tr>
	<tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="SaleButton" Text="Delete Sale" OnClick="SaleBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
<b><center><h2>Delte Home</h2>
<div class ="container">
<table border=1>
	<tr>
	 <td>Enter Home ID to Delete:</td><td> <input TYPE="number" NAME="HomeIDnum"></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="HomeButton" Text="Delete Home" OnClick="HomeBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
<b><center><h2>Delete Customer</h2>
<div class ="container">
<table border=1>
	<tr>
	 <td>Enter Customer ID to Delete:</td><td> <input TYPE="number" NAME="CustIDnum"></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="CustButton" Text="Delete Customer" OnClick="CustBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
<b><center><h2>Delete Agent</h2>
<div class ="container">
<table border=1>
	<tr>
	 <td>Enter Agent ID to Delete:</td><td> <input TYPE="number" NAME="aIDnum"></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="AgentButton" Text="Delete Agent" OnClick="AgentBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
</form>
<div class="container">
<table border=1>
	<tr>
	  <td><a class ="btn" href="http://localhost/ASP/FinalProject.html">Back</a></td>
	</tr>
</table>
</div>
<asp:label id="strSuccess" runat="server" />
<form ACTION="View.aspx" METHOD="post">
   <input TYPE="submit" VALUE="Show All Tables">
</form>
</body>

</html>