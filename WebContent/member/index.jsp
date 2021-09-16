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
String userId = request.getParameter("userId");
String userpwd = request.getParameter("userpwd");
String remember = (String)request.getAttribute("remember");
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
ResultSet rs = null;
/* String dbid = "user1";//DB에서 가져온 데이터
String dbpwd = "1234";//DB에서 가져온 데이터 */
Cookie cookie = new Cookie("userId",userId);
//회원 아이디 : user1
//비밀번호 : 1234
out.print(remember);
System.out.println(remember);
if (remember != null) { // 체크박스 체크여부에 따라 쿠키 저장 확인
   // 체크박스 체크 되었을 때
   // 쿠키 저장
   response.addCookie(cookie);
} else {
   // 체크박스 체크 해제되었을 때
   // 쿠키 유효시간 0으로 해서 브라우저에서 삭제하게 한다.
   cookie.setMaxAge(0);
   response.addCookie(cookie);
}


try{
sql = "select userpwd from member where userid=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userId);
rs = pstmt.executeQuery(); 
rs.next();

if(rs.getString(1).equals(userpwd)){
   
      //로그인 성공.
          session.setAttribute("userId", userId); 
            session.setAttribute("userpwd", userpwd);
          
      //세션에 아이디값 설정
           
      Cookie user = new Cookie("userId",userId);
      user.setMaxAge(-1);
      response.addCookie(user);
      response.sendRedirect("../turnin/main.jsp");
      }
else{
   out.println("<script>alert('아이디 혹은 비밀번호가 틀렸습니다.'); history.back();</script>");
   
}
}//로그인 성공시 main으로


catch(Exception e){
   
   out.println("<script>alert('아이디 혹은 비밀번호가 틀렸습니다.'); history.back();</script>");
   
}%>
</body>
</html>