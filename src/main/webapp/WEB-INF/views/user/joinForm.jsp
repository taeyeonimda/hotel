<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<title>트래블하우스 가입</title>
<head>
<meta charset="utf-8">
<script>
$(()=>{
	userReg();
	chkId();
	chkMail();
}); 
   
<!--  주소찾기 --> 
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({ 
        oncomplete: function(data) {
           
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            autoClose:true;//자동닫기
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('userAddr').value = data.address;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("userAddr2").value = extraRoadAddr;
            } else {
                document.getElementById("userAddr2").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            autoClose:true;//자동닫기
        }
    }).open();    
}

	
function chkId(){
	$('#userId').keyup(()=>{
	let userId= $('#userId').val();
		
		$.ajax({
			url: "./chkId",
			data:{userId:userId},
			success: function(result){
				if(userId =="" || result ==1){
					$('#msg2').html("사용 불가능한 아이디입니다.").css("color","red");
					return;
				}else{
					$('#msg2').html("사용가능합니다.").css("color","green");
					
				}
			}
		})//아약스끝
	})
}

function chkMail(){
	$('#userEmail').keyup(()=>{
	let userEmail= $('#userEmail').val();
	
	let chkMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!chkMail.test(userEmail)){
		$('#msg3').html("사용 불가능한 이메일입니다.").css("color","red");
        return;
     }
		
		$.ajax({
			url: "./chkEmail",
			data:{userEmail:userEmail},
			success: function(result){
				if(userId =="" || result ==1){
					$('#msg3').html("사용 불가능한 이메일입니다.").css("color","red");
					return;
				}else{
					$('#msg3').html("사용가능합니다.").css("color","green");
					
				}
			}
		})//아약스끝
	})
}




function userReg(){
	   $('#regBtn').click(()=>{  
	      let userId= $('#userId').val();
	      let userName= $('#userName').val();
	      let userPwd= $("#userPwd").val();
	      let userEmail= $('#userEmail').val();
	      let userTel= $('#userTel').val();
	      let userAddr= $('#userAddr').val()+$("#userAddr2").val();
	      let userBirth=$('#userBirth').val();
	      let chkPwd = $("#chkPwd").val();
	      let userClass = $('#userClass1').val();
	      let userStatus = $("#userStatus").val();
	      let msg2=$('#msg2').text();
	      let msg3=$('#msg3').text();
	      
	      
	      let chkTel = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;
	       let chkMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	       let checkPwd = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/;
	       
	         
	       if(userName==""){
	            alert("이름을 입력해주세요");
	            return;
	         }
	         
	       if(msg2 == "사용 불가능한 아이디입니다."){
	          alert("아이디를 확인해주세요");
	          return;
	       }
	       
	       if(msg3 == "사용 불가능한 이메일입니다."){
	          alert("이메일을 확인해주세요");
	          return;
	       }
	       
	         if(userId==""){
	            alert("아이디를 입력해주세요");
	            return;
	         }
	         
	         if(msg2==""){
		            alert("아이디 중복체크를 해주세요");
		            return;
		         }	         
	         
	         if(!checkPwd.test(userPwd)){
	            alert("암호는 8자이상 12자이하로 영문,숫자,특수문자를 포함하여 사용해주세요");
	            return;
	         }
	         
	         if(userPwd != chkPwd){
	            alert("암호가 같지않습니다");
	            return;
	         }
	         
	         if(userBirth==""){
		            alert("생년월일을 입력해주세요");
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
	         
	         if(msg3 ==""){
	            alert("이메일 중복체크를 해주세요");
	            return;
	         }
	                  
	         if(userAddr==""){
		            alert("주소를 입력해주세요");
		            return;
		         }
	         
	         if(userAddr2==""){
		            alert("상세주소를 입력해주세요");
		            return;
		         }
	     
	   
	      $.ajax({ 
	         url:"join",
	         data:{
	            userId: userId,
	            userName: userName,
	            userPwd: userPwd,
	            userEmail: userEmail,
	            userTel: userTel, 
	            userAddr: userAddr, 
	            userBirth: userBirth,   
	            userClass: userClass,
	            userStatus: userStatus,
	            },
	         success: () =>{
	            alert("회원가입이 완료되었습니다.");
	            
	            setTimeout("location.href='../'",2000);
	         },
	         error: () =>{
	            // alert("회원가입이 실패하였습니다.");
	         }
	      });
	   
	   }); //클릭끝
	};


</script>
<style>
body {background: linear-gradient(to right, pink, white);}
.login-form {width: 500px; margin: 50px auto;}
.login-form form {margin-bottom: 20px; background: white; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5); padding: 30px; }
.login-form h2 {margin: 0 0 15px;}
.form-control, .btn {min-height: 40px; border-radius: 2px;}
.btn {font-size: 15px; font-weight: bold;}

input[type="date"]:not(.has-value):before{
  color: #999999;
  content: attr(placeholder);
 
}

</style>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class = 'container'><!-- 화면 여백 -->
   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원가입 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
   <div class="login-form">
      <form name="joinForm" method="post">
         <br>
         <h2 class="text-center font-kr" style='font-size:50px;'>회원가입</h2>
         <br>
         <p class="text-left font-kr" style='font-size:20px;'>회원가입을 위해 아래의 양식을 작성해주세요.</p>
         <div class="form-group "><input type="text" class="form-control" name="userName" id="userName" placeholder="이름" maxlength ='10' autofocus></div>
         
         <div class="from-group row">
            <div class="col-xs-12"><input type="text" class="form-control" name="userId" id='userId' maxlength='10' placeholder="ID"></div>
            <div id='msg2'></div>
      	</div><br>
         
         <div class="form-group"><input type="password" class="form-control" id='userPwd' name="userPwd" placeholder="암호는 영문,특수문자,숫자를 포함해 8자 이상을 적어주세요." maxlength='13'></div>
         <div class="form-group"><input type="password" id='chkPwd' name="chkPwd" class="form-control" placeholder="암호확인"></div>
         <div class="form-group"><input type="date" id="userBirth" name="userBirth" class="form-control" max='2001-12-31' placeholder="생년월일을 입력해 주세요. 　　　　　　" onchange="this.className=(this.value!=''?'has-value':'')"></div>
         <div class="form-group"><input type="text" class="form-control" name="userTel" id="userTel" placeholder="010으로 시작하는 휴대폰 번호를 입력해 주세요.(- 포함)"></div>
         <Input type='hidden' id='userStatus' value='A'>
         <div class="from-group row">
            <div class="col-xs-12"><input type="text" class="form-control" name="userEmail" id='userEmail' placeholder="E-mail" style='ime-mode:disabled;'></div>
      	<div id='msg3'></div>
      	</div><br>         
          
         <div class="from-group row">
            <div class="col-xs-9"><input type="text" class="form-control" id ="userAddr" name="address1" placeholder="주소" readonly required></div>
            <div class="col-xs-3"><button type="button" class="btn btn-default btn-sm" onclick="sample4_execDaumPostcode()">주소 찾기</button></div>
      	</div><br>
         <div class="form-group">
            <input type="text" class="form-control" id="userAddr2" name="address2" placeholder="상세주소를 입력해주세요.">
         </div>
         <div>
         	<p id='msg'></p>
         </div>

       <div class="text-center">
	       	<button id ='regBtn' type='button' class = 'btn btn-info'>회원가입</button>
	       	<!-- 
            	<a href='../' type="submit" class="btn btn-info" style="width: 50%">회원가입</a>
            -->
       </div>
       
       <input type="hidden" id="userClass1" value="Silver" />
      </form>
      <div class="text-center"> 이미 회원이신가요? <a href="./logon">login은 저를 클릭해주세요.</a></div>
   </div>
<!-- END END END END END END END END 회원가입 END END END END END END END -->
</div><!-- 화면 여백 끝 --><br><br><br>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>