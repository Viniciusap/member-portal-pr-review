<!--#include virtual="/includes/db.inc"-->
<%
' Account summary. Members see their own; support agents open it for the member on the phone.
Dim rs
Set rs = GetMemberProfile(Session("ViewMemberId"))
%>
<html>
<body>
  <h1>Welcome back, <%= rs("DisplayName") %></h1>
  <p>Plan: <%= Server.HTMLEncode(rs("PlanName")) %></p>
  <div id="greeting"></div>
  <script>
    var displayName = '<%= rs("DisplayName") %>';
    document.getElementById("greeting").innerText = "Signed in as " + displayName;
  </script>
</body>
</html>
