<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Giftcard"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.*"%>
<%
String giftcard = request.getParameter("giftcard");
if (giftcard == null)
{
	out.print("<error>giftcard required</error>");
	return;
}

if ("".equals(giftcard))
{
	out.print("<error>giftcard required</error>");
	return;
}

Cart cart =  WebUtils.getCart(request);
cart.removeGiftcard(new Long(giftcard).longValue());
cart.calculateTotal();

out.print("<success>");	
out.print(giftcard);	
out.print("</success>");	
%>