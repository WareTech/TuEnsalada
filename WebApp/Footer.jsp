<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>

<table width="100%">
	<tr id="title" style="background-color: #DCDCDC; color: #000000">
		<td align="center" valign="middle">
<%
User _USER = WebUtils.getUser(request);
if (_USER != null)
{
%>
			<a href="UserEdit.jsp?user=<%=_USER.getId()%>"><%=_USER.getFirstname()%>&nbsp;<%=_USER.getLastname()%></a>&nbsp;
			|&nbsp;
			<a href="Logout.jsp">Salir</a>&nbsp;
<%
}
else
{
%>
			<a href="Login.jsp">Ingresar</a>&nbsp;
			|&nbsp;
			<a href="UserRegister.jsp">Registrarse</a>&nbsp;
<%
}
%>
		</td>
	</tr>
</table>

