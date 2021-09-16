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
<input type ="checkbox" name = "checkbox"><input type ="text" name = "contents">

<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	String checkbox = request.getParameter("check");
	String sql = null;

	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	/* sql = "insert into members values(?,?,?,?,?,?,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'))"; */
	sql = "insert into memcontents(num,checkbox) values(?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.setString(2, checkbox);
	out.println("after insert result"+pstmt.execute());
	%>

	<jsp:forward page="main.jsp" />
</body>
</html>