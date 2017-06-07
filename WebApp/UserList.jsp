<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%
int colspan = 1;

Criteria userCriteria = Database.getCurrentSession().createCriteria(User.class);
userCriteria.addOrder(Order.asc("lastname")).addOrder(Order.asc("firstname"));
List userList = userCriteria.list();
%>
<html>
	<head>
	    <title>User List</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="" method="post">
			<table width="100%">
				<tr>
					<td>
						Usuario
					</td>
				</tr>
<%
if (userList.size() == 0)
{
%>
				<tr id="gridRow1">
					<td colspan="<%=colspan%>">
						No hay elementos
					</td>
				</tr>	
<%
}
else
{
	Iterator userIterator = userList.iterator();
	User user = null;
	int userCount = 0;	
	while (userIterator.hasNext())
	{
		user = (User) userIterator.next();
%>
				<tr>
					<td>
						<a href="UserEdit.jsp?<%=user.getId()%>"><%=user.getLastname()%>,&nbsp;<%=user.getFirstname()%></a>
					</td>
				</tr>
<%
	}
}
%>
				<tr>
					<td>
						<a href="UserCreate.jsp">Nuevo ...</a>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>
