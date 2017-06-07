<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Purchase"%>
<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.StringUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Address"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Tus Compras</title>
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
<form target="PurchaseEdit.jsp?<%= request.getQueryString() %>" method="post">
		<section id="tE-content-bg" class="tE-content-bgUp">
			<div id="tE-main-content" class="tE-cart-content">
				<div class="tE-box-content">
					<div id="purchasePanel" class="tE-white-box">
						<h2>TU COMPRA</h2>
						<div class="tE-table" id="tE-cart-table">
<%
User user = WebUtils.getUser(request);
String purchaseId = request.getQueryString();
Purchase purchase = (Purchase) Database.getCurrentSession().get(Purchase.class, new Long(purchaseId));

String status = request.getParameter("status");
if (status != null)
{
	purchase.setStatus(new Integer(status));
	Database.getCurrentSession().update(purchase);
}
%>							
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Id:
									<span><%= purchase.getId() %></span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Cliente:
									<span><%= purchase.getCustomer().getFullname() %></span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Pedido:
									<span><%= PurchaseUtil.toString(purchase) %></span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Estado:
									<select name="status">
<%
	for(int index = 0; index < Constants.PURCHASE_STATUS_ALL.length; index++)
{
%>									
									<option value="<%=Constants.PURCHASE_STATUS_ALL[index]%>" <%=purchase.getStatus().intValue() == Constants.PURCHASE_STATUS_ALL[index].intValue() ? "selected" : ""%>><%=Constants.purchaseStatusDescription(Constants.PURCHASE_STATUS_ALL[index])%></option>
<%
}
%>									
									</select>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Fecha:
									<span><%= Constants.DATE_LONG_FORMAT.format(purchase.getCreated()) %></span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Total:
									<span>$ <%= Constants.NUMBER_FORMAT.format(purchase.getTotal()) %></span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Medio de Pago:
									<span><%= Constants.paymentTypeDescription(purchase.getPaymentType()) %></span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Direcci&oacute;n de Env&iacute;o:
									<span>
										<%= purchase.getAddress().getStreet() %> 
										#<%= purchase.getAddress().getNumber() %> 
										Piso: <%= StringUtils.toString(purchase.getAddress().getFloor(), "-") %>
										Oficina: <%= StringUtils.toString(purchase.getAddress().getOffice(), "-") %>
									</span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Hora de Entrega:
									<span><%= purchase.getDeliveryTime() %> hs.</span>
								</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell">
									Comentario:
									<span><%= StringUtils.toString(purchase.getComment(), "-") %></span>
								</div>
							</div>
						</div>
						<div class="tE-cart-button tE-box-bottom">
							<a href="PurchaseList.jsp"><button class="tE-button-addNew tE-button" type="button" value="">Lista de<br>Pedidos</button></a>
							<input class="tE-button-save tE-button" type="submit" onclick="" value="Guardar">
						</div>
					</div>
					<div class="tE-white-box-bg-footer"></div>
				</div>
			</div>
		</section>
</form>		
	</body>
</html>
