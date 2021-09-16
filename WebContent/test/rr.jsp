<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
     function file_browse()
     {
           document.form.file.click();
           document.form.picName.value=document.form.file.value; 
     }
     </script>
     <style>
     body,td,div{font-size:8pt;font-family:verdana}
     .style{color:#3980F4}
     </style>
</head>
<body>
<form name="form">
<table>
<input type="file" name= "file" style= "display:none;"/>
<tr>
     <td><img src="../img/none.PNG" onclick="file_browse()" style="cursor:pointer"></td>
	<td><input type="text" name="picName"></td>
</tr>
</table>
</form>
</body>
</html>