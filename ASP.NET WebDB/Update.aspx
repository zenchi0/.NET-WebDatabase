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
      intSaleID = Request("saleIDnum")
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
      
      ' Set up UPDATE statement SQL
      strSQL = "UPDATE sales SET contract_id='"& strContractID & "', sale_date='" & strDate & "', actual_amount=" & doubleAmt & "," & _
      		"home_id=" & intHomeID & ", agent_id=" & intAgentID & ", customer_id=" & intCustID & " WHERE sale_id="& intSaleID & ""
      		
      Response.Write("strSQL= " & strSQL & "<br>")
      
      ' Execute the SQL to UPDATE the sale
      objCmd = New OdbcCommand(strSQL,objDBConn)
      objCmd.ExecuteNonQuery()
      
      ' Post success message
      strSuccess.Text = "<h2>Sale successfully Updated in database!</h2>"
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
