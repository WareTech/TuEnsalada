<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%
WebUtils.getErrorList(request).clear();

String email = request.getParameter("email");
if (email == null || "".equals(email))
{
	WebUtils.addError(request, "'EMail' es requerido");
}

String password = request.getParameter("password");
if (password == null || "".equals(password))
{
	WebUtils.addError(request, "'Clave' es requerido");	
}

if (WebUtils.getErrorList(request).size() == 0)
{
	User user = (User) Database.getCurrentSession().createCriteria(User.class)
		.add(Expression.eq("email", email))
		.add(Expression.eq("password", (new sun.misc.BASE64Encoder()).encode(password.getBytes())))
		.add(Expression.eq("status", Constants.USER_STATUS_APPROVED))
		.uniqueResult();

	if (user != null)
	{
		session.setAttribute(User.class.getName(), user);
		out.print("true");
		return;
	}
	
	WebUtils.addError(request, "Login incorrecto");
}
out.print("false");
%>
