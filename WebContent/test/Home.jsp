<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="b.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap');
#btn{
position: absolute;
top : 560px;
left : 1000px;
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
	margin-top: 25px;
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
	height: 130px;
}

.add-todo {
	position: absolute;
	top: 36px;
	left: 353px;
}
/*드랍버튼(+시간지정)*/
.dropbtn {
	border: none;
	background: transparent;
}

.dropdown {
	position: relative;
	top: 11px;
	right: 50px;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	min-width: 160px;
	z-index: 1;
}

.dropdown-content a {
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
<!-- 로그인 -->
	<nav>
		<div class="login" style="background-color: #D3D3D3;">
			<h1>
				로그인 | <a href="b.jsp" style="color: white">회원가입</a>
			</h1>
			<form action="index.jsp" method="post">
				ID <br /> <input type="text" name="id" size="18"><br />
				Password <br /> <input type="password" name="pwd" size="18"><br />
				<label><input type="checkbox" name="checkbox"
					value="remember">아이디를 기억할까요?</label> <input type="submit"
					value="Log-in" size="3">

			</form>
		</div>
	</nav>
	
	<!-- 로고 -->
	<div class="logo">
		<a href="#"><img src="../img/33.png" width="380" height="105" /></a>
	</div>
	
	<!-- input칸 -->
	<div class="content">
		<div class="todoList">
			<form class="add">
				<input type="text" name="add" placeholder="오늘의 계획을 입력하세요"
					style="width: 520px;">
					
			
				<!-- 추가버튼 -->
				<div class="input-buttons">
					<a href="#" class="add-todo"> <i class="fas fa-plus add"></i></a>
				</div>
			</form>
			
			<!-- 리스트 -->
			<ul class="todos">
				<li><input type="checkbox" id="todo_1" name ="checkbox"> <label for="todo_1"> <span class="check"></span>Buy Flight Tickets 
				</label> <i class="far fa-trash-alt delete"></i></li>
				
				<li><input type="checkbox" id="todo_2" name ="checkbox"> <label
					for="todo_2"> <span class="check"></span> Find AirBnbB
				</label> <i class="far fa-trash-alt delete"></i></li>
				
				<li><input type="checkbox" id="todo_3" name ="checkbox"> <label
					for="todo_3"> <span class="check"></span> Look up things to
						do
				</label> <i class="far fa-trash-alt delete"></i></li>
			</ul>
		</div>
	</div>
	<!-- 저장버튼 -->
	<input type = "button" value = "저장">

<!-- 날짜 -->
	<div style = "position: absolute; top: 320px; left : 340px; font-family: 'Roboto Condensed', sans-serif;">
	<div style = "font-size : 70px; font-weight : bold; color : #DDC4C4;">
<script type="text/javascript" src="Home_js.js"></script>
</div>
<div style = "font-size : 60px; font-weight : bold; color : #BDBDBD;">
<script type="text/javascript" src="date.js"></script>


<!-- 리스트 자동 추가 -->
<script>
const submitForm = document.querySelector('.add');
const addButton = document.querySelector('.add-todo');
const todoList = document.querySelector('.todos');
const list = document.querySelectorAll('.todos li'); 

let listLenght = list.lenght;

const generateTempalate = (todo) => {
  
  const html = `<li>
                  <input type="checkbox" id="todo_${listLenght}">
                  <label for="todo_${listLenght}">
                    <span class="check"></span>
                    ${todo}
                  </label>
                  <i class="far fa-trash-alt delete"></i>
                </li>`
  todoList.innerHTML += html;
};

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
</div>
</div>

<input type="submit" id = "btn" value = "Modify" class="btn btn-danger" disabled>
</form>
</body>
</html>