<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>객실 목록</title>
<style>
.location li{
   float: left;
   margin : 10px 0px 10px -35px;
   list-style: none;
   font-size: 18px;
   font-weight: 700;
}

.location li::before{
   color: #6E6E6E;
   content: "〉";
   padding-right: 10px;
}


#right{
   float: right !important;
   margin-left: -20px;
}

.ico_search_submit {
    background-image: url(https://s.pstatic.net/static/www/img/2018/sp_search.svg);
    background-repeat: no-repeat;
};

a {
    text-decoration: none;
}

.table th, td{
   text-align: center;
   height-aling: center;
   
}

th{
   background-color: #343a40;
   color: white;
   
}

#add{
   background-color: #6c757d;
   color: white;
   border: none;
   line-height: 1.6em;
}

</style>
<script>
function noRoom(){
   if($('#roomList').find('tr').length == 0){
      $('#noRoom').show();
   }else{
      $('#noRoom').hide();
   }
}

$(()=>{
   noRoom();
});



</script>
</head>
<body>
<header>
   <%@ include file="../common/header.jsp" %>
</header>
<div class = 'container'>   
   <br>
   <hr>
   <h2 class="text-center font-kr" style='font-size:50px;'>객실목록</h2>
   <div></div>
   <br><br>
   
   <ul class='location'>
      <li>객실 목록</li>
   </ul>
   
   <table class='table' style="margin:auto;">
      <thead class='thead-dark' style="padding: 15px;">
         <tr id="tr" style="vertical-align: middle; text-size: 20px;">
            <th>객실 번호</th>
            <th>객실 타입</th>
            <th>예약 상태</th>
            <th>운영 상태</th>
            <th></th>
         </tr>
      </thead>
      
      <tbody id = "roomList">
         <c:forEach var="room" items="${room}">
            <tr class="roomTable">
               <td >${room.roomNum}</td>
               <td >${room.roomType}</td>
               <td >${room.roomResStatus}</td>
               <td >${room.roomStatus}</td>
               <td ><a href="./roomDetail?roomNum=${room.roomNum}">상세보기</a></td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
   <div id='noRoom' style="text-align: center;"><h4>등록된 객실이 없습니다</h4></div>
   <br><br>
   <div><a href="./roomAdd"><button type="button" class="btn btn-default" style='float:right;' id="btn" >객실 등록</button></a></div>
   
   <!-- 페이징 -->
  <div style="display: block; text-align: center;">
      <nav class='Page'>    
      <ul class='pagination'>
      <c:if test="${paging.startPage != 1 }">
         <li class="page-item" ><a class="page-link" href="/hotel/admin/room/roomList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            
            <c:when test="${p == paging.nowPage }">
               <li class="page-item" ><a class="page-link" style='font-weight:bold;'>${p }</a></li>
            </c:when>
            
            <c:when test="${p != paging.nowPage }">
               <li class="page-item"  ><a class="page-link" href="/hotel/admin/room/roomList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
            </c:when>
            
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <li class="page-item"  ><a class="page-link" href="/hotel/admin/room/roomList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
      </c:if>
      </ul> 
      </nav> 
   </div>
</div>


   
</body>
<br><br><br><br>
<footer>
   <%@ include file="../common/footer.jsp" %>
</footer>
</html>