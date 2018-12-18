<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberDTO.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
    
<title>영화를 부탁해</title>






<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">



</head>
	
<style type = "text/css">
.wrapper {    
	margin-top: 80px;
	margin-bottom: 20px;
}

.form-signin {
  max-width: 600px;
  padding: 30px 38px 66px;
  margin: 0 auto;
  
    
  }

.form-signin-heading {
  text-align:center;
  margin-bottom: 30px;
}

.form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
}

input[type="text"] {
  margin-bottom: 0px;
  
}

input[type="password"] {
  margin-bottom: 20px;
 
}

.colorgraph {
  height: 0px;
  border-top: 0;
 
}














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










</style>
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
          
          

        </div>
    </nav>

	
	

     <div class = "container">
	<div class="wrapper">
		<form action="Home" method="post" name="Login_Form" class="form-signin">       
		    <h3 class="form-signin-heading">Welcome! MoviePlease</h3>
			  <hr class="colorgraph"><br>
			  
			  <input type="text" class="form-control" name="ID" placeholder="Id" required="" autofocus="" />
			  <br>
			  <input type="password" class="form-control" name="PASSWORD" placeholder="Password" required=""/>     		  
			 
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">Login</button>
			  <br>
			  <div style="font-size: 12px;">
                <a href="MemberJoin">회원가입</a> | <a href="IdPasswordSearch.jsp">아이디/비밀번호 찾기</a>
              </div>
              <br>
			  <h6 style="color:red;">아이디 혹은 비밀번호가 올라르지 않습니다. 다시 입력해주세요.</h6>
		</form>			
	</div>
</div>
   











<!-- footer 시작 -->

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

<!-- footer 끝 -->



    <!-- id 창 시작 -->








<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>