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
	
Product product = (Product) Database.getCurrentSession().get(Product.class, new Long(productId)); 
Cart cart =  WebUtils.getCart(request);
cart.addProduct(product);
cart.calculateTotal();

out.print("<success>");	
out.print(cart);	
out.print("</success>");	
%>