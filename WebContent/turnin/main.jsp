<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*"%>
<%@page import="java.sql.*,javax.sql.*,javax.naming.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../img/icon.png" rel="shortcut icon" type="image/x-icon">
<title>turnin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="b.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap')
	;


/* 로고 */
.logo {
	position: absolute;
	top: 30px;
	left : 590px;
}
nav {
	margin-left: 5px;
	color: black;
	width: 200px;
	height: 300px;
	float: left;
}

h2 {
	text-align: center;
}

h1 {
	font-size: 12px;
	color: white;
}

.menu {
	font-size: 12px;
	color: black;
}

.login {
	margin: 30px;
	margin-top: 30px;
	border: 1px solid #D3D3D3;
	background-color: white;
	color: black;
	font-size: 10px;
	padding: 10px;
	border-radius: 1em;
	border: 1px solid #D3D3D3;
	background-color: white;
	width: 186px;
	height: 180px;
}
.login2 {
	margin: 30px;
	margin-top: 30px;
	border: 1px solid #D3D3D3;
	background-color: white;
	color: black;
	font-size: 10px;
	padding: 10px;
	border-radius: 1em;
	border: 1px solid #D3D3D3;
	background-color: white;
	width: 188px;
	height: 70px;
}
#plan {
	position: absolute;
	top: 230px;
	left: 425px;
	border: 0;
	background: #E2E2E2;
	border-radius: 8px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
	box-shadow: 0 3px 8px 2px gray;
}

.input-buttons {
	position: absolute;
	top: 260px;
	left: 1030px;
}

#tolist {
	position: absolute;
	top: 330px;
	left: 515px;
}

#debtn {
	position: absolute;
	left: 455px;
}

.todoList>table {
	width: "400px";
	height: "350px";
}

#id {
	position: absolute;
	left: 455px;
}

#save {
	position: absolute;
	left: 420px;
}
#loginbtn{
width:150px;
    background-color: #F4F4F4;
    border: none;
    color:#DDC4C4;
    text-align: center;
    padding : 5px;
    text-decoration: none;
    display: inline-block;
    font-size: 5px;
    margin: 2px;
    border-radius:10px 10px 10px 10px; 
    cursor: pointer;
    font-weight: bold;

}
#loginbtn:hover {
    background-color: skyblue;
}
#penbtn{
border: none;
background: none;
}
/* 폰트 */
button, input, select, table, h1 {
	font-family: 'Nanum Gothic', sans-serif;

	font-size: inherit;
	 font-weight: bold;
}
input::placeholder {
  font-family: 'Nanum Gothic', sans-serif;
	 font-weight: bold;
}
#welcome{
font-size: 12px;
}

</style>
</head>
<body>
	<!-- 쿠키값으로 id정보 받아오기 -->
	<%
	String cookie = "";
	Cookie[] cookies = request.getCookies(); //쿠키생성
	if (cookies != null && cookies.length > 0)
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("id")) {
		// 내가 원하는 쿠키명 찾아서 값 저장
		cookie = cookies[i].getValue();
			}
		}
	%>


	<!-- 로그인 -->
	<%
	if (session.getAttribute("userId") == null) {
	%>
	<nav>
		<div class="login" style="background-color: #D3D3D3;">
			<h1>
				<a href="../member/regit.jsp" style="color: white"><img src="../img/3.PNG" width = "160px" height = "25px"></a>
			</h1>

			<form action="../member/index.jsp" method="post">
				ID <br /> <input type="text" name="userId" size="30"
					value="<%=cookie%>"><br /> Password <br /> <input
					type="password" name="userpwd" size="30"><br /> <label><input
					type="checkbox" name="remember" value="Idrmb">아이디를 기억할까요?</label> <br>
				<input type="submit" value="Log-in" size="3" id = "loginbtn">
			</form>
		</div>
	</nav>
	<%
	} else {
	%>
	<nav>
		<div class="login2" style="background-color: #D3D3D3;">
	<h1 id = "welcome">
		<%
		out.print(session.getAttribute("userId") + "님 환영합니다!");
		%>
	</h1>

	<a href="../member/logout.jsp" style="color: white"><img src="../img/logout.PNG" width = "70px" height = "22px"></a> <img src="../img/bar.PNG" width = "10px" height = "18px">
	<a href="myPage.jsp" style="color: white"><img src="../img/mypage.PNG" width = "72px" height = "23px"></a>
	</div>
	</nav>
	<%
	}
	%>



	<div class="logo">
		<a href="main.jsp"> <img src="../img/logo.png" width="370"
			height="100" /></a>
	</div>
	<%
	if (session.getAttribute("userpwd") != null)//pw세션은 로그인에 성공하면 자동추가 
	{
		String userId = (String) session.getAttribute("userId"); //id세션을 스트링형태로 받기
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement
				("select num,contents,regdate,checkbox from addlist where userid=? and regDate = to_char(sysdate,'yyyy-mm-dd')");
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
	%>



	

	<!-- input칸 -->

	<form action="addproc.jsp" method="post">

		<input type="text" name="contents" id="plan" class="form-control"
			style="width: 710px; padding: 30px;" placeholder="오늘의 계획을 입력하세요">
		<div class="input-buttons">
			<button id = "penbtn"><img src="../img/pen.png" width="38" height="40"/></button>
		</div>


	</form>


	<!-- 리스트 -->
	<div id="tolist" style="padding-top: 50px">
		<table class="table table-hover" style="width: 500px;">
			<thead>
				<tr>
					<th style="text-align: center;">📝 오늘의 to do 📝</th>
				</tr>
			</thead>
			<%
			while (rs.next()) {
			%>
			<tbody>
				<tr>
					<th>
						<dl class="todos">
							<dt>
								<%=rs.getString(2)%>
								<a href="delete.jsp?num=<%=rs.getString(1)%>"><img src="../img/trash.png" width="30" height="30" id="debtn"/>
								<input type="hidden" name="num" value="<%=rs.getString(1)%>"></a>
								<img src="../img/check.png" width = "30px" height = "30px" onclick="location= 'updatepage.jsp?num=<%=rs.getString(1)%>'" id="save" >
								
							</dt>
						</dl>
					</th>
				</tr>
			</tbody>

			<%
			}
			rs.close();
			pstmt.close();
			conn.close();
			%>
		</table>
	</div>

	<%
	} else {
	%>

	<!-- 비회원 input칸 -->


	<input type="text" name="contents" id="plan" class="form-control"
		style="width: 710px; padding: 30px;" placeholder="오늘의 계획을 입력하세요">
	<div class="input-buttons">
		<button id = "penbtn"><img src="../img/pen.png" width="38" height="40"/></button>
	</div>
	<div id="tolist" style="padding-top: 50px">
		<table class="table table-hover" style="width: 500px;">
			<thead>
				<tr>
					<th style="text-align: center;">📝 오늘의 to do 📝</th>
				</tr>
			</thead>

		</table>
	</div>
	<%
	}
	%>

	<!-- 날짜 -->
	<div style="position: absolute; top: 260px; left: 200px; font-family: 'Roboto Condensed', sans-serif;">
		<div style="font-size: 70px; font-weight: bold; color: #DDC4C4;">
			<script type="text/javascript" src="../js_file/month.js"></script>
		</div>
		<div style="font-size: 60px; font-weight: bold; color: #BDBDBD;">
			<script type="text/javascript" src="../js_file/date.js"></script>



		</div>
	</div>
 <jsp:include page="footer.jsp" />
</body>
</html>