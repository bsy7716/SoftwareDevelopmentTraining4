<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
.modal-footer {
  padding: 19px 20px 20px;
  margin-top: 0;
  text-align: right;
  border-top: 1px solid #e5e5e5;
}
</style>

</head>


<script type="text/javascript">


function idUse() {
	
	document.getElementById("ChilduserId").value = document.getElementById("CheakId").value
	opener.document.getElementById("userId").value = document.getElementById("ChilduserId").value
	opener.document.getElementById("idCheakText").textContent = "아이디 중복확인이 완료되었습니다."
	window.open("about:blank","_self").close();
} 



</script>






<body>






<div class="container" style="margin-top:100px;">
    <div class="row">
	<div class="modal-content">

    <div class="modal-header">
		<h4 class="modal-title">아이디 중복확인</h4>
	</div>

		<form action='IdCheakServlet' method='post' name="memberJoinForm">

			<div class="modal-body">

                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label for="userEmail">아이디</label>
                      <input type="text" class="form-control" name ="CheakId" required="" id="ChilduserId" >
                      
                      <span class="help-block">
                      
                      
                      <%if(request.getParameter("CheakId")==null){%> <%} else {%> <%= request.getParameter("CheakId") %><%} %>
                      
                     
                      <input type="hidden" value = <%= request.getParameter("CheakId") %> id="CheakId">
                      <br>
                      
                      
                      
                      
                      <%if(request.getAttribute("Cheak")=="1"){%>사용가능한 ID입니다.
                      <input type="button" value="사용하기" onclick="idUse();" class="btn btn-success btn-icon">
                      <%}
                      else if(request.getAttribute("Cheak")=="0"){
                      %>사용불가능한 ID입니다.<%} else{%>아이디를 입력 후 중복 검사를 실행하여 주세요.<%} %>
                      </span>
                    </div>
                  </div>

                  <div class="col-md-4" style="margin-top:32px;">
                      <input type='submit' value="아이디 중복확인" class="btn btn-success btn-icon">
                  </div>
                  
                </div>
             </div>

		</form>

	</div>
	</div>
</div>









<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>