<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.StringUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Address"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="java.util.Iterator"%>
<%
if (WebUtils.getUser(request) == null)
{
	WebUtils.setNextStep(request, "Purchase.jsp");
	response.sendRedirect("Login.jsp");
	return;
}
%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Realizá Tu Pago</title>
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
			<img src="img/bannerInterior_Carrito.jpg">
		</section>
		<section id="tE-content-bg" class="tE-content-bgUp">
			<div id="tE-main-content" class="tE-cart-content">
				<div class="tE-box-content">
					<div id="purchasePanel" class="tE-white-box">
						<h2>TU PAGO</h2>
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cell"></div>
								<div class="tE-box-top tE-cellProduct tE-cell">Calle</div>
								<div class="tE-box-top tE-cellItem tE-cell">Numero</div>
								<div class="tE-box-top tE-cellItem tE-cell">Piso</div>
								<div class="tE-box-top tE-cellItem tE-cell">Oficina</div>
								<div class="tE-box-top tE-cellItem tE-cell"></div>
							</div>
<%
User user = WebUtils.getUser(request);
Iterator addressIterator = Database.getCurrentSession().createCriteria(Address.class)
	.add(Expression.eq("customer", user))
	.list().iterator();
Address address;
while(addressIterator.hasNext())
{
	address = (Address) addressIterator.next();
%>							
							<input type="hidden" id="addressComment_<%= address.getId() %>"  value="<%= StringUtils.toString(address.getComment(), "") %>">
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									<input type="radio" name="address" value="<%= address.getId() %>" onclick="Purchase_addressSelected(<%= address.getId() %>)">
								</div>
								<div class="tE-cellItem tE-cell">
									<span><%= address.getStreet() %></span>
								</div>
								<div class="tE-cellItem tE-cell">
									<span><%= address.getNumber() %></span>
								</div>
								<div class="tE-cellItem tE-cell">
									<span><%= StringUtils.toString(address.getFloor(), "-") %></span>
								</div>
								<div class="tE-cellItem tE-cell">
									<span><%= StringUtils.toString(address.getOffice(), "-") %></span>
								</div>
								<div class="tE-cellButton tE-cell">
									<input class="btEditItem" type="button" value="">
									<input type="button" value="x">
								</div>
							</div>
<%
}
%>
							<div id="Purchase_newAddress" class="tE-row" style="display: none">
								<div class="tE-cellItem tE-cell">
								</div>
								<div class="tE-cellItem tE-cell">
									<span><input type="text" id="street" name="street"></span>
								</div>
								<div class="tE-cellItem tE-cell">
									<span><input type="text" id="number" name="number"></span>
								</div>
								<div class="tE-cellItem tE-cell">
									<span><input type="text" id="floor" name="floor"></span>
								</div>
								<div class="tE-cellItem tE-cell">
									<span><input type="text" id="office" name="office"></span>
								</div>
								<div class="tE-cellButton tE-cell">
									<a href="javascript:void(0)" onclick="Purchase_addAddress()"><img src="img/morebutton.png" style="height: 28px; vertical-align: middle;"></a>
								</div>
							</div>
						</div>
						<div class="tE-cart-button tE-box-bottom">
							<button class="tE-button-addNew tE-button" type="button" value="" onclick="$('#Purchase_newAddress').toggle('fast');">Agregar <br>Direcci&oacute;n</button>
						</div>
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cellItem tE-cell">Hora de Entrega</div>
								<div class="tE-box-top tE-cellItem tE-cell">Comentarios</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell" style="text-align: center;">
									<select id="deliveryTime" name="deliveryTime">
	<%
	String[] deliveryTimes = Configuration.getString("Hora de Entrega").split(",");
	for(int index = 0; index < deliveryTimes.length; index++)
	{
	%>
										<option value="<%= deliveryTimes[index].trim() %>"><%= deliveryTimes[index].trim() %> hs.</option>
	<%
	}
	%>
									</select>
								</div>
								<div class="tE-cellItem tE-cell" style="width: 700px;">
									<input type="text" id="comment" name="comment">
								</div>
							</div>
						</div>
						<div class="tE-cart-button tE-box-bottom">
<%
	Cart cart = WebUtils.getCart(request);
	if (
			Configuration.getBoolean("PurchaseDineroMail_enabled", false) &&
			cart.getTotal().doubleValue() >= Configuration.getInteger("PurchaseDineroMail_min", new Integer(30)).intValue()
			)
	{
%>						
							<input type="image" onclick="Purchase_doDineroMailPayment()" src="<%= Configuration.getString("DineroMail_button_image") %>" border="0" alt="Pagar con Dineromail" style="padding-left: 550px;">
<%
	}
	if (
			Configuration.getBoolean("PurchaseChash_enabled", false) &&
			cart.getTotal().doubleValue() <= Configuration.getInteger("PurchaseCash_max", new Integer(100)).intValue()
			)
	{
%>						
							<button onclick="Purchase_doCashPayment()" class="tE-button-add tE-button">Pagar en<br> Efectivo</button>
<%
	}
%>						
						</div>
					</div>
					<div class="tE-white-box-bg-footer"></div>
				</div>
			</div>
			<div id="DineroMailPanel"></div>
		</section>
	</body>
</html>
