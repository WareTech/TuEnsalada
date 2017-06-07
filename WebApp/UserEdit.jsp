<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="org.hibernate.Criteria"%>

<%
boolean authorized = WebUtils.checkAuthorization(request, "UserEdit.jsp!update");

String userId = request.getQueryString();
User user = (User) Database.getCurrentSession().get(User.class, new Long(userId));

Access access;
UserAccess userAccess;
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
String password = request.getParameter("password");
String passwordConfirm = request.getParameter("passwordConfirm");
String status = request.getParameter("status");
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
	if (status == null || "".equals(status))
	{
		WebUtils.addError(request, "'Estado' es requerido");
	}
	
	if (WebUtils.getErrorList(request).size() == 0)
	{
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setEmail(email);
		user.setPassword((new sun.misc.BASE64Encoder()).encode(password.getBytes()));
		user.setStatus(new Integer(status));
		Database.getCurrentSession().update(user);
		Database.getCurrentSession().flush();
		
		WebUtils.addMessage(request, "Usuario actualizado correctamente");
		
		if (user.getEmail() != null && !"".equals(user.getEmail()))
		{
    		String text = new StringBuffer()
			.append("Su usuario de TuEnsalada ha sido actualizado. Los nuevos datos son:\n")
			.append("Nombre: ").append(user.getFirstname()).append("\n")
			.append("Apellido: ").append(user.getLastname()).append("\n")
			.append("eMail: ").append(user.getEmail()).append("\n")
			.append("Clave: ").append(password).append("\n")
			.append("Acceda a TuEnsalada a través de http://www.TuEnsalada.com.ar\n")
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
}
else if (request.getParameter("add") != null && request.getParameterMap().get("toAddAccessList") != null)
{
	String[] accessIdArray = (String[]) request.getParameterMap().get("toAddAccessList");
	for(
	int index = 0; 
	index < accessIdArray.length; 
	index++
	)
	{
		access = (Access) Database.getCurrentSession().get(Access.class, new Long(accessIdArray[index]));
		userAccess = new UserAccess();
		userAccess.setUser(user);
		userAccess.setAccess(access);
		Database.getCurrentSession().save(userAccess);
	}
	Database.getCurrentSession().flush();
}
else if (request.getParameter("remove") != null && request.getParameterMap().get("toRemoveAccessList") != null)
{
	String[] accessIdArray = (String[]) request.getParameterMap().get("toRemoveAccessList");
	for(
	int index = 0; 
	index < accessIdArray.length; 
	index++
	)
	{
		userAccess = (UserAccess) Database.getCurrentSession().get(UserAccess.class, new Long(accessIdArray[index]));
		Database.getCurrentSession().delete(userAccess);
	}
	Database.getCurrentSession().flush();
}
else if (request.getParameter("addAll") != null)
{
	Criteria accessCriteria = Database.getCurrentSession().createCriteria(Access.class);
	
	List accessList = Database.getCurrentSession().createQuery(
	"SELECT access.id FROM UserAccess WHERE user = :user"
	)
	.setEntity("user", user)
	.list();
	if (accessList.size() > 0)
	{
		accessCriteria.add(Expression.not(Expression.in("id", accessList)));
	}
	Iterator accessIterator = accessCriteria.list().iterator();
	
	while(accessIterator.hasNext())
	{
		access = (Access) accessIterator.next();
		userAccess = new UserAccess();
		userAccess.setUser(user);
		userAccess.setAccess(access);
		Database.getCurrentSession().save(userAccess);
	}
	Database.getCurrentSession().flush();
}
else if (request.getParameter("removeAll") != null)
{
	Iterator userAccessIterator = Database.getCurrentSession().createCriteria(
	UserAccess.class
	)
	.add(Expression.eq("user", user))
	.list()
	.iterator();
	while(userAccessIterator.hasNext())
	{
		userAccess = (UserAccess) userAccessIterator.next();
		Database.getCurrentSession().delete(userAccess);
	}
	Database.getCurrentSession().flush();
}
%>
<%
User loggedUser = WebUtils.getUser(request);

int colspan = 2;
int rouwCount = 0;
%>
<html>
	<head>
	    <title>User Edit</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="UserEdit.jsp?<%= user.getId() %>" method="post">
			<table width="100%">
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Nombre
					</td>
					<td id="name">
						<input type="text" name="firstname" value="<%= firstname == null ? user == null ? "" : user.getFirstname() : firstname %>" <%= authorized || (user != null && loggedUser.getId().longValue() == user.getId().longValue()) ? "" : "disabled" %>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Apellido
					</td>
					<td id="name">
						<input type="text" name="lastname" value="<%= lastname == null ? user == null ?  "" : user.getLastname() : lastname %>" <%=authorized || (user != null && loggedUser.getId().longValue() == user.getId().longValue()) ? "" : "disabled" %>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						eMail
					</td>
					<td id="name">
						<input type="name" name="email" value="<%= email == null ? user == null ? "" : user.getEmail() : email %>" size="50" <%=authorized || (user != null && loggedUser.getId().longValue() == user.getId().longValue()) ? "" : "disabled"%>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Clave
					</td>
					<td id="name">
						<input type="password" name="password" value="" <%= authorized || (user != null && loggedUser.getId().longValue() == user.getId().longValue()) ? "" : "disabled"%>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Confirm&aacute; tu clave
					</td>
					<td id="name">
						<input type="password" name="passwordConfirm" value="" <%= authorized || (user != null && loggedUser.getId().longValue() == user.getId().longValue()) ? "" : "disabled"%>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Estado
					</td>
					<td id="name">
						<select name="status">
<%
for(int index = 0; index < Constants.USER_STATUS_ALL.length; index++)
{
%>
							<option value="<%= Constants.USER_STATUS_ALL[index] %>" <%= status != null && Constants.USER_STATUS_ALL[index].toString().equals(status) ? "selected" : user != null && user.getStatus().equals(Constants.USER_STATUS_ALL[index]) ? "selected" : ""  %>>
								<%= Configuration.getString("USER_STATUS_" + index) %>
							</option>
<%
}
%>						
						</select>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="save"
							value="Guardar"
							<%=authorized || (user != null && loggedUser.getId().longValue() == user.getId().longValue()) ? "" : "disabled"%>
							/>
					</td>
				</tr>
			</table>
<%
if (user != null)
{
%>
			<table width="100%">
				<tr id="gridHeader">
					<td colspan="3" align="left">
						Accessos
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td width="45%">Disponibles</td>
					<td width="10%">&nbsp;</td>
					<td width="45%">Asignados</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td>
						<select name="toAddAccessList" size="10" style="overflow:auto; width:100%;" multiple="multiple" <%=authorized ? "" : "disabled"%>>
<%
	List userAccessList = Database.getCurrentSession().createCriteria(
			UserAccess.class
			)
			.add(Expression.eq("user", user))
			.list();
	Criteria accessCriteria = Database.getCurrentSession().createCriteria(Access.class);
	if (userAccessList.size() > 0)
	{
		Iterator userAccessIterator = userAccessList.iterator();
		while(userAccessIterator.hasNext())
		{
			userAccess = (UserAccess) userAccessIterator.next();
			accessCriteria.add(Expression.ne("id", userAccess.getAccess().getId()));
		}
	}
	Iterator accessIterator = accessCriteria.list().iterator();
	while(accessIterator.hasNext())
	{
		access = (Access) accessIterator.next();
%>
						    <option value="<%=access.getId()%>">
						    	<%=access.getDescription()%>&nbsp;(<%=access.getValue()%>)
						    </option>
<%
	}
%>
						</select>
					</td>
					<td>
						<table width="100%">
							<tr>
								<td align="center">
									<input type="submit" name="add" value="&gt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="remove" value="&lt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
							<tr>
								<td align="center">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="addAll" value="&gt;&gt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="removeAll" value="&lt;&lt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<select name="toRemoveAccessList" size="10" style="overflow:auto; width:100%;" multiple="multiple" <%=authorized ? "" : "disabled"%>>
<%
	Iterator userAccessIterator = userAccessList.iterator();
	while(userAccessIterator.hasNext())
	{
		userAccess = (UserAccess) userAccessIterator.next();
%>
						    <option value="<%=userAccess.getId()%>">
						    	<%=userAccess.getAccess().getDescription()%>&nbsp;(<%=userAccess.getAccess().getValue()%>)
						    </option>
<%
	}
%>
						</select>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
			</table>
<%
}
%>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>
