<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/> <p id="image_container"></p>
<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/> <p id="image_container"></p>
<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/> <p id="image_container"></p>


	<script>
function setThumbnail(event) {
	for (var image of event.target.files) {
var reader = new FileReader();
reader.onload = function(event) {
var img = document.createElement("img");
img.setAttribute("src", event.target.result);

document.querySelector("p#image_container").appendChild(img);
};
console.log(image);
reader.readAsDataURL(image);
img.ensureThumbnail('picture.jpg', 100, 100, function(err, filename){
	
});
}
	} </script>

</body>
</html>