<%@page import="java.io.File"%>
<%
File file = new File("log.txt");
file.createNewFile();
out.print(file.getAbsolutePath());
%>