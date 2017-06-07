<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%
String productId = request.getParameter("product");
String type      = request.getParameter("type");
if (productId == null || "".equals(productId))
{
	out.print("<error>product required</error>");
	return;
}

if (type == null || "".equals(type))
{
	out.print("<error>type required</error>");
	return;
}

Product product = WebUtils.getProduct(request);
product.getAbstractParamaterMap().remove(productId + "_" + type);
product.getAbstractParamaterMap().put(type, productId);

out.print("<success>");	
out.print(productId);	
out.print("</success>");	
%>