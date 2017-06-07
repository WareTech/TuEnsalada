<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="java.util.Iterator"%>
<%
Iterator errorIterator = WebUtils.getErrorList(request).iterator();
String error;
StringBuffer html = new StringBuffer();
while (errorIterator.hasNext())
{
	error = (String) errorIterator.next();
	html.append("<span>");
	html.append(error);
	html.append("</span>");
}
WebUtils.getErrorList(request).clear();

if (html.length() > 0)
{
%>
<script>
showError("<%= html %>");
</script>
<%
}
%>

