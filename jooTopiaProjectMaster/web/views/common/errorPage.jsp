<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
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