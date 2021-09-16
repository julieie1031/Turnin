<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

#pic {
	position: absolute;
	top: 210px;
	left: 450px;
}

#pic1 {
	position: absolute;
	top: 360px;
	left: 450px;
}

#pic2 {
	position: absolute;
	top: 510px;
	left: 450px;
}

.content input[type="checkbox"]+label {
	color: #6c717b;
	font-size: 15px;
	cursor: pointer;
	position: relative;
	border-radius: 3px;
	display: inline-block;
	padding: 5px 5px 5px 30px;
}

.content input[type="checkbox"]+label:hover {
	color: #353a42;
	background-color: #f4f7fa;
}

.content input[type="checkbox"]+label span.check {
	left: 4px;
	top: 50%;
	position: absolute;
	transform: translatey(-50%);
	width: 18px;
	height: 18px;
	display: block;
	background: white;
	border-radius: 3px;
	border: 1px solid #b8bfcc;
	box-shadow: 0 2px 3px #f0f4f8;
}

.content input[type="checkbox"]:checked+label {
	color: #aeb7c6;
	text-decoration: line-through;
}

.content input[type="checkbox"]:checked+label span.check {
	background-color: transparent;
	border-color: transparent;
	box-shadow: none;
}

.content input[type="checkbox"]+label span.check::after {
	width: 100%;
	height: 100%;
	content: '';
	display: block;
	position: absolute;
	background-image:
		url('https://tjgillweb.github.io/Vacation-Todo-App/images/tick.svg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: 16px 16px;
	transform: scale(0);
	transition: transform 300ms cubic-bezier(.3, 0, 0, 1.5);
}

.content input[type="checkbox"]:checked+label span.check::after {
	transform: scale(1);
}

.content input[type="checkbox"]+label span.check::before {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: block;
	content: '';
	position: absolute;
	border-radius: 50%;
	background: #8798aa;
	opacity: .8;
	transform: scale(0);
}

.content input[type="checkbox"]:checked+label span.check::before {
	opacity: 0;
	transform: scale(1.3);
	transition: opacity 300ms cubic-bezier(0.2, 0, 0, 1), transform 400ms
		cubic-bezier(0.3, 0, 0, 1.4);
}

.content input[type="checkbox"] {
	display: none;
}

.box {
	position: absolute;
	top: 210px;
	left: 700px;
}

.box1 {
	position: absolute;
	top: 360px;
	left: 700px;
}

.box2 {
	position: absolute;
	top: 510px;
	left: 700px;
}

.logo {
	position: absolute;
	top: 30px;
	left: 80px;
}
/* 배경색 */
body {
	background: linear-gradient(#F4DEF9, white);
	height: 400px;
	background-repeat: no-repeat;
	font-family: 'Nanum Gothic', sans-serif;
}
/* 폰트 */
button, input, select, textarea {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="logo">
		<a href="b.html"><img src="../img/33.png" width="250" height="70" /></a>
	</div>

	<div id="pic">
		<input type="file" name="fileName" id="fileName" class="form-control">
	</div>

	<div id="pic1">
		<input type="file" name="fileName" id="fileName" class="form-control">
	</div>

	<div id="pic2">
		<input type="file" name="fileName" id="fileName" class="form-control">
	</div>


	<div class="content">
		<div class="todoList">
			<!-- 리스트 -->
			<dl class="todos">
				<dt class="box">
					<input type="checkbox" id="todo_1" name="checkbox"> <label
						for="todo_1"> <span class="check"></span>Buy Flight
						Tickets
					</label>
				</dt>

				<dt class="box1">
					<input type="checkbox" id="todo_2" name="checkbox"> <label
						for="todo_2"> <span class="check"></span> Find AirBnbB
					</label>
				</dt>

				<dt class="box2">
					<input type="checkbox" id="todo_3" name="checkbox"> <label
						for="todo_3"> <span class="check"></span> Look up things
						to do
					</label>
				</dt>
			</dl>
		</div>
	</div>
</body>
</html>