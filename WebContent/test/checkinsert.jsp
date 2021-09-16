<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.sql.*" %>
     <%@page import="java.sql.*,javax.sql.*,javax.naming.* "%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String[] checkbox = request.getParameterValues("checkbox");
for(int i = 0; i < checkbox.length; i++){
    out.println(checkbox[i]+"<br/>");
    

out.print(checkbox);
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
String sql = "UPDATE addlist SET checkbox = ? WHERE num = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, checkbox[i]);
pstmt.setInt(2, num);
out.println("after insert result"+pstmt.execute());
}
response.sendRedirect("main.jsp");

%>
</body>
</html>