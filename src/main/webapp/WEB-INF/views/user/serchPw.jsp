<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>트래블하우스 비밀번호 찾기</title>
<script>
$(()=>{ 
	findPw();
});

function findPw(){
	$("#findPw").click(()=>{
		$.ajax({
			url:"./findPw",
			data:{
				userId: $("#userId").val(),
				userEmail: $("#userEmail").val(),
			},
			success : function(userId){
				if(userId){ 
					alert("비밀번호를 이메일로 발송하였습니다");
				}else{
					$('p').html(`<h3><mark>아이디 혹은 이메일을 확인해주세요</mark></h3>`);
				}
			},
			error:function(a,b,errMsg){
				$('p').html(`<h3><mark>아이디 혹은 이메일을 확인해주세요</mark></h3>`); 
				return;
			}, 
			complete :function(){
				alert("비밀번호를 이메일로 발송하였습니다");
			}
		});
	});
};
</script>
<style>
.wrap{background:#FDFCFC; margin:100px 0px 100px 0px }
.form-horizontal {width: 500px; margin: 50px auto; }
#wrapTop{text-align:center;}
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
			<h2>비밀번호 찾기<span class="glyphicon">&#xe033;</span></h2>
			<p></p>
			<hr>
		</div>
		<form class="form-horizontal" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="userId">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="userId" placeholder="Enter Id" name="userId">
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
        <button type="button" id ='findPw'  class="btn btn-info">비밀번호 찾기</button>
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
