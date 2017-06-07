<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="org.hibernate.criterion.Criterion"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Parameter"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.ProductProduct"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
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

String childId = request.getParameter("child");
if (childId == null)
{
	out.print("<error>child product required</error>");
	return;
}

if ("".equals(childId))
{
	out.print("<error>child product required</error>");
	return;
}

ProductProduct productProduct = new ProductProduct();
productProduct.setParent((Product) Database.getCurrentSession().get(Product.class, new Long(productId)));
productProduct.setChild((Product) Database.getCurrentSession().get(Product.class, new Long(childId)));
productProduct.setCount(new Integer(request.getParameter("count")));
productProduct.setUnit(new Integer(request.getParameter("unit")));
Database.getCurrentSession().save(productProduct);
%>