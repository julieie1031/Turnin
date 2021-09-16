<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*, java.util.*"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.global.turnin.addlist"%>
<!DOCTYPE html>
<html>
<head>
<link href="../img/icon.png" rel="shortcut icon" type="image/x-icon">
<title>turnin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

body{
 height: 100vh;
  margin: 0;
background: linear-gradient(#ECE2E2 50%, #ffffff 50%);
}
.logo{
position: absolute;
	top: 23px;
	left: 1235px;
}
#box {
	background-color: white;
	padding: 95px;
	border: none;
	margin: 10px;
	width: 900px;
	height: 310px;
	border-radius: 30px;
	box-shadow: 0 3px 8px 2px gray;
	position: absolute;
	top: 205px;
	left: 400px;
}

#save {
	position: absolute;
	top: 605px;
	left: 1210px;
	border: none;
background: none;
}

#savebtn {
	position: absolute;
	top: 135px;
	left: 380px;
}

input[type=checkbox] {
	cursor: pointer;
	width: 40px;
	height: 40px;
}

input[type=checkbox]:checked {
	width: 40px;
	height: 40px;
}
/*
input[type=checkbox] {
    display:none;
}
input[type=checkbox] + label { 
    cursor: pointer; 
    background-repeat: no-repeat;
    background-image: url('../img/beforecheck.PNG');
}
input[type=checkbox]:checked + label {
    background-image: url('../img/aftercheck.PNG');
}*/
#content {
	position : absolute;
	left : 450px;
	font-size : 25px;
	top : 135px;
	border:none;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight : bold;
	
}
#filebox{
position: absolute;
width : 200px;
height : 200px;
top : 55px;
left: 100px;
}
#memo{
background-color: white;
text-align : center;
border: solid #CEBBBB 5px;
position: absolute;
	top: 148px;
	left: 410px;
	padding: 10px 10px;
	width: 410px;
	height: 55px;
	border-radius: 50px;

	font-family: 'Nanum Gothic', sans-serif;
	font-size : 17px;
	font-weight : bold;
}
#date{
background-color: #D3D3D3;
text-align : center;
border: none;
position: absolute;
	padding: 40px 30px;
	width: 150px;
	height: 200px;
}
.home{
position: absolute;
top: 20px;
	left: 50px;
}
</style>
<script src="../jquery/jquery-3.6.0.js"></script>

<script>

		
$(document).ready(function(){
 $("#savebtn").click(function(){
	$("#checkFrm").submit(); 
});


	</script>
</head>
<body>


	<%
	List<addlist> al = new ArrayList<addlist>();
	%>
	<%
	if (session.getAttribute("userId") != null) {

		String userId = (String) session.getAttribute("userId"); //id세션을 스트링형태로 받기
		int num = Integer.parseInt(request.getParameter("num"));
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select num, contents from addlist where userid=? and num = ?");
		pstmt.setString(1, userId);
		pstmt.setInt(2, num);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {

			addlist dto = new addlist();
			dto.setNum(rs.getInt(1));
			dto.setContents(rs.getString(2));
			al.add(dto);
		} //while

		rs.close();
		pstmt.close();
		conn.close();
		request.setAttribute("al", al);
		
	%>
	<c:set var="al" value="${al }" />

	<form action="updateProc.jsp" method="post"
		enctype="multipart/form-data" id="checkFrm">
		
		
		<table id="box">
			<c:forEach var="item" items="${al}">

				<tr>
					<td><label>
					<input type="hidden" name="num" value="${item.num }">
					<input type="checkbox" id="savebtn" name="checkbox" value="Y"></label>
					<input type="text" id="content" style = "color:#9F9B9B;" value="${item.contents }" readonly>
					<input type="file" name="picName" id="picName" style='display: none;'>
					<img src="../img/none.PNG" border='0' onclick='document.all.picName.click();' id= "filebox">
					</td>
				</tr>
			</c:forEach>
		</table>
		<input id="save" type="image" src="../img/complete.png" width="200" height="90">
	</form>

	<%
	} else {
	%><script> 
		alert("로그인 후 이용해주세요");
		 location.href = 'main.jsp';
		</script>
	<%
	}
	%>
<div class="logo">
<a href="main.jsp">
<img src="../img/logo.png" width="250" height="70" /></a>
</div>

<p id = "memo" style = "color:#CCBEBE;">오늘의 계획을 사진으로 기록해보세요</p>

<div id = "date" style="position: absolute; top: 270px; left: 200px; font-family: 'Roboto Condensed', sans-serif;">
		<div style="font-size: 40px; font-weight: bold; color: white;">
			<script type="text/javascript" src="../js_file/month.js"></script>
		</div>
		<div style="font-size: 40px; font-weight: bold; color: #A5A5A5;">
			<script type="text/javascript" src="../js_file/datetwo.js"></script>
	</div>
	</div>
<div class="home">
<a href="main.jsp"><img src="../img/hometwo.png" width="60" height="60" />
<img src="../img/home.png" width="50" height="45" /></a>
 <jsp:include page="footer.jsp" />
</div>
</body>
</html>