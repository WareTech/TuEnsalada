<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ApplicationContext"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.MailUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.SecurityManager"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="java.math.*"%>
<%@page import="java.util.*"%>

<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/script.js"></script>
<script src="js/jquery-1.8.0.min.js"></script>

<table width="100%">
	<tr id="title" style="background-color: #DCDCDC; color: #000000">
		<td align="center" valign="middle">
			<a href="<%= request.getContextPath() %>">www.TuEnsalada.com.ar</a>
		</td>
	</tr>
</table>

<%
//------------------------------------------------------------------------------------------------
List errorList = WebUtils.getErrorList(request);
if (errorList != null && errorList.size() > 0)
{
%>
<table>
<%
	Iterator errorIterator = errorList.iterator();
	String error = null;
	while (errorIterator.hasNext())
	{
		error = (String) errorIterator.next();
%>
	<tr>
		<td>
			<%=error%>
		</td>
	</tr>
<%
	}
	errorList.clear();
%>
</table>
<%
}
%>

<%
List messageList = WebUtils.getErrorList(request);
if (messageList != null && messageList.size() > 0)
{
%>
<table>
<%
	Iterator messageIterator = messageList.iterator();
	String message = null;
	while (messageIterator.hasNext())
	{
		message = (String) messageIterator.next();
%>
	<tr>
		<td>
			<%=message%>
		</td>
	</tr>
<%
	}
	messageList.clear();
%>
</table>
<%
}
// ------------------------------------------------------------------------------------------------
%>

