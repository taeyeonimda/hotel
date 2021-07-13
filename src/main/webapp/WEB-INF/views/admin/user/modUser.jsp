<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<title>트래블하우스 수정 탈퇴</title>
<head>
<meta charset="utf-8">
<script src="<c:url value="/js/daum.js"/>" ></script>  
<script>
$(()=>{
	alert("수정 및 탈퇴시 기존패스워드 입력해주세요.");
	chnageUser(); 
	delUser(); 

}); 


function chnageUser(){ 
	$('#chnageBtn').click(()=>{
		let chkTel = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;
	    let chkMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    let checkPwd = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/;
	    
		let originPwd = $('#originPwd').val();//기존비밀번호 확인용 히든타입
		
		let oriPwd = $('#oriPwd').val();//기존비밀번호 입력해서 확인용
		
		let userEmail = $('#userEmail').val();
		let userTel = $('#userTel').val(); 
		let userPwd = $("#userPwd").val();
		
		if(originPwd != oriPwd){
			alert("기존비밀번호가 다릅니다");
			return;
		}
		
	      if(!chkTel.test(userTel)){
	            alert("전화번호형식이 맞지않습니다");
	            return;
	         }
 
	      if(!chkMail.test(userEmail)){
	            alert("이메일형식이 안맞아요");
	            return;
	         }
	      
		  if(userPwd !="" && !checkPwd.test(userPwd)){
	            alert("암호는 8자이상 12자이하로 영문,숫자,특수문자를 포함하여 사용해주세요");
	            return;
	         }
		  
		  if(oriPwd !="" && userPwd !="")
	      	oriPwd=userPwd;
		  
		$.ajax({
			url: "./chnage",
			data:{
					userPwd: oriPwd,
					userEmail: userEmail,
					userTel: userTel,
					userAddr:$('#userAddr').val(),
					userId :$('#userId').val(),
			}, 
			success: ()=>{
				alert("수정에 성공하였습니다. 회원목록으로 돌아갑니다");
				setTimeout('location.href="../user/listUser"',1500);
			},
			error: ()=>{
				alert("수정에 실패했습니다."); 
			}
		})
	});
};
 

 
//유저삭제(update)
function delUser(){
	$('#delBtn').click(()=>{
		let userId = $("userId").val();
		let originPwd = $('#originPwd').val();//기존비밀번호 확인용 히든타입
		let oriPwd = $('#oriPwd').val();//기존비밀번호 입력해서 확인용
		
		if(originPwd != oriPwd){
			alert("기존비밀번호가 다릅니다");
			return;
		}
		
		// var userPwd = 	"${sessionScope.userInfo.userPwd}";

		$.ajax({
			url : "./delete", 
			data: {
				userId:$('#userId').val(),
			}, 
			success:() =>{
				alert("탈퇴를 완료했습니다.");
				setTimeout('location.href="../user/listUser"',1500);
			},
			error: () =>{ 
				alert("탈퇴에 실패했습니다.");
			}
		})

		
  
	});
};
</script>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class= "container">
<form>
    	<h1 class="text-center"><b class='font-kr' style='font-size:50px;'>회원수정/탈퇴</b></h1><br>
        <p class="text-left font-kr" style='font-size:20px;'>회원님의 정보입니다.</p>
        <div class="form-group"><input class="form-control" id='userId' value = "${users.userId}" readonly ></div>
        <div class="form-group "><input class="form-control" value = "${users.userName}"readonly ></div>    
        <div class="form-group" ><input type="password" class="form-control" id='oriPwd' name="oriPwd" placeholder="기존패스워드." maxlength='13'></div>
		<div class="form-group"><input type="password" class="form-control" id='userPwd' name="userPwd" placeholder="영문,특수문자,숫자를 포함해 8자이상을 적어주세요." maxlength='13'></div>
		<div class="form-group"><input class="form-control" value ="${users.userBirth}" readonly></div>
		<div class="form-group"><input class="form-control" id='userTel' value = "${users.userTel}" ></div>
        <div class="form-group"><input class="form-control" id='userEmail' value = "${users.userEmail}"></div>
		<input type='hidden' id='originPwd' value='${users.userPwd}'>
		<div class="form-group row">
			<div class='col-sm-9'><input class="form-control" id ="userAddr"  name = 'userAddr' value='${users.userAddr}'placeholder="주소"  readonly></div>
			<div class='col-sm-3'><button type='button' class='btn btn-info' onclick="sample4_execDaumPostcode()" >주소찾기</button></div>
		</div>
		<div class="form-group"><input class="form-control" id="userAddr2" name='userAddr2'></div><br><br>
        <div id='testMsg'></div>
        <div class='text-center' id= 'btnLine'>
        	<button type='button' class= 'btn btn-info' id='chnageBtn'>수정</button>
        	<button type='button' class= 'btn btn-danger' id='delBtn'>탈퇴</button>  
        </div>
    </form>
</div>
</body>
</html>