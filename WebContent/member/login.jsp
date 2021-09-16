<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 쿠키값으로 id정보 받아오기 -->
	<%String cookie = "";
		Cookie[] cookies = request.getCookies(); //쿠키생성
		if(cookies !=null&& cookies.length > 0)
		for (int i = 0; i < cookies.length; i++){
			if (cookies[i].getName().equals("userId")) { 
				// 내가 원하는 쿠키명 찾아서 값 저장
				cookie = cookies[i].getValue();}}%>
	<nav>
		<div class="login" style="background-color: #D3D3D3;">
		
		
			<%

					
			if (session.getAttribute("id")==null){ %>
				<h1> 로그인 | <a href="regit.jsp" style="color: white">회원가입</a> </h1>
				<form action="index.jsp" method="post">
				ID <br /> <input type="text" name="id" size="18" value="<%=cookie%>"><br />
				Password <br /> <input type="password" name="pwd" size="18"><br />
				<label><input type="checkbox" name="remember"
					value="Idrmb">아이디를 기억할까요?</label> <br>
							<label><input type="checkbox" name="logbox"
					value="Idrmb">자동로그인</label> 
					<input type="submit"value="Log-in" size="3" >
					</form>
<%} 
else {	%>
<form action="logout.jsp" method="post">
<h1><%out.print(session.getAttribute("userId")+"님 환영합니다!"); %></h1> <br>
<label><input type= "submit"  name= "logout" value="로그아웃"></label>
</form>
<%} %>

			
		</div>
	</nav>
</body>
</html>