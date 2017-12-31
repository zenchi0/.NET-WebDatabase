<%@ Page Language="vb" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Odbc "%>
<html>
<head>
<script runat="server">
  Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load ' subroutine run on page load event
	

            
End Sub    
      
           Public Function InsertUpdateData(ByVal cmd As OdbcCommand) As Boolean
           
          	   Dim con  As OdbcConnection
           
                   con = New OdbcConnection("DSN=CMIS;UID=sgubenia;PWD=Gibson20")
                   
                   cmd.CommandType = CommandType.Text
		   
		   cmd.Connection = con

           
                   Try
           
                       con.Open
           
                       cmd.ExecuteNonQuery()
           
                       Return True
           
                   Catch ex As Exception
           
                       Response.Write(ex.Message)
           
                       Return False
           
                   Finally
           
                       con.Close()
           
                       con.Dispose()
           
                   End Try
           
     End Function
     
     
     
     
      Sub SaleBtnClick(ByVal sender As Object, _
      			ByVal e As EventArgs)
      	If Page.IsValid Then		
      	Dim clickedButton As Button = sender
      	clickedButton.Text = "...button clicked..."
      	clickedButton.Enabled = False
      	
      	
      	' Declaration section
	Dim objCmd1       As OdbcCommand
	Dim strSQL1	  As String
	Dim intSaleID	  As Integer
	Dim strContractID As String
	Dim strDate	  As String
	Dim doubleAmt     As Double
	Dim intHomeID	  As Integer
	Dim intAgentID 	  As Integer
	Dim intCustID 	  As Integer
	'Dim eDate	  As Date
	'Dim format	  As String = "DD/MM/YYYY"

      	
      	
      	' Retrieve parameters from HTML form
      	strContractID = Convert.ToString(contractIDtext.text)

      	
      	intHomeID = Convert.ToInt32(homeIDtext.text)

      	
      	intAgentID = Convert.ToInt32(agentIDtext.text)

      	
      	intCustID = Convert.ToInt32(custIDtext.text)

      	
      	doubleAmt = Convert.ToDouble(amounttext.text)

      	
      	strDate = Convert.ToString(datetext.text)
      	'eDate = Date.ParseExact(strDate, format, Nothing)
    		
	Response.Write("Contract ID= " & strContractID & "<br>")
	Response.Write("Sale Date= " & strDate & "<br>")
	Response.Write("Sale Amount= " & doubleAmt & "<br>")
	Response.Write("Home ID= " & intHomeID & "<br>")
	Response.Write("Agent ID= " & intAgentID & "<br>")
	Response.Write("Customer ID= " & intCustID & "<br>")
      	

      
      ' Set up INSERT statement SQL
      strSQL1 = "INSERT INTO sales (sale_id,contract_id,sale_date, actual_amount," & _
      	       "		   home_id, agent_id, customer_id ) " & _
               "               VALUES (sales_sequence.nextval, :strContractID,:strDate,:doubleAmt,:intHomeID,:intAgentID,:intCustID)"
      
   
               
      Response.Write("strSQL1= " & strSQL1 & "<br>")
      
      
      ' Execute the SQL to INSERT new sale
      objCmd1 = New OdbcCommand(strSQL1)
      objCmd1.Parameters.AddWithValue(":strContractID",strContractID)
      objCmd1.Parameters.AddWithValue(":strDate",strDate)
      objCmd1.Parameters.AddWithValue(":doubleAmt",doubleAmt)
      objCmd1.Parameters.AddWithValue(":intHomeID",intHomeID)
      objCmd1.Parameters.AddWithValue(":intAgentID",intAgentID)
      objCmd1.Parameters.AddWithValue(":intCustID",intCustID)
      InsertUpdateData(objCmd1)
      
      ' Post success message
      strSuccess.Text = "<h2>New sale successfully added to database!</h2>"
      strSuccess.Visible = "True"
      
      
      End If
      End Sub
      
      
      Sub HomeBtnClick(ByVal sender As Object, _
      			ByVal e As EventArgs)
      If Page.IsValid Then	
      Dim clickedButton As Button = sender
      clickedButton.Text = "...button clicked..."
      clickedButton.Enabled = False
      
      
      ' Declaration section
      Dim objCmd2       As OdbcCommand
      Dim strSQL2	As String
      Dim strModelID	As String
      Dim strLotSize	As String
      Dim strHomeLoc	As String
      Dim intPrice	As Integer
      Dim strHAddress	As String
      Dim strHCity	As String
      Dim strHState	As String
      Dim strHZip	As String
      
      ' Retrieve parameters from HTML form
      	strModelID = Convert.ToString(ModelIDnum.text)
      	strLotSize = Convert.ToString(lottext.text)
      	strHomeLoc = Convert.ToString(locationtext.text)
	intPrice = Convert.ToInt32(pricenum.text)
	strHAddress = Convert.ToString(addresstext.text)
	strHCity = Convert.ToString(citytext.text)
	strHState = Convert.ToString(statetext.text)
	strHZip = Convert.ToString(ziptext.text)
	Response.Write("Model ID= " & strModelID & "<br>")
	Response.Write("Lot Size= " & strLotSize & "<br>")
	Response.Write("Home Location= " & strHomeLoc & "<br>")
	Response.Write("Sale Price= " & intPrice & "<br>")
	Response.Write("Home Address= " & strHAddress & "<br>")
	Response.Write("Home City= " & strHCity & "<br>")
	Response.Write("Home State= " & strHState & "<br>")
	Response.Write("Home Zip= " & strHZip & "<br>")
	
      
      strSQL2 = "INSERT INTO homes (home_id,model_id,lot_size,home_location,purchase_price," & _
      		"		    street_address,city,state,zip)" & _
      		"		VALUES(homes_sequence.nextval, :strModelID,:strLotSize,:strHomeLoc,:intPrice,:strHAddress,:strHCity,:strHstate,:strHZip)"
      		
      	Response.Write("strSQL2= " & strSQL2 & "<br>")
      	
      	
      	' Execute the SQL to INSERT new home
	objCmd2 = New OdbcCommand(strSQL2)
      	objCmd2.Parameters.AddWithValue(":strModelID",strModelID)
      	objCmd2.Parameters.AddWithValue(":strLotSize",strLotSize)
      	objCmd2.Parameters.AddWithValue(":strHomeLoc",strHomeLoc)
      	objCmd2.Parameters.AddWithValue(":intPrice",intPrice)
      	objCmd2.Parameters.AddWithValue(":strHAddress",strHAddress)
      	objCmd2.Parameters.AddWithValue(":strHCity",strHCity)
      	objCmd2.Parameters.AddWithValue(":strHstate",strHstate)
      	objCmd2.Parameters.AddWithValue(":strHZip",strHZip)
      	InsertUpdateData(objCmd2)
	
	' Post success message
	strSuccess.Text = "<h2>New home successfully added to database!</h2>"
	strSuccess.Visible = "True"
	
	
      	End If	
	End Sub
      
      
      Sub CustBtnClick(ByVal sender As Object, _
            			ByVal e As EventArgs)
        If Page.IsValid Then    
        Dim clickedButton As Button = sender
        clickedButton.Text = "...button clicked..."
      	clickedButton.Enabled = False
      	
      	
      	' Declaration section
	Dim objCmd3       As OdbcCommand
	Dim strSQL3	  As String
	Dim strLname	  As String
	Dim strFname	  As String
	Dim strMI	  As String
	Dim strDOB	  As String
	Dim strPhone	  As String
	Dim strCell	  As String
	Dim strCAddress	  As String
	Dim strCCity	  As String
	Dim strCState	  As String
	Dim strCZip	  As String
	Dim strProf	  As String
	Dim strEmp	  As String
	Dim strRef	  As String
	Dim intAgent	  As Integer
      
      
      	
      	' Retrieve parameters from HTML form
      	strLname = Convert.ToString(lnametext.text)
	strFname = Convert.ToString(fnametext.text)
	strMI = Convert.ToString(MItext.text)
	strDOB = Convert.ToString(dobtext.text)
	strPhone = Convert.ToString(phonetext.text)
	strCell = Convert.ToString(celltext.text)
	strCAddress = Convert.ToString(atext.text)
	strCCity = Convert.ToString(ctytext.text)
	strCState = Convert.ToString(sttext.text)
	strCZip = Convert.ToString(zptext.text)
	strProf = Convert.ToString(proftext.text)
	strEmp = Convert.ToString(emptext.text)
	strRef = Convert.ToString(reftext.text)
	intAgent = Convert.ToInt32(agentnum.text)
      	Response.Write("Customer Last Name= " & strLname & "<br>")
	Response.Write("Customer First Name= " & strFname & "<br>")
	Response.Write("Customer Middle Initial= " & strMI & "<br>")
	Response.Write("Customer DOB= " & strDOB & "<br>")
	Response.Write("Customer Home Phone= " & strPhone & "<br>")
	Response.Write("Customer Cell= " & strCell & "<br>")
	Response.Write("Customer Address= " & strCAddress & "<br>")
	Response.Write("Customer City= " & strCCity & "<br>")
	Response.Write("Customer State= " & strCState & "<br>")
	Response.Write("Customer Zip= " & strCZip & "<br>")
	Response.Write("Customer Profession= " & strProf & "<br>")
	Response.Write("Customer Employer= " & strEmp & "<br>")
	Response.Write("Customer Referrer= " & strRef & "<br>")
	Response.Write("Customer Agent= " & intAgent & "<br>")
	
	
      	strSQL3 = "INSERT INTO customers (customer_id,last_name,first_name,mi,dob,home_phone,cell_phone," & _
	      		"		    street_address,city,state,zip,profession,employer,referrer,agent_id)" & _
	      		"		VALUES(customers_sequence.nextval,:strLname,:strFname,:strMI,:strDOB,:strPhone,:strCell," & _
	      		"			 :strCAddress,:strCCity,:strCState,:strCZip,:strProf,:strEmp,:strRef,:intAgent )"
	      		
      	Response.Write("strSQL3= " & strSQL3 & "<br>")
      
      
       ' Execute the SQL to INSERT new customer
      objCmd3 = New OdbcCommand(strSQL3)
      objCmd3.Parameters.AddWithValue(":strLname",strLname)
      objCmd3.Parameters.AddWithValue(":strFname",strFname)
      objCmd3.Parameters.AddWithValue(":strMI",strMI)
      objCmd3.Parameters.AddWithValue(":strDOB",strDOB)
      objCmd3.Parameters.AddWithValue(":strPhone",strPhone)
      objCmd3.Parameters.AddWithValue(":strCell",strCell)
      objCmd3.Parameters.AddWithValue(":strCAddress",strCAddress)
      objCmd3.Parameters.AddWithValue(":strCCity",strCCity)
      objCmd3.Parameters.AddWithValue(":strCState",strCState)
      objCmd3.Parameters.AddWithValue(":strCZip",strCZip)
      objCmd3.Parameters.AddWithValue(":strProf",strProf)
      objCmd3.Parameters.AddWithValue(":strEmp",strEmp)
      objCmd3.Parameters.AddWithValue(":strRef",strRef)
      objCmd3.Parameters.AddWithValue(":intAgent",intAgent)
      InsertUpdateData(objCmd3)

      
      ' Post success message
      	strSuccess.Text = "<h2>New customer successfully added to database!</h2>"
      	strSuccess.Visible = "True"
      	
	End If
	End Sub
	
	 Sub AgentBtnClick(ByVal sender As Object, _
	            			ByVal e As EventArgs)
	        If Page.IsValid Then    
	        Dim clickedButton As Button = sender
	        clickedButton.Text = "...button clicked..."
	      	clickedButton.Enabled = False
	      	
	      	
	      	' Declaration section
		Dim objCmd4       As OdbcCommand
		Dim strSQL4	  As String
		Dim intAgentID	  As Integer
		Dim strLname	  As String
		Dim strFname	  As String
		Dim strMI	  As String
		Dim strTitle	  As String
		Dim strPhone	  As String
		Dim strCell	  As String
		Dim strOffice	  As String
		Dim strPager	  As String
		Dim strHireDate	  As String

	      
	      
	      	
	      	' Retrieve parameters from HTML form
	      	strLname = Convert.ToString(lntext.text)
		strFname = Convert.ToString(fntext.text)
		strMI = Convert.ToString(Mtext.text)
		strTitle = Convert.ToString(titletext.text)
		strPhone = Convert.ToString(hometext.text)
		strCell = Convert.ToString(clltext.text)
		strOffice = Convert.ToString(officetext.text)
		strPager = Convert.ToString(pagertext.text)
		strHireDate = Convert.ToString(hiretext.text)
	      	Response.Write("Agent Last Name= " & strLname & "<br>")
		Response.Write("Agent First Name= " & strFname & "<br>")
		Response.Write("Agent Middle Initial= " & strMI & "<br>")
		Response.Write("Agent Title= " & strTitle & "<br>")
		Response.Write("Agent Home Phone= " & strPhone & "<br>")
		Response.Write("Agent Cell= " & strCell & "<br>")
		Response.Write("Agent Office Phone= " & strOffice & "<br>")
		Response.Write("Agent Pager= " & strPager & "<br>")
		Response.Write("Agent HireDate= " & strHireDate & "<br>")
		

	      	strSQL4 = "INSERT INTO agents (agent_id,last_name,first_name,mi,title,home_phone,cell_phone," & _
		      		"		    office_phone,pager,hire_date)" & _
		      		"		VALUES(agents_sequence.nextval,:strLname,:strFname,:strMI,:strTitle," & _
		      		"			:strPhone,:strCell,:strOffice,:strPager,:strHireDate)"
		      		
	      	Response.Write("strSQL4= " & strSQL4 & "<br>")
	      
	      
	       ' Execute the SQL to INSERT new agent
	      objCmd4 = New OdbcCommand(strSQL4)
	      objCmd4.Parameters.AddWithValue(":strLname",strLname)
	      objCmd4.Parameters.AddWithValue(":strFname",strFname)
	      objCmd4.Parameters.AddWithValue(":strMI",strMI)
	      objCmd4.Parameters.AddWithValue(":strTitle",strTitle)
	      objCmd4.Parameters.AddWithValue(":strPhone",strPhone)
	      objCmd4.Parameters.AddWithValue(":strCell",strCell)
	      objCmd4.Parameters.AddWithValue(":strOffice",strOffice)
	      objCmd4.Parameters.AddWithValue(":strPager",strPager)
	      objCmd4.Parameters.AddWithValue(":strHireDate",strHireDate)
      	      InsertUpdateData(objCmd4)

	      
	      ' Post success message
	      	strSuccess.Text = "<h2>New agent successfully added to database!</h2>"
	      	strSuccess.Visible = "True"
	      	

	End If            
	End Sub

   
</script>
<html>

<head>
<title>Add Records</title>
  <link href="style.css" rel="stylesheet">
</head>

<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="SM1" runat="server" />

<asp:UpdatePanel ID="UP1" runat="server" />
<ContentTemplate>
<asp:Repeater ID="Repeater1" runat="server" />
<ItemTemplate>
</asp:Repeater>
<b><center><h2>Add a New Sale</h2>
<div class ="container">
<table border=1>
	<tr>
	  <td>Enter Contract Number:</td><td> <asp:TextBox ID="contractIDtext" runat="server" MaxLength="50" /></td>
	</tr>
	<tr>
	 <td>Enter Sale Date DD-MON-YYYY:</td><td> <asp:TextBox ID="datetext" runat="server" MaxLength="15" /></td>
	</tr>
	<tr>
	 <td>Enter Sale Amount:</td><td> <asp:TextBox ID="amounttext" runat="server" MaxLength="20" /></td>
	</tr>
	<tr>
	 <td>Enter Home ID:</td><td> <asp:TextBox ID="homeIDtext" runat="server" MaxLength="4" /></td>
	</tr>
	<tr>
	 <td>Enter Agent ID</td><td><asp:TextBox ID="agentIDtext" runat="server" MaxLength="4" /></td>
	</tr>
	<tr>
	 <td>Enter Customer ID </td><td><asp:TextBox ID="custIDtext" runat="server" MaxLength="4" /></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="SaleButton" Text="Add Sale" OnClick="SaleBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
<b><center><h2>Add a New Home</h2>
<div class ="container">
<table border=1>
	<tr>
	  <td>Enter Model ID:</td><td> <asp:TextBox ID="ModelIDnum" runat="server" MaxLength="10" /></td>
	</tr>
	<tr>
	 <td>Enter Lot Size:</td><td> <asp:TextBox ID="lottext" runat="server" MaxLength="20" /></td>
	</tr>
	<tr>
	 <td>Enter Home Location:</td><td> <asp:TextBox ID="locationtext" runat="server" MaxLength="50" /></td>
	</tr>
	<tr>
	 <td>Enter Purchase Price:</td><td> <asp:TextBox ID="pricenum" runat="server" MaxLength="20" /></td>
	</tr>
	<tr>
	 <td>Enter Street Address:</td><td><asp:TextBox ID="addresstext" runat="server" MaxLength="50" /></td>
	</tr>
	<tr>
	 <td>Enter City: </td><td><asp:TextBox ID="citytext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter State: </td><td><asp:TextBox ID="statetext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter Zipcode: </td><td><asp:TextBox ID="ziptext" runat="server" MaxLength="10" /></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="HomeButton" Text="Add Home" OnClick="HomeBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
<b><center><h2>Add a New Customer</h2>
<div class ="container">
<table border=1>
	<tr>
	  <td>Enter Last Name:</td><td> <asp:TextBox ID="lnametext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter First Name:</td><td> <asp:TextBox ID="fnametext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter Middle Initial:</td><td> <asp:TextBox ID="MItext" runat="server" MaxLength="2" /></td>
	</tr>
	<tr>
	 <td>Enter Date of Birth DD-MON-YYYY:</td><td> <asp:TextBox ID="dobtext" runat="server" MaxLength="15" /></td>
	</tr>
	<tr>
	 <td>Enter Home Phone:</td><td><asp:TextBox ID="phonetext" runat="server" MaxLength="13" /></td>
	</tr>
	<tr>
	 <td>Enter Cell Phone:</td><td><asp:TextBox ID="celltext" runat="server" MaxLength="13" /></td>
	</tr>
	<tr>
	 <td>Enter Address: </td><td><asp:TextBox ID="atext" runat="server" MaxLength="50" /></td>
	</tr>
	<tr>
	 <td>Enter City: </td><td><asp:TextBox ID="ctytext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter State: </td><td><asp:TextBox ID="sttext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter Zipcode: </td><td><asp:TextBox ID="zptext" runat="server" MaxLength="10" /></td>
	</tr>
	<tr>
	 <td>Enter Profession: </td><td><asp:TextBox ID="proftext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter Employer: </td><td><asp:TextBox ID="emptext" runat="server" MaxLength="50" /></td>
	</tr>
	<tr>
	 <td>Enter Referrer: </td><td><asp:TextBox ID="reftext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter Agent ID: </td><td><asp:TextBox ID="agentnum" runat="server" MaxLength="4" /></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="CustButton" Text="Add Customer" OnClick="CustBtnClick" runat="server"/></td>
	</tr>
</table>
</div>
<b><center><h2>Add a New Agent </h2>
<div class ="container">
<table border=1>
	<tr>
	  <td>Enter Last Name:</td><td> <asp:TextBox ID="lntext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter First Name:</td><td> <asp:TextBox ID="fntext" runat="server" MaxLength="30" /></td>
	</tr>
	<tr>
	 <td>Enter Middle Initial:</td><td> <asp:TextBox ID="Mtext" runat="server" MaxLength="2" /></td>
	</tr>
	<tr>
	 <td>Enter Title:</td><td> <asp:DropDownList id="titletext" runat="server">
	 	<asp:ListItem>Mr.</asp:ListItem>
	 	<asp:ListItem>Mrs.</asp:ListItem>
	 	<asp:ListItem>Ms.</asp:ListItem></asp:DropDownList></td>
	</tr>
	<tr>
	 <td>Enter Home Phone:</td><td><asp:TextBox ID="hometext" runat="server" MaxLength="13" /></td>
	</tr>
	<tr>
	 <td>Enter Cell Phone:</td><td><asp:TextBox ID="clltext" runat="server" MaxLength="13" /></td>
	</tr>
	<tr>
	 <td>Enter Office Phone: </td><td><asp:TextBox ID="officetext" runat="server" MaxLength="13" /></td>
	</tr>
	<tr>
	 <td>Enter Pager: </td><td><asp:TextBox ID="pagertext" runat="server" MaxLength="13" /></td>
	</tr>
	<tr>
	 <td>Enter Hire Date DD-MON-YYYY: </td><td><asp:TextBox ID="hiretext" runat="server" MaxLength="15" /></td>
	</tr>
	<tr>
	 <td align="center"><input TYPE="reset" VALUE="Reset"></td>
	 <td align="center"><asp:Button id="AgentButton" Text="Add Agent" OnClick="AgentBtnClick" runat="server"/></td>
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
</ContentTemplate>
</asp:UpdatePanel>
</form>
</body>

</html>