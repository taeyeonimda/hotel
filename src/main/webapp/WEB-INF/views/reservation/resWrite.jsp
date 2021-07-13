<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<head>
<title>예약 신청</title>
<meta charset="utf-8">


<script>
$(()=>{
	
	/*
	$("#resChkin").datepicker({
		minDate: 0,
	});
	*/
	
	resReg();
	chkMail();
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
	
function chkMail(){
	$('#resEmail').keyup(()=>{
	let resEmail= $('#resEmail').val();
	
	let chkMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!chkMail.test(resEmail)){
		$('#msg3').html("사용 불가능한 이메일입니다.").css("color","red");
        return;
     }
		
		$.ajax({
			url: "./chkEmail",
			data:{resEmail:resEmail},
			success: function(result){
				if(resId =="" || result ==1){
					$('#msg3').html("사용 불가능한 이메일입니다.").css("color","red");
					return;
				}else{
					$('#msg3').html("사용가능합니다.").css("color","green");
					
				}
			}
		})//아약스끝
	})
}




function resReg(){
	   $('#regBtn').click(()=>{
	      let resPername= $('#resPername').val();
	      let resEmail= $('#resEmail').val();
	      let resTel= $('#resTel').val();
	      let resChkin= $('#resChkin').val();
	      let resChkout= $('#resChkout').val();
	      let resPernum= $('#resPernum').val();
	      let msg2=$('#msg2').text();
	      let msg3=$('#msg3').text();
	      var form = document.resWriteForm;
	      
	      
	      let chkTel = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;
	       let chkMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	       let checkPwd = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/;
	       
	         
	       if(resPername==""){
	            alert("이름을 입력해주세요");
	            return;
	         }
	       
	         if(!chkMail.test(resEmail)){
	            alert("이메일형식이 안맞아요");
	            return;
	         }
	         
	         if(!chkTel.test(resTel)){
	            alert("전화번호형식이 맞지않습니다");
	            return;
	         }
	         
	         if(resChkin==""){
		            alert("체크인 날짜를 입력해주세요");
		            return;
		         }
	         
	         if(resChkout==""){
		            alert("체크아웃 날짜를 입력해주세요");
		            return;
		         }
	         
	         if(resPernum==""){
		            alert("인원수를 입력해주세요");
		            return;
		         }
	         
	         // location.href='./resPay';
	         form.submit();
	   
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
</style>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class = 'container'><!-- 화면 여백 -->
   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원가입 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
   <div class="login-form">
      <form name="resWriteForm" method="post" action="./resPay">
      
         <h2 class="text-center">
         <b class='font-kr' style='font-size:50px;'>예약 신청</b>
         </h2>
         <br><br>
         
         <table>
         	<tr>
         		<td width="200" style="font-size: 16px;"><label>신청자 성명</label></td>
         		<td width="400"><input type="text" class="form-control" name="resPername" id='resPername' placeholder="이름" maxlength ='10' autofocus></td>
        	</tr>
        	<tr><td>&nbsp;</td></tr>
         	<tr>
         		<td style="font-size: 16px;"><label>이메일</label></td>
         		<td><input type="text" class="form-control" name="resEmail" id='resEmail' placeholder="E-mail" style='ime-mode:disabled;'></td>
         	</tr>
         	<tr><td>&nbsp;</td></tr>
         	<tr>
         		<td style="font-size: 16px;"><label>연락처</label></td>
         		<td><input type="text" class="form-control" name="resTel" id='resTel' placeholder="전화번호"></td>
         	</tr>
         	<tr><td>&nbsp;</td></tr>
         	<tr>
         		<td style="font-size: 16px;"><label>체크인</label></td>
         		<td><input type="date" id="resChkin" name="resChkin" class="form-control" min='2020-07-14' max='2021-12-31' placeholder="체크인"></td>
        	</tr>
        	<tr><td>&nbsp;</td></tr>
        	<tr>
         		<td style="font-size: 16px;"><label>체크아웃</label></td>
         		<td><input type="date" id="resChkout" name="resChkout" class="form-control" min='2020-07-14' max='2021-12-31' placeholder="체크아웃"></td>
        	</tr>
        	<tr><td>&nbsp;</td></tr>
        	<tr>
         		<td style="font-size: 16px;"><label>인원수</label></td>
         		<td><input type="number" class="form-control" id="resPernum" name="resPernum" placeholder="인원수" min="0" max="10"></td>
        	</tr>
        	<tr><td>&nbsp;</td></tr>
        	<tr><td>&nbsp;</td></tr>
        	<tr><td>&nbsp;</td></tr>
        	<tr>
        		<td colspan="2" align="center">
        			<button type="button" id="regBtn" class="btn btn-info">예약신청 진행</button>
        			<button type="button" class="btn btn-info" onclick="location.href='../'">예약신청 취소</button>
        		</td>
        	</tr>
         </table>
         <input type="hidden" name="roomNum" value="${param.roomNum}" />
         <input type="hidden" name="roomTypeTxt" value="${param.roomTypeTxt}" />
      </form>
   </div>
   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원가입 끝 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
</div><!-- 화면 여백 끝 --><br><br><br><br><br>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>