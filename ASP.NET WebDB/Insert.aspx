<%@ Page Language="vb" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Odbc "%>
<html>
<head>
<script runat="server">
   Sub Page_Load(sender As Object, e As EventArgs) ' subroutine run on page load event

      ' Declaration section
      Dim objDBConn     As OdbcConnection
      Dim objCmd        As OdbcCommand
      Dim objCmd2       As OdbcCommand
      Dim objDR         As OdbcDataReader
      Dim intSaleID	As Integer
      Dim strContractID As String
      Dim strDate	As String
      Dim doubleAmt     As Double
      Dim intHomeID	As Integer
      Dim intAgentID 	As Integer
      Dim intCustID 	As Integer
      Dim strSQL	As String

  
      ' Retrieve parameters from HTML form
      strContractID = Request("contractIDtext")
      strDate = Request("datetext")
      doubleAmt = Request("amounttext")
      intHomeID = Request("homeIDtext")
      intAgentID = Request("agentIDtext")
      intCustID = Request("custIDtext")
      Response.Write("Sale ID= " & intSaleID & "<br>")
      Response.Write("Contract ID= " & strContractID & "<br>")
      Response.Write("Sale Date= " & strDate & "<br>")
      Response.Write("Sale Amount= " & doubleAmt & "<br>")
      Response.Write("Home ID= " & intHomeID & "<br>")
      Response.Write("Agent ID= " & intAgentID & "<br>")
      Response.Write("Customer ID= " & intCustID & "<br>")
	    
      ' Open DB connection
      objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
      objDBConn.Open
      
      ' Set up INSERT statement SQL
      strSQL = "INSERT INTO sales (sale_id,contract_id,sale_date, actual_amount," & _
      	       "		   home_id, agent_id, customer_id ) " & _
               "               VALUES (sales_sequence.nextval, '" & strContractID & "'," & _
               "                       '" & strDate & "'," & _
               "                       '" & doubleAmt & "'," & _
               "                       '" & intHomeID & "'," & _
               "                       '" & intAgentID & "'," & _
               "                       '" & intCustID & "')"
               
      Response.Write("strSQL= " & strSQL & "<br>")
      
      ' Execute the SQL to INSERT new sale
      objCmd = New OdbcCommand(strSQL,objDBConn)
      objCmd.ExecuteNonQuery()
      
      ' Post success message
      strSuccess.Text = "<h2>New sale successfully added to database!</h2>"
      strSuccess.Visible = "True"

     ' Close all objects
      objCmd.Dispose
      objDBConn.Close

   End Sub
</script>
<title>Sales table</title>
  <link href="style.css" rel="stylesheet">
</head>
<body>
<asp:label id="strSuccess" runat="server" />
<form ACTION="Select.aspx" METHOD="post">
   <input TYPE="submit" VALUE="Show All Sales">
</form>
</body>
</html>
