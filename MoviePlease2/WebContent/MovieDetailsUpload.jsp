<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 부탁해</title>
</head>
<body>
	<form action="MovieDetailsUploadAction.jsp" method="post" enctype="multipart/form-data">
		영화 제목 : <input type="text" name="MovieName"> <br><br>
		개봉일 : <input type="text" name="OpenDate"> <br><br>
		장르 : <input type="text" name="MovieType"> <br><br>
		감독 : <input type="text" name="Director"> <br><br>
		배우 : <input type="text" name="Actor"> <br><br>
		러닝타임 : <input type="text" name="RunningTime"> <br><br>
		영화등급 : <select name="AgeGrade" size="1">
					<option>[국내] 전체</option>
					<option>[국내] 12세이상</option>
					<option>[국내] 15세이상</option>
					<option>[국내] 청소년관람불가</option>
					<option>[해외] 전체관람</option>
					<option>[해외] 12세이상</option>
					<option>[해외] 15세이상</option>
					<option>[해외] 청소년관람불가</option>
				</select><br><br>
		줄거리 : <br><textarea name="Plot" rows="20" cols="80"></textarea><br><br>
		예고편 : <input type="text" name="MovieTrailer"> <br><br>
		포스터1 : <input type="file" name="PosterOne"> <br><br>
		포스터2 : <input type="file" name="PosterTwo"> <br><br>
		포스터3 : <input type="file" name="PosterThree"> <br><br>
		
		<input type="submit" value="업로드"><br><br>
	</form>
</body>
</html>