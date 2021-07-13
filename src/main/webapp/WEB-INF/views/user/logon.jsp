<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<title>트래블하우스 로그인</title>
<head>
<meta charset="utf-8">
<script src="<c:url value="/js/login.js"/>" ></script>  
<script>
$(()=>{ 
	login();
});
 
function alert(text){
	   swal({
	        title: "",
	        text, 
	        icon:"",
	        timer:1000,
	        buttons:false,
	      });
	}

function login(){ 
	$('#loginBtn1').click(()=>{
		
		$.ajax({
			type:"post",
			url: "./login", 
			data:{ 
				userId: $('#userId').val(),
				userPwd: $('#userPwd').val(),
			},	
			success:(result) =>{
				if(result==true){ 
					location.href='../';
				}
				if(userId ==null){
					alert("아이디와 비밀번호를 정확하게 입력해 주세요.");
				}
			},
			error: (result) =>{ 
					alert("아이디와 비밀번호를 정확하게 입력해 주세요.");
					return;
			}
			
		})//ajax끝	
	});//클릭끝
};//함수끝
</script>
<style>
body {background: linear-gradient(to right, pink, white);}
.login-form {width: 380px; margin: 50px auto;}
.login-form form {background: white; box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.5);padding: 30px;}
.login-form h2 {margin: 0 0 15px;}
.form-control, .btn {min-height: 40px; border-radius: 2px;}
.btn {font-size: 15px; font-weight: bold;}
</style> 

</head>
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header> 
<div class = 'container'>
<div class="login-form">
    <form id="loginForm" class="form-horizontal" method ='post' action='../'>
        

       <h2 class="text-center font-en" style='font-size:50px;'>login</h2><br>      
         <div class="form-group">
         <input type="text" class="form-control" placeholder="ID" id='userId' name="userId" autofocus>
         <input type="password" class="form-control" placeholder="Password" id="userPwd" name="userPwd">
         <div class="checkbox"><label class="pull-left checkbox-inline"><input type="checkbox" name="idSaveCheck" id='idSaveCheck' value='y'>ID 저장</label></div>
            <br>
            <button id='loginBtn1' type="button" class="btn btn-info btn-block" name='login' >login</button>
           <a href='./joinForm' type="submit" class="btn btn-primary btn-block">회원가입</a><hr>
        </div>
			<a href="./serchId">ID 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="./serchPw">비밀번호 찾기</a>
      </form>
      <br>
</div>
</div>
<br><br><br><br><br><br>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>                        