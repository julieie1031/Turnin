<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*, java.util.*"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.* "%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.global.turnin.addlist"%>
<!DOCTYPE html>
<html>
<head>
<link href="../img/icon.png" rel="shortcut icon" type="image/x-icon">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:ital@1&display=swap');

body {
	height: 100vh;
	margin: 0;
	background: linear-gradient(to left, #ffffff 70%, #ECE2E2 30%);
}

.home {
	position: absolute;
	top: 20px;
	left: 50px;
}

#search {
	position: absolute;
	top: 355px;
	left: 185px;
}

#date {
	position: absolute;
	top: 290px;
	left: 100px;
}

.date-picker-button {
	background: #fff;
	color: gray;
	position: relative;
	cursor: pointer;
	margin-bottom: 10px;
	border: 2px solid gray;
	font-size: 14px;
	padding: 12px;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-o-border-radius: 3px;
	width: 300px;
}

.input-group {
	position: relative;
	border: 2px solid #cdd7e1;
	margin-bottom: 10px;
	display: block !important;
	width: 300px;
	border: none;
}

.date-picker-button .date-picker-input {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	margin: 0;
	background: lightgray;
	border: none;
	width: 300px;
	padding-left: 55px;
}

.fa.fa-angle-down {
	float: right;
	color: white;
	font-size: 20px !important;
	font-weight: 600;
	top: 0px !important;
	position: relative;
	margin-right: 20px;
}

.fa-calendar-o {
	color: white !important;
	z-index: 1;
	top: 0px !important;
	position: relative !important;
}

#box {
	position: absolute;
	top: 185px;
	left: 550px;
	font-size: 25px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
}

input[type=checkbox] {
	cursor: pointer;
	width: 30px;
	height: 30px;
}

input[type=checkbox]:checked {
	width: 30px;
	height: 30px;
}

#content {
	border: none;
}
#sysdate{
position: absolute;
	top: 26px;
	left: 1265px;
	background-color: gray;
	font-size: 25px;
	font-family: 'Noto Sans', sans-serif;
	padding: 10px 10px 10px 10px; 
	width : 160px;
	height : 60px;
}
#nothing{
position: absolute;
	top: 305px;
	left: 700px;
}#notcontent{
font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
position: absolute;
	top: 225px;
	left: 820px;
}

</style>
</head>
<body>
<body>
	<jsp:useBean id="addlist" class="com.global.turnin.addlist"
		scope="request" />

<!-- date로 데이터 가져오기 -->
	<form action="myPageProc.jsp">
		<div id="date" class="date-picker-button input-group">
			<i class="fa fa-calendar-o" aria-hidden="true"></i> <span>Select
				Date</span> <input type="date" name="date"
				class="input-startdate date-picker-input hasDatepicker"
				id="dp1523936970319" aria-required="true"> <i
				class="fa fa-angle-down" aria-hidden="true"></i>
		</div>
		<p id="search">
			<input type="image" src="../img/search.png" width="100" height="100">
		</p>

	</form>

	<% 
   
 if(session.getAttribute("date")!=null){
String userId =(String)session.getAttribute("userId");    
String regDate = (String)session.getAttribute("date");

InitialContext ic = new InitialContext();
   DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
   Connection conn = ds.getConnection();
   PreparedStatement pstmt = conn.prepareStatement("select * from addlist where userid=? and regdate=?");
   pstmt.setString(1, userId);
    pstmt.setString(2, regDate); 
   ResultSet rs = pstmt.executeQuery();
   List<addlist> al = new ArrayList<addlist>();
   while(rs.next()){  

		addlist dto = new addlist();
		dto.setNum(rs.getInt(1));
		dto.setUserId(rs.getString(2));
		dto.setContents(rs.getString(3));
		dto.setRegDate(rs.getString(4));
		dto.setCheckbox(rs.getString(5));
		dto.setPicName(rs.getString(6));
		al.add(dto);
	} //while
		
	rs.close();
	pstmt.close();
	conn.close();
	   
	   %>
	<% String uploadedUrl = request.getContextPath()+"/upload"; %>
	<div id="box">
		<c:set var="list" value="<%=al %>" />
		<c:set var="imgUrl" value="<%=uploadedUrl %>"></c:set>
		<c:forEach var="item" items="${list}">
			<img src="<%=uploadedUrl %>/${item.picName}" width="150px"
				height="150px" onerror="this.style.display='none'" />
			&emsp;
			<input type="checkbox" id="checkYn" name="checkbox"
				<c:if test="${item.checkbox eq 'Y'}">checked</c:if>>
			&emsp;
			<input type="text" id="content" style="color: #9F9B9B;"
				value="${item.contents }">
			<br>
			<br>
			

<!-- 
			<script>
var checkYn = "${item.checkbox}";
if(checkYn == "Y"){
	$("#checkYn").prop("checked", true);
	
	if($("#checkYn").is(':checked')==true){
	item.set("checkYn", "Y");
	}else if{
	item.set("checkYn", null);
	}	
}else{
		$("#checkYn").prop("checked", false);
	}
</script>  -->

		</c:forEach>
	</div>
	<c:forEach var="item" items="${list}">
	<div id = "sysdate" style = "color : white; align : center;">${item.regDate }</div>
	</c:forEach>
	<%    

 }
 else{%>
 <h4 id = "notcontent" style = "color:gray;">스케줄이 존재하지 않아요 😂</h4>
 <div id = "nothing">
   <img src="../img/nothing.PNG" width="480" height="150" />
 </div>
 <%   
 }%>

	<div class="home">
		<a href="main.jsp"><img src="../img/hometwo.png" width="60"
			height="60" /> <img src="../img/home.png" width="50" height="45" /></a>
	</div>
 <jsp:include page="footer.jsp" />
</body>
</html>