<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>

<%
//------------------------------------------------------------------------------------------------
List errorList = WebUtils.getErrorList(request);
System.out.println(errorList);
if (errorList != null && errorList.size() > 0)
{
%>
<table id="errorList">
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
List messageList = WebUtils.getMessageList(request);
System.out.println(messageList);
if (messageList != null && messageList.size() > 0)
{
%>
<table id="messageList">
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
%>

