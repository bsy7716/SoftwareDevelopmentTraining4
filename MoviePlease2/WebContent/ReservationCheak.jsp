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
</style>

<script type="text/javascript">

function reservationSuccess()
{
	document.getElementById("ReservationSuccess").submit();
}
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
            <li class="nav-item active" style="margin-left:40px;">
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








 <div class = "container">
	<div class="wrapper">
		<div class="form-signin" style="text-align:center">       
		    <h3 class="form-signin-heading">현재 입력된 정보로 예매 하시겠습니까?</h3>
			  <br>
			  <table class="table table-bordered">
                <tbody>
                	 <tr>
                    <th class="table-primary" style="width:30%; height:10%;">영화명</th>
                    <td style="width:70%; height:10%;"><%=session.getAttribute("movieName") %></td>
                    </tr>
                    <tr>
                    <th class="table-primary" style="width:30%; height:10%;">상영날짜</th>
                    <td style="width:70%; height:10%;"><%=session.getAttribute("selectDate") %></td>
                    </tr>
                    <tr>
                    <th class="table-primary" style="width:30%; height:10%;">상영시간</th>
                    <td style="width:70%; height:10%;"><%=session.getAttribute("movieShowTime") %></td>
                    </tr>
                    <tr>
                    <th class="table-primary" style="width:30%; height:10%;">지점</th>
                    <td style="width:70%; height:10%;"><%=session.getAttribute("movieTheatersName") %></td>
                    </tr>
                    <tr>
                    <th class="table-primary" style="width:30%; height:10%;">좌석</th>
                    <td style="width:70%; height:10%;"><%=request.getParameter("selectSeat") %></td>
                    </tr>
                    <tr>
                    <th class="table-primary" style="width:30%; height:10%;">결재 금액</th>
                    <td style="width:70%; height:10%;"><%=request.getParameter("price") %>원</td>
                    </tr>
                </tbody>           
</table>
<div style="text-align:center">
<br>
<button type="button" class="btn btn-primary" style="width:30%" onclick="reservationSuccess();">예매 하기</button>
<button type="button" class="btn btn-secondary" style="width:30%; margin-left:10%" onclick="location.href='Home'">취소</button>
</div>
	</div>
	</div>
</div>



<form action='ReservationSuccess'  method='post' id="ReservationSuccess">
<input type="hidden" value="" id="personInfo" name="personInfo">
<input type="hidden" value=<%=request.getParameter("selectSeat") %> id="selectSeat" name="selectSeat">
<input type="hidden" value=<%=request.getParameter("price") %> id="price" name="price">
</form>












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








<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>