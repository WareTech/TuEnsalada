<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.*"%>
<%
JSONObject jsonObject = new JSONObject();
try
{
	String saladName = request.getParameter("saladName");
	
	Product product = WebUtils.getProduct(request); 
	if (product.ingredientCount() > 0 && product.ingredientCount() < 6)
	{
		jsonObject.put("result", "-1");
		jsonObject.put("message", "Debe seleccionar exactamente 6 ingredientes");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	
	if (product.getAbstractParamaterMap().get(Constants.PRODUCT_TYPE_DRINK.toString()) != null)
	{
		jsonObject.put("result", "-1");
		jsonObject.put("message", "No te olvides de elegir una bebida para tu menú!");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	
	if (product.getAbstractParamaterMap().get(Constants.PRODUCT_TYPE_DESSERT.toString()) != null)
	{
		jsonObject.put("result", "-1");
		jsonObject.put("message", "No te olvides de elegir una postre para tu menú!");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	
	User user = WebUtils.getUser(request);
	if (saladName == null)
	{
		product.setName(user.getFullname());
	}
	else
	{
		product.setName(saladName);
	}
	product.setCreated(new Date());
	product.setType(Constants.PRODUCT_TYPE_SALAD);
	product.setUser(user);
	product.calculatePrice();

	Cart cart = WebUtils.getCart(request);
	cart.addProduct(product);
	cart.calculateTotal();
	WebUtils.clearProduct(request);
	
	jsonObject.put("result", "1");
	jsonObject.put("cartSize", Integer.toString(cart.getProducts().size()));
	jsonObject.put("message", "Tu Ensalada fue agregada a Tu Carrito!");

	out.print("(");	
	out.print(jsonObject.toJSONString());	
	out.print(")");	
}
catch(Exception exception)
{
	Logger.getInstance().log(exception);
	jsonObject.put("result", "-1");
	jsonObject.put("message", exception.getLocalizedMessage());
	out.print("(");
	out.print(jsonObject.toJSONString());
	out.print(")");
}
%>