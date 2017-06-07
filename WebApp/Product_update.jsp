<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%
Product product = (Product) Database.getCurrentSession().get(Product.class, new Long(request.getParameter("product")));
product.setName(request.getParameter("name"));
product.setDescription(request.getParameter("description"));
product.setPrice(new Double(Constants.NUMBER_FORMAT.parse(request.getParameter("price")).doubleValue()));
product.setCalories(new Integer(request.getParameter("calories")));
product.setStatus(new Integer(request.getParameter("status")));
Database.getCurrentSession().saveOrUpdate(product);
	
WebUtils.addMessage(request, "Producto actualizado correctamente");
%>