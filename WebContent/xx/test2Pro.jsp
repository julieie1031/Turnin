<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] str = request.getParameterValues("c1");

%>

<%for(int i=0;i<str.length;i++){
%>
<%=str[i] %><br>
<%} %>


</body>
</html>