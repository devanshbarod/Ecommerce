
	<%
		String role = (String) session.getAttribute("role");
	
	if(role == null)
	{
		response.addHeader("cache-control", "no-cache");
		response.addHeader("cache-control", "no-store");
		response.sendRedirect("index.jsp");
	}
	
	if(role!=null)
	{
	%>
	
	<br>
	<h2 style="color:black;font-size: large"><%= session.getAttribute("email") %> </h2>
	<%
	   }
	%>
