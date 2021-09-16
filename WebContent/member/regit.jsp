<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<link href="../img/icon.png" rel="shortcut icon" type="image/x-icon">
        <title>로그인 / 회원가입</title>
        <link   href="style.css" rel="stylesheet">
    </head>
    <body>

   
        <div class="wrap">

<header>   

<div class="logo" align="center">
      <a href="../turnin/main.jsp"><img src="../img/logo.png" width="370" height="100" /></a>
   </div>
   </header>
            <div class="form-wrap">
            
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">탈퇴</button>
                    <button type="button" class="togglebtn" onclick="register()">회원가입</button>
                </div>
         <!--        <div class="social-icons">
                    <img src="../images/fb.png" alt="facebook">
                    <img src="../images/tw.png" alt="twitter">   
                    <img src="../images/gl.png" alt="google">
                </div> -->
                <form id="login" action="outProc.jsp" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디 혹은 이메일을 적어주세요" required name="userId">
                    <input type="password" class="input-field" placeholder="비밀번호를 입력하세요" required name="userPwd">
                    <input type="checkbox" class="checkbox"><span style="color: red;">탈퇴하면 복구 할 수 없습니다.</span>
                    <button class="submit">로그인</button>
                </form>
                <form id="register" action="joinFrm.jsp" class="input-group" method="post">
                    <input type="text" class="input-field" placeholder="아이디 혹은 이메일을 적어주세요" required name="userId">
                    <input type="email" class="input-field" placeholder="이메일을 입력해주세요" required name="email">
                    <input type="password" class="input-field" placeholder="비밀번호를 입력해주세요" required name="userpwd">
                   
                    <button class="submit">회원가입</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
 <jsp:include page="/turnin/footer.jsp" />
</body>
</html>