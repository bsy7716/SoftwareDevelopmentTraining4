<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberDTO.Member"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화를 부탁해</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">

</head>
<style type = "text/css">


.table td:hover,
.table td:focus
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

.table td{
     border: 2px solid #ddd;
}

</style>

<script type="text/javascript">

function clickBtn(id){
	if(document.getElementById("cheakBtn").value == "")
	{
		document.getElementById(id).className = "btn btn-outline-primary active";
		document.getElementById("personInfo").value = document.getElementById(id).textContent;
		document.getElementById("cheakBtn").value = id;
		
	}
	else
		{
		if(id == document.getElementById("cheakBtn").value)
			{
				document.getElementById(id).className = "btn btn-outline-primary";
				document.getElementById("personInfo").value = "";
				document.getElementById("cheakBtn").value = "";
			}
		else
			{
				document.getElementById(document.getElementById("cheakBtn").value).className = "btn btn-outline-primary";
				document.getElementById(id).className = "btn btn-outline-primary active";
				document.getElementById("personInfo").value = document.getElementById(id).textContent;
				document.getElementById("cheakBtn").value = id;
			}
		}
	//document.getElementById("cheakBtn").value = id;
}
/*
function clickSeat(id){
	if(document.getElementById("seat").value == "")
	{
		document.getElementById(id).style.backgroundColor = "red";
	    document.getElementById("seatTextContent").textContent = "선택된 좌석 : " + document.getElementById(id).textContent;
	    document.getElementById("selectSeat").value = document.getElementById(id).textContent;
	}
	else
		{
		if(id == document.getElementById("seat").value)
			{
				alert("좌석 선택을 취소 하셨습니다.");
			    document.getElementById(id).style.backgroundColor = "white";
			    document.getElementById("seatTextContent").textContent = "좌석을 선택하세요.";
			    document.getElementById("selectSeat").value = "";
			}
		else
			{
				document.getElementById(document.getElementById("seat").value).style.backgroundColor = "white";
				document.getElementById(id).style.backgroundColor = "red";
				document.getElementById("seatTextContent").textContent = "선택된 좌석 : " + document.getElementById(id).textContent;
				document.getElementById("selectSeat").value = document.getElementById(id).textContent;
			}
		}
	  document.getElementById("seat").value = id;
	}
	*/
	
	function clickSeat(id){
		if(document.getElementById(id).style.backgroundColor == "black")
			{
				alert("예약 완료된 좌석입니다.");
			}
		else
			{
			if(document.getElementById("seat").value == "")
			{
				document.getElementById(id).style.backgroundColor = "red";
			    document.getElementById("seatTextContent").textContent = "선택된 좌석 : " + document.getElementById(id).textContent;
			    document.getElementById("selectSeat").value = document.getElementById(id).textContent;
			    document.getElementById("seat").value = id;
			}
			else
				{
				if(id == document.getElementById("seat").value)
					{
						alert("좌석 선택을 취소 하셨습니다.");
					    document.getElementById(id).style.backgroundColor = "white";
					    document.getElementById("seatTextContent").textContent = "좌석을 선택하세요.";
					    document.getElementById("selectSeat").value = "";
					    document.getElementById("seat").value = "";
					}
				else
					{
						document.getElementById(document.getElementById("seat").value).style.backgroundColor = "white";
						document.getElementById(id).style.backgroundColor = "red";
						document.getElementById("seatTextContent").textContent = "선택된 좌석 : " + document.getElementById(id).textContent;
						document.getElementById("selectSeat").value = document.getElementById(id).textContent;
						document.getElementById("seat").value = id;
					}
				}
			}
		}
	
	function successReservation(){
		if(document.getElementById("personInfo").value == "대인")
		{
			document.getElementById("price").value = "10,000";
		}
		else if (document.getElementById("personInfo").value == "어린이")
		{
			document.getElementById("price").value = "4,000";
		}
		else if(document.getElementById("personInfo").value == "우대")
		{
			document.getElementById("price").value = "5,000";
		}
		else
			{
				alert("인원 정보를 선택하세요.");
			}
		if(document.getElementById("selectSeat").value == "")
			{
				alert("좌석을 선택하세요.");
			}
		if(document.getElementById("selectSeat").value != "" && document.getElementById("personInfo").value != "")
			{
				document.getElementById("selectSeat").value = (document.getElementById("selectSeat").value).replace( /(\s*)/g, "");
				document.getElementById("ReservationCheak").submit();
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





<br><br><br>
 <div class="container">
 <div class="row">
            	
<div class="col-md-3" style="border:1px solid black; margin-left:5%; text-align:center;">




<br><br>

<div style=" position:static; width:80%; height:50%; border:1px solid black; margin-left:10%;">
<br>
<span>인원 정보</span>
<br><br>
<button type="button" class="btn btn-outline-primary" style="width:80%" onclick="clickBtn(this.id);" id="btnAdult" value="0">대인</button>
<br>
<br>
<button type="button" class="btn btn-outline-primary" style="width:80%" onclick="clickBtn(this.id);" id="btnChild" value="0">어린이</button>
<br>
<br>
<button type="button" class="btn btn-outline-primary" style="width:80%" onclick="clickBtn(this.id);" id="btnSpecial" value="0">우대</button>
<input type="hidden" id="cheakBtn" value=""/>


<input type="button" class="btn btn-primary" value="결제" style="width:80%; margin-top:45%" onclick="successReservation();"/>
<input type="button" class="btn btn-secondary" value="이전" style="width:80%; margin-top:10%"/>
</div>

</div>


<% ArrayList<String> seatList = (ArrayList<String>)session.getAttribute("seatList"); %>
<% ArrayList<Integer> seatNumberList = new ArrayList<Integer>(); %>

<%for(int x=0; x<seatList.size(); x++){ 
               switch(seatList.get(x).replaceAll("[^a-zA-Z]", ""))
               {
               case "A":
            	   seatNumberList.add(x, Integer.parseInt(seatList.get(x).replaceAll("[a-zA-Z]", ""))+0);
            	   break;
               case "B":
            	   seatNumberList.add(x, Integer.parseInt(seatList.get(x).replaceAll("[a-zA-Z]", ""))+7);
            	   break;
               case "C":
            	   seatNumberList.add(x, Integer.parseInt(seatList.get(x).replaceAll("[a-zA-Z]", ""))+14);
            	   break;
               case "D":
            	   seatNumberList.add(x, Integer.parseInt(seatList.get(x).replaceAll("[a-zA-Z]", ""))+21);
            	   break;
               case "E":
            	   seatNumberList.add(x, Integer.parseInt(seatList.get(x).replaceAll("[a-zA-Z]", ""))+28);
            	   break;
               case "F":
            	   seatNumberList.add(x, Integer.parseInt(seatList.get(x).replaceAll("[a-zA-Z]", ""))+35);
            	   break;
            	   default:
            		   break;
               }
}
%>

<div class="col-md-1">
</div>

<br><br><br><br><br><br>
<div class="col-md-7" style="border:1px solid black; border-radius:5px; text-align:center;">
<br><br>
<span style="border:1px solid black; padding:10px; color:blue;">좌석 배치도</span>
<br><br>
            		<h5 style="text-align:center; color:red;">SCREEN</h5>
                <br>

            <table class="table table-bordered">
              <thead>
                <tr>
                  
                </tr>
              </thead>
              <tbody>
                <%for(int i=1; i<=42; i++) {
                if(i%7==1 || i==1){%><tr><% } %>
                <td id="seat<%=i %>" onclick="clickSeat(this.id);"
                
                	<%for(int x=0; x<seatNumberList.size(); x++){ 
                        if(seatNumberList.get(x) == i){%>
                        style="background-color:black; color:white"
                        <% }%>
                        <%}%>
                >
                
                <%if(i<=7) {%>
                A<%= i  %>
                <%} 
                else if(i<=14) {%>
                B<%= i-7  %>
                <%} 
                else if(i<=21) {%>
                C<%= i-14  %>
                <%}
                else if(i<=28) {%>
                D<%= i-21  %>
                <%}
                else if(i<=35) {%>
                E<%= i-28  %>
                <%}
                else if(i<=42) {%>
                F<%= i-35  %>
                <%}%>
                </td>
                <% if(i%7==0){%></tr><% } %>
                <% }%>
              </tbody>
            </table>
            <h5 id="seatTextContent" value="" style="text-align: center;">좌석을 선택하세요.</h5>
            <input type="hidden" value="" id="seat">
            <br>
              </div>     
</div>
</div>

<form action='ReservationCheak'  method='post' id="ReservationCheak">
<input type="hidden" value="" id="personInfo" name="personInfo">
<input type="hidden" value="" id="selectSeat" name="selectSeat">
<input type="hidden" value="" id="price" name="price">
</form>






<script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>