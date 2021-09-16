<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
<jsp:useBean id="member" class="com.global.turnin.Member"/>
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<script>
alert("회원가입을 축하합니다🎉");
document.location.href = "../turnin/main.jsp";
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String userId= request.getParameter("userId");
String email= request.getParameter("email");
String userpwd = request.getParameter("userpwd");

String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "insert into member values(?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, member.getUserId());
pstmt.setString(2, member.getEmail());
pstmt.setString(3, member.getUserpwd());

pstmt.execute();



/* sql = "select * from members where userId=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, member.getId());
pstmt.execute(); */

pstmt.close(); conn.close();
%>
