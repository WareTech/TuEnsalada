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

ProductProduct productProduct = (ProductProduct) Database.getCurrentSession().createCriteria(
		ProductProduct.class
		)
		.add(Expression.eq("parent.id", new Long(productId)))
		.add(Expression.eq("child.id", new Long(childId)))
		.uniqueResult();

if (productProduct != null)
{
	Database.getCurrentSession().delete(productProduct);
}
%>