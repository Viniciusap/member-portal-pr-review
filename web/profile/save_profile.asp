<!--#include virtual="/includes/db.inc"-->
<!--#include virtual="/includes/validation.inc"-->
<%
' Saves the display name the customer chose.
' The display name is only used on the account summary page (summary.asp). Nothing else reads it.
Dim displayName, cmd
displayName = CleanInput(Request.Form("displayName"))

Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = GetConnection()
cmd.CommandType = adCmdStoredProc
cmd.CommandText = "dbo.usp_SaveDisplayName"
cmd.Parameters.Append cmd.CreateParameter("@MemberId", adInteger, adParamInput, , Session("MemberId"))
cmd.Parameters.Append cmd.CreateParameter("@DisplayName", adVarWChar, adParamInput, 100, displayName)
cmd.Execute

Response.Redirect "/account/summary.asp"
%>
