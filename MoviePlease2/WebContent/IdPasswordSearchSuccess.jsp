<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberDTO.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<script type="text/javascript">

</script>



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
          <%if(member != null){%>
          
          <button class="btn btn-outline-success my-3 my-sm-0" onclick="location.href='logout'">LogOut</button>
         
          <%}%><%else{%>
          <button class="btn btn-outline-success my-3 my-sm-0" data-toggle="modal" data-target="#login-modal">Login</button>
          <%}%>
          

        </div>
    </nav>


<br><br>




     <div class = "container">
	<div class="wrapper">
		<form action="Home" method="post" name="Login_Form" class="form-signin">       
		    <h3 class="form-signin-heading">아이디/패스워드 찾기 결과 </h3>
			  <hr class="colorgraph"><br>

<%if(request.getAttribute("cheak")=="passwordCheak") {%>
			  <%if(request.getAttribute("password")!=null){ %>
			  <h6 style="color:red; text-align:center;">비밀번호 : <%=request.getAttribute("password") %></h6>
			  <%}else{ %>
			  <h6 style="color:red; text-align:center;">입력하신 정보와 일차하는 Password가 없습니다.</h6>
			  <%} %>
			  <%} %>
			  
<%if(request.getAttribute("cheak")=="idCheak") {%>
			  <%if(request.getAttribute("id")!=null){%>
			  <h6 style="color:red; text-align:center;">아이디 : <%=request.getAttribute("id") %></h6>
			  <%}else{ %>
			  <h6 style="color:red; text-align:center;">입력하신 정보와 일차하는 Id가 없습니다.</h6>
			  <%} %>
			  <%} %>
		</form>			
	</div>
</div>














<br><br><br><br>
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


<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="loginmodal-container">
              <h1>Login to Your Account</h1><br>
              <form action='Home' method='post'>
                <input type="text" name=ID placeholder="Id">
                <input type="password" name=PASSWORD placeholder="Password">
                <input type="submit" name="login" class="login loginmodal-submit" value="Login">
              </form>
              <div class="login-help">
                <a href="MemberJoin">회원가입</a> | <a href="IdPasswordSearch.jsp">아이디/비밀번호 찾기</a>
              </div>
            </div>
          </div>
        </div>
      </div>





<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>