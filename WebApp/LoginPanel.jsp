<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<div id="LoginDialog" title="Ingresa!" style="display:none">
	<form  id="LoginForm">
		<table>
			<tr>
				<td>eMail</td>
				<td><input type="text" id="email" name="email" value=""/></td>
			</tr>
			<tr>
				<td>Clave</td>
				<td><input type="password" id="password" name="password" value=""/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input 
						type="button"
						id="login"
						name="login"
						class="tE-button-save tE-button"
						value="Ingresar"
						onclick="doLogin()"
						/>
					&nbsp;|&nbsp;
					<a href="ForgotPassword.jsp" ><i>Olvid&eacute; mi clave ...</i></a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="tE-header-login"">
<%
User _USER = WebUtils.getUser(request);
if (_USER == null)
{
%>
		<ul>
			<li><a onclick="openProcessingPopup()" href="Login.jsp">Ingresar</a></li>
			<li>|</li>
			<li><a onclick="openProcessingPopup()" href="UserRegister.jsp">Registrarse</a></li>
		</ul>
<%
}
else
{
%>
	<div id="tE-header-user">
		<span><%= _USER.getFirstname() %> <%= _USER.getLastname() %></span>	
		<ul>
			<li><a href="UserEdit.jsp?<%=_USER.getId()%>">Editar</a></li>
			<li>|</li>
			<li><a href="Logout.jsp">Cerrar Sesi&oacute;n</a></li>
			<li><img style="margin-left:5px;" src="img/candado.png"></li>
		</ul>
	</div>
	<div id="tE-header-userPic">
		<img src="img/userPic.png" style="top: -33px;" title="User">
	</div>
<%
}
%>
</div>
