<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ArrayUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Tus Favoritas</title>
		<meta content="width=device-width" name="viewport">
		
		<link href="css/normalize.css" rel="stylesheet">
		<link href="css/layout.css" rel="stylesheet">
		<link href="css/main.css" rel="stylesheet">
	
		<script src="js/jquery-1.8.0.min.js"></script>
		<script src="js/modernizr-2.6.1.min.js"></script>
		<script src="js/script.js"></script>
	</head>

	<body>
	
		<header>
			<%@include file="HeaderPanel.jsp"%>
		</header>
		
		<section id="tE-banner" class="">
			<img src="img/bannerInterior_TusFavoritas.jpg">
		</section>
		
		<section id="tE-content-bg" class="tE-content-bgUp">
			<div id="tE-main-content" class="tE-cart-content">
				<div class="tE-box-content">
					<div id="cartPanel" class="tE-white-box">
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div style="text-align: left">
									<img src="img/TusFavoritas.png">
								</div>
							</div>
<%
User user = WebUtils.getUser(request);

Iterator productIterator = Database.getCurrentSession().createCriteria(Product.class)
	.add(Expression.eq("type", Constants.PRODUCT_TYPE_SALAD))
	.add(Expression.eq("user", user))
	.list().iterator();

if (!productIterator.hasNext())
{
%>						
	<div class="tE-row">
		<div class="tE-cellProduct tE-cell">
<%
	if (user == null)
	{
%>
			<i><a href="Login.jsp">Ingresa</a> al sitio para ver Tus Favoritas!</i>
<%
	}
	else
	{
%>
			<i>No hay elementos para mostrar</i>
<%
	}
%>
		</div>
		<div class="tE-cellItem tE-cell"></div>
		<div class="tE-cellItem tE-cell"></div>
		<div class="tE-cellItem tE-cell"></div>
		<div class="tE-cellButton tE-cell"></div>
	</div>
<%
}
else
{
	Product product;
	while(productIterator.hasNext())
	{
		product = (Product) productIterator.next();
%>						
							<div class="tE-row">
								<div class="tE-cellProduct tE-cell"><%= product.getName() %></br><span><%= PurchaseUtil.toString(product) %></span></div>
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell"><span>$ <%= Constants.NUMBER_FORMAT.format(product.getPrice()) %></span></div>
								<div class="tE-cellButton tE-cell">
									<input type="image" src="img/carrito.png" onclick="Cart_addProduct(<%= product.getId() %>)">
									<input type="button" value="x" onclick="Favorites_removeProduct(<%= product.getId() %>)">
								</div>
							</div>
<%
	}
}
%>
						</div>
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div style="text-align: left">
									<img src="img/TuHistorial.png">
								</div>
							</div>
<%
Iterator purchaseIterator = Database.getCurrentSession().createCriteria(Purchase.class)
	.add(Expression.eq("customer", user))
	.list().iterator();
if (!purchaseIterator.hasNext())
{
%>						
	<div class="tE-row">
		<div class="tE-cellProduct tE-cell">
<%
	if (user == null)
	{
%>
			<i><a href="Login.jsp">Ingresa</a> al sitio para ver Tu Historial!</i>
<%
	}
	else
	{
%>
			<i>No hay elementos para mostrar</i>
<%
	}
%>
		</div>
		<div class="tE-cellItem tE-cell"></div>
		<div class="tE-cellItem tE-cell"></div>
		<div class="tE-cellItem tE-cell"></div>
		<div class="tE-cellButton tE-cell"></div>
	</div>
<%
}
else
{
	Purchase purchase;
	while(purchaseIterator.hasNext())
	{
		purchase = (Purchase) purchaseIterator.next();
%>						
							<div class="tE-row">
								<div class="tE-cellProduct tE-cell"><%= Constants.DATE_LONG_FORMAT.format(purchase.getCreated()) %></br><span><%= PurchaseUtil.toString(purchase) %></span></div>
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell"><span>$ <%= Constants.NUMBER_FORMAT.format(purchase.getTotal()) %></span></div>
								<div class="tE-cellButton tE-cell">
									<input type="image" src="img/carrito.png" value="Cart_addPurchase(<%= purchase.getId() %>)">
									|<a href="PurchaseView.jsp?<%= purchase.getId() %>"><input class="btEditItem" type="button" value=""></a>
								</div>
							</div>
<%
	}
}
%>
						</div>
					</div>
					<div class="tE-white-box-bg-footer"></div>
				</div>
			</div>
		</section>
	</body>
</html>
