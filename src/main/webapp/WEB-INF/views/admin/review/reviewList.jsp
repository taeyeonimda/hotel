<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ include file="../common/import.jsp"%>

<script>
function noReview(){
   if($('#reviewList').find('tr').length == 0){
      $('#noReview').show();
   }else{
      $('#noReview').hide();
   }
}

function chklogin(){
   $("#writeBtn").click(()=>{
      let userId = "${user.userId}";
      console.log(userId);
      if(userId==null || userId==""){
         swal("로그인 후 글을 쓸수있습니다");
         return;
      }else{
         location.href='./reviewAdd';
      }
      })
}

$(()=>{
   noReview();
   chklogin();
   
});
</script>
<style>
.location li {
	float: left;
	margin: 10px 0px 10px -35px;
	list-style: none;
	font-size: 18px;
	font-weight: 700;
}

.location li::before {
	color: #6E6E6E;
	content: "〉";
	padding-right: 10px;
}

a {
	text-decoration: none;
	color: #000;
}

.ico_search_submit {
	position: absolute;
	top: 10px;
	left: 14px;
	width: 21px;
	height: 21px;
	background-position: -4px -60px;
}

.table th, td {
	text-align: center;
	height-aling: center;
}

th {
	background-color: #343a40;
	color: white;
}

#add {
	background-color: #6c757d;
	color: white;
	border: none;
	line-height: 1.6em;
}

#right {
	float: right !important;
	margin-left: -20px;
}

#btn {
	float: right;
	margin: 30px 40px 30px 0px;
	background-color: #343a40;
	color: white;
	border: none;
	line-height: 1.6em;
	padding: 10px 20px;
	font-size: 20px;
}

.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}
</style>

<body>
<header><%@ include file="../common/header.jsp"%></header>
	<div class="container center-block">
		<h2 class='font-kr' style='font-size: 50px;'>&nbsp;&nbsp;후기목록</h2>
		<div class="container">
			<br> <br>
			<ul class='location'>
				<li>후기 목록</li>
			</ul>
			<table class='table' style="margin: auto;">
				<thead class='thead-dark' style="padding: 15px;">
					<tr id="tr" style="vertical-align: middle; text-size: 20px;">
						<th style="padding: 15px;">번호</th>
						<th style="vertical-align: middle;">후기제목</th>
						<th style="vertical-align: middle;">작성자</th>
						<th style="vertical-align: middle;">등록일자</th>
						<th style="vertical-align: middle;">조회수</th>
					</tr>
				</thead>

				<tbody id="reviewList">
					<c:forEach var="reviews" items="${reviews}">
						<tr class="reviewTable">
							<td style="padding: 15px;">${reviews.reviewNum}</td>
							<td style="vertical-align: middle;"><a
								href="./reviewContentUser?reviewNum=${reviews.reviewNum}">${reviews.reviewTitle}</a></td>
							<td style="vertical-align: middle;">${reviews.userId}</td>
							<td style="vertical-align: middle;">${reviews.reviewDate}</td>
							<td style="vertical-align: middle;">${reviews.reviewHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id='noReview' align="center">
				<h3>후기가 없습니다.</h3>
			</div>
			<br>
			<br><br>
			<!-- 검색 -->
		
		<!-- 검색끝 -->
		<br>
		<!-- paging -->
		<div style="display: block; text-align: center;">
      <nav class='Page'>    
      <ul class='pagination'>
      <c:if test="${paging.startPage != 1 }">
         <li class="page-item" ><a class="page-link" href="./reviewList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            
            <c:when test="${p == paging.nowPage }">
               <li class="page-item" ><a class="page-link" style='font-weight:bold;'>${p }</a></li>
            </c:when>
            
            <c:when test="${p != paging.nowPage }">
               <li class="page-item"  ><a class="page-link" href="./reviewList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
            </c:when>
            
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <li class="page-item"  ><a class="page-link" href="./reviewList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
      </c:if>
      </ul> 
      </nav> 
   </div>
		<!-- paging 끝 -->
	</div>	
</body>
<footer>
	<%@ include file="../common/footer.jsp"%>
</footer>
