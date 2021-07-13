<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>header</title>
<meta charset="utf-8">
<style>
.navbar  {background:white; border:1px solid white;}
.font-kr {font-family: 'Nanum Pen Script', cursive;}
.font-en {font-family: 'Caveat', cursive;}
ul{cursor:pointer;}
</style>
<script>
function roomTypeChoose(roomType){
	   var roomTypeText = $(roomType).text();
	   var url = "/hotel/room/roomInfo";
	   url = url + "?roomType=" + roomTypeText;
	   location.href = url;
	}

	function noRoomType(){
		if($('#roomTypes').find('li').length == 0){
			$('#noRoomType').show();
		}else{
			$('#noRoomType').hide();
		}
	}

	$(()=>{
		noRoomType();
	});
</script>
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
     		<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//main.jsp'}">
   				<a class="navbar-brand" style="font-size: 30px; color:black;" href="./">
   				<i class="fas fa-home fa-2x" style="color:#f78b92;"></i>&nbsp;&nbsp;트래블 <b style="color:lightblue;">하우스</b></a>
   			</c:when>
   			<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views/common/myPage.jsp'}">
   				<a class="navbar-brand" style="font-size: 30px; color:black;" href="./">
   				<i class="fas fa-home fa-2x" style="color:#f78b92;"></i>&nbsp;&nbsp;트래블 <b style="color:lightblue;">하우스</b></a>
   			</c:when>
   			<c:otherwise>
   				<a class="navbar-brand" style="font-size: 30px; color:black;" href="../">
   				<i class="fas fa-home fa-2x" style="color:#f78b92;"></i>&nbsp;&nbsp;트래블 <b style="color:lightblue;">하우스</b></a>
   			</c:otherwise>
   	</c:choose>
</div>
<!-- END END END END END END END END logo END END END END END END END END -->

      
   <!-- 임시로고
   <div class="navbar-brand" style=" float: left; border: 1px solid black; margin: 10px; 
   height: 80px; width: 120px; background: lightblue;"><!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ logo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
   
   		<c:choose>
     		<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//main.jsp'}">
   				<a id="mainBtn" class="navbar-brand" style="font-size: 12px; color:black;" href="./">
   				&nbsp;&nbsp;로고 이미지</a>
   			</c:when>
   			<c:otherwise>
   				<a id="mainBtn" class="navbar-brand" style="font-size: 12px; color:black;" href="../">
   				&nbsp;&nbsp;로고 이미지</a>
   			</c:otherwise>
   		</c:choose>
   </div><!-- 임시로고 -->
   	
  
   
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
		
      <c:choose>
      <c:when test="${sessionScope.user == null }">
      	<c:choose>
     		<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//main.jsp'}">
     			<li><a href="./user/logon"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
        		<li><a href="./user/joinForm"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
        	</c:when>
        	<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views/common/myPage.jsp'}">
     			<li><a href="./user/logon"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
        		<li><a href="./user/joinForm"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
        	</c:when>
        	<c:otherwise>
        		<li><a href="../user/logon"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
        		<li><a href="../user/joinForm"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
        	</c:otherwise>
        </c:choose>
      </c:when>
    
      
      <c:when test="${sessionScope.user.userId !='admin'}">
        <c:choose>
      		<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//main.jsp'}">
               	<li class='font-kr' style='font-size:20px;'><a href="./">${user.userId}님 환영합니다.</a></li>
            	<li><a href="./user/logout" ><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>           
           		<li><a href="./reservation/resMy"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
           	</c:when>
           	<c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views/common/myPage.jsp'}">
				<li class='font-kr' style='font-size:20px;'><a href="./">${user.userId}님 환영합니다.</a></li>
            	<li><a href="./user/logout" ><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>           
           		<li><a href="./reservation/resMy"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
           	</c:when>
           	<c:otherwise>
               	<li class='font-kr' style='font-size:20px;'><a href="../">${user.userId}님 환영합니다.</a></li>
            	<li><a href="../user/logout" ><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>           
           		<li><a href="../reservation/resMy"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
           	</c:otherwise>
        </c:choose>     
      </c:when>
      </c:choose>    

      </ul>
      <br><br>
      <c:choose>
      <c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//main.jsp'}">
      <ul class="nav navbar-nav font-en" style="padding-left: 200px; font-size:20px;">
        <li><a id ='mapBtn' href='./map/mapInfo'>Map</a></li>
         <!-- 룸 타입 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" style='color: pink;'>Room <span class="caret"></span></a>
          <ul class="dropdown-menu font-kr" id="roomTypes" style="font-size:20px;">			
			<c:forEach var='roomType' items='${roomTypeList}' >
				<li><a class="roomBtn" href="#" onClick="roomTypeChoose(this)">${roomType.roomType}</a></li>
			</c:forEach>
			<div id='noRoomType' style="text-align: center;"><h4>등록된 객실이 없습니다</h4></div>
          </ul>
        </li>
        <li><a id="reviewBtn" href="./review/reviewList">Review</a></li>
        <li><a id="queryBtn" href="./query/queryList">Q & A</a></li>
      </ul>
      </c:when>
      <c:when test="${pageContext.request.requestURI=='/hotel/WEB-INF/views/common/myPage.jsp'}">
      <ul class="nav navbar-nav font-en" style="padding-left: 200px; font-size:20px;">
        <li><a id ='mapBtn' href='./map/mapInfo'>Map</a></li>
        <!-- 룸 타입 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" style='color: pink;'>Room <span class="caret"></span></a>
          <ul class="dropdown-menu font-kr" id="roomTypes" style="font-size:20px;">			
			<c:forEach var='roomType' items='${roomTypeList}' >
				<li><a class="roomBtn" href="#" onClick="roomTypeChoose(this)">${roomType.roomType}</a></li>
			</c:forEach>
			<div id='noRoomType' style="text-align: center;"><h4>등록된 객실이 없습니다</h4></div>
          </ul>
        </li>
        <li><a id="reviewBtn" href="./review/reviewList">Review</a></li>
        <li><a id="queryBtn" href="./query/queryList">Q & A</a></li>
      </ul>
      </c:when>
      <c:otherwise>
      <ul class="nav navbar-nav font-en" style="padding-left: 200px; font-size:20px;">
        <li><a id ='mapBtn' href='../map/mapInfo'>Map</a></li>
         <!-- 룸 타입 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" style='color: pink;'>Room <span class="caret"></span></a>
          <ul class="dropdown-menu font-kr" id="roomTypes" style="font-size:20px;">			
			<c:forEach var='roomType' items='${roomTypeList}' >
				<li><a class="roomBtn" href="#" onClick="roomTypeChoose(this)">${roomType.roomType}</a></li>
			</c:forEach>
			<div id='noRoomType' style="text-align: center;"><h4>등록된 객실이 없습니다</h4></div>
          </ul>
        </li>
        <li><a id="reviewBtn" href="../review/reviewList">Review</a></li>
        <li><a id="queryBtn" href="../query/queryList">Q & A</a></li>
      </ul>
      </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>
</div>
</body>
</html>