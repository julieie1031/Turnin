<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.oreilly.servlet.MultipartRequest" %>
    <%@ page import="java.sql.*,javax.sql.*,javax.naming.*, java.util.*"%>
    <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
    	<%@ page import = "com.global.turnin.*" %>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<c:set var = "contextPath" value = "<%=request.getContextPath() %>"></c:set>

<%
	
	String fileName1 ="";// 중복처리된 이름
	String im_name ="";// 중복 처리전 실제 원본 이름
	String uploadFolder = application.getRealPath("/upload"); //업로드 될 파일의 위치
	int maxSize = 5 * 1024 * 1024; //한번에 업로드 할 크기
	String encType = "UTF-8"; //한글 처리
	
	MultipartRequest multi = new MultipartRequest(request, uploadFolder, maxSize, encType, new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	
	   String name= (String)files.nextElement();
	   String picName = multi.getOriginalFileName(name);
	   
	String sql = null;
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	/* sql = "insert into members values(?,?,?,?,?,?,sysdate)"; */
	sql = "insert into memcontents(picName) values(?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, picName);
		pstmt.execute();
		
	    
		%>
		<jsp:forward page="test2.jsp"/> 
</body>
</html>