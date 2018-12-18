<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 부탁해</title>
</head>
<body>
	<form action="MovieUploadAction.jsp" method="post" enctype="multipart/form-data">
		영화 제목 : <input type="text" name="MovieName"> <br><br>
		포스터 : <input type="file" name="Poster"> <br><br>
		개봉일 : <input type="text" name="OpenDate"> <br><br>
		<input type="submit" value="업로드"><br><br>
	</form>
</body>
</html>