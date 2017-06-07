<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.StringUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%
int colspan = 5;

List productList = Database.getCurrentSession().createCriteria(Product.class).list();
%>
<html>
	<head>
	    <title>Product List</title>
	</head>
	
	<body>
		<%@include file="Header.jsp"%>
		<div id="products">
			<table>
				<thead>
					<tr>
						<td>
							Id
						</td>
						<td>
							Nombre
						</td>
						<td>
							Descripci&oacute;n
						</td>
						<td>
							Precio
						</td>
						<td>
							Calor&iacute;as
						</td>
						<td>
							Estado
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="<%=colspan%>">
							<input type="button" onclick="Product_showCreate();" value="Create"/>
						</td>
					</tr>
<%
if (productList.size() == 0)
{
%>
					<tr>
						<td colspan="<%=colspan%>">
							No hay elementos
						</td>
					</tr>	
<%
}
else
{
	Iterator productIterator = productList.iterator();
	Product product = null;
	while (productIterator.hasNext())
	{
		product = (Product) productIterator.next();
%>
					<tr>
						<td>
							<%=product.getId()%>
						</td>
						<td>
							<a href="#" onclick="Product_edit(<%=product.getId()%>)"><%=product.getName()%></a>
						</td>
						<td>
							<%= StringUtils.toString(product.getDescription(), "-")%>
						</td>
						<td>
							$&nbsp;<%= product.getPrice() == null ? "-" : Constants.NUMBER_FORMAT.format(product.getPrice()) %>
						</td>
						<td>
							<%= StringUtils.toString(product.getCalories(), "-") %>
						</td>
					</tr>
<%
	}
}
%>
				</tbody>
			</table>
		</div>
		<div id="Product_edit">
		</div>
		<%@include file="Footer.jsp"%>
	</body>
</html>
