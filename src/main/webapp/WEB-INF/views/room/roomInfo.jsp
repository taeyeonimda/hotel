<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>객실 상세정보</title>

<style>
body {font-family: "Noto Sans KR", sans-serif !important;}
.carousel-control.left, .carousel-control.right {
    background-image: none !important;
}
.location li{
   float: left;
   margin-top: 10px;
   margin-right: 10px;
   list-style: none;
}

.location li::before{
   color: #6E6E6E;
   content: "〉";
   padding-right: 10px;
}

.location li:first-child::before{
   content: none;
}

a{
   color: black;
   text-decoration: none; 
}

.title{
   text-align: center;
   font-size: 16px;
   color: #2E2E2E;
   padding: 50px 10px;
   
}
.title >h1{
   font-size: 45px;
}

/* .title >h1{
   border-left: 5px solid #8A4B08;
   padding-top: 2px;
   padding-bottom: 5px;
   padding-left: 10px;
   letter-spacing: -0.07em;
   line-height: 30px;
} */

#resBtn{float: right; margin: 30px 40px 30px 0px; background-color: #343a40; color: white;
   border: none; line-height: 1.6em; padding: 10px 20px; font-size: 20px;}

#demo{
   margin: 0 auto;
   width: 1800px;
   height: 800px;
   
}

.description{
   padding: 50px 15px 20px 15px;
   font-size: 16px;
   line-height: 25px;
   text-align: center;
}

#info{
   width: 30%;
   font-size: 28px;
   float: left;
   padding: 60px 100px;
}

#info_content{
   float: left;
   font-size: 18px;
   width: 35%;
   list-style: none;
}

strong{
   font-size: 28px;
}

ul {
  list-style: none;
}

.li_list li::before {
  content: "\2022";
  color: #BDBDBD;
  font-weight: bold;
  display: inline-block; 
  width: 1em;
  margin-left: -1em;
}

.li_list li{
   font-size: 16px;
   padding-bottom: 5px;
   line-height: 27px;
}

.part{
   font-size: 20px;
}

.menu{
   padding-top: 30px;
   padding-bottom: 30px;
}

.menuList{
   display: inline-block;
   float: left;
   width: 20%;
}

.menu_subList{
   display: inline-block;
   padding-left: 100px;
   width: 80%;
}

.subList_list1{
   display: inline-block;
   width: 32%;
   float: left;
   padding-right: 60px;
}

.subList_list2{
   display: inline-block;
   width: 34%;
   float: left;
   padding-right: 60px;   
}

.bed{
   margin-bottom: 50px;
}
</style>
<script>
$(function(){
   $('#demo').carousel({
      interval: 3000,
      pause: "hover",
      wrap: true,
      keyboard: true
   });
});

$(() => {
	var roomImages = ["${room.attachName1}", "${room.attachName2}", "${room.attachName3}"];
	$(".roomImage").each(function(idx, img){		
		if(roomImages[idx] != "")
			$(this).attr("src", "<c:url value='/attach/" + roomImages[idx] + "'/>");
		});	
	
	$("#resBtn").click(()=>{
        let userId = "${user.userId}";
        let roomNum = "${findRoom.roomNum}";
        let roomTypeTxt = "${room.roomType}";
        
        if(userId ==null || userId ==""){
           alert("로그인 후 예약을 할 수있습니다");
           return;
        }else{
        	location.href = '../reservation/resWrite?roomNum=' + roomNum + '&roomTypeTxt=' + roomTypeTxt;
        }
   })
})
</script>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class="container-fluid">
	<div>
		<ul class='location'>
         	<li><a href="#" style="color: #6E6E6E">Home</a></li>
         	<li><a href="#" style="color: #6E6E6E">Rooms</a></li>
         	<li><a href="#">${room.roomType}</a></li>
     	</ul>
	</div>

	<div class='title'>
		<!--
		<p style='color:#585858' id='subtitle'></p>   
		<hr>
		-->
		<h1>${room.roomType}</h1>
      
	</div>
   
   <div id="demo" class="carousel slide carousel-fade" data-ride="carousel">
   
      <ol class="carousel-indicators">
         <li data-target="#demo" data-slide-to="0" class="active"></li>
         <li data-target="#demo" data-slide-to="1"></li>
      </ol>

         <div class="carousel-inner">
            <div class="item active" style="width: 1800px; height: 800px;">
				<img class="roomImage"/>	
         	</div>
          	<div class="item" style="width: 1800px; height: 800px;">
                <img class="roomImage"/>
           	</div>
           	<div class="item" style="width: 1800px; height: 800px;">
                <img class="roomImage"/>
           	</div>
         </div>

         <a class="left carousel-control" href="#demo" data-slide="prev">
           <span class="glyphicon glyphicon-chevron-left"></span>
           <span class="sr-only">Previous</span>
         </a>
         <a class="right carousel-control" href="#demo" data-slide="next">
           <span class="glyphicon glyphicon-chevron-right"></span>
           <span class="sr-only">Next</span>
         </a>   
   </div>
   
   <div><button type="button" class="btn btn-lg" id="resBtn">예약하기</button></div>
   
   <div class="container">
      <div class="description">
         <p><span style="font-size: 20px; line-height: 3em;">[${room.roomType} 룸]</span> <br>
       ${room.roomInfo}         
         </p>
       </div>
       
       <hr>
       <div class="menu">
         <div class="menuList">
            <strong>개요</strong>
         </div>
         
         <div class="menu_subList">
            <div class="subList_list1">
                 <ul class= "li_list">
                     <div class='bed'>
                        <strong class="part">침대 타입</strong>
                        <li style="line-height: 3em;">${room.roomBed}</li>
                     </div>
                     
                     <strong class="part">투숙 인원</strong>
                     <li style="line-height: 3em;">${room.roomPerCnt}</li>
                  </ul>
               </div>
               
              <!--  <div class="subList_list2">
                  <ul class= "li_list">
                     <strong class="part">객실 면적</strong>
                     <li style="line-height: 3em;">30 m²</li>
                  </ul>
               </div> -->
                
               <div class="subList_list2">
                  <ul class= "li_list">
                       <strong class="part">체크인 / 체크아웃</strong>
                     <li style="line-height: 3em;">15:00 / 12:00</li>
                 </ul>
            </div>
         </div>
      </div> 
      
      <hr>
      <div class="menu">
         <div class="menuList">
            <strong>어메니티</strong>
         </div>
         
         <div class="menu_subList">
                  <div class="subList_list1">
                     <ul class= "li_list">
                        <strong class="part">일반</strong><br><br>
                        <li>편안한 숙면을 도와주는 최고급사양 침대와 침구류</li>
                        <li>55인치 LED TV</li>
                        <li>에어컨</li>
                        <li>개인 금고</li>
                        <li>전기포트</li>
                        <li>미니 냉장고</li>
                        <li>구둣주걱</li>
                     </ul>
                  </div>
                  <div class="subList_list2">
                     <ul class= "li_list">
                        <strong class="part">욕실</strong><br><br>
                        <li>세면대 2개</li>
                        <li>욕조</li>
                        <li>비데</li>
                        <li>사이즈 별 고급 타올</li>
                        <li>Luxury Bath Amenity (샴푸, 린스, 바디 클렌저)</li>
                        <li>1회용 칫솔 및 치약 세트</li>
                        <li>면도기</li>
                        <li>객실 슬리퍼</li>
                        <li>실내 가운</li>
                        <li>헤어 드라이어</li>
                     </ul>
                   </div>
                   <div class="subList_list2">
                      <ul class= "li_list">
                          <strong class="part">기타</strong><br><br>
                        <li>케이블 위성 TV채널</li>
                        <li>무료 생수 2병 및 티백</li>
                        <li>무료 일간 신문</li>
                     </ul>
               </div>
         </div>
      </div>
      <hr>
      <div class="menu">
         <div class="menuList">
            <strong>무료제공 서비스</strong>
         </div>
         <div class="menu_subList">
               <ul class= "li_list">
                  <li>유,무선 인터넷</li>
                  <li>다리미 & 다리미판 대여 (프런트에 요청 시)</li>
                  <li>우산대여 (프런트에 요청 시)</li>
                  <li>RoofTop Track 무료 이용</li>
                  <li>한 객실당 차량 1대 무료</li>
                  <li>턴다운 서비스 (제공시간 14:00-17:00 / 체크아웃 당일 서비스 불가)</li>
                  <li>Wake-up 서비스</li>
                  <li>개인 음성 사서함 서비스</li>
                  <li>신문 서비스 (요청시에 한함)</li>
               </ul>
         </div>
      </div>
      <hr>   
      <div class="menu">
         <div class="menuList">
            <strong>유료제공 서비스</strong>
         </div>
         <div class="menu_subList">
               <ul class= "li_list">
                  <strong class="part">룸서비스</strong><br><br>
                  <li>객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.</li>
                  <li>식사 및 음료 : 24시간 서비스 </li>
                  <li>중식, 일식 : 점심 12:00~14:00, 저녁 18:00~21:30</li>
               </ul>
            </div>
      </div>
      <hr>
      <div class="menu">
         <div class="menuList">
            <strong>추가정보</strong>
         </div>
         <div class="menu_subList">
               <ul class= "li_list">
                  <li>전 객실 금연(적발시 패널티 적용 : 100,000원)</li>
                  <li>Extra 침대의 추가 제공은 되지 않습니다.</li>
                  <li>객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.</li>
                  <li>호텔내 반려동물 동반 입장은 불가합니다.</li>
                  <li>화재의 위험이 있는 양초류의 사용은 불가합니다.</li>
               </ul>
         </div>
      </div>  
   </div>
</div> 
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>  
</body>
</html>