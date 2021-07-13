<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>객실상태 변경</title>
<style>
.location li{
   float: left;
   margin : 10px 0px 10px 180px;
   list-style: none;
   font-size: 18px;
   font-weight: 700;
}

.location li::before{
   color: #6E6E6E;
   content: "〉";
   padding-right: 10px;
}

.totalBox{
   padding-left: 20%;
   padding-top: 30px;
   padding-bottom: 30px;
}

.roomImg{
   width: 700px;
   height: 280px;
}

#myCarousel{
   width: 700px;
   margin: auto;
}
.img_btn{
   padding-top: 220px;
   padding-left: 500px;
}   

.col-form-label{
   font-size: 16px;
   padding-top: 5px;
   padding-left: 50px;
}

.totalBox{
   padding-left: 20%;
   padding-top: 30px;
   padding-bottom: 30px;
}

#chk_btn{
   margin: 0px 0px 3px 5px;
}

.type-inline{
   margin: 0px 20px 10px 0px;
}

#roomType{
   margin: 10px 15px 10px 0px;
}

.person-inline{
   margin: 0px 35px 10px 0px;
}

#personNo{
   margin: 10px 10px 10px 0px;
}

#roomAdd{
   width:35%; 
   margin:auto;
}

#roomStatus{
   margin: 10px 10px 10px 15px;
}
</style>
<script>
$(()=>{
	roomUpdate();
});
function alert(text){
    swal({
         title: "",
         text, 
         icon:"",
         timer:2000,
         buttons:false,
       });
 }
 
function roomUpdate(){
	$('#update').click(()=>{
		let roomNum = $('#roomNum').val();
		let roomType = $('#roomType').val();
		let roomStatus = $('input[name=roomStatus]:checked').val();
		
		console.log(roomStatus);
		
	    if($('input[name=roomStatus]:checked').val() == null){
	    	alert("객실 운영 상태를 선택해주세요.")
	    	return;
	    }
	    
	    $.ajax({ 
	        url:"roomCorrect",
	        data:{
	           roomNum: roomNum,
	           roomType: roomType,
	           roomStatus: roomStatus
	           },
	        success: () =>{
	           alert("객실 수정이 완료되었습니다.");
	           
	           setTimeout("location.href='./roomList'",1500);
	        }
	     });
	});
}

</script>
</head>
<body>
   <header>
         <%@ include file="../common/header.jsp" %>
   </header>
<div class="container">
<ul class='location'>
   <li>객실 상태 변경</li>
</ul> 
<br><br>

<form class="form-horizontal" action="#"> 
   <div class="totalBox">
	   <div class="form-group">
	       <label class="col-form-label col-sm-2" for="roomNum">객실 번호</label>
	      <div class="col-sm-5">
	         <input type="text" class='form-control' id="roomNum" name="roomNum" value="${room.roomNum}" readonly>
	      </div>  
	   </div>
	   <br>
	
	   <div class="form-group">
	      <label class="col-form-label col-sm-2" for="roomType">객실 타입</label>
	      <div class="col-sm-5">
	            <input type="text" class='form-control' id="roomType" name="roomType" value="${room.roomType}" readonly>
	         </div>
	   </div>
	   <br>
	     
	   <div class="form-group">
	      <label class="col-form-label col-sm-2" for="roomType">객실 상태</label>
	      <label class="type-inline"><input type="radio" name="roomStatus" id="roomStatus" value="운영중">운영중</label>
	      <label class="type-inline"><input type="radio" name="roomStatus" id="roomStatus" value="비운영">비운영</label>
	   </div>    
	    <br>
	   <div style="margin-bottom: 150px;">
	      <button type="button" class="btn btn-default" id= "update" style="float: right; margin-right: 315px;">객실 수정</button>
	      <a href="./roomList" type= "button" class="btn btn-default" style="margin-left: -5px;">객실 목록</a>
	   </div> 
   </div>
<br><br>   
</form>
</div>
   <footer>
         <%@ include file="../common/footer.jsp" %>
   </footer>
</body>
</html>