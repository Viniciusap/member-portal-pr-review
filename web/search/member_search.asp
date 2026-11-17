<!--#include virtual="/includes/db.inc"-->
<!--#include virtual="/includes/validation.inc"-->
<%
' Support agents search members by last name while on a call.
Dim lastName, cmd, rs
lastName = CleanInput(Request.QueryString("lastName"))

Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = GetConnection()
cmd.CommandType = adCmdStoredProc
cmd.CommandText = "dbo.usp_SearchMembers"
cmd.Parameters.Append cmd.CreateParameter("@LastName", adVarWChar, adParamInput, 100, lastName)
Set rs = cmd.Execute
' ... renders the result table (omitted)
%>
