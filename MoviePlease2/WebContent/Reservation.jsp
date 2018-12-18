<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
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
  
  <style type="text/css">
  
  .modal-title { margin: 0 auto; }
  
  .modal-content {
    position: relative;
    background-color: #ffffff;
    border: 1px solid #999999;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 0;
    outline: none;
    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
    box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
    background-clip: padding-box;
  }
  .modal-header {
    border-bottom: 1px solid #48a4ac;
    background: black;
    min-height: 16.4286px;
    padding: 10px 15px;
    color:white;
    text-align: center;
  }
  .close {
    float: right;
    font-size: 21px;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: .2;
    filter: alpha(opacity=20);
  }
  .modal-body {
    position: relative;
    padding: 20px;
  }
  
  
  
  
  
  
  
  
  
  
  .table {
    border-radius: 12px;
  }
  
  .table thead tr{
    background-color:lavender;
    border: 2px solid #ddd;
  }
  
  .table thead tr th{
    border: 2px solid #ddd;
  }
  
  .table tr td:hover,
  .table tr td:focus
  {
    background-color: red;
  }
  
  .table {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
  }
  
  .table tr td{
   
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
  
  
  
  <div class="container" style="margin-top:50px;">
    <div class="row">
 
      <div class="col-md-4">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">영화 목록</h4>
          </div>
          
                <%
ArrayList<String> movies = (ArrayList<String>)request.getAttribute("movies");
for(int i =0; i< movies.size(); i++){
%>
<button type="button" class="btn btn-outline-secondary" onclick="openMovieTheatersName(this.id);" id="movieNameButton<%=i%>"><%= movies.get(i) %></button>
<%} %>

          <form action='MovieTheatersNameServlet'  method='post' id="openMovieTheatersNameServlet">
          <input type="hidden" value="" id="movieName" name="movieName">
          <input type="hidden" value="" id="movieNameId" name="movieNameId">
          </form>     
          <input type="hidden" value="<%=session.getAttribute("movieNameId") %>" id="selectMovieNameId" name="selectMovieNameId">
          
        </div>
      </div>
      
      <div class="col-md-4" id="content">
       <% if(session.getAttribute("movieTheatersNames")!="0") 
       {%><jsp:include page="movieTheatersNameForm.jsp"/><%} %>
      </div>
      
      <div class="col-md-4" id="content2">
        <% if(session.getAttribute("movieShowTimes")!="0") 
       {%><jsp:include page="movieShowTimeForm.jsp"/><%} %>
      </div>
      
      
      
        
      </div>
    </div>
    
    
    
    
    
    
    <div class="container" style="margin-top:100px;">
    <div class="row">
    <% if(session.getAttribute("movieShowDays")!="0") 
       {%><jsp:include page="movieCalendarForm.jsp"/>
       
       <%} %>
       

      </div>
    </div>
    
    
    
    
    
    
    
    <script type="text/javascript">
    
    var selectmovieNameId = document.getElementById("selectMovieNameId").value;

  
    document.getElementById(selectmovieNameId).className = "btn btn-outline-secondary active";

    
    function openMovieTheatersName(id)
    {
    	document.getElementById("movieName").value = document.getElementById(id).textContent; 
    	document.getElementById("movieNameId").value = id;
    	document.getElementById("openMovieTheatersNameServlet").submit();
    }
    
    </script>
    
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/bootstrap.js"></script>
  </body>
  </html>
