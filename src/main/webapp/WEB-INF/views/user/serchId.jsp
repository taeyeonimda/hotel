<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>트래블하우스 아이디찾기</title>
<script>
$(()=>{
	findId();
});
  
function findId(){
	$('#findId').click(()=>{ 
	$.ajax({
		url: "./findId", 
		data:{
			userName: $("#userName").val(),
			userEmail: $("#userEmail").val(),
		},
		success:(userId) =>{
			if(userId){
				$('p').html(`<h1>당신의 Id는`+`<mark>`+userId+`</mark>`+ `입니다.</h1>`);
			}else{ 
				alert("이름 혹은 이메일을 다시입력해주세요.");
			}
			
		},
		error: (error) =>{
			alert("이름 혹은 이메일을 다시입력해주세요.");
			return;
		}
	});
	});
};
</script>
<style>
.wrap{background:#FDFCFC; margin:100px 0px 100px 0px }
.form-horizontal {width: 500px; margin: 50px auto; }
#wrapTop{text-align:center;}

@media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      container {height:auto;} 
    }
</style>
</head>
<body>
<header>
<%@ include file="../common/header.jsp" %>
</header>

<div class="container" >
<div class= 'wrap'>
		<div id='wrapTop'>
		<a href= './serchId' class='btn btn-default btn-sm' >아이디찾기</a><a class='btn btn-default btn-sm' href='serchPw'>비밀번호 찾기</a>
			<h2>아이디 찾기<span class="glyphicon">&#xe008;</span></h2>
			<p></p>
			<hr>
		</div>
		<form class="form-horizontal" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="userName">이름:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="userName" placeholder="Enter Name" name="userName">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="userEmail">이메일:</label>
      <div class="col-sm-10">          
        <input type="email" class="form-control" id="userEmail" placeholder="Enter Email" name="userEmail">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="button" id ='findId' class="btn btn-info">아이디 찾기</button>
      </div>
    </div>
  </form>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br>
<footer>
<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>