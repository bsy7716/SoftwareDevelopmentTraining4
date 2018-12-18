<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberDTO.Member"%>
<%@ page import = "vo.Inquiry" %>
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

            <li class="nav-item active" style="margin-left:40px;">
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
    
      <h1 class="my-4">문의
        <small>Help</small>
      </h1>
      
       <div class="row">
        <div class="col-lg-3">
          <h2 class="my-3">자주찾는질문</h2>
          
          <div class="list-group">
          <button data-toggle="modal" data-target="#squarespaceModal1" class="btn btn-primary center-block">규정안내</button><br>
          <button data-toggle="modal" data-target="#squarespaceModal2" class="btn btn-primary center-block">관람등급</button><br>
          <button data-toggle="modal" data-target="#squarespaceModal3" class="btn btn-primary center-block">예매확인</button><br>
          <button data-toggle="modal" data-target="#squarespaceModal4" class="btn btn-primary center-block">예매취소</button><br>
          <button data-toggle="modal" data-target="#squarespaceModal5" class="btn btn-primary center-block">좌석변경</button><br>
          <button data-toggle="modal" data-target="#squarespaceModal6" class="btn btn-primary center-block">아이디/비밀번호 분실</button><br>
          </div>
        </div>

        <div class="col-lg-2">&nbsp;</div>
        
        <!-- line modal -->
		<div class="modal fade" id="squarespaceModal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="lineModalLabel">규정 안내</h3>
				</div>
				<div class="modal-body">
		           <p>■ 예매 시<br>
					ㆍ 홈페이지 예매 시 → 영화 시작시간 20분 전까지 예매 가능합니다.<br>
					ㆍ 모바일 앱/웹 예매 시 → 영화 시작시간까지 예매 가능합니다.<br>
					ㆍ 현장 →  영화 시작시간까지 예매 가능합니다.<br>
					<br>
					<br>
					■ 취소 시<br>
					ㆍ 홈페이지 취소 시 → 영화 시작시간 20분 전까지 취소 가능합니다.<br>
					ㆍ 모바일 앱/웹 예매 시 → 영화 시작시간 20분 전까지 취소 가능합니다.<br>
					ㆍ 현장 →  영화 시작시간 직전까지 취소 가능합니다.<br>
					<br>
					<br>
					※ 무대인사가 포함된 영화의 경우 행사의 원활한 진행을 위해 상영시간 24시간 이전부터는 취소가 불가합니다.<br>
		           </p>
		            
		
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group" aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">확인</button>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
        
		        <!-- line modal -->
		<div class="modal fade" id="squarespaceModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="lineModalLabel">관람등급 안내</h3>
				</div>
				<div class="modal-body">
		           <p>■ 등급 기준<br>
					  - 전체 관람가 : 모든 연령의 관람객이 관람 할 수 있는 영화<br>
					  - 12세 관람가 : 만 12세 미만의 관람객은 관람 할 수 없는 영화(보호자 동반 시 12세 미만 관람가)<br>
					   - 15세 관람가 : 만 15세 미만의 관람객은 관람 할 수 없는 영화(보호자 동반 시 15세 미만 관람가)<br>
					   - 청소년 관람불가 : 만 18세 미만의 관람객은 관람 할 수 없는 영화<br>
					<br>
					<br>
					<br>
					※ 만 18세 이상이라도 고등학생 신분은 청소년 관람불가 상영관에 입장 불가 (초, 중등교육법 제2조 규정)<br>
					※ 관람 시 보호자는 만 19세 이상의 부모 등의 동반자 가능<br>
					※ 인터넷 예매 시 영화 선택 후, 로그인한 예매자의 나이가 영화 등급에 해당 되지 않을 시 결제 진행 불가<br>
		           </p>
		            
		
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group" aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">확인</button>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
		
		        <!-- line modal -->
		<div class="modal fade" id="squarespaceModal3" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="lineModalLabel">예매확인 안내</h3>
				</div>
				<div class="modal-body">
		           <p>인터넷 예매 후 예매내역 확인을 원하시는 경우 다음과 같이 확인하세요. <br>
					<br>
 					<br>
					<br>	
						■ 홈페이지에서 확인 시<br>
						  - 홈페이지 로그인 → [예매 조회] → [MY 예매내역]<br>
		           </p>
		            
		
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group" aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">확인</button>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
		
		        <!-- line modal -->
		<div class="modal fade" id="squarespaceModal4" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="lineModalLabel">예매취소 안내</h3>
				</div>
				<div class="modal-body">
		           <p>인터넷 예매 후 취소를 원하시는 경우 다음과 같이 확인하세요. <br>
					<br>
 					<br>
					<br>	
						■ 홈페이지에서 취소 시<br>
						  - 홈페이지 로그인 → [예매 취소] → [MY 예매내역] → [해당 영화취소]<br>
		           <br>
		            1) 현장 취소를 하는 경우<br>
					  : 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.<br>
					<br>
					2) 홈페이지에서 예매 취소할 경우<br>
					 부분 취소는 불가합니다. (ex. 4장을 홈페이지로 예매한 경우 4장 모두 취소만 가능) <br>               
					홈페이지 예매 취소는 영화 상영 시작 시간 20분전까지 가능합니다.<br>
					영화 상영 시작 시간 이후 취소나 환불은 되지 않습니다.<br>
					<br>
					홈페이지상 영화예매는 상영시간 20분전 까지 가능하며,<br>
					시간 안에 결제까지 모두 마쳐주셔야 합니다.<br>
					<br>
					 <br>
					단, 현장 및 어플의 경우 상영시간 전까지 예매가 가능하오니,<br>
					상영시간이 20분 미만일 경우 현장 및 어플을 이용한 예매 진행 부탁드립니다. <br>
		           </p>
		            
		
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group" aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">확인</button>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
		
		        <!-- line modal -->
		<div class="modal fade" id="squarespaceModal5" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="lineModalLabel">좌석변경 안내</h3>
				</div>
				<div class="modal-body">
		           <p>예매내역 변경은 예매취소나 환불 후 재 결제하는 방식으로 가능합니다.<br>
						<br>
						 <br>
						<br>
						인터넷 상으로는 <예매확인 및 취소>에서 상영시간 20분전까 취소가 가능하며,<br>
						
						상영시작 20분 전까지 재 예매가 가능합니다.<br>
						
						현장에서는 영화의 상영시간 전까지 매표소에서 전체 환불 후 원하시는 시간이나 좌석으로<br>
						
						재 결제를 하셔야 합니다.<br>
		           </p>
		            
		
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group" aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">확인</button>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
		
		        <!-- line modal -->
		<div class="modal fade" id="squarespaceModal6" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="lineModalLabel">아이디/비밀번호 분실</h3>
				</div>
				<div class="modal-body">
		           <p>홈페이지 우측 상단 로그인 선택시 ID/PW 찾기를 통해 확인가능합니다.<br>
						<br>
						■ 아이디 찾기<br>
						  - [로그인] → [아이디 찾기] 클릭 시, 인증기관을 통해 본인인증 후 아이디 찾기 가능<br>
						    (인증방법은 '아이핀' 또는 '휴대폰'으로만 이용 가능)<br>
						<br>
						■ 비밀번호 찾기<br>
						   - [로그인] → [비밀번호 찾기] 클릭 시, 아이디 조회 후 회원정보 수정<br>
						<br>
						<br>
						단,비밀번호 찾기의 경우<br>
						현재 설정된 비밀번호 확인은 불가하며,<br>
						새로운 비밀번호로의 재 설정만 가능합니다.<br>
		           </p>
		            
		
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group" aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">확인</button>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
    
    <div class="col-md-7">
	<div class="row">
			<div class="col-md-7">
			<h4>문의하신 내용의 답변은 이메일로 발송됩니다!<br>이메일을 정확히 기재하기 바랍니다.</h4>
         	</div>
         	<br><br>
				<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgroud-color:#eeeeee; text-align:center;">번호</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >제목</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >작성자</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >이메일</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >작성일</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >문의내용</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >&nbsp;</th>
							<th style="backgroud-color:#eeeeee; text-align:center;" >&nbsp;</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="inquiry" items="${inquirys}">
						<tr>
							<td>${inquiry.inquiryNo}</td>
							<td>${inquiry.inquiryTitle}</td>
							<td>${inquiry.userName}</td>
							<td>${inquiry.userEmail}</td>
							<td>${inquiry.inquiryDate}</td>
							<%-- <td>${inquiry.inquiryContent}</td> --%>
							<td><a href="contentview?InquiryNo=${inquiry.inquiryNo}" class="btn btn-info btn-sm">보기</a></td>
							<td><a href="update?InquiryNo=${inquiry.inquiryNo}" class="btn btn-success btn-sm">수정</a></td>
							<td><a href="delete?InquiryNo=${inquiry.inquiryNo}" class="btn btn-danger btn-sm">삭제</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="write" class="btn btn-primary pull-right">1:1 문의</a> &nbsp;&nbsp;
			</div>
		</div>
    </div>
    
    

    
    <br><br><br><br><br>

    </div>
    
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
      
      
      
      
      
      
            <!-- id 창 시작 -->

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

<!-- id 창 끝 -->
	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>