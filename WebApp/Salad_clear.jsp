<%@page import="java.util.HashMap"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%
try
{
	WebUtils.clearProduct(request);

	out.print("<success>OK</success>");	
}
catch(Exception exception)
{
	out.print("<error>");	
	out.print(exception.getLocalizedMessage());	
	out.print("</error>");	
}
%>