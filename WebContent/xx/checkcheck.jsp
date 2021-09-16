<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*, java.util.*"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.global.turnin.addlist"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
 	List<addlist> al = new ArrayList<addlist>();
 	%>
	<%
	if (session.getAttribute("userId") != null) {
		
		String userId = (String) session.getAttribute("userId"); //id세션을 스트링형태로 받기
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select checkbox,picname from addlist where userid = ?");
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			addlist dto = new addlist();
			dto.setCheckbox(rs.getString(1));
			al.add(dto);
		}  //while
		rs.close();
		pstmt.close();
		conn.close();
		request.setAttribute("al", al);

			%>
	<c:set var="al" value="${al }" />
	<table id="box">
		<c:forEach var="item" items="${al}">
			<input type="checkbox" id="checkYn" name="checkbox" <c:if test="${item.checkbox eq 'Y'}">checked</c:if> >

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



</script>
		</c:forEach>
	</table>
		<% }else {
	%><script>
		alert("로그인 후 이용해주세요");
		 location.href = 'main.jsp';
		</script>
	<% } %>

</html>