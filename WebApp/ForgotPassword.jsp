<%@page import="java.text.MessageFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ArrayUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.MailUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.UserUtils"%>
<%
if (request.getParameter("submit") != null)
{
	WebUtils.getErrorList(request).clear();
	String email = request.getParameter("email");
	if (email == null || "".equals(email))
	{
		WebUtils.addError(request, "'eMail' es requerido");	
	}
	if (!UserUtils.validateEMail(email))
	{
		WebUtils.addError(request, "'eMail' no es valida");	
	}
	
	if (WebUtils.getErrorList(request).size() == 0)
	{
		User user = (User) Database.getCurrentSession().createCriteria(
				User.class
				)
				.add(Expression.eq("email", email))
				.uniqueResult();
		
		if (user != null)
		{
			String password = new Long(System.currentTimeMillis()).toString().substring(0, 6);
			user.setPassword((new sun.misc.BASE64Encoder()).encode(password.getBytes()));
			Database.getCurrentSession().save(user);
			
			try
			{
				String subject = Configuration.getString("MAIL_SUBJECT_FORGOT_PASSWORD");
				String text    = MessageFormat.format(
						Configuration.getString("MAIL_TEXT_FORGOT_PASSWORD"),
						new Object[]{user.getEmail(), password}
						);
				MailUtils.sendMailToUser(
						user, 
						subject,
						text
						);
			}
			catch(Exception exception)
			{
				Logger.getInstance().log(exception);
				WebUtils.addError(request, exception.getLocalizedMessage());
			}
			WebUtils.addMessage(request, "Tu nueva contraseña fue enviada por email");
			
			response.sendRedirect("index.jsp");
			return;
		}

		WebUtils.addError(request, "El email ingresado nunca fue registrado");
	}
}
%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Olvide mi Contraseña</title>
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
			<%@include file="HeaderPanel.jsp"%>
		</header>
		
		<section id="tE-banner" class="">
			<img src="img/bannerInterior_TusFavoritas.jpg">
		</section>
		
		<section id="tE-content-bg" class="tE-content-bgUp">
			<div id="tE-main-content" class="tE-cart-content">
				<div class="tE-box-content">
					<div id="cartPanel" class="tE-white-box">
						<h2>RECUPERA TU CONTRASEÑA</h2>
						<div class="tE-table" id="tE-cart-table">
							<%@include file="MessagePanel.jsp"%>
							<form id="ForgotPasswordForm" action="ForgotPassword.jsp" method="post">
								<table class="user-register" style="margin-left: 130px;">
									<tr>
										<td>eMail</td>
										<td><input type="text" name="email" value=""/></td>
									</tr>
									<tr>
										<td>
										</td>
										<td style="text-align: left;">
											<input type="submit" name="submit" value="Enviar" onclick="openProcessingPopup();">
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class="tE-white-box-bg-footer"></div>
				</div>
			</div>
		</section>
	</body>
</html>
