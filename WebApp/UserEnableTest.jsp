<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.UserUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%
String id = request.getQueryString();
User user = (User) Database.getCurrentSession().get(User.class, new Long(id));
%>
<a href="UserEnable.jsp?<%= UserUtils.encode(user) %>">Aqui!</a>
