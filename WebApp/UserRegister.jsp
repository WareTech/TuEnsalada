<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ArrayUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.MailUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.UserUtils"%>
<%
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
String emailConfirm = request.getParameter("emailConfirm");
String password = request.getParameter("password");
String passwordConfirm = request.getParameter("passwordConfirm");

if (request.getParameter("save") != null)
{
	if (firstname == null || "".equals(firstname))
	{
		WebUtils.addError(request, "'Nombre' es requerido");
	}
	if (lastname == null || "".equals(lastname))
	{
		WebUtils.addError(request, "'Apellido' es requerido");
	}
	if (email == null || "".equals(email))
	{
		WebUtils.addError(request, "'eMail' es requerido");
	}
	email = email.trim().toLowerCase();
	if (!UserUtils.validateEMail(email))
	{
		WebUtils.addError(request, "'eMail' no es valido");
	}
	if (emailConfirm == null || "".equals(emailConfirm))
	{
		WebUtils.addError(request, "'Repet&iacute; tu eMail' es requerido");
	}
	emailConfirm = emailConfirm.trim().toLowerCase();
	if (!UserUtils.validateEMail(emailConfirm))
	{
		WebUtils.addError(request, "'Repet&iacute; tu eMail' no es valido");
	}
	if (email != null && emailConfirm != null && !email.equals(emailConfirm))
	{
		WebUtils.addError(request, "Los eMails deben coincidir");
	}
	if (password == null || "".equals(password))
	{
		WebUtils.addError(request, "'Contraseña' es requerido");
	}
	password = password.trim();
	if (password.length() < 8)
	{
		WebUtils.addError(request, "'Contraseña' debe ser de al menos 8 caracteres");
	}
	if (passwordConfirm == null || "".equals(passwordConfirm))
	{
		WebUtils.addError(request, "'Repetí tu contraseña' es requerido");
	}
	passwordConfirm = passwordConfirm.trim();
	if (password != null && passwordConfirm != null && !password.equals(passwordConfirm))
	{
		WebUtils.addError(request, "Las calves deben coincidir");
	}
	
	if (WebUtils.getErrorList(request).size() == 0)
	{
		User user = (User) Database.getCurrentSession().createCriteria(User.class)
				.add(Expression.eq("email", email))
				.uniqueResult();
		
		if (user != null)
		{
			WebUtils.addError(request, "Ya existe un usuario registardo con ese email");
		}
		else
		{
			user = new User();
			user.setFirstname(firstname);
			user.setLastname(lastname);
			user.setEmail(email);
			user.setPassword((new sun.misc.BASE64Encoder()).encode(password.getBytes()));
			user.setStatus(Constants.USER_STATUS_APPROVED);
			user.setCreated(new Date());
			
			Database.getCurrentSession().save(user);
			
			WebUtils.addMessage(request, "Tu usuario fue registrado. Bienvenido a Tu Ensalada!");
			
    		String subject = Configuration.getString("MAIL_SUBJECT_USER_ACTIVATE");
    	    String text = MessageFormat.format(
    	    		Configuration.getString("MAIL_TEXT_USER_ACTIVATE"),
    				new Object[]{UserUtils.encode(user)}
    				);
	    	
    		try
    		{
				MailUtils.sendMailToUser(
					user, 
					subject,
					text
					);
    		}
    		catch(Exception exception)
    		{
    			WebUtils.addError(request, exception.getLocalizedMessage());
    		}
    		
			response.sendRedirect("Login.jsp");
			return;
		}
	}
}
%>
<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Nuevo Uuuario</title>
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
						<h2>REGISTRA TU USUARIO</h2>
						<div class="tE-table" id="tE-cart-table">
							<%@include file="MessagePanel.jsp"%>
							<form id="UserRegisterForm" action="UserRegister.jsp" method="post">
								<table class="user-register" style="width: 100%; margin-left: -50px;">
									<tr>
										<td>Nombre</td>
										<td><input class="input-error" type="text" name="firstname" value="<%= firstname == null ? "" : firstname %>"/></td>
										<td>Apellido</td>
										<td><input type="text" name="lastname" value="<%= lastname == null ? "" : lastname %>"/></td>
									</tr>
									<tr>
										<td>eMail</td>
										<td><input type="text" name="email" value="<%= email == null ? "" : email %>"/></td>
										<td>Repet&iacute; tu eMail</td>
										<td><input type="text" name="emailConfirm" value="<%= emailConfirm == null ? "" : emailConfirm %>"/></td>
									</tr>
									<tr>
										<td>Contraseña</td>
										<td><input type="password" name="password" value=""/></td>
										<td>Repet&iacute; tu contraseña</td>
										<td><input type="password" name="passwordConfirm" value=""/></td>
									</tr>
									<tr>
										<td colspan="2"></td>
										<td style="text-align: left;">
											<input type="submit" name="save" value="Enviar" onclick="openProcessingPopup();">
										</td>
										<td></td>
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
