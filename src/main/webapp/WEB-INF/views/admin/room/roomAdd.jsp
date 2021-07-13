<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>객실 추가</title>

<style>
.location li{
   float: left;
   margin : 80px 0px 10px 180px;
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
   padding-top: 100px;
   padding-bottom: 30px;
}

#roomNum{
   width: 350px;
   display:inline-block;
}

#chk_btn{
   margin: 0px 0px 3px 5px;
}

.type-inline{
   margin: 0px 20px 10px 0px;
}

#roomType{
   margin: 10px 10px 10px 0px;
}

.person-inline{
   margin: 0px 35px 10px 0px;
}

#personNo{
   margin: 10px 10px 10px 0px;
}

#roomStatus{
   margin: 10px 10px 10px 15px;
}
</style>
<script>
$(()=>{   
   chkNum();
   noRoomType();
   roomReg();
   
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
   
function chkNum(){
   $('#chkNumBtn').click(()=>{
      let roomNum = $('#roomNum').val();
      
      
      if(roomNum == ""){
          alert("객실번호를 입력해주세요");
          return;
      }
   
      
      $.ajax({
         url: "./chkNum",
         data:{roomNum: roomNum},
         success: function(result){
            if(result == 1 || roomNum == ""){
               $('#msg1').html("이미 존재하는 객실 번호입니다.");
               return;
            }else{
               $('#msg1').html("사용가능한 객실 번호입니다.");
               
            }
         }
      })//아약스끝
      
   })
}

function roomReg(){
   $('#add').click(() => {
      let roomNum = $('#roomNum').val();
      let roomType = $("#roomTypes option:selected").val();
      let roomResStatus = $('#roomResStatus').val();
      let roomStatus = $('#roomStatus').val();
      let msg1 = $('#msg1').text();
      
      if(msg1 == ""){
          alert("객실번호를 중복체크를 해주세요");
          return;
      }
      
      if(roomNum == ""){
          alert("객실번호를 입력해주세요");
          return;
      }
      
      if(msg1 == "이미 존재하는 객실 번호입니다."){
          alert("객실번호를 확인해주세요");
          return;
      }
      
      if(roomType == "noRoomType"){
         alert("등록된 객실타입이 없습니다. \n\n 객실 타입을 먼저 등록해주세요.");
         return;
      }
      
        $.ajax({ 
               url:"roomjoin",
               data:{
                  roomNum: roomNum,
                  roomResStatus: roomResStatus,
                  roomStatus: roomStatus,
                  roomType: roomType
                  },
               success: () =>{
                  alert("객실등록이 완료되었습니다.");
                  
                  setTimeout("location.href='./roomList'",2000);
               },
               error: () =>{
                  // alert("회원가입이 실패하였습니다.");
               }
            });
      
   });
   
};

function noRoomType(){
   if($('#roomTypes').find('option').length == 0){
      $('#roomType').show();
   }else{
      $("select option[value*='noRoomType']").prop('disabled',true);
      //$('#noRoomType').hide();
   }
}
</script>
</head>
<body>
<header>
   <%@ include file="../common/header.jsp" %>
</header>
<div class="container">
<br>
<hr>
 <ul class='location'>
   <li>객실 등록</li>
</ul> 
<br><br>
<form class="form-horizontal" action="#" > 
<div class="totalBox" >
<div class="form-group">
   <label class="col-form-label col-sm-2" for="roomNum">객실 번호</label>
   <div class="col-sm-7">
      <input type="number" class="form-control" id="roomNum" placeholder="객실 번호를 입력하세요" name="roomNum" >
      <span><button type="button" class="btn btn-default" id="chkNumBtn">중복 확인</button></span>
      <div id='msg1' style="margin-top: 5px;"></div>
   </div>   
</div>
<br>
   <div class="form-group">
      <label class="col-form-label col-sm-2" for="roomType">객실 타입</label>
      <div class="col-sm-6">
         <select name="roomBed" class="form-control" id="roomTypes">
        <c:forEach var='roomType' items='${roomTypeList}' >
              <option id='roomType' value="${roomType.roomType}">${roomType.roomType}</option>
        </c:forEach>
        <option id='roomType' value='noRoomType'>등록된 객실타입이 없습니다. 객실 타입을 먼저 등록해주세요.</option>
      </select>
       </div>
   </div>

   <div style="margin-top:12px; margin-bottom: 20px;">
      <h6>※  객실 타입을 선택하시면 객실 타입과 관련한 정보들이 자동으로 추가됩니다.</h6>
   </div>
   <br>
  
   <div class="form-group">
      <label class="col-form-label col-sm-2" for="roomType">객실 상태</label>
      <label class="type-inline"><input type="radio" name="roomStatus" id="roomStatus" value="운영중" checked>운영중</label>
      <label class="type-inline"><input type="radio" name="roomStatus" id="roomStatus" value="비운영">비운영</label>
   </div>    
    <br>
   <div style="margin-bottom: 150px;">
      <button type="button" class="btn btn-default" id= "add" style="float: right; margin-right: 315px;">객실 등록</button>
      <a href="./roomList" type= "button" class="btn btn-default" style="margin-left: -5px;">객실 목록</a>
   </div> 
<br><br>   
</form>
</div>
   <footer>
         <%@ include file="../common/footer.jsp" %>
   </footer>
</body>
</html>