<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	String msg = (String) request.getAttribute("msg");
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	System.out.println("hamp : " + hmap);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JooTopia</title>
</head>
<body>
	<h1 align="center"><%= msg %></h1>
</body>
</html>