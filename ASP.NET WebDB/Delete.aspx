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
      Dim strSQL	As String


  
      ' Retrieve parameters from HTML form
      intSaleID = Request("saleIDnum")
      Response.Write("Sale ID= " & intSaleID & "<br>")
	    
      ' Open DB connection
      objDBConn = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
      objDBConn.Open
      
      ' Set up DELETE statement SQL
      strSQL = "DELETE FROM sales WHERE sale_id=" & intSaleID &""
               
      Response.Write("strSQL= " & strSQL & "<br>")
      
      ' Execute the SQL to DELETE sale
      objCmd = New OdbcCommand(strSQL,objDBConn)
      objCmd.ExecuteNonQuery()
      
      ' Post success message
      strSuccess.Text = "<h2>Sale successfully deleted from database!</h2>"
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