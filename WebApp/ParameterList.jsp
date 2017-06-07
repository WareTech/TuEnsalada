<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Parameter"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
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

<%
if (request.getParameter("reload") != null)
{
	Configuration.init();
}
else if (request.getParameter("delete") != null)
{
	Long parameterId = new Long(request.getParameter("delete"));
	Parameter parameter = (Parameter) Database.getCurrentSession().get(Parameter.class, parameterId);
	Database.getCurrentSession().delete(parameter);
}
else if (request.getParameter("update") != null)
{
	Long parameterId = new Long(request.getQueryString());
	Parameter parameter = (Parameter) Database.getCurrentSession().get(Parameter.class, parameterId);
	parameter.setKey(request.getParameter("key"));
	parameter.setValue(request.getParameter("value"));
	Database.getCurrentSession().update(parameter);
}
else if (request.getParameter("create") != null)
{
	Parameter parameter = new Parameter();
	parameter.setKey(request.getParameter("key"));
	parameter.setValue(request.getParameter("value"));
	Database.getCurrentSession().save(parameter);
}
%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Tu Configuraci&oacute;n</title>
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
						<h2>CONFIGURACION</h2>
<%
if (request.getParameter("edit") == null)
{
%>
<form action="ParameterList.jsp?create" method="post">
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cellProduct tE-cell">Clave</div>
								<div class="tE-box-top tE-cellProduct tE-cell">Valor</div>
								<div class="tE-box-top tE-cellItem tE-cell">&nbsp;</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellProduct tE-cell"><input type="text" name="key" value=""></div>
								<div class="tE-cellProduct tE-cell"><input type="text" name="value" value=""></div>
								<div class="tE-cellItem tE-cell"><input class="tE-button-add tE-button" type="submit" name="create" value="Guardar"></div>
							</div>
						</div>
</form>
<%
}
else
{
	Long parameterId = new Long(request.getParameter("edit"));
	Parameter parameter = (Parameter) Database.getCurrentSession().get(Parameter.class, parameterId);
%>
<form action="ParameterList.jsp?<%= parameter.getId() %>" method="post">
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cellItem tE-cell">Id</div>
								<div class="tE-box-top tE-cellItem tE-cell">Version</div>
								<div class="tE-box-top tE-cellProduct tE-cell">Clave</div>
								<div class="tE-box-top tE-cellProduct tE-cell">Valor</div>
								<div class="tE-box-top tE-cellItem tE-cell">&nbsp;</div>
							</div>
							<div class="tE-row">
								<div class="tE-cellItem tE-cell"><%= parameter.getId() %></div>
								<div class="tE-cellItem tE-cell"><%= parameter.getVersion() %></div>
								<div class="tE-cellProduct tE-cell"><input type="text" name="key" value="<%= parameter.getKey() %>"></div>
								<div class="tE-cellProduct tE-cell"><input type="text" name="value" value="<%= parameter.getValue() %>"></div>
								<div class="tE-cellItem tE-cell"><input class="tE-button-add tE-button" type="submit" name="update" value="Guardar"></div>
							</div>
						</div>
</form>
<%
}
%>
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cellItem tE-cell">
									<a href="ParameterList.jsp?reload"><u>Actualizar la Configuraci&oacute;n</u></a>
								</div>
							</div>
						</div>
						<div class="tE-table" id="tE-cart-table">
							<div class="tE-row">
								<div class="tE-box-top tE-cellItem tE-cell">Id</div>
								<div class="tE-box-top tE-cellItem tE-cell" style="text-align: center">Version</div>
								<div class="tE-box-top tE-cellProduct tE-cell" style="width:30%">Clave</div>
								<div class="tE-box-top tE-cellItem tE-cell">Valor</div>
								<div class="tE-box-top tE-cellItem tE-cell"></div>
							</div>
<%
Iterator parameterIterator = Database.getCurrentSession().createCriteria(Parameter.class).addOrder(Order.asc("key")).list().iterator();
Parameter parameter;
while(parameterIterator.hasNext())
{
	parameter = (Parameter) parameterIterator.next();
%>						
							<div class="tE-row">
								<div class="tE-cellItem tE-cell"><b><%= parameter.getId() %></b></div>
								<div class="tE-cellItem tE-cell"><%= parameter.getVersion() %></div>
								<div class="tE-cellItem tE-cell" title="<%= parameter.getKey() %>"><%= StringUtils.substring(parameter.getKey(), 30, "&nbsp;...") %></div>
								<div class="tE-cellItem tE-cell" title="<%= parameter.getValue() %>"><%= StringUtils.substring(parameter.getValue(), 30, "&nbsp;...") %></div>
								<div class="tE-cellButton tE-cell">
									<a href="ParameterList.jsp?edit=<%= parameter.getId() %>"><input class="btEditItem" type="button" value=""></a>
									<a href="ParameterList.jsp?delete=<%= parameter.getId() %>" onclick="return confirm('Estas seguro de borrar el registro #<%= parameter.getId() %>?');"><input type="button" value="x"></a>
								</div>
							</div>
<%
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
