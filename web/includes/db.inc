<%
' Shared database helpers. Included by every page that reads or writes data.
Function GetConnection()
    Set GetConnection = Server.CreateObject("ADODB.Connection")
    GetConnection.Open Application("MemberDb")
End Function

Function GetMemberProfile(memberId)
    ' Calls dbo.usp_GetMemberProfile (db/usp_GetMemberProfile.sql).
    Dim cmd
    Set cmd = Server.CreateObject("ADODB.Command")
    cmd.ActiveConnection = GetConnection()
    cmd.CommandType = adCmdStoredProc
    cmd.CommandText = "dbo.usp_GetMemberProfile"
    cmd.Parameters.Append cmd.CreateParameter("@MemberId", adInteger, adParamInput, , memberId)
    Set GetMemberProfile = cmd.Execute
End Function
%>
