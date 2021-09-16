<%@page import="java.util.ArrayList"%>
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

<!-- 계획 추가 -->
<%
request.setCharacterEncoding("utf-8");
String contents = request.getParameter("contents");
String userId = (String)session.getAttribute("userId");
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle"); 
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement("select num,userid,contents,regDate from addlist");
ResultSet rs = pstmt.executeQuery();
response.sendRedirect("main.jsp");
// Connection/PreparedStatement/ResultSet ==> interface

try
{
      String sql = "insert into addlist(num,userid,contents,regdate) values(addsqence.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'))";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, contents);
      pstmt.executeUpdate();
      out.print("성공");
}catch(Exception e){
	out.print("실패");
      e.printStackTrace();
}

%>
</body>
</html>