<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Giftcard"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.*"%>
<%
JSONObject jsonObject = new JSONObject();
try
{
	String giftcardCode = request.getParameter("giftcard");
	if (giftcardCode == null)
	{
		jsonObject.put("result", "-1");	
		jsonObject.put("message", "El codigo no puede ser vacio");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	
	if ("".equals(giftcardCode))
	{
		jsonObject.put("result", "-1");	
		jsonObject.put("message", "El codigo no puede ser vacio");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	
	Giftcard giftcard = (Giftcard) Database.getCurrentSession().createCriteria(Giftcard.class)
			.add(Expression.eq("code", giftcardCode))
			.uniqueResult();
	
	if (giftcard == null)
	{
		jsonObject.put("result", "-1");	
		jsonObject.put("message", "El codigo es incorrecto");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}

	Cart cart = WebUtils.getCart(request);
	cart.addGiftcard(giftcard);
	cart.calculateTotal();
	
	jsonObject.put("result", "1");	
	jsonObject.put("message", "Giftcard cargada correctamente");
	jsonObject.put("cartTotal", cart.getTotal());
	out.print("(");
	out.print(jsonObject.toJSONString());
	out.print(")");
}
catch(Exception exception)
{
	Logger.getInstance().log(exception);
	Database.getCurrentSession().getTransaction().rollback();
	Database.getCurrentSession().flush();
}
%>