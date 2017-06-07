<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.MailUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Purchase"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%
String address      = request.getParameter("address");
String deliveryTime = request.getParameter("deliveryTime");
String comment      = request.getParameter("comment");

User user = WebUtils.getUser(request);
Cart cart = WebUtils.getCart(request);
Purchase purchase = PurchaseUtil.pay(
		user, 
		cart, 
		Constants.PAYMEMNT_TYPE_CASH,
		new Long(address),
		deliveryTime,
		comment
		);

cart.clear();

if (purchase == null)
{
	return;
}
else
{
	String subject = MessageFormat.format(
		Configuration.getString("Purchase_mail_subject"), 
		new Object[]{
			purchase.getId(), 
			purchase.getCustomer().getFullname(), 
			Constants.DATE_LONG_FORMAT.format(purchase.getCreated()),
		 	"$ " + Constants.NUMBER_FORMAT.format(purchase.getTotal()),
		 	purchase.getComment(),
		 	PurchaseUtil.toString(purchase)
			}
		); 
	String body = MessageFormat.format(
		Configuration.getString("Purchase_mail_body"), 
		new Object[]{
			purchase.getId(), 
			purchase.getCustomer().getFullname(), 
			Constants.DATE_LONG_FORMAT.format(purchase.getCreated()),
		 	"$ " + Constants.NUMBER_FORMAT.format(purchase.getTotal()),
		 	purchase.getComment(),
		 	PurchaseUtil.toString(purchase)
			}
		); 
	try
	{
		MailUtils.sendMailToUser(
			user, 
			subject,
			body
			);
	}
	catch(Exception exception)
	{
		WebUtils.addError(request, exception.getLocalizedMessage());
		exception.printStackTrace();
		Logger.getInstance().log(exception);
	}
}
out.print("PurchaseView.jsp?" + purchase.getId());
%>