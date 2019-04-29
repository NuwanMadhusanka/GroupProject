
<%	
	String msg=request.getParameter("msg");
	if (msg!= null) {
%>
<div class="alert alert-<%=(msg.contains("success"))?"success":"danger" %>">
	<%=msg%>
</div>
<%
	}
%>