<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Date"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%
Product product = new Product();
product.setName(request.getParameter("name"));
product.setDescription(request.getParameter("description"));
product.setType(new Integer(request.getParameter("type")));
product.setPrice(new Double(Constants.NUMBER_FORMAT.parse(request.getParameter("price")).doubleValue()));
product.setStatus(new Integer(request.getParameter("status")));
if (request.getParameter("calories") != null)
{
	product.setCalories(new Integer(request.getParameter("calories")));
}
product.setCreated(new Date());
Database.getCurrentSession().saveOrUpdate(product);

JSONObject jsonObject = new JSONObject();
jsonObject.put("id", product.getId());	
jsonObject.put("name", product.getName());	
jsonObject.put("description", product.getDescription());	
jsonObject.put("type", product.getType());	
jsonObject.put("price", Constants.NUMBER_FORMAT.format(product.getPrice()));	
jsonObject.put("status", product.getStatus());	
jsonObject.put("created", Constants.DATE_LONG_FORMAT.format(product.getCreated()));	
out.print(jsonObject.toJSONString());

WebUtils.addMessage(request, "Producto creado correctamente");
%>