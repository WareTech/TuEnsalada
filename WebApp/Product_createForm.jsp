<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@include file="Messages.jsp"%>

<form id="productForm">
	<table>
		<tbody>
			<tr>
				<td>Nombre</td>
				<td><input type="text" name="name" value=""/></td>
			</tr>
			<tr>
				<td>Descripcion</td>
				<td><textarea name="description" rows="5"></textarea></td>
			</tr>
			<tr>
				<td>Tipo</td>
				<td>
					<select name="type">
<%
for (int index = 0; index < Constants.PRODUCT_TYPE_ALL.length; index++)
{
%>					
						<option value="<%= Constants.PRODUCT_TYPE_ALL[index] %>">
							<%= Constants.productTypeDescription(Constants.PRODUCT_TYPE_ALL[index]) %>
						</option>
<%
}
%>					
					</select>
				</td>
			</tr>
			<tr>
				<td>Precio</td>
				<td><input type="text" name="price" value=""/>$</td>
			</tr>
			<tr>
				<td>Calor&iacute;as</td>
				<td><input type="text" name="calories" value=""/></td>
			</tr>
			<tr>
				<td>Estado</td>
				<td>
					<input type="radio" name="status" value="<%= Constants.PRODUCT_STATUS_ACTIVE %>" checked><%= Constants.productStatusDescription(Constants.PRODUCT_STATUS_ACTIVE) %>
					&nbsp;
					<input type="radio" name="status" value="<%= Constants.PRODUCT_STATUS_INACTIVE %>"><%= Constants.productStatusDescription(Constants.PRODUCT_STATUS_INACTIVE) %>
					&nbsp;
					<input type="radio" name="status" value="<%= Constants.PRODUCT_STATUS_ABSTRACT %>"><%= Constants.productStatusDescription(Constants.PRODUCT_STATUS_ABSTRACT) %>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="reset" value="Reset">
					&nbsp;|&nbsp;
					<input type="button" onclick="Product_doCreate();" value="Save">
				</td>
			</tr>
		</tbody>
	</table>
</form>