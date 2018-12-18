<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "register.MovieDetails"%>
<%@ page import = "java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="memberDTO.Member"%>
<%@page import="movieDetailDTO.MovieDetail"%>

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
	
	<style type = "text/css">



.context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
}

.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}

.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}

ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}

.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}



@import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 500px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
}

.login-help{
  font-size: 12px;
}



</style>
	
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

            <li class="nav-item">
              <a class="nav-link" href="Home">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            
            <li class="nav-item active" style="margin-left:40px;">
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
	 <%MovieDetail movieDetail = (MovieDetail)request.getAttribute("movieDetail");%>
	 
    <!-- Page Content -->
    <div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">영화상세정보</h1>
				<div class="list-group">
				<a href="ResetReservationSessionServlet" class="list-group-item active"><strong>예매하기</strong></a>
				<br>
				<a href="MovieSchedule.jsp" class="list-group-item active"><strong>상영시간표</strong></a>
				</div>
			</div>
        <!-- /.col-lg-3 -->
			<div class="col-lg-9">
				<div class="card mt-4">
				 <%-- 동영상 소스코드 src부분 --%>
				<iframe width="824" height="450" src="<%=movieDetail.getMovieTrailer() %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<div class="card-body">
				  <h3 class="card-title"><%=movieDetail.getMovieName() %></h3> <%--MovieName --%>
				  <h4>간단 줄거리</h4>
				  <p class="card-text"><%=movieDetail.getPlot() %></p>
				<div class="col-md-6">
				<h3 class="my-3">상세정보</h3>
				  <ul>
					<li>기본정보 : <%=movieDetail.getAgeGrade() %>, <%=movieDetail.getRunningTime() %></li>
					<li>개봉일 : <%=movieDetail.getOpenDate() %></li>
					<li>장르 : <%=movieDetail.getMovieType() %></li>
					<li>감독 :<%=movieDetail.getDirector() %></li>
					<li>배우 : <%=movieDetail.getActor() %></li>
				  </ul>
					</div>
					  평점 <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span> 4.0
					</div>
				  </div>
				  
				  <h3 class="my-4">스틸컷</h3>
				  <div class="row">
					<div class="col-md-4 col-sm-6 mb-4">
						<img class="img-fluid"  src="./image/<%=movieDetail.getPosterOne()%>" alt="국가부도의날1">
					</div>
			
					<div class="col-md-4 col-sm-6 mb-4">
						<img class="img-fluid" src="./image/<%=movieDetail.getPosterTwo() %>" alt="국가부도의날2">
					</div>
			
					<div class="col-md-4 col-sm-6 mb-4">
						<img class="img-fluid" src="./image/<%=movieDetail.getPosterThree() %>" alt="국가부도의날3">
					</div>
				  </div>
				  
				  <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
		            <ol class="carousel-indicators">
		              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		            </ol>
		            <div class="carousel-inner" role="listbox">
		              <div class="carousel-item active">
		                <img class="d-block img-fluid" src="./image/<%=movieDetail.getPosterOne() %>" alt="국가부도의날1">
		              </div>
		              <div class="carousel-item">
		                <img class="d-block img-fluid" src="./image/<%=movieDetail.getPosterTwo() %>" alt="국가부도의날2">
		              </div>
		              <div class="carousel-item">
		                <img class="d-block img-fluid" src="./image/<%=movieDetail.getPosterThree() %>" alt="국가부도의날3">
		              </div>
		            </div>
		            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		              <span class="sr-only">Previous</span>
		            </a>
		            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		              <span class="carousel-control-next-icon" aria-hidden="true"></span>
		              <span class="sr-only">Next</span>
		            </a>
		          </div>
				  
				 <a href="review" class="btn btn-primary pull-right btn-lg">리뷰 & 추천영화보러가기</a><br><br>
				  
			  </div>
			  <!-- /.card -->
          <!-- /.card -->
        </div>    
    </div>
        <!-- /.col-lg-9 -->
    <!-- /.container -->


    <!-- Footer -->
    <footer class="section footer-classic context-dark bg-image" style="background: #2d3246;">
        <div class="container">
          <div class="row row-30">
            <div class="col-md-4 col-xl-5">
              <div class="pr-xl-4">
              <br>
              <h5>소프트웨어 개발실습4 프로젝트</h5>
              <br>
                <h6>20131721 박수용</h6>
                <h6>20141722 서정호</h6>
                <br>
                <!-- Rights-->
                <p class="rights"><span>Made by Team MoviePlease</span></p>
              </div>
            </div>
            <div class="col-md-4">
            <br>
              <h5>Contacts</h5>
              <dl class="contact-list">
                <dt>Address:</dt>
                <dd>부산광역시 사상구 주례로 47 동서대학교</dd>
              </dl>
              <dl class="contact-list">
                <dt>email:</dt>
                <dd>Test@gmail.com</dd>
              </dl>
              <dl class="contact-list">
                <dt>phones:</dt>
                <dd><span>010-1234-5678</span></dd>
              </dl>
            </div>
            <div class="col-md-4 col-xl-3">
            <br>
              <h5>Links</h5>
              <ul class="nav-list">
                <li><a href="http://www.facebook.com">Facebook</a></li>
                <li><a href="http://www.instagram.com">instagram</a></li>
                <li><a href="http://twitter.com">twitter</a></li>
                <li><a href="http://www.google.com">google</a></li>
              </ul>
            </div>
          </div>
        </div>
      </footer>

      
	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.3.1.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
</body>
</html>


