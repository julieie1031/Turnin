<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="b.css">
	
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>