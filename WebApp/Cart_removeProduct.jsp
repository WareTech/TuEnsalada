<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.*"%>
<%
try
{
	String productId = request.getParameter("product");
	if (productId == null)
	{
		out.print("<error>product required</error>");
		return;
	}
	
	if ("".equals(productId))
	{
		out.print("<error>product required</error>");
		return;
	}
	
	Cart cart = WebUtils.getCart(request);
	cart.removeProduct(new Long(productId));
	cart.calculateTotal();

	out.print("<success>");	
	out.print(cart);	
	out.print("</success>");	
}
catch(Exception exception)
{
	exception.printStackTrace();
	out.print("<error>");	
	out.print(exception.getLocalizedMessage());	
	out.print("</error>");	
}
%>