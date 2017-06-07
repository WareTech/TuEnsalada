<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.UserUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="org.hibernate.Criteria"%>

<%
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
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
	email = email.toLowerCase();
	if (password == null || "".equals(password))
	{
		WebUtils.addError(request, "'Clave' es requerido");
	}
	password = password.trim();
	if (password.length() < 8)
	{
		WebUtils.addError(request, "'Clave' debe ser de al menos 8 caracteres");
	}
	if (passwordConfirm == null || "".equals(passwordConfirm))
	{
		WebUtils.addError(request, "'Confirmá tu clave' es requerido");
	}
	passwordConfirm = passwordConfirm.trim();
	if (password != null && passwordConfirm != null && !password.equals(passwordConfirm))
	{
		WebUtils.addError(request, "Las calves deben coincidir");
	}
	
	if (WebUtils.getErrorList(request).size() == 0)
	{
		User user = new User();
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setEmail(email);
		user.setPassword((new sun.misc.BASE64Encoder()).encode(password.getBytes()));
		user.setStatus(Constants.USER_STATUS_APPROVED);
		user.setCreated(new Date());
		Database.getCurrentSession().save(user);
		
		WebUtils.addMessage(request, "Usuario actualizado correctamente");
		
   		String text = new StringBuffer()
			.append("Su usuario de TuEnsalada ha sido actualizado. ")
			.append("Para activarlo, por favor acceda a ")
			.append("<http://www.tuensalada.com.ar/site/UserEnable.jsp?")
			.append(UserUtils.encode(user))
			.append("> en las proximas 24hs")
			.toString();
   	
   		try
   		{
			MailUtils.sendMailToUser(
				user, 
				"TuEnsalada - Actualización de usuario",
				text
				);
	   		}
   		catch(Exception exception)
   		{
   			WebUtils.addError(request, exception.getLocalizedMessage());
   		}
	}
}
%>
<%
int colspan = 2;
int rouwCount = 0;
%>
<html>
	<head>
	    <title>User Create</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="UserCreate.jsp" method="post">
			<table width="100%">
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Nombre
					</td>
					<td id="name">
						<input type="text" name="firstname" value="<%= firstname == null ? "" : firstname %>"/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Apellido
					</td>
					<td id="name">
						<input type="text" name="lastname" value="<%= lastname == null ? "" : lastname %>"/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						eMail
					</td>
					<td id="name">
						<input type="name" name="email" value="<%= email == null ? "" : email %>" size="50"/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Clave
					</td>
					<td id="name">
						<input type="password" name="password" value=""/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Confirm&aacute; tu clave
					</td>
					<td id="name">
						<input type="password" name="passwordConfirm" value=""/>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="save"
							value="Guardar"
							/>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>
