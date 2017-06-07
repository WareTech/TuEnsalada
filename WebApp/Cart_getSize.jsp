<%@page import="org.json.simple.JSONObject"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%
Cart cart = WebUtils.getCart(request);

JSONObject jsonObject = new JSONObject();
jsonObject.put("result", "1");
jsonObject.put("cartSize", Integer.toString(cart.getProducts().size()));

out.print("(");	
out.print(jsonObject.toJSONString());	
out.print(")");	
%>