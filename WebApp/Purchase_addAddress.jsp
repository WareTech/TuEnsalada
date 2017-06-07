<%@page import="java.util.Date"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.StringUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Address"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%
User user = WebUtils.getUser(request);

String street = request.getParameter("street");
String number = request.getParameter("number");
String floor  = request.getParameter("floor");
String office = request.getParameter("office");

Address address = new Address();
address.setCustomer(user);
address.setStreet(street);
address.setNumber(number);
address.setFloor(floor);
address.setOffice(office);
address.setCreated(new Date());

Database.getCurrentSession().save(address);
%>							
<div class="tE-row">
	<div class="tE-cellItem tE-cell">
		<input type="radio" name="address" value="<%= address.getId() %>">
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
		<input type="button" value="x" onclick="Purchase_removeAddress(<%= address.getId() %>)">
	</div>
</div>
