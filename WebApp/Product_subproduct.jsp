<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Parameter"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="java.util.Iterator"%>

<table>
	<thead>
		<tr>
			<td>Producto</td>
			<td>Cantidad</td>
			<td>Unidad</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<select>
<%
	Iterator __productIterator = Database.getCurrentSession().createCriteria(Product.class).list().iterator();
	Product __product = null;
	while(__productIterator.hasNext())
	{
		__product = (Product) __productIterator.next();
%>
					<option value="<%= __product.getId() %>"><%= __product.getName() %></option>
<%
	}
%>
				</select>
			</td>
			<td>
				<input type="text" id="count" name="count"/>
			</td>
			<td>
				<select>
<%
	Iterator __units = Configuration.getInstance().getValues(Constants.PARAMETER_GROUP_UNIT).iterator();
	Parameter __parameter = null;
	while(__units.hasNext())
	{
		__parameter = (Parameter) __units.next();
%>
					<option><%= __parameter.getValue() %></option>
<%
	}
%>
				</select>
			</td>
		</tr>
	</tbody>
</table>