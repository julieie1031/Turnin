<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@ page import="java.sql.*,javax.sql.*,javax.naming.*, java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 회원 탈퇴 -->
<%
String userId = request.getParameter("userId"); 
String userPwd = request.getParameter("userPwd");
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
ResultSet rs = null;
sql="select userpwd from member where userid=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userId);
rs = pstmt.executeQuery(); 
rs.next();

if(rs.getString(1).equals(userPwd)){
String    sql1="delete from member where userid=?";
pstmt=conn.prepareStatement(sql1);
pstmt.setString(1, userId);
rs=pstmt.executeQuery();
out.print(1);
String sql2= "delete from addlist where userid=?";
pstmt=conn.prepareStatement(sql2);
pstmt.setString(1, userId);
rs=pstmt.executeQuery();
out.print(2);
out.print("<script>alert('탈퇴가 완료되었습니다!!'); history.back();</script>");
session.invalidate();
Cookie user = new Cookie("id","");
user.setMaxAge(0);
response.addCookie(user); %>
<% }
else{
   out.print("<script>alert('아이디 또는 비밀번호를 확인해주세요'); history.back();</script>");
   
}
rs.close(); pstmt.close(); conn.close();
%>

</body>
</html>