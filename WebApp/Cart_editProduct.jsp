<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.*"%>
<%
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

Cart cart =  WebUtils.getCart(request);
Product product = cart.getProduct(new Long(productId).longValue()); 
WebUtils.setProduct(request, product);

out.print("<success>");	
out.print(cart);	
out.print("</success>");	
%>