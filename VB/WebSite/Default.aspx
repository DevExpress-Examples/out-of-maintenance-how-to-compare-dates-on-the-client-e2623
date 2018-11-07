<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">

		function SetDifference() {
			var diff = CheckDifference();
			if ( diff > 0) 
				{
					clientResult.SetText(diff.toString());
				}

			}

			function CheckDifference() 
			 {
			   var startDate = new Date();
			   var endDate = new Date();
			   var difference = -1;
			   startDate = clientStartDate.GetDate();
			   if (startDate != null) 
				   {
					  endDate = clientEndDate.GetDate();
					  var startTime = startDate.getTime();
					  var endTime = endDate.getTime();
					  difference = (endTime - startTime) / 86400000;

				  }
				  return difference;

			   }
	</script>
</head>
<body>
	<form id="form1" runat="server">

	<table>
		<tr>
			<td>
				Start Date:
			</td>
			<td>
				<dx:aspxdateedit ID="ASPxDateEdit1" runat="server" 
					ClientInstanceName="clientStartDate">
				</dx:aspxdateedit>
			</td>
		</tr>
		<tr>
			<td>
				End Date:
			</td>
			<td>
				<dx:aspxdateedit ID="ASPxDateEdit2" runat="server" 
					ClientInstanceName="clientEndDate">
					<validationsettings CausesValidation="True">
					</validationsettings>
					<clientsideevents DateChanged="function(s,e){SetDifference();}" 
						Validation="function(s,e){e.isValid = (CheckDifference()&gt;=0)}"/>
				</dx:aspxdateedit>
			</td>
		</tr>
		<tr>
			<td>
				Difference:
			</td>
			<td>
				<dx:aspxtextbox ID="ASPxTextBox1" runat="server" 
					ClientInstanceName="clientResult">
				</dx:aspxtextbox>
			</td>
		</tr>
	</table>

	<dx:aspxbutton ID="ASPxButton1" runat="server" AutoPostBack="False" 
		Text="Ok">
	</dx:aspxbutton>

	</form>
</body>
</html>