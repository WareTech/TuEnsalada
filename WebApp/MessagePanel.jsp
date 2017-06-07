<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="java.util.Iterator"%>

<%
StringBuffer html = new StringBuffer();
Iterator messageIterator = WebUtils.getMessageList(request).iterator();
String message;
while (messageIterator.hasNext())
{
	message = (String) messageIterator.next();
	html.append("<li class='info'>");
	html.append(message);
	html.append("</li>");
}
WebUtils.getMessageList(request).clear();

Iterator errorIterator = WebUtils.getErrorList(request).iterator();
String error;
while (errorIterator.hasNext())
{
	error = (String) errorIterator.next();
	html.append("<li class='error'>");
	html.append(error);
	html.append("</li>");
}
WebUtils.getErrorList(request).clear();

if (html.length() > 0)
{
%>
<script>
showError("<ul><%= html %></ul>");
</script>
<%
}
%>
