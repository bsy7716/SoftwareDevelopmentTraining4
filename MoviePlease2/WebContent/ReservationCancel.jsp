<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberDTO.Member"%>
<%@page import="reservationListDTO.ReservationList" %>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
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

<script type="text/javascript">
function cancelReservation(value){
	var deleteReservationConfirm = confirm('예매를 취소 하시겠습니까?');
	   if (deleteReservationConfirm) {
	      alert('예매가 정상적으로 취소 되었습니다.');
	  	document.getElementById("ticketNumber").value = value;
	  	document.getElementById("ReservationCancelServlet").submit();
	   }
	   else {
	      alert('취소되었습니다.');
	   }
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
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="ResetReservationSessionServlet">영화예매</a>
            </li>
            <li class="nav-item" style="margin-left:40px;">
              <a class="nav-link" href="ReservationView">예매조회</a>
            </li>
             <li class="nav-item active" style="margin-left:40px;">
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
   
   
   
   <%
   ArrayList<ReservationList> reservationLists = (ArrayList<ReservationList>)request.getAttribute("reservationLists");
   %>
   
	<div class="container">
	<h1 class="my-4">예매취소
        <small>Cancel Reservation</small>
    </h1>
			<div class="row">
			<div class="col-md-5 active">
			<img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt=""> <%-- 사용자 사진 --%>
           
           	<div class="media">
            <div class="media-body">
                <h5 class="media-heading"><br><strong><%=member.getUserId() %>(<%=member.getUserName() %>)님의 예매 내역입니다!</strong></h5>
            </div>
        	</div>
         	</div>
         	<br><br>
         	<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgroud-color:#eeeeee; text-align:center;">예매번호</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >영화</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >지점</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >상영일</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >상영시간</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >좌석</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >가격</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >예매취소</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i = 0; i < reservationLists.size(); i++) {%>
						<tr>
							<td><%=reservationLists.get(i).getTicketNumber() %></td>
							<td><%=reservationLists.get(i).getMovieName() %></td>
							<td><%=reservationLists.get(i).getMovieTheatersName() %></td>
							<td><%=reservationLists.get(i).getShowDay() %></td>
							<td><%=reservationLists.get(i).getShowTime() %></td>
							<td><%=reservationLists.get(i).getSeat() %></td>
							<td><%=reservationLists.get(i).getPrice() %></td>
							<td><button type="button" class="btn btn-danger pull-right" value="<%=reservationLists.get(i).getTicketNumber() %>" onclick="cancelReservation(this.value);">예매취소</button>&nbsp;&nbsp;</td>
						</tr>
						<%} %>
						<%if(reservationLists.size()==0) {%><td colspan="8">현재 예매된 영화가 존재하지 않습니다.</td><% }%>

					</tbody>
				</table>
				<form action='ReservationCancelServlet'  method='post' id="ReservationCancelServlet">
				<input type="hidden" value="" id="ticketNumber" name="ticketNumber"/>
				</form>
			</div>
			<br><br><br><br><br>
			<div class="col-md-9">
         	<h3 class="my-3">유의사항</h3>
          	
          	<h4>예매 및 결제</h4>
          	<ul>
            <li>관람 등급을 반드시 확인해주시기 바랍니다.
			<li>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</li>
			<li>홈페이지 예매 현황이 매진인 경우에도 영화관 현장에 잔여석이 남아있는 경우, 현장에서 구매 가능합니다.</li>
			<li>할인 카드로 결제 시, 할인 내역은 청구서에서 확인 가능합니다.</li>
			<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
			<li>상영시간 이후 관람하신 영화의 영수증 출력을 원하실 경우, 관람하신 영화관에서 출력 가능합니다.</li>
			<li>취소하신 내역이 나타나지 않거나 궁금하신 사항이 있으시면, 홈페이지에 문의해 주시기 바랍니다.</li>
         	</ul>
         	<br>
        	<h4>취소 및 환불 규정</h4>
          	<ul>
            <li>현장 취소를 하는 경우 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.</li>
			<li>홈페이지 또는 모바일에서 예매한 내역을 취소 할 경우 부분 취소는 불가능합니다.</li>
			<li>온라인 예매 취소는 상영시간 20분전까지 입니다.</li>
			<li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
			<li>발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</li>
         	</ul>
        	<br>
        	<h4>관람 유의사항</h4>
          	<ul>
            <li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
			<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
         	</ul>
		</div>
	</div>
			
	<br><br><br><br>	
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
    
	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>