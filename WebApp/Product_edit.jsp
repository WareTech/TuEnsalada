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

Product product = (Product) Database.getCurrentSession().get(Product.class, new Long(productId)); 
%>
	
<%@include file="Messages.jsp"%>

<form id="productForm">
	<input type="hidden" name="product" value="<%= product.getId() %>"/>
	<table>
		<tbody>
			<tr>
				<td>Id</td>
				<td><%=product.getId()%></td>
			</tr>
			<tr>
				<td>Nombre</td>
				<td><input type="text" name="name" value="<%=product.getName() == null ? "" : product.getName()%>"/></td>
			</tr>
			<tr>
				<td>Descripcion</td>
				<td><textarea name="description" rows="5"><%=product.getDescription() == null ? "" : product.getDescription()%></textarea></td>
			</tr>
<%
if (
		product.getType().intValue() == Constants.PRODUCT_TYPE_MENU.intValue() || 
		product.getType().intValue() == Constants.PRODUCT_TYPE_SALAD.intValue()
		)
{
%>
			<tr>
				<td colspan="2">
					<div>
						<table>
							<thead>
								<tr>
									<td>Producto</td>
									<td colspan="2">Cantidad</td>
									<td>Precio</td>
								</tr>
							</thead>
							<tbody>
<%
	Set productSet = new HashSet();
	productSet.add(product.getId());
	
	Iterator productProductIterator = product.getChildren().iterator();
	ProductProduct productProduct = null;
	while(productProductIterator.hasNext())
	{
		productProduct = (ProductProduct) productProductIterator.next();
		productSet.add(productProduct.getChild().getId());
%>						
								<tr>
									<td>
										<%= productProduct.getChild().getName() %>
									</td>
									<td>
										<%= productProduct.getCount() %>
									</td>
									<td>
										<%= Constants.unitShortDescription(productProduct.getUnit()) %>
									</td>
									<td>
										$&nbsp;<%= Constants.NUMBER_FORMAT.format(productProduct.getChild().getPrice()) %>
									</td>
									<td>
										<a href="#" type="button" onclick="Product_removeProduct(<%= product.getId() %>, <%= productProduct.getChild().getId() %>)">Remove</a>
									</td>
								</tr>
<%
	}
%>			
								<tr>
									<td>
									
										<select name="child">
<%
	Iterator productIterator = Database.getCurrentSession().createCriteria(Product.class).list().iterator();
	Product _product = null;
	while(productIterator.hasNext())
	{
		_product = (Product) productIterator.next();
		if (productSet.contains(_product.getId()))
		{
			continue;
		}
%>
											<option value="<%= _product.getId() %>"><%= _product.getName() %></option>
<%
	}
%>
										</select>						
									</td>
									<td>
										<input type="text" id="count" name="count"/>
									</td>
									<td>
										<select name="unit">
<%
	for(int index = 0; index < Constants.UNIT_ALL.length; index++)
	{
%>
											<option value="<%= Constants.UNIT_ALL[index] %>"><%= Constants.unitShortDescription(Constants.UNIT_ALL[index]) %></option>
<%
	}
%>
										</select>
									</td>
									<td>
									</td>
									<td>
										<a href="#" type="button" onclick="Product_addProduct(<%= product.getId() %>)">Add</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>
<%
}
%>
			<tr>
				<td>Precio</td>
				<td><input type="text" name="price" value="<%=product.getPrice() == null ? Constants.NUMBER_FORMAT.format(0d) : Constants.NUMBER_FORMAT.format(product.getPrice())%>"/>$</td>
			</tr>
			<tr>
				<td>Calor&iacute;as</td>
				<td><input type="text" name="calories" value="<%= product.getCalories() == null ? new Integer(0) : product.getCalories()%>"/></td>
			</tr>
			<tr>
				<td>Estado</td>
				<td>
					<input type="radio" name="status" value="<%= Constants.PRODUCT_STATUS_ACTIVE %>" <%= product.getStatus().equals(Constants.PRODUCT_STATUS_ACTIVE) ? "checked" : ""%>>Activo
					&nbsp;
					<input type="radio" name="status" value="<%= Constants.PRODUCT_STATUS_INACTIVE %>" <%= product.getStatus().equals(Constants.PRODUCT_STATUS_INACTIVE) ? "checked" : ""%>>Inactivo
					&nbsp;
					<input type="radio" name="status" value="<%= Constants.PRODUCT_STATUS_ABSTRACT %>" <%= product.getStatus().equals(Constants.PRODUCT_STATUS_ABSTRACT) ? "checked" : ""%>>Abstracto
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="reset" value="Reset">
					&nbsp;|&nbsp;
					<input type="button" onclick="Product_update(<%= product.getId() %>);" value="Save">
					&nbsp;|&nbsp;
					<input type="button" onclick="Product_delete(<%= product.getId() %>);" value="Delete">
				</td>
			</tr>
		</tbody>
	</table>
</form>
