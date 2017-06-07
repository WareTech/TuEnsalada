<%@page import="org.json.simple.JSONObject"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.User"%>
<%
User user = WebUtils.getUser(request);

JSONObject jsonObject = new JSONObject();
if (user == null)
{
	jsonObject.put("result", "0");	
}
else
{
	jsonObject.put("result", "1");
	jsonObject.put("id", user.getId());
	jsonObject.put("firstname", user.getFirstname());
	jsonObject.put("lastname", user.getLastname());
	jsonObject.put("fullname", user.getFullname());
	jsonObject.put("email", user.getEmail());
}

out.print("(");	
out.print(jsonObject.toJSONString());	
out.print(")");	

%>
