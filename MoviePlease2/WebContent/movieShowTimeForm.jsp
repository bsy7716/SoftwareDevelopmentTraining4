<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화를 부탁해</title>
</head>



<body>
<div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">상영 시간</h4>
          </div>
         
          <%
ArrayList<String> movieShowTimes = (ArrayList<String>)session.getAttribute("movieShowTimes");

for(int i =0; i< movieShowTimes.size(); i++){
%>
<button type="button" class="btn btn-outline-secondary" onclick="openCalendar(this.id);" id="movieShowTimesButton<%=i%>"><%= movieShowTimes.get(i) %></button>
<%}%>
         <form action='MovieCalendarServlet'  method='post' id="MovieCalendarServlet">
          <input type="hidden" value="" id="movieShowTime" name="movieShowTime">
          <input type="hidden" value="" id="movieShowTimeId" name="movieShowTimeId">
          </form>
         <input type="hidden" value="<%=session.getAttribute("movieShowTimeId") %>" id="selectMovieShowTimeId" name="selectMovieShowTimeId">
        </div>
        
        
        
        
        
        
        
        <script type="text/javascript">

        var selectMovieShowTimeId = document.getElementById("selectMovieShowTimeId").value;
        document.getElementById(selectMovieShowTimeId).className = "btn btn-outline-secondary active";
function openCalendar(id){
	document.getElementById("movieShowTime").value = document.getElementById(id).textContent;
	document.getElementById("movieShowTimeId").value = id;
	document.getElementById("MovieCalendarServlet").submit();
}

</script>
</body>
</html>