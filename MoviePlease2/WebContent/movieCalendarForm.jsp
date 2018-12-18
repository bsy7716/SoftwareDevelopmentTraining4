<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화를 부탁해</title>
</head>

<script type="text/javascript">
/*
function clickDate(id){
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	
	if(document.getElementById(id).style.border == "2px solid blue")
	{
		alert("상영일 선택을 취소 하셨습니다.");
		document.getElementById(id).style.border ="1px solid #ddd";
		document.getElementById("selectDate").textContent = "원하시는 상영날짜를 선택하세요.";
	}
else
	{
		if(document.getElementById("day").value != "notSelect")
			{
				document.getElementById(document.getElementById("day").value).style.border = "1px solid #ddd";
			}
		document.getElementById(id).style.border = "2px solid blue";
		document.getElementById("selectDate").textContent = "선택된 상영일 : "  + year + "년 " + month + "월 " + id +"일";
		document.getElementById("selectDate").value = id;
	}
document.getElementById("day").value = id;
}
*/

function clickDate(id){
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	
	if(document.getElementById(id).style.border == "2px solid blue")
	{
		alert("상영일 선택을 취소 하셨습니다.");
		document.getElementById(id).style.border ="1px solid #ddd";
		document.getElementById("selectDateText").textContent = "원하시는 상영날짜를 선택하세요.";
		document.getElementById("dateCheak").value = 0;
	}
else
	{
		if(document.getElementById("day").value != "notSelect")
			{
				document.getElementById(document.getElementById("day").value).style.border = "1px solid #ddd";
			}
		if(document.getElementById(id).style.backgroundColor=="lavender")
			{
				document.getElementById(id).style.border = "2px solid blue";
				document.getElementById("selectDateText").textContent = "선택된 상영일 : "  + year + "년 " + month + "월 " + id +"일";
				document.getElementById("selectDateText").value = id;
				document.getElementById("selectDate").value = "" + year + "년 " + month + "월 " + id +"일";
				document.getElementById("dateCheak").value = 1;
			}
		else
			{
				alert("상영 일자가 아닙니다.");
			}
	}
	document.getElementById("day").value = id;
}

function nextReservation(){
	if(document.getElementById("dateCheak").value==0)
		alert("상영일을 선택해 주세요.");
	else
		document.getElementById("Reservation2").submit();
}
</script>

<body>
<% ArrayList<String> movieShowDays = (ArrayList<String>)session.getAttribute("movieShowDays"); %>




<%Calendar oCalendar = Calendar.getInstance();%>
     <% oCalendar.set(oCalendar.get(Calendar.YEAR), oCalendar.get(Calendar.MONTH), 1); %>
     <%int first = oCalendar.get(Calendar.DAY_OF_WEEK); %>
     <% oCalendar = Calendar.getInstance();%>
     
     <%int cal = Integer.parseInt(oCalendar.get(Calendar.YEAR)+""+(oCalendar.get(Calendar.MONTH)+1)+"00"); %>
     
     <% ArrayList<Integer> calList = new ArrayList<Integer>(); %>
     <% for(int i = 0; i< movieShowDays.size(); i++){%>
     <% calList.add(i,(Integer.parseInt(movieShowDays.get(i).replaceAll("[^0-9]", ""))-cal)); %>
     <% }
     %>
      <div class="col-md-5">
                <br>

            <table class="table table-bordered" style="text-align:center">
                <thead>
                    <tr>
                      <th colspan="7">
                        <span class="btn-group">
                            <a class="btn"><i class="icon-chevron-left">Back</i></a>
                          <a class="btn active"><%=oCalendar.get(Calendar.YEAR)%>년 <%=oCalendar.get(Calendar.MONTH)+1 %>월</a>
                          <a class="btn"><i class="icon-chevron-right">Next</i></a>
                        </span>
                      </th>
                    </tr>
                    <tr>
                        <th style="color:red;">Su</th>
                        <th>Mo</th>
                        <th>Tu</th>
                        <th>We</th>
                        <th>Th</th>
                        <th>Fr</th>
                        <th style="color:blue;">Sa</th>
                    </tr>
                </thead>
                <tbody>
                <%for(int i=1; i<=42; i++) {
                if(i%7==1 || i==1){%><tr><% } %>
                <% if(i<first || i> oCalendar.getActualMaximum(Calendar.DATE)+first-1){ %><td></td><%} else{%>
                <td id="<%=i-first+1 %>" onclick="clickDate(this.id);"
                
                
                
                <% for(int x=0; x<calList.size(); x++){ 
                if(calList.get(x) == i-first+1){
                if(calList.get(x) == oCalendar.get(Calendar.DATE)){%>style="background-color:lavender; color:red; font-weight:bold;"<%}
                else{ %>
                style="background-color:lavender;"
                <%} %>
                <% }%>
                <%}%>
                
                <%if(oCalendar.get(Calendar.DATE) == i-first+1){ %>
                style="color:red; font-weight:bold"
                <%}%>
             
                 
                >
                <%=i-first+1 %>
                </td><%} %>
                <% if(i%7==0){%></tr><% } %>
              	<%} %>
                </tbody>           
</table>
<h5 id="selectDateText" value="" style="text-align: center;">원하시는 상영일을 선택하세요.</h5>
<h6 style="text-align: center;">파란색 날짜 : 선택 가능</h6>
					<input type="hidden" value="notSelect" id="day">
					<input type="hidden" value="<%=oCalendar.get(Calendar.MONTH)+1 %>" id="month">
					<input type="hidden" value="<%=oCalendar.get(Calendar.YEAR) %>" id="year">
					<input type="hidden" value="0" id="dateCheak">
					<form action='Reservation2'  method='post' id="Reservation2">
					<input type="hidden" value="" id="selectDate" name="selectDate">
					</form>
</div>

<div class="col-md-3" style="">
       </div>
       <div class="col-md-3" style="">
       
       <br><br><br><br><br><br><br><br><br>
       <button type="button" class="btn btn-primary" style="width:100%; height:10%" onclick="nextReservation();">다음</button>
       <br>
       <br>
       <br>
       <br>
       <button type="button" class="btn btn-secondary" style="width:100%; height:10%">취소</button>
       <br>
       <br>
       
       </div>
</body>
</html>