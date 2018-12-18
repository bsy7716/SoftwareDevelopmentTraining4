<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="register.MovieDetailsRegisterDAO" %>
<%@page import="register.MovieDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 부탁해</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		//아래는 전송 받은 데이터들을 DB테이블에 저장시키기 위한 작업들
		// MultipartRequest로 전송받은 데이터를 불러온다.
		// enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 request객체가 아닌 MultipartRequest객체로 불러와야 한다.

		String MovieName = multipartRequest.getParameter("MovieName");
		String OpenDate = multipartRequest.getParameter("OpenDate");
		String MovieType = multipartRequest.getParameter("MovieType");
		String Director = multipartRequest.getParameter("Director");
		String Actor = multipartRequest.getParameter("Actor");
		String RunningTime = multipartRequest.getParameter("RunningTime");
		String AgeGrade = multipartRequest.getParameter("AgeGrade");
		String Plot = multipartRequest.getParameter("Plot");
		String MovieTrailer = multipartRequest.getParameter("MovieTrailer");
		// 전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다. 
		String PosterOne = multipartRequest.getFilesystemName("PosterOne");
		String PosterTwo = multipartRequest.getFilesystemName("PosterTwo");
		String PosterThree = multipartRequest.getFilesystemName("PosterThree");

		// 데이터들을 담을 그릇인 DTO(혹은 Bean) 객체를 생성 후, 데이터들을 set해준다. 

		MovieDetails movieDetailsDTO = new MovieDetails();

		movieDetailsDTO.setMovieName(MovieName);
		movieDetailsDTO.setOpenDate(OpenDate);
		movieDetailsDTO.setMovieType(MovieType);
		movieDetailsDTO.setDirector(Director);
		movieDetailsDTO.setActor(Actor);
		movieDetailsDTO.setRunningTime(RunningTime);
		movieDetailsDTO.setAgeGrade(AgeGrade);
		movieDetailsDTO.setPlot(Plot);
		movieDetailsDTO.setMovieTrailer(MovieTrailer);
		movieDetailsDTO.setPosterOne(PosterOne);
		movieDetailsDTO.setPosterTwo(PosterTwo);
		movieDetailsDTO.setPosterThree(PosterThree);

		// Service 객체 생성.(서비스가 없고 DAO에서 직접 처리한다면 DAO 객체 생성) 

		new MovieDetailsRegisterDAO().upload(MovieName, OpenDate, MovieType, Director, Actor, RunningTime, AgeGrade, Plot, MovieTrailer, PosterOne, PosterTwo, PosterThree);

		// 만약 return할 페이지에 방금 전송한 데이터들을 출력하고 싶다면 DTO를 속성에 담아준다.
		request.setAttribute("movieDetailsDTO", movieDetailsDTO);

		out.write("영화제목 : " + MovieName + "<br>");
		out.write("개봉일 : " + OpenDate + "<br>");
		out.write("장르 : " + MovieType + "<br>");
		out.write("감독 : " + Director + "<br>");
		out.write("배우 : " + Actor + "<br>");
		out.write("러닝타임 : " + RunningTime + "<br>");
		out.write("영화등급 : " + AgeGrade + "<br>");
		out.write("줄거리 : " + Plot + "<br>");
		out.write("예고편 : " + MovieTrailer + "<br>");
		out.write("포스터1 : " + PosterOne + "<br>");
		out.write("포스터2 : " + PosterTwo + "<br>");
		out.write("포스터3 : " + PosterThree + "<br>");
	%>
	<a href="MovieDetailsUpload.jsp"><input type="submit" value="확인"></a>
</body>
</html>