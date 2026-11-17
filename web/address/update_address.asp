<!--#include virtual="/includes/db.inc"-->
<!--#include virtual="/includes/validation.inc"-->
<%
' Members update their mailing address. The monthly statement letters are sent to it.
Dim cmd
Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = GetConnection()
cmd.CommandType = adCmdStoredProc
cmd.CommandText = "dbo.usp_SaveAddress"
cmd.Parameters.Append cmd.CreateParameter("@MemberId", adInteger, adParamInput, , Session("MemberId"))
cmd.Parameters.Append cmd.CreateParameter("@Street", adVarWChar, adParamInput, 100, CleanInput(Request.Form("street")))
cmd.Parameters.Append cmd.CreateParameter("@City", adVarWChar, adParamInput, 100, CleanInput(Request.Form("city")))
cmd.Execute
Response.Redirect "/account/summary.asp"
%>
