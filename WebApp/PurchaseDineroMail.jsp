<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.MailUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Purchase"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%
try
{
	String address      = request.getParameter("address");
	String deliveryTime = request.getParameter("deliveryTime");
	String comment      = request.getParameter("comment");
	
	User user = WebUtils.getUser(request);
	Cart cart = WebUtils.getCart(request);
	Purchase purchase = PurchaseUtil.pay(
			user, 
			cart, 
			Constants.PAYMEMNT_TYPE_DINERO_MAIL,
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
%>
<form action='https://argentina.dineromail.com/Shop/Shop_Ingreso.asp' method='post'> 
	<input type='hidden' name='NombreItem' value='<%= 
		MessageFormat.format(
				Configuration.getString("DineroMail_NombreItem"), 
				new Object[]{
					purchase.getId(), 
					purchase.getCustomer().getFullname(), 
					Constants.DATE_LONG_FORMAT.format(purchase.getCreated()),
				 	"$ " + Constants.NUMBER_FORMAT.format(purchase.getTotal()),
				 	purchase.getComment(),
				 	PurchaseUtil.toString(purchase)
					}
				) 
		%>'> 
	<input type='hidden' name='TipoMoneda' value='<%= Configuration.getString("DineroMail_TipoMoneda") %>'> 
	<input type='hidden' name='PrecioItem' value='<%= purchase.getTotal() %>'> 
	<input type='hidden' name='E_Comercio' value='<%= Configuration.getString("DineroMail_E_Comercio") %>'> 
	<input type='hidden' name='NroItem' value='<%= Configuration.getString("DineroMail_NroItem") %>'> 
	<input type='hidden' name='image_url' value='<%= Configuration.getString("DineroMail_image_url") %>'> 
	<input type='hidden' name='DireccionExito' value='http://www.tuensalada.com.ar/site/PaymentSuccess.jsp'> 
	<input type='hidden' name='DireccionFracaso' value='http://www.tuensalada.com.ar/site/PaymentFail.jsp'> 
	<input type='hidden' name='DireccionEnvio' value='<%= Configuration.getString("DineroMail_DireccionEnvio") %>'> 
	<input type='hidden' name='Mensaje' value='<%= Configuration.getString("DineroMail_Mensaje") %>'> 
</form>
<%
}
catch(Exception exception)
{
	WebUtils.addError(request, exception.getLocalizedMessage());
	exception.printStackTrace();
	Logger.getInstance().log(exception);
}
%>