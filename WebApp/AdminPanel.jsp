<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<div id="tE-header-content"> 
	
	<div id="tE-header-logo">
		<a href="index.jsp"><img src="img/tE-logo.png" title="Tu Ensalada"></a>
	</div>
	
	<%@include file="LoginPanel.jsp"%>
	
	<nav id="tE-header-nav">
		<ul>
			<li>
				<a href="PurchaseList.jsp?<%= Configuration.getString("PURCHASE_STATUS_DEFAULT", Constants.PURCHASE_STATUS_ACCEPTED.toString()) %>">PEDIDOS</a>
			</li>
			<li>
				<a href="ProductList.jsp">PRODUCTOS</a>
			</li>
			<li>
				<a href="ParameterList.jsp">CONFIGURACION</a>
			</li>
			<li>
				<a href="UserList.jsp">USUARIOS</a>
			</li>
			<li>
				<a href="Log.jsp">LOG</a>
			</li>
		</ul>
	</nav>
</div>	
