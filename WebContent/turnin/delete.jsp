<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int num = Integer.parseInt(request.getParameter("num"));
	String sql = null;
	ResultSet rs = null;
	out.println(num);

	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	/* sql = "insert into members values(?,?,?,?,?,?,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'))"; */
	sql = "delete from addlist where num =?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();
	
	pageContext.forward("main.jsp");
	%>
	


</body>
</html>