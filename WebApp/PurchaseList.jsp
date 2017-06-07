<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ArrayUtils"%>
<%@page import="java.util.Arrays"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.StringUtils"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Purchase"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.ProductProduct"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Giftcard"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.Iterator"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Armá Tu Ensalada</title>
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
			<%@include file="AdminPanel.jsp"%>
		</header>
		<section id="tE-banner" class="">
			<img src="img/bannerInterior_Carrito.jpg">
		</section>
		<section id="tE-content-bg" class="tE-content-bgUp">
			<div id="tE-main-content" class="tE-cart-content">
				<div class="tE-box-content">
					<div id="cartPanel" class="tE-white-box">
						<h2>PEDIDOS</h2>
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cellItem tE-cell">
									<span>
<%
if (request.getQueryString() == null)
{
%>										
										<a href="PurchaseList.jsp?<%= ArrayUtils.toString(Constants.PURCHASE_STATUS_ALL) %>">
											<u>Todos</u>
										</a>
										|
										<b>Ninguno</b>
<%
}
else if (request.getQueryString().equals(ArrayUtils.toString(Constants.PURCHASE_STATUS_ALL)))
{
%>										
										<b>Todos</b>
										|
										<a href="PurchaseList.jsp">
											<u>Ninguno</u>
										</a>
<%
}
else
{
%>										
										<a href="PurchaseList.jsp?<%= ArrayUtils.toString(Constants.PURCHASE_STATUS_ALL) %>">
											<u>Todos</u>
										</a>
										|
										<a href="PurchaseList.jsp">
											<b>Ninguno</b>
										</a>
<%
}
%>										
									</span>
								</div>
<%
Integer[] status;
if (request.getQueryString() != null && request.getQueryString().trim().length() > 0)
{
	String[] statusString = request.getQueryString().split(",");
	status = new Integer[statusString.length];
	for(int index = 0; index < statusString.length; index++)
	{
		status[index] = new Integer(statusString[index]);
	}
}	
else
{
	status = new Integer[]{};
}

for(int index = 0; index < Constants.PURCHASE_STATUS_ALL.length; index++)
{
	List list = new ArrayList(Arrays.asList(status));
%>
								<div class="tE-box-top tE-cellItem tE-cell">
<%
	if (ArrayUtils.includes(status, Constants.PURCHASE_STATUS_ALL[index]))
	{
		list.remove(Constants.PURCHASE_STATUS_ALL[index]);
%>
									<span>
										<a href="PurchaseList.jsp?<%= ArrayUtils.toString((Integer[]) list.toArray(new Integer[]{})) %>">
											<b><%= Constants.purchaseStatusDescription(Constants.PURCHASE_STATUS_ALL[index]) %></b>
										</a>
									</span>
<%
	}
	else
	{
		list.add(Constants.PURCHASE_STATUS_ALL[index]);
%>
									<a href="PurchaseList.jsp?<%= ArrayUtils.toString((Integer[]) list.toArray(new Integer[]{})) %>">
										<u><%= Constants.purchaseStatusDescription(Constants.PURCHASE_STATUS_ALL[index]) %></u>
									</a>
<%
	}
%>
								</div>
<%
}
%>
							</div>
						</div>
						<div class="tE-table" id="tE-cart-table">
<%
if (status.length == 0)
{
%>						
	<div class="tE-row">
		<div class="tE-cellItem tE-cell">No hay elementos para mostrar</div>
	</div>
<%
}
else
{
	Criteria criteria = Database.getCurrentSession().createCriteria(Purchase.class);
	criteria.add(Expression.in("status", status));
	criteria.addOrder(Order.asc("deliveryTime"));
	
	Iterator purchaseIterator = criteria.list().iterator();
	Purchase purchase;
	while(purchaseIterator.hasNext())
	{
		purchase = (Purchase) purchaseIterator.next();
%>						
							<div class="tE-row">
								<div class="tE-box-top tE-cellItem tE-cell"><b>Id</b></div>
								<div class="tE-box-top tE-cellItem tE-cell"><b>Hora de Entrega</b></div>
								<div class="tE-box-top tE-cellItem tE-cell"><b>Cliente</b></div>
								<div class="tE-box-top tE-cellItem tE-cell"><b>Ensalada</b></div>
								<div class="tE-box-top tE-cellItem tE-cell"><b>Postre</b></div>
								<div class="tE-box-top tE-cellItem tE-cell"><b>Otros</b></div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell"><a href="PurchaseEdit.jsp?<%= purchase.getId() %>"><u><%= purchase.getId() %></u></a></div>
								<div class="tE-cellItem tE-cell"><%= purchase.getDeliveryTime() %> hs.</div>
								<div class="tE-cellItem tE-cell"><%= purchase.getCustomer().getFullname() %></div>
								<div class="tE-cellItem tE-cell"><%= PurchaseUtil.toString(purchase) %></div>
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell"></div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell"><b>Total</b> (<%= Constants.paymentTypeDescription(purchase.getPaymentType()) %>)</div>
								<div class="tE-cellItem tE-cell"><b>Estado</b></div>
								<div class="tE-cellItem tE-cell"><b>Direcci&oacute;n</b></div>
								<div class="tE-cellItem tE-cell"><b>Comentarios</b></div>
								<div class="tE-cellItem tE-cell"><b>Fecha</b></div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell"></div>
								<div class="tE-cellItem tE-cell">$ <%= Constants.NUMBER_FORMAT.format(purchase.getTotal()) %></div>
								<div class="tE-cellItem tE-cell"><%= Constants.purchaseStatusDescription(purchase.getStatus()) %></div>
								<div class="tE-cellItem tE-cell">
									<%= purchase.getAddress().getStreet() %> 
									#<%= purchase.getAddress().getNumber() %> 
									Piso: <%= StringUtils.toString(purchase.getAddress().getFloor(), "-") %>
									Oficina: <%= StringUtils.toString(purchase.getAddress().getOffice(), "-") %>
								</div>
								<div class="tE-cellItem tE-cell"><%= StringUtils.substring(purchase.getComment(), 15, "...") %></div>
								<div class="tE-cellItem tE-cell"><%= Constants.DATE_LONG_FORMAT.format(purchase.getCreated()) %></div>
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
