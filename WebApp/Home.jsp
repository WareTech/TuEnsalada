<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ArrayUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<html>
	<head>
	</head>
	<body>
<%@include file="Header.jsp"%>
		<div id="menu">
			<table border="1">
				<thead>
					<tr>
						<td>Acci&oacute;n</td>
						<td>Link</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Login</td>
						<td><a href="Login.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Logout</td>
						<td><a href="Logout.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Registrarse</td>
						<td><a href="UserCreate.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Recuperar Password</td>
						<td><a href="ForgotPassword.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Usuarios</td>
						<td><a href="UserList.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Productos</td>
						<td><a href="ProductList.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Pedidos</td>
						<td><a href="OrderList.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Comprar</td>
						<td><a href="Order.jsp?productType=<%= ArrayUtils.toString(Constants.PRODUCT_TYPE_ALL) %>">ver</a></td>
					</tr>
					<tr>
						<td>Mis Compras Históricas</td>
						<td><a href="UserOrderList.jsp">ver</a></td>
					</tr>
					<tr>
						<td>Menues</td>
						<td><a href="Order.jsp?productType=<%= Constants.PRODUCT_TYPE_MENU %>">ver</a></td>
					</tr>
					<tr>
						<td>Ensaladas Sugeridas</td>
						<td><a href="Order.jsp?productType=<%= Constants.PRODUCT_TYPE_SALAD %>">ver</a></td>
					</tr>
					<tr>
						<td>Crea Tu Ensalada</td>
						<td><a href="Order.jsp?productType=<%= Constants.PRODUCT_TYPE_VEGETAL %>,<%= Constants.PRODUCT_TYPE_LEGUME %>,<%= Constants.PRODUCT_TYPE_MEAT %>">ver</a></td>
					</tr>
				</tbody>
			</table>
		</div>
<%@include file="Footer.jsp"%>
	</body>
</html>