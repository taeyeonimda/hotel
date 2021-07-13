<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>객실타입 내용</title>

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
</style>
<script> 
$(() => {
	var roomImages = ["${showRoomType.attachName1}", "${showRoomType.attachName2}", "${showRoomType.attachName3}"];
	$(".roomImage").each(function(idx, img){		
		if(roomImages[idx] != "")
			$(this).attr("src", "<c:url value='/attach/" + roomImages[idx] + "'/>");
		});	
});

function roomTypeDel(){
	let roomType = $('#roomType').val();
	
    $.ajax({ 
        url:"roomTypeDel",
        data:{
           roomType: roomType,
           },
        success: () =>{
           alert("객실타입 삭제가 완료되었습니다.");
           
           setTimeout("location.href='./roomTypeList'",2000);
        }
     });
}
</script>
</head>
<body>
<header>
   <%@ include file="../common/header.jsp" %>
</header>
<div class="container">
<form class="form-horizontal">
   <div class="form-inline" style="margin-left: 100px;">
	   <div class="container inputGroup">
			<div class="input-group col-md-3" >
				<img width="300" height="200" class="roomImage" style="margin-bottom: 10px; margin-right:5px;">
			</div>
			<div class="input-group col-md-3" >
				<img width="300" height="200" class="roomImage" style="margin-bottom: 10px; margin-right:5px;"> 
				
			</div>
		
			<div class="input-group col-md-3" >
				<img width="300" height="200" class="roomImage" style="margin-bottom: 10px; margin-right:5px;"> 
				
			</div>
		</div>  
	</div>
   <br>
   
   <ul class='location'>
      <li>객실 정보</li>
   </ul>  
   <br>    
   <div class="totalBox">
      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomType">객실 타입</label>
         <div class="col-sm-7">
            <input type="text" class='form-control' id="roomType" name="roomType" value="${showRoomType.roomType}" readonly>
         </div>   
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomInfo">객실 안내</label>
         <div class="col-sm-7">
            <textarea class="form-control" rows="3" name="roomInfo" readonly>${showRoomType.roomInfo}
            </textarea>
         </div>
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomBed">침대 타입</label>
         <div class="col-sm-7">
            <input type="text" class="form-control" name="roomBed" value="${showRoomType.roomBed}" readonly> 
         </div>
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomPerson">인원 수</label>
         <div class="col-sm-7">
            <input type="text" class="form-control" name="roomPerCnt" value="${showRoomType.roomPerCnt}" readonly> 
         </div>
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomPrice">가격</label>
         <div class="col-sm-7">
            <input type="number" class="form-control" name="roomPrice" value="${showRoomType.roomPrice}" readonly>
         </div>
      </div>
   </div>
   
   <div style="margin-bottom: 50px;">
   <a href="./roomTypeList" role= "button" class="btn btn-default" style="margin-left: 215px;">객실 타입 목록</a>
   <button type= "button" class="btn btn-default" onclick="roomTypeDel()" style="float: right; margin-right: 230px;">객실 타입 삭제</button>
   <a href="./roomTypeUpdate?roomType=${showRoomType.roomType}" role= "button" class="btn btn-default" style="float: right; margin-right: 15px;">객실 타입 수정</a>
   </div>
   
   
</form>
</div>
<footer>
   <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>