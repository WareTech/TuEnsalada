<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.UserUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>

<%
String message;
String encodedUser = request.getQueryString();
User user = UserUtils.decode(encodedUser);
if (user == null)
{
	message = "USER_REGISTRATION_VALIDATION_FAIL";
}
else
{
	user = (User) Database.getCurrentSession().get(User.class, user.getId());
	
	if (user == null)
	{
		message = "USER_REGISTRATION_VALIDATION_FAIL";
	}
	else
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(user.getCreated());
		calendar.add(Calendar.DATE, 1);
			
		if (calendar.getTime().getTime() < new Date().getTime())
		{
			message = "USER_REGISTRATION_VALIDATION_OUTDATED";
		}
		else
		{
			message = "USER_REGISTRATION_VALIDATION_OK";
			user.setStatus(Constants.PURCHASE_STATUS_DELIVERED);
			Database.getCurrentSession().update(user);
		}
	}
}
%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Activa Tu Usuario</title>
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
						<h2>ACTIVA TU USUARIO</h2>
						<div class="tE-table" id="tE-cart-table">
							<table class="user-register" style="width: 100%;">
								<tr>
									<td colspan="4"  style="text-align: center; color: red; font-weight: bold;">
										<%= Configuration.getString(message) %>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="tE-white-box-bg-footer"></div>
				</div>
			</div>
		</section>
	</body>
</html>
