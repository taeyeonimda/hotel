<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>header</title>
<meta charset="utf-8">
<style>
.navbar  {background:#fff; border:1px solid #fff;}
.font-kr {font-family: 'Nanum Pen Script', cursive;}
.font-en {font-family: 'Caveat', cursive;}
ul{cursor:pointer;}
</style>
</head>
<body>
<div class="container">
<header class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>

   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ logo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
<div class="font-kr" style="padding: 0px;">
	<c:choose>
     		<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//admin/main.jsp'}">
   				<a class="navbar-brand" style="font-size: 30px; color:black;" href="./admin">
   				<i class="fas fa-home fa-2x" style="color:#f78b92;"></i>&nbsp;&nbsp;트래블 <b style="color:lightblue;">하우스</b></a>
   			</c:when>
   			<c:otherwise>
   				<a class="navbar-brand" style="font-size: 30px; color:black;" href="../../admin">
   				<i class="fas fa-home fa-2x" style="color:#f78b92;"></i>&nbsp;&nbsp;트래블 <b style="color:lightblue;">하우스</b></a>
   			</c:otherwise>
   	</c:choose>
</div>
<!-- END END END END END END END END logo END END END END END END END END -->
      
   <!-- 임시로고
   <div class="navbar-brand" style=" float: left; border: 1px solid black; margin: 10px; 
   height: 80px; width: 120px; background: lightblue;"><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ logo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
   <a id="mainBtn" class="navbar-brand" style="font-size: 12px; color:black;" href="./"><!-- adminMain
   &nbsp;&nbsp;로고 이미지</a></div>
   -->
   
    </div>
     <div class="collapse navbar-collapse" id="myNavbar">
     <c:choose>
     	<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//admin/main.jsp'}">
     
      <ul class="nav navbar-nav navbar-right">
      
      
      	<li class='font-kr' style='font-size:20px;'><a href="#">관리자님 환영합니다</a></li>
               <li><a href="./user/logout"><span class="glyphicon glyphicon-user"></span>관리자 로그아웃</a></li>
      
        <!-- <li><a id="mypageBtn" href="../../common/mypage.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;이용자 화면</a></li> -->
      </ul>
      <br><br>
      <ul class="nav navbar-nav font-kr" style="padding-left: 200px; font-size:25px;">
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a id="userListBtn" href="./admin/user/listUser">회원 </a>
      </li><!-- END END END END END END END END 회원 END END END END END END END --> 
       
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 객실 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown" style='color:#f555;'>객실 <b class="caret"></b></a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="roomListBtn" href="admin/room/roomList">객실 목록</a></li>            
            <li><a id="roomAddBtn" href="admin/room/roomAdd">객실 추가</a></li>
            <li><a href="#">----------------</a></li>
            <li><a id="roomTypeListBtn" href="admin/room/roomTypeList">객실 타입 목록</a></li>
            <li><a id="roomTypeAddBtn" href="admin/room/roomTypeAdd">객실 타입 추가</a></li>
         </ul>
      </li><!-- END END END END END END END 객실 END END END END END END END -->
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 예약 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a id="reservationBtn" href="./admin/reservation/resList">예약</a>
      </li><!-- END END END END END END END END 예약 END END END END END END END -->
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 환불 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown">환불 </a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="refundBtn" href="./admin/refund/refundList">환불목록</a></li>
         </ul>
      </li><!-- END END END END END END END END 환불 END END END END END END END -->   
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 후기 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown">후기 </a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="reviewBtn" href="./admin/review/reviewList">후기목록</a></li>
         </ul>
      </li><!-- END END END END END END END END 후기 END END END END END END END -->
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 문의 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown">문의</a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="queryBtn" href="./admin/query/queryList">문의목록</a></li>
         </ul>
      </li><!-- END END END END END END END END 문의 END END END END END END END -->  
      </ul>
      	</c:when>
      	
      	<c:otherwise>
      		<ul class="nav navbar-nav navbar-right">
      
      
      	<li class='font-kr' style='font-size:18px;'><a href="#">관리자님 환영합니다</a></li>
               <li><a href="../../user/logout"><span class="glyphicon glyphicon-user"></span>관리자 로그아웃</a></li>
      
        <!-- <li><a id="mypageBtn" href="../../common/mypage.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;이용자 화면</a></li> -->
      </ul>
      <br><br>
      <ul class="nav navbar-nav font-kr" style="padding-left: 200px; font-size:25px;">
      
       <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a id="userListBtn" href="../../admin/user/listUser">회원 </a>
      </li><!-- END END END END END END END END 회원 END END END END END END END -->  
       
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 객실 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown" style='color:#f555;'>객실 <b class="caret"></b></a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="roomListBtn" href="../../admin/room/roomList">객실 목록</a></li>            
            <li><a id="roomAddBtn" href="../../admin/room/roomAdd">객실 추가</a></li>
            <li><a href="#">----------------</a></li>
            <li><a id="roomTypeListBtn" href="../../admin/room/roomTypeList">객실 타입 목록</a></li>
            <li><a id="roomTypeAddBtn" href="../../admin/room/roomTypeAdd">객실 타입 추가</a></li>
         </ul>
      </li><!-- END END END END END END END 객실 END END END END END END END -->
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 예약 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a id="reservationBtn" href="../../admin/reservation/resList">예약</a>
      </li><!-- END END END END END END END END 예약 END END END END END END END -->
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 환불 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown">환불 </a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="refundBtn" href="../../admin/refund/refundList">환불목록</a></li>
         </ul>
      </li><!-- END END END END END END END END 환불 END END END END END END END -->   
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 후기 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown">후기 </a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="reviewBtn" href="../../admin/review/reviewList">후기목록</a></li>
         </ul>
      </li><!-- END END END END END END END END 후기 END END END END END END END -->
      
      <li><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 문의 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
         <a data-toggle="dropdown">문의</a>
         <ul class="dropdown-menu" style="font-size:20px;">               
            <li><a id="queryBtn" href="../../admin/query/queryList">문의목록</a></li>
         </ul>
      </li><!-- END END END END END END END END 문의 END END END END END END END -->  
      </ul>
      	</c:otherwise>
      </c:choose>
      
    </div>
  </div>
</header>
</div>
</body>
</html>