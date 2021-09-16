<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.global.turnin.MemContents"%>
    <%@page import="java.sql.*,javax.sql.*, javax.naming.*"%>
<%@page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<style>

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img id="preview" src="" width="200">

<input type="file" id="getfile" accept="image/*">
<script>
var file = document.querySelector('#getfile');

file.onchange = function () {
    var fileList = file.files ;

    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후 
        //로컬 이미지를 보여주기
        document.querySelector('#preview').src = reader.result;
        };
    };
</script>
</body>
</html>