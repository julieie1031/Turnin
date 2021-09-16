<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script>
	const submitForm = document.querySelector('.add');
	const addButton = document.querySelector('.add-todo');
	const todoList = document.querySelector('.todos');
	const list = document.querySelectorAll('.todos li');

	let listLenght = list.lenght;

	function addTodos(e) {
		e.preventDefault();
		const todo = submitForm.add.value.trim();
		if (todo.length) {
			listLenght = listLenght + 1;
			generateTempalate(todo);
			submitForm.reset();
		}
	}

	submitForm.addEventListener('submit', addTodos);
	addButton.addEventListener('click', addTodos);

	function deleteTodos(e) {
		if (e.target.classList.contains('delete')) {
			e.target.parentElement.remove();
		}
	}

	todoList.addEventListener('click', deleteTodos);
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap">
<meta charset="UTF-8">
<link rel="stylesheet" href="b.css" type="text/css" />
<style>
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
	margin: 15px;
	margin-top: 15px;
	border: 1px solid #D3D3D3;
	background-color: white;
	width: 190px;
	height: 130px;
	color: black;
	font-size: 12px;
	padding: 10px;
	border-radius: 1em;
	border: 1px solid #D3D3D3;
	background-color: white;
	width: 190px;
	height: 180px;
}

#plan {
	position: absolute;
	top: 230px;
	left: 410px;
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
	left: 1020px;
}

#tolist {
	position: absolute;
	top: 330px;
	left: 500px;
}

#debtn {
	position: relative;
	left: 400px;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="<%=request.getContextPath()%>" />
	<c:set var="list" value="${cList}" />
	
	
	<%
	String userId = request.getParameter("userId");
	
	String cookie = "";
	Cookie[] cookies = request.getCookies(); //쿠키생성
	if (cookies != null && cookies.length > 0)
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("userId")) {
		// 내가 원하는 쿠키명 찾아서 값 저장
		cookie = cookies[i].getValue();
			}
		}
	%>
	<nav>
		<div class="login" style="background-color: #D3D3D3;">


			<%
			if (session.getAttribute("userId") == null) {
			%>
			<h1>
				로그인 | <a href="../member/regit.jsp" style="color: white">회원가입</a>
			</h1>
			<form action="../member/index.jsp" method="post">
				ID <br /> <input type="text" name="userId" size="18"
					value="<%=cookie%>"><br /> Password <br /> <input
					type="password" name="userpwd" size="18"><br /> <label><input
					type="checkbox" name="remember" value="Idrmb">아이디를 기억할까요?</label> <br>
				<input type="submit" value="Log-in" size="3">
			</form>
			<%
			} else {
			%>
			<form action="../member/logout.jsp" method="post">
				<h1>
					<%
					out.print(session.getAttribute("userId") + "님 환영합니다!");
					%>
				</h1>
				<br> <label><input type="submit" name="logout"
					value="로그아웃"></label>
			</form>
			<%
			}
			%>
		</div>
	</nav>


	<!-- 로고 -->
	<div class="logo">
		<a href="#"><img src="../img/33.png" width="380" height="105" /></a>
	</div>


	<!-- input칸 -->
	<form action="<c:url value = "/PJ/viewProc.do"/>" method="post">

		<input type="text" name="contents" id="plan" class="form-control"
			style="width: 710px; padding: 30px;" placeholder="오늘의 계획을 입력하세요">
		<div class="input-buttons">
			<a href="0422_1.jsp" class="add-todo"><input type="hidden" name = "userId"
				value="<%=userId %>"><input type="submit"
				value="+"></a>
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
			<c:forEach var="item" items="${list}">
				<tbody>
					<tr>
						<th>
							<dl class="todos">
								<dt>
									<input type="checkbox" id="todo_1" name="checkbox"><label
										for="todo_1"> <span class="check"></span>
										${item.contents}
									</label><a href="delete.jsp?num=${item.num}" class="add-todo"><input
										type="hidden" name="num" value="${item.num}"> <input
										id="debtn" type="submit" value="삭제"></input></a>
								</dt>
							</dl>
						</th>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>



</body>
</html>