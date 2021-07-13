<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>객실타입 추가</title>
<style>
.location li{
   float: left;
   margin : 10px 0px 20px 80px;
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
   margin: 5px 15px 8px 0px;
   width: 380px;
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
$(()=>{	
	roomTypeReg();
	chkType();
	
}); 

function chkType(){
	$('#chkTypeBtn').click(()=>{
		let roomType = $('#roomType').val();
		
			
		$.ajax({
			url: "./chkType",
            data:{roomType: roomType},
            success: function(result2){
               if(result2 == 1){
                  $('#msg2').html("이미 존재하는 객실 타입 명입니다.");
                  return;
               }else if(roomType == ""){
                  alert("객실 타입 명을 입력해주세요");
                  return;               
               }else{
                  var pattern = /([^가-힣a-z\x20])/i; 
                  
                  if(pattern.test(roomType)) alert("정확히 입력하세요.");
                  else{
                     $('#msg2').html("사용가능한 객실 타입 명입니다.");
                     return;
                  }            
               }
            }
         })//아약스끝		
		
	})
}


//이미지 추가
var imgView = function(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.addEventListener("load", function() {
			$('.previewImg').attr('src', reader.result);
		}, false);
		reader.readAsDataURL(input.files[0]);
	}
}
var imgView1 = function(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.addEventListener("load", function() {
			$('.previewImg1').attr('src', reader.result);
		}, false);
		reader.readAsDataURL(input.files[0]);
	}
}
var imgView2 = function(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.addEventListener("load", function() {
			$('.previewImg2').attr('src', reader.result);
		}, false);
		reader.readAsDataURL(input.files[0]);
	}
}

function roomTypeReg(){
	$("#addForm").bind("submit", function(e){
		e.preventDefault();	
		
		var roomImage = [null, null, null];
		for(var i = 0; i < roomImage.length ; i++){
			if($("#roomImage" + (i+1))[0].files[0] != null)
				roomImage[i] = "room/" + $("#roomImage" + (i+1))[0].files[0].name;
		}
		$("input[name=roomImage]").each(function(idx, img){
			if(roomImage[idx] != null){
				var formData = new FormData();
				formData.append( "file", img.files[0]);
				$.ajax({
					url: "addImage",
					method: "post",
					data: formData,
					processData: false,
					contentType: false,
					error:function(a, b, errMsg){
						alert(errMsg);
						return;
					}
				});
			}
		});
	//img1	
		var imgFile = $('#roomImage1').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	

		if($('#roomImage1').val() == "") {
			alert("첫 번째 객실 첨부파일을 선택해주세요.");
		    $("#roomImage1").focus();
		    return;
		}

		if(imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("roomImage1").files[0].size;
		    
		    if(!imgFile.match(fileForm)) {
		    	alert("이미지 파일만 업로드 가능합니다.");
		        return;
		    } 
		}
	//img2	
		var imgFile = $('#roomImage2').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
		

		if($('#roomImage2').val() == "") {
			alert("두 번째 객실 첨부파일을 선택해주세요.");
		    $("#roomImage2").focus();
		    return;
		}

		if(imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("roomImage2").files[0].size;
		    
		    if(!imgFile.match(fileForm)) {
		    	alert("이미지 파일만 업로드 가능합니다.");
		        return;
		    } 
		}
	//img3	
		var imgFile = $('#roomImage3').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
		

		if($('#roomImage3').val() == "") {
			alert("세 번째 객실 첨부파일을 선택해주세요.");
		    $("#roomImage3").focus();
		    return;
		}

		if(imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("roomImage3").files[0].size;
		    
		    if(!imgFile.match(fileForm)) {
		    	alert("이미지 파일만 업로드 가능합니다.");
		        return;
		    } 
		}
		
		let roomType = $('#roomType').val();
		let roomInfo = $('#roomInfo').val();
		let roomBed = $('#bedType').val();
		let roomPerCnt = $('#roomPerCnt').val();
		let roomPrice = $('#roomPrice').val();
		let attachName1= roomImage[0];
    	let attachName2= roomImage[1];
    	let attachName3= roomImage[2];
    	let msg2 = $('#msg2').text();
		
    	if(msg2 == "이미 존재하는 객실 타입 명입니다."){
		    alert("객실 타입 명을 확인해주세요");
		    return;
		}
		
		if(roomType == ""){
		    alert("객실 타입 명을 입력해주세요");
		    return;
		}
		
		if(msg2 == ""){
		    alert("객실 타입 명을 중복체크를 해주세요");
		    return;
		}
		
		if(roomInfo == ""){
		    alert("객실 안내를  입력해주세요");
		    return;
		}
		
		if(roomBed == ""){
		    alert("객실 침대 타입을 선택해주세요");
		    return;
		}
		
		if(roomPerCnt == ""){
		    alert("객실 인원 수를 선택해주세요");
		    return;
		}
		
		if(roomPrice == ""){
		    alert("객실 가격을 입력해주세요");
		    return;
		}
		
		  $.ajax({ 
	         url:"roomTypeJoin",
	         method:"POST",
	         data:{
	        	 roomType: roomType,
	        	 roomInfo: roomInfo,
	        	 roomBed: roomBed,
	        	 roomPerCnt: roomPerCnt,
	        	 roomPrice: roomPrice,
	        	 attachName1: roomImage[0],
	        	 attachName2: roomImage[1],
	        	 attachName3: roomImage[2]
	            },
	         success: () =>{
	            alert("객실 타입이 등록되었습니다.");
	            
	            setTimeout("location.href='./roomTypeList'",2000);
	         }
	      });
		
	});
	
};



</script>
</head>
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<div class="container">
<form class="form-horizontal" id="addForm" enctype="multiport/form-data" method="post" >
	<ul class='location'>
			<li>객실 타입 등록</li>
	</ul>  
	<br><br><br>
	<div class="form-inline" style="margin-left: 100px;">
	   <div class="container inputGroup">
			<div class="input-group col-md-3" >
				<img width="300" height="200" class="previewImg" style="margin-bottom: 10px; margin-right:5px;">
				<input type="file" id="roomImage1" value="roomImage" name="roomImage" accept="image/*"
								onchange="imgView(this)" >
			</div>
			<div class="input-group col-md-3" >
				<img width="300" height="200" class="previewImg1" style="margin-bottom: 10px; margin-right:5px;"> 
				<input type="file" id="roomImage2" value="roomImage1" name="roomImage" accept="image/*"
								onchange="imgView1(this)" >
			</div>
		
			<div class="input-group col-md-3" >
				<img width="300" height="200" class="previewImg2" style="margin-bottom: 10px; margin-right:5px;"> 
				<input type="file" id="roomImage3" value="roomImage2" name="roomImage" accept="image/*"
								onchange="imgView2(this)" >
			</div>
		</div>  
	</div>
   <br> 
   <div class="totalBox">
      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomType">객실 타입</label>
         <div class="col-sm-7">
            <label class="type-inline"> 
               <input type="text" class="form-control" name="roomType" id="roomType" placeholder="객실 타입 명을 한글로만 입력해주세요." 
               				onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;">
             </label> 
             <span><button type="button" class="btn btn-default" id="chkTypeBtn" onclick="test()">중복 확인</button></span>
             <div id='msg2' style="margin-top: 5px;"></div>
         </div>   
      </div>
		
      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomInfo">객실 안내</label>
         <div class="col-sm-7">
         	<textarea class="form-control" rows="3" name="roomInfo" id="roomInfo"></textarea>
         </div>
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomBed">침대 타입</label>
         <div class="col-sm-7">
            <select name="roomBed" class="form-control" id="bedType">
			  <option value="더블*1">더블*1</option>
			  <option value="더블*1,싱글*1">더블*1,싱글*1</option>
			  <option value="더블*2">더블*2</option>
			  <option value="더블*3">더블*3</option>
			</select>
         </div>
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomPerCnt">인원 수</label>
         <div class="col-sm-7">
            <select name="roomPerCnt" class="form-control" id="roomPerCnt">
			  <option value="1~2 명">1~2 명</option>
			  <option value="2~3 명">2~3 명</option>
			  <option value="3~4 명">3~4 명</option>
			  <option value="4~6 명">4~6 명</option>
			</select> 
         </div>
      </div>

      <div class="form-group">
         <label class="col-form-label col-sm-2" for="roomPrice">가격</label>
         <div class="col-sm-7">
            <input type="number" class="form-control" name="roomPrice" id="roomPrice" placeholder="(원)을 제외한 숫자만 입력해주세요." min="10000" max="1000000">
         </div>
      </div>
   </div>
   
   <div style="margin-bottom: 50px;">
	<a href="./roomTypeList" role= "button" class="btn btn-default" style="margin-left: 215px;">객실 타입 목록</a>
	<button type="submit" class="btn btn-default" id="add" style="float: right; margin-right: 235px;">객실 타입 등록</button>
   </div>
</form>
</div>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>