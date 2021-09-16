<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*, java.util.*"%>
<%@ page import="com.global.turnin.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
   <c:set var = "contextPath" value = "<%=request.getContextPath() %>"></c:set>

<!-- 체크박스, 사진 저장처리 -->
   <%
   if (-1 < request.getContentType().indexOf("multipart/form-data")) {

     
      String uploadFolder = application.getRealPath("/upload"); //업로드 될 파일의 위치
      int maxSize = 5 * 1024 * 1024; //한번에 업로드 할 크기
      String encType = "UTF-8"; //한글 처리
      //파일 업로드
      MultipartRequest multi = new MultipartRequest(request, uploadFolder, maxSize, encType,
      new DefaultFileRenamePolicy());
      //업로드된 파일의 이름을 반환
      Enumeration files = multi.getFileNames();

      String name = (String) files.nextElement();
      String picName = multi.getOriginalFileName(name);

      Integer num = Integer.valueOf(multi.getParameter("num"));
      String checkbox = multi.getParameter("checkbox");

      try {
         String sql = null;

         InitialContext ic = new InitialContext();
         DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
         Connection conn = ds.getConnection();
         sql = "UPDATE addlist SET checkbox = ?, picName = ? WHERE num = ?";
         PreparedStatement pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, checkbox);
         pstmt.setString(2, picName);
         pstmt.setInt(3, num);
         
         pstmt.execute();
         
      } catch (Exception e) {
         out.print("실패");
         e.printStackTrace();
      }

   } else {
	   out.print("실패");
   }
   %>
 <script>
         alert("스케줄이 저장되었어요");
         document.location.href = "../turnin/main.jsp";
         </script>
</body>
</html>