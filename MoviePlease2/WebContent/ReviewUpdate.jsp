<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberDTO.Member"%>
<%@ page import = "vo.Review" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
    <meta name="author" content="">
	<title>영화를 부탁해</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%Member member = (Member)session.getAttribute("members"); %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="Home">영화를 부탁해</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
           <ul class="navbar-nav mr-auto" 
          <%if(member != null){%>
          style="margin-left:110px"<%}else{%>
          style="margin-left:200px"<%}%>>

            <li class="nav-item active">
              <a class="nav-link" href="Home">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="MovieList">영화정보</a>
            </li>
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="ResetReservationSessionServlet">영화예매</a>
            </li>
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="ReservationView">예매조회</a>
            </li>
             <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="ReservationCancel">예매취소</a>
            </li>
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="MovieSchedule.jsp">상영시간표</a>
            </li>

            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="inquiry">문의</a>
            </li>
            
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="review">리뷰&추천</a>
            </li>
            
           <li class="nav-item" style="margin-left:50px;">
              <a class="navbar-text" style="color:white;">
     		  <%if(member != null){%>안녕하세요! <%=member.getUserId() %>님 <%}%><%else{%><%}%>
              </a>
            </li>
           
          </ul>
          <%if(member != null){%>
          
          <button class="btn btn-outline-success my-3 my-sm-0" onclick="location.href='logout'">LogOut</button>
         
          <%}%><%else{%>
          <button class="btn btn-outline-success my-3 my-sm-0" data-toggle="modal" data-target="#login-modal">Login</button>
          <%}%>
          

        </div>
    </nav>
    <br><br><br><br>

<!-- Page Content -->
    <div class="container">

      <!-- Portfolio Item Heading -->
      <h1 class="my-4">리뷰&추천
        <small>Review</small>
      </h1>
      
       <div class="row">

         
    <div class="col-md-10">
		<form action="reviewupdate" method="post">
			<h3 style="margin-bottom: 25px; text-align: center;">리뷰 수정</h3>
			번호<input type="text" class="form-control" id="ReviewNo" name="ReviewNo" value='${review.reviewNo}' readonly><br>
			작성자<input type="text" class="form-control" id="ID" name="ID" value='${review.ID}' readonly><br>
			타입<select class="form-control" id="ReviewType" name="ReviewType">
			<option selected>${review.reviewType}</option>
			<option>리뷰</option>
			<option>영화추천</option>
			</select><br>
			영화<input type="text" class="form-control" id="MovieName" name="MovieName" value='${review.movieName}'><br>
			제목<input type="text" class="form-control" id="ReviewTitle" name="ReviewTitle" value='${review.reviewTitle}'><br>
			문의내용 <textarea class="form-control" name="ReviewContent" id="ReviewContent" rows="15" cols="60">${review.reviewContent}</textarea><br>
			평점<select class="form-control" name="MovieScore" id="MovieScore">
			<option selected>${review.movieScore}</option>
			<option>10.0</option>
			<option>9.0</option>
			<option>8.0</option>
			<option>7.0</option>
			<option>6.0</option>
			<option>5.0</option>
			<option>4.0</option>
			<option>3.0</option>
			<option>2.0</option>
			<option>1.0</option>
			</select><br>
			작성일<input type="text" class="form-control" id="ReviewDate" name="ReviewDate" value='${review.reviewDate}' readonly><br>
			<input class="btn btn-info pull-right" type="submit" value="수정">
			<input class="btn btn-danger pull-right" type="button" value="삭제" onclick="location.href='reviewdelete?ReviewNo=${review.reviewNo}';">
			<input class="btn btn-default pull-right" type="button" value="취소" onclick="location.href='review'">
		</form>
		
    </div>
    </div>
    
    

    
    <br><br><br><br><br>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    </div>
	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>