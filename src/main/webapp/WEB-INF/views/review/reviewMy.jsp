<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ include file="../common/import.jsp" %>
<header><%@ include file="../common/header.jsp"%></header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.title span {
	font-size: 21px;
	color: #d2d2d2;
	font-weight: 500;
	letter-spacing: 0em;
	margin-left: 3px;
}

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

.table th, td {
	text-align: center;
	height-aling: center;
}

th {
	background-color: #343a40;
	color: white;
}

a {
	text-decoration: none;
}
</style>
<script>
function noReview(){
	   if($('#reviewList').find('tr').length == 0){
	      $('#noReview').show();
	   }else{
	      $('#noReview').hide();
	   }
	}

$(()=>{
	   noReview();
	   chklogin();
	   
	});
</script>
<body>
	<div class="container">
		<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Mypage $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
		<div class='title'>
			<a href='01.html' style="text-decoration: none"><h1>
					마이페이지<span>MyPage</span>
				</h1></a>
		</div>
		<nav class='navbar navbar-default' style='background-color:#0B2161'
			id='menu'>
		<div class='container-fluid'>
		    <ul class='nav navbar-nav'>
         <li><a style='color:#FFFFFF' href='../reservation/resMy'>예약 내역</a></li>
        <li><a style='color:#FFFFFF' href='../refund/refundMy'>환불 내역</a></li>
        <li><a style='color:#FFFFFF' href='../review/reviewMy'>후기 내역</a></li>
        <li><a style='color:#FFFFFF' href='../query/queryMypage'>문의 내역</a></li>
        <li><a style='color:#FFFFFF' href='../user/userInfo'>회원 정보 관리</a></li>
      </ul>  
		</div>
		</nav>
		<!-- END END END END END END END END Mypage END END END END END END END -->
		<br> <br> <br>
		<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 게시판 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
		<ul class='location'>
			<li>후기 내역</li>
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
					<c:if test="${sessionScope.user.userId == reviews.userId}">
						<tr class="reviewTable">
							<td style="padding: 15px;">${reviews.reviewNum}</td>
							<td style="vertical-align: middle;"><a
								href="./reviewContent?reviewNum=${reviews.reviewNum}">${reviews.reviewTitle}</a></td>
							<td style="vertical-align: middle;">${reviews.userId}</td>
							<td style="vertical-align: middle;">${reviews.reviewDate}</td>
							<td style="vertical-align: middle;">${reviews.reviewHit}</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div id='noReview' align="center">
				<h3>후기가 없습니다.</h3>
			</div>
		</table>

		<div style="display: block; text-align: center;">
      <nav class='Page'>    
      <ul class='pagination'>
      <c:if test="${paging.startPage != 1 }">
         <li class="page-item" ><a class="page-link" href="./reviewMy?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            
            <c:when test="${p == paging.nowPage }">
               <li class="page-item" ><a class="page-link" style='font-weight:bold;'>${p }</a></li>
            </c:when>
            
            <c:when test="${p != paging.nowPage }">
               <li class="page-item"  ><a class="page-link" href="./reviewMy?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
            </c:when>
            
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <li class="page-item"  ><a class="page-link" href="./reviewMy?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
      </c:if>
      </ul> 
      </nav> 
   </div>
		<!-- 페이징 끝-->
		<!-- END END END END END END END END 게시판 END END END END END END END -->
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer> <%@ include file="../common/footer.jsp"%>
	</footer>
</body>