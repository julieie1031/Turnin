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
	request.setCharacterEncoding("UTF-8");
	%>
	<%
	String contents = (String)request.getParameter("contents");
	String userId = (String) session.getAttribute("userId");
	String sql = null;
	out.println(contents);

	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	/* sql = "insert into members values(?,?,?,?,?,?,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'))"; */
	sql = "insert into memcontents(num, contents, regdate, userId) values(mem_seq.nextval,?,sysdate,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, contents);
	pstmt.setString(2, userId);
	out.println("after insert result"+pstmt.execute());
	%>

	<jsp:forward page="0422.jsp" />
</body>
</html>