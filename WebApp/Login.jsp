<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.UserUtils"%>
<%@page import="java.util.Iterator"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%
if (request.getParameter("login") != null)
{
	WebUtils.getErrorList(request).clear();
	String email = request.getParameter("email");
	if (email == null || "".equals(email))
	{
		WebUtils.addError(request, "'EMail' es requerido");
	}
	if (!UserUtils.validateEMail(email))
	{
		WebUtils.addError(request, "'eMail' no es valida");	
	}
	
	String password = request.getParameter("password");
	if (password == null || "".equals(password))
	{
		WebUtils.addError(request, "'Contraseña' es requerido");	
	}
	
	if (WebUtils.getErrorList(request).size() == 0)
	{
		User user = (User) Database.getCurrentSession().createCriteria(
			User.class
			)
			.add(Expression.eq("email", email))
			.add(Expression.eq("password", (new sun.misc.BASE64Encoder()).encode(password.getBytes())))
			.add(Expression.eq("status", Constants.USER_STATUS_APPROVED))
			.uniqueResult();

		if (user != null)
		{
			session.setAttribute(User.class.getName(), user);
			response.sendRedirect(
					WebUtils.nextStep(
							request,
							"index.jsp"
							)
					);
			return;
		}

		WebUtils.addError(request, "Login incorrecto");
	}
}
%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Login</title>
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
						<h2>INGRESA A TU ENSALADA</h2>
						<div class="tE-table" id="tE-cart-table">
							<%@include file="MessagePanel.jsp"%>
							<form id="LoginForm" action="Login.jsp" method="post">
								<table class="user-register" style="margin-left: 150px;">
									<tr>
										<td>eMail</td>
										<td><input type="text" id="email" name="email" value=""/></td>
									</tr>
									<tr>
										<td>Contraseña</td>
										<td><input type="password" name="password" value=""/></td>
									</tr>
									<tr>
										<td>
										</td>
										<td style="text-align: left;">
											<input type="submit" name="login" value="Ingresar" onclick="openProcessingPopup();">
										</td>
									</tr>
									<tr style="height: 40px">
										<td colspan="2" style="vertical-align: bottom;">	
											<a href="ForgotPassword.jsp"><u>Olvid&eacute; mi contraseña...</u></a>
											&nbsp;|&nbsp;
											<a href="UserRegister.jsp"><u>Quiero registrarme...</u></a><br>
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
