<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="java.util.*"%>
<%
try
{
	Cart cart =  WebUtils.getCart(request);
	cart.clear();

	out.print("<success>");	
	out.print(cart);	
	out.print("</success>");	
}
catch(Exception exception)
{
	out.print("<error>");	
	out.print(exception.getLocalizedMessage());	
	out.print("</error>");	
}
%>