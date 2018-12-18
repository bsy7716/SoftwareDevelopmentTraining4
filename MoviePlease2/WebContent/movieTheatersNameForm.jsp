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
            <h4 class="modal-title">지점</h4>
          </div>
          
          <%
ArrayList<String> movieTheatersNames = (ArrayList<String>)session.getAttribute("movieTheatersNames");
          
for(int i =0; i< movieTheatersNames.size(); i++){
%>
<button type="button" class="btn btn-outline-secondary" onclick="openShowTime(this.id);" id="movieTheatersNameButton<%=i%>"><%= movieTheatersNames.get(i) %></button>
<%}%>
          <form action='MovieShowTimeServlet'  method='post' id="openMovieShowTimeServlet">
          <input type="hidden" value="" id="movieTheatersName" name="movieTheatersName">
          <input type="hidden" value="" id="movieTheatersNameId" name="movieTheatersNameId">
          </form>
          
          <input type="hidden" value="<%=session.getAttribute("movieTheatersNameId") %>" id="selectMovieTheatersNameId" name="selectMovieTheatersNameId">
<%if(movieTheatersNames.size()==0) {%><br><h6 style="text-align:center;">현재 상영중인 지점이 없습니다.</h5><br><% }%>

        </div>
        
        <script type="text/javascript">


        var selectMovieTheatersNameId = document.getElementById("selectMovieTheatersNameId").value;
        document.getElementById(selectMovieTheatersNameId).className = "btn btn-outline-secondary active";
function openShowTime(id){
	document.getElementById("movieTheatersName").value = document.getElementById(id).textContent;
	document.getElementById("movieTheatersNameId").value = id;
	document.getElementById("openMovieShowTimeServlet").submit();
}

</script>
</body>
</html>