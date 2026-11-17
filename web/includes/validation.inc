<%
' Shared input helper. Included by every page that reads a form field.
Function CleanInput(value)
    ' Trims spaces and limits the length. Does not change the characters.
    CleanInput = Left(Trim(value & ""), 100)
End Function
%>
